# Gate de salida — Validación cruzada de Fase 01

Lee TODOS los archivos en docs/ y hacé una validación exhaustiva.

## 1. EXISTENCIA
- [ ] docs/PROBLEM-STATEMENT.md
- [ ] docs/PERSONAS.md
- [ ] docs/OPCIONES-SOLUCION.md
- [ ] docs/PROPUESTA-CLIENTE.md (con aprobación formalizada)
- [ ] docs/PRD.md
- [ ] docs/MVP-SCOPE.md
- [ ] docs/ARCHITECTURE-VISION.md
- [ ] .claude/CLAUDE.md (versión definitiva, <150 líneas)

## 2. APROBACIÓN DEL CLIENTE
- [ ] Gate intermedio ✅ en tracker
- [ ] docs/PROPUESTA-CLIENTE.md tiene fecha y firmante
- [ ] Resumen del tracker indica "Aprobación del cliente: ✅ [Fecha]"

## 3. CONSISTENCIA
- ¿Features MVP-SCOPE vs PRD coinciden?
- ¿Features PRD dentro del alcance aprobado en PROPUESTA-CLIENTE?
- ¿User stories MUST sin feature MVP?
- ¿Features MVP sin user story?
- ¿Servicios en ARCHITECTURE-VISION cubren todas las features del PRD?
- ¿KPIs (con umbrales) medibles con las features del MVP?
- ¿Timeline PRD alineado con la propuesta aprobada?

## 4. COMPLETITUD
- PRD: 10 secciones, criterios de aceptación BINARIOS
- PERSONAS: persona primaria con journey, user stories (MoSCoW en PRD, no acá)
- OPCIONES: mín. 2 opciones, trade-offs, recomendación con plan B
- PROPUESTA: alcance MVP, timeline, condiciones, aprobación formalizada
- MVP-SCOPE: features excluidas con razón, criterio de éxito
- ARCHITECTURE: servicios con boundaries, stack justificado

## 5. VIABILIDAD
- ¿MVP construible en el timeline comprometido?
- ¿Cantidad de MUST razonable (5-7)?
- ¿Stack conocido por el equipo?

## 6. CLARIDAD
- ¿Alguien que NO participó podría leer los docs y entender qué construir?

## Output

Clasificar en:
**✅ Aprobados** — checks que pasan
**❌ Bloqueantes** — con referencia exacta a documento y sección, y qué sesión corrige
**⚠️ Warnings** — no bloqueantes

### Si TODOS los checks pasan:
1. Tracker: marcar todos items del gate [x], Estado gate → ✅ Aprobado
2. Estado general → 🟢 Completada
3. Historial: "Gate de salida aprobado — Fase 01 cerrada"
4. Commit: git add -A && git commit -m "docs: Phase 01 gate approved — ready for Phase 02"

### Si hay BLOQUEANTES:
1. Listar exactamente qué corregir y en qué sesión
2. NO marcar gate como aprobado
3. NO commitear hasta que se corrija

### Caso especial: cliente nunca aprobó
No es arreglable inline. Opciones:
a) Obtener aprobación y ejecutar /cliente-aprobo
b) Volver a /s3-opciones si el cliente rechazó el enfoque
c) Pausar el proyecto si el cliente no responde
