import type { CSSProperties } from "react";
import "./PawPrintBackground.css";

type PawStyle = CSSProperties & Record<`--${string}`, string>;

type Paw = {
  id: number;
  warm: boolean;
  style: PawStyle;
};

const PAWS: Paw[] = Array.from({ length: 34 }, (_, index) => {
  const left = (index * 37 + 4) % 96;
  const top = (index * 53 + 7) % 94;
  const size = 26 + ((index * 11) % 30);
  const duration = 12 + ((index * 7) % 10);
  const delay = -((index * 1.73) % 20);
  const rotation = -38 + ((index * 29) % 76);
  const driftX = -22 + ((index * 17) % 44);
  const driftY = -16 + ((index * 13) % 38);

  return {
    id: index,
    warm: index % 4 === 1 || index % 7 === 0,
    style: {
      "--left": `${left}%`,
      "--top": `${top}%`,
      "--size": `${size}px`,
      "--duration": `${duration}s`,
      "--delay": `${delay}s`,
      "--rotation": `${rotation}deg`,
      "--drift-x": `${driftX}px`,
      "--drift-y": `${driftY}px`,
    },
  };
});

function PawIcon() {
  return (
    <svg viewBox="0 0 64 64" aria-hidden="true" focusable="false">
      <ellipse cx="32" cy="42" rx="15.5" ry="13.5" transform="rotate(-2 32 42)" />
      <ellipse cx="12.5" cy="27" rx="6.8" ry="9" transform="rotate(-25 12.5 27)" />
      <ellipse cx="24.5" cy="16" rx="6.6" ry="9.4" transform="rotate(-8 24.5 16)" />
      <ellipse cx="40" cy="16" rx="6.6" ry="9.4" transform="rotate(8 40 16)" />
      <ellipse cx="52" cy="27" rx="6.8" ry="9" transform="rotate(25 52 27)" />
    </svg>
  );
}

export function PawPrintBackground() {
  return (
    <div className="paw-print-background" aria-hidden="true">
      {PAWS.map((paw) => (
        <span
          key={paw.id}
          className={`paw-print${paw.warm ? " paw-print--warm" : ""}`}
          style={paw.style}
        >
          <PawIcon />
        </span>
      ))}
    </div>
  );
}
