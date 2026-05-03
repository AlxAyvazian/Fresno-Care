interface KurzgesagtCatProps {
  size?: number;
  className?: string;
}

const FBL: React.CSSProperties = { transformBox: "fill-box" };
const pivotBotCenter: React.CSSProperties = { transformBox: "fill-box", transformOrigin: "50% 100%" };
const pivotTailBase: React.CSSProperties  = { transformBox: "fill-box", transformOrigin: "10% 80%" };
const pivotCenter: React.CSSProperties   = { transformBox: "fill-box", transformOrigin: "50% 50%" };

export function KurzgesagtCat({ size = 120, className = "" }: KurzgesagtCatProps) {
  return (
    <svg
      width={size}
      height={size * 1.15}
      viewBox="0 0 110 126"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
      style={{ overflow: "visible" }}
      aria-label="Animated cat character"
    >
      {/* Ground shadow stays fixed */}
      <ellipse cx="55" cy="122" rx="28" ry="4.5" fill="#01204E" opacity="0.12" />

      {/* Whole character bounces */}
      <g className="anim-bounce" style={FBL}>

        {/* Tail — rotates from its base */}
        <g className="anim-cat-tail" style={pivotTailBase}>
          <path
            d="M76 92 C93 80 98 63 90 53 C86 47 80 51 82 57"
            stroke="#F85525"
            strokeWidth="9"
            strokeLinecap="round"
            fill="none"
          />
        </g>

        {/* Body */}
        <ellipse cx="55" cy="88" rx="33" ry="30" fill="#FAA968" />
        {/* Belly */}
        <ellipse cx="55" cy="93" rx="16" ry="18" fill="#F6DCAC" opacity="0.65" />

        {/* Left ear — rotates from bottom center */}
        <g className="anim-cat-ear-l" style={pivotBotCenter}>
          <polygon points="25,44 15,19 40,38" fill="#FAA968" />
          <polygon points="27,42 19,25 38,38" fill="#F85525" opacity="0.6" />
        </g>

        {/* Right ear */}
        <g className="anim-cat-ear-r" style={pivotBotCenter}>
          <polygon points="85,44 95,19 70,38" fill="#FAA968" />
          <polygon points="83,42 91,25 72,38" fill="#F85525" opacity="0.6" />
        </g>

        {/* Head */}
        <ellipse cx="55" cy="50" rx="30" ry="28" fill="#FAA968" />

        {/* Eye whites */}
        <ellipse cx="42" cy="46" rx="9" ry="10" fill="white" />
        <ellipse cx="68" cy="46" rx="9" ry="10" fill="white" />

        {/* Pupils — blink */}
        <ellipse cx="42" cy="47" rx="5" ry="7" fill="#01204E"
          className="anim-blink"  style={pivotCenter} />
        <ellipse cx="68" cy="47" rx="5" ry="7" fill="#01204E"
          className="anim-blink2" style={pivotCenter} />

        {/* Eye shine */}
        <circle cx="44" cy="43" r="2.5" fill="white" />
        <circle cx="70" cy="43" r="2.5" fill="white" />

        {/* Nose */}
        <path d="M51 59 L55 62 L59 59 Z" fill="#F85525" />
        {/* Mouth */}
        <path d="M51 62 Q55 67 59 62" stroke="#01204E" strokeWidth="1.5"
          strokeLinecap="round" fill="none" opacity="0.55" />

        {/* Whiskers */}
        <line x1="20" y1="57" x2="46" y2="59" stroke="#01204E" strokeWidth="1.2" opacity="0.28" />
        <line x1="20" y1="63" x2="46" y2="61" stroke="#01204E" strokeWidth="1.2" opacity="0.28" />
        <line x1="90" y1="57" x2="64" y2="59" stroke="#01204E" strokeWidth="1.2" opacity="0.28" />
        <line x1="90" y1="63" x2="64" y2="61" stroke="#01204E" strokeWidth="1.2" opacity="0.28" />

        {/* Left paw */}
        <ellipse cx="34" cy="115" rx="11" ry="7"   fill="#FAA968" />
        <ellipse cx="30" cy="114" rx="4"  ry="3.5" fill="#F6DCAC" opacity="0.5" />
        <ellipse cx="37" cy="114" rx="4"  ry="3.5" fill="#F6DCAC" opacity="0.5" />

        {/* Right paw */}
        <ellipse cx="76" cy="115" rx="11" ry="7"   fill="#FAA968" />
        <ellipse cx="72" cy="114" rx="4"  ry="3.5" fill="#F6DCAC" opacity="0.5" />
        <ellipse cx="79" cy="114" rx="4"  ry="3.5" fill="#F6DCAC" opacity="0.5" />
      </g>
    </svg>
  );
}
