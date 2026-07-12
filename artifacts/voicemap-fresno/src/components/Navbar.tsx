import { useState } from "react";
import { Link, useLocation } from "wouter";
import {
  ChevronDown,
  MapPin,
  Menu,
  Moon,
  PawPrint,
  Sun,
  X,
} from "lucide-react";
import { useTheme } from "@/lib/theme";

const PRIMARY_LINKS = [
  { href: "/", label: "Home" },
  { href: "/submit", label: "Submit Report" },
  { href: "/lostfound", label: "Lost & Found" },
  { href: "/dashboard", label: "Live Map" },
  { href: "/escalate", label: "Escalation" },
];

const MORE_LINKS = [
  { href: "/watch", label: "Neighborhood Watch", icon: <MapPin size={13} /> },
  { href: "/tools", label: "Tools" },
  { href: "/flyer", label: "Flyer Generator" },
  { href: "/resources", label: "Resources" },
  { href: "/about", label: "About" },
];

const ALL_LINKS = [...PRIMARY_LINKS, ...MORE_LINKS];

export function Navbar() {
  const { theme, toggle } = useTheme();
  const [location] = useLocation();
  const [menuOpen, setMenuOpen] = useState(false);
  const [moreOpen, setMoreOpen] = useState(false);
  const isMoreActive = MORE_LINKS.some((link) => link.href === location);

  return (
    <header className="liquid-nav-wrap">
      <nav className="liquid-nav relative flex min-h-16 items-center justify-between px-4 sm:px-5">
        <Link href="/">
          <span className="flex cursor-pointer items-center gap-2.5">
            <span className="flex h-9 w-9 items-center justify-center rounded-2xl border border-white/55 bg-primary text-primary-foreground shadow-[inset_0_1px_0_rgba(255,255,255,.4),0_7px_22px_rgba(83,126,165,.28),0_0_18px_rgba(143,186,225,.2)]">
              <PawPrint size={17} />
            </span>
            <span className="font-heading text-[16px] font-extrabold sm:text-[17px]">
              VoiceMap <span className="text-primary">Fresno</span>
            </span>
          </span>
        </Link>

        <div className="hidden items-center gap-1 text-sm font-semibold md:flex">
          {PRIMARY_LINKS.map(({ href, label }) => (
            <Link key={href} href={href}>
              <span className={`nav-pill cursor-pointer whitespace-nowrap ${location === href ? "is-active" : ""}`}>
                {label}
              </span>
            </Link>
          ))}

          <div className="relative">
            <button
              type="button"
              onMouseDown={() => setMoreOpen((open) => !open)}
              onBlur={() => window.setTimeout(() => setMoreOpen(false), 150)}
              className={`nav-pill flex items-center gap-1 whitespace-nowrap ${isMoreActive ? "is-active" : ""}`}
            >
              More
              <ChevronDown
                size={13}
                className={`transition-transform ${moreOpen ? "rotate-180" : ""}`}
              />
            </button>

            {moreOpen && (
              <div className="glass-card absolute right-0 top-full z-50 mt-3 w-56 rounded-3xl p-2">
                {MORE_LINKS.map(({ href, label, icon }) => (
                  <Link key={href} href={href}>
                    <span
                      className={`flex cursor-pointer items-center gap-2.5 rounded-2xl px-4 py-3 text-sm font-semibold transition-colors ${
                        location === href
                          ? "bg-primary text-primary-foreground"
                          : "text-muted-foreground hover:bg-[#FDFAE0]/45 hover:text-foreground dark:hover:bg-white/5"
                      }`}
                      onClick={() => setMoreOpen(false)}
                    >
                      {icon && <span className={location === href ? "text-current" : "text-primary"}>{icon}</span>}
                      {label}
                    </span>
                  </Link>
                ))}
              </div>
            )}
          </div>
        </div>

        <div className="flex items-center gap-2">
          <button
            data-testid="button-theme-toggle"
            type="button"
            onClick={toggle}
            className="liquid-button flex h-10 w-10 items-center justify-center rounded-2xl transition-transform hover:scale-[1.03]"
            aria-label="Toggle dark mode"
          >
            {theme === "dark" ? <Sun size={16} /> : <Moon size={16} />}
          </button>

          <button
            data-testid="button-mobile-menu"
            type="button"
            className="liquid-button flex h-10 w-10 items-center justify-center rounded-2xl md:hidden"
            onClick={() => setMenuOpen((open) => !open)}
            aria-label="Toggle navigation menu"
          >
            {menuOpen ? <X size={17} /> : <Menu size={17} />}
          </button>
        </div>

        {menuOpen && (
          <div className="glass-card absolute left-2 right-2 top-[calc(100%+.6rem)] rounded-3xl p-2 md:hidden">
            {ALL_LINKS.map(({ href, label }) => (
              <Link key={href} href={href}>
                <span
                  className={`block cursor-pointer rounded-2xl px-4 py-3 text-sm font-semibold transition-colors ${
                    location === href
                      ? "bg-primary text-primary-foreground"
                      : "text-muted-foreground hover:bg-[#FDFAE0]/45 hover:text-foreground dark:hover:bg-white/5"
                  }`}
                  onClick={() => setMenuOpen(false)}
                >
                  {label}
                </span>
              </Link>
            ))}
          </div>
        )}
      </nav>
    </header>
  );
}
