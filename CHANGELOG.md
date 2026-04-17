# CHANGELOG — sdlc-framework-templates

## v3.2 — 2026-04-17

### Fase 01 Prompt Templates

**Problema atacado:** La Fase 01 v3.1 funcionaba bien para proyectos greenfield pero
podía generar propuestas que prometían integraciones con sistemas existentes del cliente
sin evidencia de su factibilidad. Esto afectaba especialmente a proyectos de orquestación
(agentes de IA, integraciones entre sistemas legacy, etc.).

**Filosofía de la revisión:** Distinción "existencia vs detalle". La Fase 01 identifica
QUÉ sistemas deben integrarse sin detallarlos técnicamente. El detalle (APIs, auth, SLAs,
formatos) queda para Fase 02.

**Cambios:**
- Nuevo PASO 6 en S1: inventario técnico de alto nivel. Paso universal que se adapta —
  30 segundos en greenfield, 10-15 minutos en proyectos de integración.
- Dependencias de integración explícitas por opción en S3
- Nueva sección 11 en la propuesta al cliente: cláusula de factibilidad técnica con
  compromiso de renegociación si la validación en Fase 02 falla
- Nueva subsección 8.2 en el PRD: supuestos de factibilidad pendientes de validación
- Gate-check verifica coherencia entre cláusula de propuesta, PRD 8.2 e inventario de S1
- Tracker con items nuevos (1.6, 1.7, 1.8, 4.5) y marcador "Tipo de proyecto"

**Sin cambios estructurales en cantidad de sesiones:** Sigue siendo 7 sesiones.
La S1 se extiende pero no se agregan sesiones nuevas.

---

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

- 2 sesiones nuevas: S3 (Exploración de opciones) y S4 (Propuesta al cliente)
- Flujo de 5 sesiones → 7 sesiones
- Nuevo artefacto: `docs/OPCIONES-SOLUCION.md`
- Nuevo artefacto: `docs/PROPUESTA-CLIENTE.md`
- Gate intermedio: cliente debe aprobar antes del PRD
- PRD ahora se escribe sobre dirección ya aprobada

---

## v2.0 — 2026-04-14

### Fase 01 Prompt Templates

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
