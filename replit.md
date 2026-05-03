# Workspace

## Overview

pnpm workspace monorepo using TypeScript. Each package manages its own dependencies.

## Stack

- **Monorepo tool**: pnpm workspaces
- **Node.js version**: 24
- **Package manager**: pnpm
- **TypeScript version**: 5.9
- **API framework**: Express 5
- **Database**: PostgreSQL + Drizzle ORM
- **Validation**: Zod (`zod/v4`), `drizzle-zod`
- **API codegen**: Orval (from OpenAPI spec)
- **Build**: esbuild (CJS bundle)

## Key Commands

- `pnpm run typecheck` — full typecheck across all packages
- `pnpm run build` — typecheck + build all packages
- `pnpm --filter @workspace/api-spec run codegen` — regenerate API hooks and Zod schemas from OpenAPI spec
- `pnpm --filter @workspace/db run push` — push DB schema changes (dev only)
- `pnpm --filter @workspace/api-server run dev` — run API server locally

See the `pnpm-workspace` skill for workspace structure, TypeScript setup, and package details.

## Artifacts

### VoiceMap Fresno (`artifacts/voicemap-fresno`)
- **Type**: React + Vite web app (frontend-only, localStorage)
- **Preview path**: `/`
- **Purpose**: Civic-tech tool for Fresno residents to document stray animal welfare concerns
- **Color palette**: #01204E (navy), #028391 (teal), #F6DCAC (cream), #FAA968 (peach), #F85525 (coral)
- **Characters**: Kurzgesagt-style SVG animated cat and dog
- **Pages**: Landing, Submit Report, Report Generator, Dashboard, Escalation Center, Resources, About
- **Persistence**: localStorage (no backend required for v1)
- **TODO for v2**: Replace localStorage with Supabase, add photo upload, email routing

### API Server (`artifacts/api-server`)
- **Type**: Express 5 API server
- **Preview path**: `/api`
- **Status**: Scaffolded, health endpoint only
