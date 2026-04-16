# CHANGELOG — sdlc-framework-templates

## v3.1 — 2026-04-16

### Fase 01 Prompt Templates

**Correcciones críticas:**
- User stories sin MoSCoW prematuro en S2 (MoSCoW formal se hace en S5)
- KPIs candidatos en S1 sin umbrales; KPIs finales con umbrales en S5
- Nuevo command `/cliente-aprobo` reemplaza edición manual del tracker
- Versionado automático de propuesta en S4 (`propuesta-v1.md`, `v2.md`...)
- Detección de cambio de opción en iteraciones de propuesta
- Modalidad explícita: recomendación única vs opciones abiertas al cliente
- Análisis competitivo diferenciado: S1 desde problema, S3 desde solución
- Gate humano documentado en CLAUDE.md con 5 estados posibles
- `/gate-check` contempla rechazo de cliente y otros casos no-happy-path
- Nota sobre tiempos netos (~4.5h) vs calendario real (5-10 días hábiles)

**Nueva sección:** Sección 7 — Gate intermedio — Aprobación del cliente

**Nuevo command:** `cliente-aprobo.md`

**Nuevos artefactos en skeleton:** `docs/_propuestas/`

---

## v3.0 — 2026-04-15

### Fase 01 Prompt Templates

**Cambios principales:**
- 2 sesiones nuevas: S3 (Exploración de opciones) y S4 (Propuesta al cliente)
- Flujo de 5 sesiones → 7 sesiones
- Nuevo artefacto: `docs/OPCIONES-SOLUCION.md`
- Nuevo artefacto: `docs/PROPUESTA-CLIENTE.md`
- Gate intermedio: cliente debe aprobar antes del PRD
- PRD ahora se escribe sobre dirección ya aprobada

---

## v2.0 — 2026-04-14

### Fase 01 Prompt Templates

**Cambios principales:**
- Repositorio central de templates con `init-project.sh`
- Commands de Claude Code ejecutables por sesión (`/s[N]-nombre`)
- Tracking integrado en `docs/_tracking/FASE-01-STATUS.md`
- Flujo de ejecución unificado (37 pasos sin tareas implícitas)
- Sección 9 de flujo completo

---

## v1.0 — 2026-04-13

### Fase 01 Prompt Templates

**Versión inicial:**
- 5 sesiones con prompts detallados
- Instrucciones de modo (Plan Mode / Normal Mode) y modelo (Opus/Sonnet)
- Gate de salida con checklist de 20 items
- Referencia rápida de 24 prompts
- Notas sobre contexto, iteración y skills
