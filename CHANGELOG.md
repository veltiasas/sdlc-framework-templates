# CHANGELOG — Framework SDLC con Claude Code

Changelog consolidado de los tres artefactos maestros del framework. Cada artefacto
tiene su propia numeración de versión pero se referencian entre sí para garantizar
coherencia.

## Matriz de versiones actual (2026-04-17)

| Artefacto | Versión | Ubicación |
|-----------|---------|-----------|
| framework-sdlc.docx | 2.0 | Distribución externa (fuera del repo) |
| fase-01-prompt-templates | 3.2 | docs/fase-01-prompt-templates-v3-2.md |
| workplan.json schema | 2.0 | skeleton/docs/_tracking/workplan.json |
| sdlc-framework-templates repo | 3.2 | Este repositorio (GitHub) |

---

## Release v2.0 — 2026-04-17 (coordinada)

### framework-sdlc.docx v2.0
Cambios mayores respecto a v1.0:
- Estructura híbrida: Fase 01 remite a la guía operativa v3.2; Fases 02-06 con detalle en el documento
- Sección nueva (capítulo 2): Matriz de versionado y coherencia entre artefactos
- Sección nueva (capítulo 3): Setup inicial con repositorio central sdlc-framework-templates
- Sección nueva (capítulo 12): Sistema de tracking con workplan.json schema v2.0
- Fase 01 actualizada a flujo de 7 sesiones con gate intermedio
- Fase 01 incorpora filosofía "existencia vs detalle" para proyectos de integración
- Fase 01 con cláusula de factibilidad técnica en la propuesta
- Fase 02 con primer paso de validación de supuestos de factibilidad (hereda cláusula)
- Checklist de auditoría actualizado con checks v3.2
- Templates de Fase 01 referencian guía operativa en lugar de duplicar contenido

### workplan.json schema v2.0
Cambios respecto a v1.0:
- schema_version agregado explícitamente (2.0)
- framework_version agregado (2.0)
- source_of_truth: referencias a framework-doc y phase-01-guide con versiones
- coherence_check: reglas para detectar desalineamientos
- Fase 01 reestructurada a 7 sesiones + gate intermedio (antes 5 sesiones lineales)
- project_type agregado (greenfield / integration / mixed)
- project_type_legend con definiciones
- status_legend extendido (waiting_approval, iterating, rejected)
- Cada sesión ahora incluye el command asociado (/s1-relevamiento, etc.)
- S1: 8 tareas (incluye 1.6 inventario técnico)
- S3: 3.3 y 3.4 incluyen dependencias de integración y supuestos heredados
- S4: 4.5 incluye cláusula de factibilidad técnica
- S4: campos current_version y client_iterations para propuestas versionadas
- S5: 5.5 incluye supuestos de factibilidad en PRD sección 8.2
- intermediate_gate explícito con bloqueo de S5/S6/S7
- exit_gate con 10 checks, incluye correspondencia cláusula-PRD-inventario
- changelog interno del JSON con historial

### fase-01-prompt-templates v3.2
Cambios respecto a v3.1:
- Nuevo PASO 6 en S1: inventario técnico de alto nivel (existencia, no detalle)
- Dependencias de integración explícitas por opción en S3
- Cláusula de factibilidad técnica en la propuesta (S4)
- Supuestos de factibilidad en PRD sección 8.2 (S5)
- Gate-check verifica coherencia entre cláusula, PRD y inventario
- Tracker con items nuevos (1.6-1.8, 4.5) y marcador "Tipo de proyecto"

### sdlc-framework-templates repo v3.2 (bump de release coordinado)
- Incluye workplan.json v2.0 en skeleton/docs/_tracking/
- Referencias cruzadas a framework-sdlc-v2-0.docx
- CHANGELOG consolidado coordinando versiones
- README actualizado con matriz de versiones

---

## Historial

### v3.2 — 2026-04-16 (solo fase-01-prompt-templates)
Cláusula de factibilidad técnica. Ver detalle en docs/fase-01-prompt-templates-v3-2.md.

### v3.1 — 2026-04-16 (solo fase-01-prompt-templates)
Correcciones críticas: MoSCoW diferido, KPIs en dos momentos, /cliente-aprobo,
versionado de propuesta, gate humano documentado.

### v3.0 — 2026-04-15 (solo fase-01-prompt-templates)
Sesiones S3 y S4 nuevas, flujo 5 → 7 sesiones, gate intermedio.

### v2.0 — 2026-04-14 (solo fase-01-prompt-templates)
Repositorio central, init-project.sh, commands ejecutables, tracker integrado.

### v1.0 — 2026-04-13
Versión inicial de framework-sdlc.docx, fase-01-prompt-templates.md y workplan.json.
Framework completo documentado pero sin estructura de 7 sesiones ni gates.

---

## Reglas de actualización futuras

Cuando se modifique cualquier artefacto del framework, seguir este orden:

1. Si cambia la guía operativa (fase-01-prompt-templates):
   - Bump de versión según magnitud (patch/minor/major)
   - Evaluar si workplan.json necesita regenerarse (siempre sí si cambian sesiones o tareas)
   - Evaluar si framework-sdlc.docx necesita bump (sí si cambia el resumen de Fase 01)
   - Actualizar este CHANGELOG con entrada coordinada

2. Si cambia el framework general (framework-sdlc.docx):
   - Bump de versión
   - workplan.json solo cambia si se agrega/quita una fase
   - fase-01-prompt-templates no cambia necesariamente

3. Si cambia el workplan.json:
   - Si es schema bump: actualizar framework-sdlc.docx sección 12
   - Si son campos opcionales: solo bump patch
   - Regenerar workplan.json del skeleton del repo

4. Commit message del release coordinado:
   `release: framework v2.0 + phase-01 v3.2 + workplan schema v2.0 - [resumen]`

5. Cada release debe actualizar:
   - README.md del repo (versión actual)
   - CHANGELOG.md (esta tabla + entrada nueva)
   - Tag de git: `git tag release-YYYY-MM-DD` o `release-vN.N`
