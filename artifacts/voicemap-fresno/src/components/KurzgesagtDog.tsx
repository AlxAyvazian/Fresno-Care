interface KurzgesagtDogProps {
  size?: number;
  className?: string;
}

const FBL: React.CSSProperties = { transformBox: "fill-box" };
const pivotTopCenter: React.CSSProperties = { transformBox: "fill-box", transformOrigin: "50% 5%" };
const pivotTailBase: React.CSSProperties  = { transformBox: "fill-box", transformOrigin: "10% 80%" };
const pivotCenter: React.CSSProperties   = { transformBox: "fill-box", transformOrigin: "50% 50%" };
const pivotTopMid: React.CSSProperties   = { transformBox: "fill-box", transformOrigin: "50% 0%" };

export function KurzgesagtDog({ size = 120, className = "" }: KurzgesagtDogProps) {
  return (
    <svg
      width={size}
      height={size * 1.15}
      viewBox="0 0 110 126"
      fill="none"
      xmlns="http://www.w3.org/2000/svg"
      className={className}
      style={{ overflow: "visible" }}
      aria-label="Animated dog character"
    >
      {/* Ground shadow stays fixed */}
      <ellipse cx="55" cy="122" rx="30" ry="4.5" fill="#01204E" opacity="0.12" />

      {/* Whole character bounces */}
      <g className="anim-bounce-slow" style={FBL}>

        {/* Tail — rotates from its base */}
        <g className="anim-dog-tail" style={pivotTailBase}>
          <path
            d="M80 86 C97 73 103 55 95 45 C91 39 84 43 86 49"
            stroke="#016570"
            strokeWidth="10"
            strokeLinecap="round"
            fill="none"
          />
        </g>

        {/* Body */}
        <ellipse cx="55" cy="87" rx="34" ry="31" fill="#028391" />
        {/* Belly */}
        <ellipse cx="55" cy="93" rx="17" ry="19" fill="#F6DCAC" opacity="0.4" />

        {/* Left floppy ear — rotates from top */}
        <g className="anim-dog-ear-l" style={pivotTopCenter}>
          <ellipse cx="22" cy="52" rx="11" ry="21" fill="#016570"
            transform="rotate(-16 22 52)" />
        </g>

        {/* Right floppy ear */}
        <g className="anim-dog-ear-r" style={pivotTopCenter}>
          <ellipse cx="88" cy="52" rx="11" ry="21" fill="#016570"
            transform="rotate(16 88 52)" />
        </g>

        {/* Head */}
        <ellipse cx="55" cy="47" rx="29" ry="27" fill="#028391" />

        {/* Snout */}
        <ellipse cx="55" cy="59" rx="16" ry="12" fill="#F6DCAC" opacity="0.45" />

        {/* Nose */}
        <ellipse cx="55" cy="53" rx="8" ry="6" fill="#01204E" />
        <ellipse cx="53" cy="51" rx="2.5" ry="1.8" fill="white" opacity="0.5" />

        {/* Eye whites */}
        <ellipse cx="40" cy="41" rx="9" ry="10" fill="white" />
        <ellipse cx="70" cy="41" rx="9" ry="10" fill="white" />

        {/* Pupils — blink */}
        <ellipse cx="40" cy="42" rx="5" ry="7" fill="#01204E"
          className="anim-blink"  style={pivotCenter} />
        <ellipse cx="70" cy="42" rx="5" ry="7" fill="#01204E"
          className="anim-blink2" style={pivotCenter} />

        {/* Eye shine */}
        <circle cx="42" cy="38" r="2.5" fill="white" />
        <circle cx="72" cy="38" r="2.5" fill="white" />

        {/* Mouth */}
        <path d="M48 64 Q55 69 62 64" stroke="#016570" strokeWidth="2"
          strokeLinecap="round" fill="none" />

        {/* Tongue — wags from top */}
        <g className="anim-tongue" style={pivotTopMid}>
          <ellipse cx="55" cy="70" rx="6"   ry="7.5" fill="#F85525" />
          <line x1="55" y1="66" x2="55" y2="77"
            stroke="#C44020" strokeWidth="1.5" opacity="0.45" />
        </g>

        {/* Left paw */}
        <ellipse cx="33" cy="115" rx="12" ry="7"   fill="#028391" />
        <ellipse cx="28" cy="114" rx="4"  ry="3.5" fill="#F6DCAC" opacity="0.45" />
        <ellipse cx="35" cy="114" rx="4"  ry="3.5" fill="#F6DCAC" opacity="0.45" />
        <ellipse cx="41" cy="114" rx="4"  ry="3.5" fill="#F6DCAC" opacity="0.45" />

        {/* Right paw */}
        <ellipse cx="77" cy="115" rx="12" ry="7"   fill="#028391" />
        <ellipse cx="72" cy="114" rx="4"  ry="3.5" fill="#F6DCAC" opacity="0.45" />
        <ellipse cx="79" cy="114" rx="4"  ry="3.5" fill="#F6DCAC" opacity="0.45" />
        <ellipse cx="85" cy="114" rx="4"  ry="3.5" fill="#F6DCAC" opacity="0.45" />
      </g>
    </svg>
  );
}
