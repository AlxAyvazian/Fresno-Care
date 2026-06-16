import { useEffect, useState } from 'react';
import L from 'leaflet';
import { getMedicalProvidersByBounds, getMedicalProviderCategories, MedicalProvider } from '../lib/neon-client';

// Target categories matching refined scope
const TARGET_CATEGORIES = [
  'Dentist',
  'General Practitioner',
  'Cardiologist',
  'Internal Medicine',
  'Occupational Health Specialist',
  'Occupational Health Clinic',
  'Audiologist',
  'Radiology Imaging Center',
  'Medical Clinic',
  'Private Practice',
  'Urgent Care',
  'Polyclinic',
  'Hospital',
  'Primary Care Provider',
  'Independent Medical Examiner',
  'Orthopedist',
  'Pulmonologist',
  'Neurologist',
  'Laboratory'
];

interface NeonMedicalProvidersProps {
  map: L.Map | null;
  enabled: boolean;
  onStatsUpdate?: (stats: { total: number; byCategory: Record<string, number> }) => void;
}

export function NeonMedicalProviders({ 
  map, 
  enabled, 
  onStatsUpdate 
}: NeonMedicalProvidersProps) {
  const [providers, setProviders] = useState<MedicalProvider[]>([]);
  const [categoryToggles, setCategoryToggles] = useState<Record<string, boolean>>(() => {
    const initial: Record<string, boolean> = {};
    TARGET_CATEGORIES.forEach(cat => initial[cat] = true);
    return initial;
  });
  const [loading, setLoading] = useState(false);
  const [layerGroup, setLayerGroup] = useState<L.LayerGroup | null>(null);

  const toggleCategory = (category: string) => {
    setCategoryToggles(prev => ({
      ...prev,
      [category]: !prev[category]
    }));
  };

  const getSelectedCategories = () => {
    return TARGET_CATEGORIES.filter(cat => categoryToggles[cat]);
  };

  useEffect(() => {
    if (!enabled) {
      if (layerGroup) {
        map?.removeLayer(layerGroup);
        setLayerGroup(null);
      }
      setProviders([]);
      return;
    }

    const loadCategories = async () => {
      const cats = await getMedicalProviderCategories();
      console.log('Available categories:', cats);
    };

    loadCategories();
  }, [enabled, map]);

  useEffect(() => {
    if (!map || !enabled) return;

    const loadProviders = async () => {
      if (!map) return;
      
      const bounds = map.getBounds();
      const boundsObj = {
        north: bounds.getNorth(),
        south: bounds.getSouth(),
        east: bounds.getEast(),
        west: bounds.getWest()
      };

      const selectedCategories = getSelectedCategories();
      
      if (selectedCategories.length === 0) {
        setProviders([]);
        if (layerGroup) {
          map.removeLayer(layerGroup);
          setLayerGroup(null);
        }
        return;
      }

      setLoading(true);
      
      try {
        const data = await getMedicalProvidersByBounds(boundsObj, selectedCategories);
        setProviders(data);
        
        // Update stats
        if (onStatsUpdate) {
          const byCategory: Record<string, number> = {};
          data.forEach(p => {
            if (p.category) {
              byCategory[p.category] = (byCategory[p.category] || 0) + 1;
            }
          });
          onStatsUpdate({ total: data.length, byCategory });
        }
      } catch (error) {
        console.error('Error loading providers:', error);
      } finally {
        setLoading(false);
      }
    };

    loadProviders();

    const handleMoveEnd = () => {
      loadProviders();
    };

    const handleZoomEnd = () => {
      loadProviders();
    };

    map.on('moveend', handleMoveEnd);
    map.on('zoomend', handleZoomEnd);

    return () => {
      map.off('moveend', handleMoveEnd);
      map.off('zoomend', handleZoomEnd);
    };
  }, [map, enabled, categoryToggles, onStatsUpdate]);

  useEffect(() => {
    if (!map || !enabled || providers.length === 0) return;

    // Remove existing layer
    if (layerGroup) {
      map.removeLayer(layerGroup);
    }

    // Create new layer group
    const newLayerGroup = L.layerGroup().addTo(map);

    // Add markers for each provider
    providers.forEach(provider => {
      const marker = createProviderMarker(provider);
      marker.addTo(newLayerGroup);
    });

    setLayerGroup(newLayerGroup);
  }, [providers, map, enabled]);

  const createProviderMarker = (provider: MedicalProvider): L.Marker => {
    const color = getCategoryColor(provider.category);
    
    const icon = L.divIcon({
      className: '',
      html: `<div style="
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background: ${color};
        box-shadow: 0 0 8px ${color}, 0 0 16px ${color}44, inset 0 0 4px rgba(255,255,255,0.6);
        cursor: pointer;
      "></div>`,
      iconSize: [8, 8],
      iconAnchor: [4, 4]
    });

    const marker = L.marker([provider.lat, provider.lng], { icon });

    // Create popup content
    const popupContent = `
      <div style="
        font-family: 'Inter', sans-serif;
        padding: 8px 12px;
        min-width: 200px;
      ">
        <div style="
          font-size: 13px;
          font-weight: 700;
          color: #cdd9f0;
          margin-bottom: 4px;
        ">${provider.name}</div>
        <div style="
          font-size: 10px;
          color: #3d5478;
          margin-bottom: 6px;
        ">${provider.category || 'Medical Provider'}</div>
        ${provider.formatted_address ? `
          <div style="
            font-size: 10px;
            color: #6b7c93;
            margin-bottom: 4px;
          ">${provider.formatted_address}</div>
        ` : ''}
        ${provider.phone ? `
          <div style="
            font-size: 10px;
            color: #6b7c93;
            margin-bottom: 4px;
          ">${provider.phone}</div>
        ` : ''}
        ${provider.rating ? `
          <div style="
            font-size: 10px;
            color: #f59e0b;
            margin-top: 6px;
          ">★ ${provider.rating} ${provider.user_ratings_total ? `(${provider.user_ratings_total} reviews)` : ''}</div>
        ` : ''}
        ${provider.website ? `
          <a href="${provider.website}" target="_blank" rel="noopener" style="
            display: inline-block;
            margin-top: 8px;
            padding: 4px 8px;
            background: rgba(59, 130, 246, 0.1);
            border: 1px solid rgba(59, 130, 246, 0.3);
            color: #60a5fa;
            font-size: 9px;
            text-decoration: none;
            border-radius: 3px;
          ">Website</a>
        ` : ''}
      </div>
    `;

    marker.bindPopup(popupContent, {
      maxWidth: 280,
      className: 'neon-provider-popup'
    });

    return marker;
  };

  const getCategoryColor = (category: string | null): string => {
    const colors: Record<string, string> = {
      'Dentist': '#06b6d4',
      'General Practitioner': '#84cc16',
      'Cardiologist': '#dc2626',
      'Internal Medicine': '#3b82f6',
      'Occupational Health Specialist': '#f97316',
      'Occupational Health Clinic': '#fb923c',
      'Audiologist': '#22d3ee',
      'Radiology Imaging Center': '#8b5cf6',
      'Medical Clinic': '#10b981',
      'Private Practice': '#14b8a6',
      'Urgent Care': '#f59e0b',
      'Polyclinic': '#06b6d4',
      'Hospital': '#ef4444',
      'Primary Care Provider': '#84cc16',
      'Independent Medical Examiner': '#f97316',
      'Orthopedist': '#f97316',
      'Pulmonologist': '#3b82f6',
      'Neurologist': '#8b5cf6',
      'Laboratory': '#ec4899'
    };
    
    return colors[category || ''] || '#3b82f6';
  };

  // Return category toggles UI
  return (
    <div className="category-toggles" style={{
      position: 'absolute',
      top: '20px',
      left: '20px',
      background: 'rgba(15, 23, 42, 0.95)',
      backdropFilter: 'blur(12px)',
      border: '1px solid rgba(59, 130, 246, 0.3)',
      borderRadius: '12px',
      padding: '16px',
      zIndex: 1000,
      maxWidth: '280px',
      display: enabled ? 'block' : 'none'
    }}>
      <div style={{
        fontSize: '12px',
        fontWeight: '700',
        color: '#cdd9f0',
        marginBottom: '12px',
        borderBottom: '1px solid rgba(59, 130, 246, 0.3)',
        paddingBottom: '8px'
      }}>
        Medical Categories
      </div>
      <div style={{
        display: 'grid',
        gridTemplateColumns: '1fr 1fr',
        gap: '8px',
        maxHeight: '400px',
        overflowY: 'auto'
      }}>
        {TARGET_CATEGORIES.map(category => (
          <label key={category} style={{
            display: 'flex',
            alignItems: 'center',
            fontSize: '10px',
            color: '#94a3b8',
            cursor: 'pointer',
            padding: '4px'
          }}>
            <input
              type="checkbox"
              checked={categoryToggles[category]}
              onChange={() => toggleCategory(category)}
              style={{
                marginRight: '6px',
                accentColor: getCategoryColor(category)
              }}
            />
            <span style={{
              color: categoryToggles[category] ? '#cdd9f0' : '#6b7c93'
            }}>{category}</span>
          </label>
        ))}
      </div>
      {loading && (
        <div style={{
          marginTop: '12px',
          fontSize: '10px',
          color: '#60a5fa',
          textAlign: 'center'
        }}>
          Loading providers...
        </div>
      )}
    </div>
  );
}
