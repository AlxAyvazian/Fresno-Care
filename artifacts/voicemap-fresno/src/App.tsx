import { Switch, Route, Router as WouterRouter } from "wouter";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { Toaster } from "@/components/ui/toaster";
import { TooltipProvider } from "@/components/ui/tooltip";
import { ThemeProvider } from "@/lib/theme";
import { Navbar } from "@/components/Navbar";
import NotFound from "@/pages/not-found";
import LandingPage from "@/pages/LandingPage";
import SubmitReport from "@/pages/SubmitReport";
import ReportGenerator from "@/pages/ReportGenerator";
import Dashboard from "@/pages/Dashboard";
import EscalationCenter from "@/pages/EscalationCenter";
import ResourceLibrary from "@/pages/ResourceLibrary";
import AboutPage from "@/pages/AboutPage";
import LostFound from "@/pages/LostFound";
import FlyerGenerator from "@/pages/FlyerGenerator";
import ToolsPage from "@/pages/CoreToolsPage";
import NeighborhoodWatch from "@/pages/NeighborhoodWatch";
import ShareReport from "@/pages/ShareReport";

const queryClient = new QueryClient();

function Router() {
  return (
    <>
      <Navbar />
      <Switch>
        <Route path="/" component={LandingPage} />
        <Route path="/submit" component={SubmitReport} />
        <Route path="/generate" component={ReportGenerator} />
        <Route path="/dashboard" component={Dashboard} />
        <Route path="/lostfound" component={LostFound} />
        <Route path="/flyer" component={FlyerGenerator} />
        <Route path="/tools" component={ToolsPage} />
        <Route path="/watch" component={NeighborhoodWatch} />
        <Route path="/escalate" component={EscalationCenter} />
        <Route path="/resources" component={ResourceLibrary} />
        <Route path="/about" component={AboutPage} />
        <Route path="/share" component={ShareReport} />
        <Route component={NotFound} />
      </Switch>
    </>
  );
}

function App() {
  return (
    <QueryClientProvider client={queryClient}>
      <TooltipProvider>
        <ThemeProvider>
          <WouterRouter base={import.meta.env.BASE_URL.replace(/\/$/, "")}>
            <Router />
          </WouterRouter>
        </ThemeProvider>
        <Toaster />
      </TooltipProvider>
    </QueryClientProvider>
  );
}

export default App;
