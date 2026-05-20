import L from 'leaflet';
import { createTileLayer, type TileProviderKey } from '../../lib/mapServices';

export function replaceBaseTileLayer(params: {
  map: L.Map;
  currentLayer?: L.TileLayer | null;
  providerKey: TileProviderKey;
}): L.TileLayer {
  const { map, currentLayer, providerKey } = params;
  if (currentLayer) {
    try {
      map.removeLayer(currentLayer);
    } catch {}
  }
  const nextLayer = createTileLayer(providerKey);
  nextLayer.addTo(map);
  return nextLayer;
}

export function clearLayerGroup(layer?: L.LayerGroup | null): void {
  if (!layer) return;
  try {
    layer.clearLayers();
  } catch {}
}

export function safeRemoveLayer(map: L.Map | null | undefined, layer?: L.Layer | null): void {
  if (!map || !layer) return;
  try {
    map.removeLayer(layer);
  } catch {}
}

export function fitMarkers(map: L.Map, points: Array<[number, number]>, fallbackZoom = 10): void {
  if (!points.length) return;
  if (points.length === 1) {
    map.flyTo(points[0], fallbackZoom, { duration: 0.8 });
    return;
  }
  map.fitBounds(L.latLngBounds(points), { padding: [30, 30] });
}
