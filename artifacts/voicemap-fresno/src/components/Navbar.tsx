import { useState } from "react";
import { Link, useLocation } from "wouter";
import { Sun, Moon, Menu, X, PawPrint, ChevronDown, MapPin } from "lucide-react";
import { useTheme } from "@/lib/theme";

const PRIMARY_LINKS = [
  { href: "/",         label: "Home"          },
  { href: "/submit",   label: "Submit Report" },
  { href: "/lostfound",label: "Lost & Found"  },
  { href: "/dashboard",label: "Dashboard"     },
  { href: "/escalate", label: "Escalation"    },
];

const MORE_LINKS = [
  { href: "/watch",     label: "Neighborhood Watch", icon: <MapPin size={13} /> },
  { href: "/tools",     label: "Tools"               },
  { href: "/flyer",     label: "Flyer Generator"     },
  { href: "/resources", label: "Resources"           },
  { href: "/about",     label: "About"               },
];

const ALL_LINKS = [...PRIMARY_LINKS, ...MORE_LINKS];

export function Navbar() {
  const { theme, toggle } = useTheme();
  const [location] = useLocation();
  const [menuOpen, setMenuOpen] = useState(false);
  const [moreOpen, setMoreOpen] = useState(false);
  const isMoreActive = MORE_LINKS.some((l) => l.href === location);

  const navBg  = theme === "dark" ? "#01204E"  : "#F6DCAC";
  const shadow = theme === "dark"
    ? "0 1px 0 rgba(2,131,145,0.25), 0 4px 16px rgba(0,0,0,0.3)"
    : "0 1px 0 rgba(250,169,104,0.35), 0 4px 20px rgba(1,32,78,0.07)";

  function activeStyle(href: string) {
    return location === href
      ? { background: "#028391", color: "#fff", borderRadius: "10px", padding: "6px 14px" }
      : { padding: "6px 14px", borderRadius: "10px", opacity: 0.65 };
  }

  return (
    <header
      className="fixed top-0 left-0 right-0 z-50"
      style={{ background: navBg, boxShadow: shadow }}
    >
      <nav className="max-w-7xl mx-auto px-4 sm:px-6 h-16 flex items-center justify-between">

        {/* Logo */}
        <Link href="/">
          <span className="flex items-center gap-2.5 cursor-pointer flex-shrink-0">
            <div
              className="w-8 h-8 rounded-xl flex items-center justify-center"
              style={{ background: "#028391", boxShadow: "0 2px 8px rgba(2,131,145,0.35)" }}
            >
              <PawPrint size={16} color="#fff" />
            </div>
            <span className="font-heading font-bold text-[17px] leading-none">
              VoiceMap<span style={{ color: "#028391" }}> Fresno</span>
            </span>
          </span>
        </Link>

        {/* Desktop links */}
        <div className="hidden md:flex items-center gap-0.5 text-sm font-medium">
          {PRIMARY_LINKS.map(({ href, label }) => (
            <Link key={href} href={href}>
              <span
                className="cursor-pointer whitespace-nowrap transition-all duration-150"
                style={activeStyle(href)}
                onMouseEnter={(e) => {
                  if (location !== href) {
                    (e.currentTarget as HTMLElement).style.opacity = "1";
                    (e.currentTarget as HTMLElement).style.background = "rgba(2,131,145,0.1)";
                  }
                }}
                onMouseLeave={(e) => {
                  if (location !== href) {
                    (e.currentTarget as HTMLElement).style.opacity = "0.65";
                    (e.currentTarget as HTMLElement).style.background = "transparent";
                  }
                }}
              >
                {label}
              </span>
            </Link>
          ))}

          {/* More dropdown */}
          <div className="relative">
            <button
              onMouseDown={() => setMoreOpen(!moreOpen)}
              onBlur={() => setTimeout(() => setMoreOpen(false), 150)}
              className="flex items-center gap-1 cursor-pointer whitespace-nowrap transition-all duration-150"
              style={isMoreActive ? activeStyle("/more") : { ...activeStyle("__none"), paddingRight: "10px" }}
            >
              More
              <ChevronDown
                size={13}
                style={{ transition: "transform 0.15s", transform: moreOpen ? "rotate(180deg)" : "none" }}
              />
            </button>

            {moreOpen && (
              <div
                className="absolute top-full right-0 mt-2 w-52 rounded-2xl overflow-hidden z-50"
                style={{
                  background: theme === "dark" ? "#0a1e42" : "#FFF8ED",
                  boxShadow: "0 8px 32px rgba(1,32,78,0.14), 0 2px 8px rgba(1,32,78,0.08)",
                  border: "1px solid rgba(250,169,104,0.3)",
                }}
              >
                {MORE_LINKS.map(({ href, label, icon }) => (
                  <Link key={href} href={href}>
                    <span
                      className="flex items-center gap-2.5 px-4 py-3 text-sm font-medium cursor-pointer transition-all"
                      style={
                        location === href
                          ? { background: "#028391", color: "#fff" }
                          : { opacity: 0.8 }
                      }
                      onMouseEnter={(e) => {
                        if (location !== href) {
                          (e.currentTarget as HTMLElement).style.background = "rgba(2,131,145,0.1)";
                          (e.currentTarget as HTMLElement).style.opacity = "1";
                        }
                      }}
                      onMouseLeave={(e) => {
                        if (location !== href) {
                          (e.currentTarget as HTMLElement).style.background = "transparent";
                          (e.currentTarget as HTMLElement).style.opacity = "0.8";
                        }
                      }}
                      onClick={() => setMoreOpen(false)}
                    >
                      {icon && <span style={{ color: "#028391" }}>{icon}</span>}
                      {label}
                    </span>
                  </Link>
                ))}
              </div>
            )}
          </div>
        </div>

        {/* Right controls */}
        <div className="flex items-center gap-2">
          <button
            data-testid="button-theme-toggle"
            onClick={toggle}
            className="w-9 h-9 rounded-full flex items-center justify-center transition-all"
            style={{
              background: "rgba(2,131,145,0.12)",
              boxShadow: "0 2px 8px rgba(1,32,78,0.08)",
            }}
            aria-label="Toggle dark mode"
          >
            {theme === "dark" ? <Sun size={16} /> : <Moon size={16} />}
          </button>

          <button
            data-testid="button-mobile-menu"
            className="md:hidden w-9 h-9 rounded-full flex items-center justify-center transition-all"
            style={{ background: "rgba(2,131,145,0.12)" }}
            onClick={() => setMenuOpen(!menuOpen)}
          >
            {menuOpen ? <X size={16} /> : <Menu size={16} />}
          </button>
        </div>
      </nav>

      {/* Mobile menu */}
      {menuOpen && (
        <div
          className="md:hidden px-4 pb-4 pt-1 flex flex-col gap-0.5"
          style={{ borderTop: "1px solid rgba(250,169,104,0.3)" }}
        >
          {ALL_LINKS.map(({ href, label }) => (
            <Link key={href} href={href}>
              <span
                className="block px-4 py-2.5 rounded-xl text-sm font-medium cursor-pointer transition-all"
                style={
                  location === href
                    ? { background: "#028391", color: "#fff" }
                    : { opacity: 0.75 }
                }
                onClick={() => setMenuOpen(false)}
              >
                {label}
              </span>
            </Link>
          ))}
        </div>
      )}
    </header>
  );
}
