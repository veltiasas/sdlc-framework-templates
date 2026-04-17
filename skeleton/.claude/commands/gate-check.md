# Gate de salida — Validación cruzada de Fase 01

Lee TODOS los archivos en docs/ y hacé una validación exhaustiva.

## 1. EXISTENCIA
- [ ] docs/PROBLEM-STATEMENT.md (con inventario técnico de alto nivel)
- [ ] docs/PERSONAS.md
- [ ] docs/OPCIONES-SOLUCION.md (con dependencias de integración por opción)
- [ ] docs/PROPUESTA-CLIENTE.md (con cláusula de factibilidad y aprobación formalizada)
- [ ] docs/PRD.md (con sección 8.2 de supuestos de factibilidad)
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
- ¿Los supuestos de factibilidad del PRD (8.2) se corresponden con los de la
  cláusula de PROPUESTA-CLIENTE.md?
- ¿Los sistemas en la cláusula de factibilidad se corresponden con el inventario
  técnico de PROBLEM-STATEMENT.md?

## 4. COMPLETITUD
- PRD: 10 secciones, criterios BINARIOS. ¿Sección 8.2 presente con supuestos de factibilidad?
- PERSONAS: persona primaria con journey, user stories descriptivas
- OPCIONES: mín. 2 opciones, trade-offs, recomendación con plan B, cada opción con
  dependencias de integración y supuestos de factibilidad heredados
- PROPUESTA: alcance MVP, timeline, condiciones, aprobación formalizada, cláusula de
  factibilidad técnica con sistemas, supuestos y compromiso de renegociación
- MVP-SCOPE: features excluidas con razón, criterio de éxito
- ARCHITECTURE: servicios con boundaries, stack justificado
- PROBLEM-STATEMENT: inventario técnico de alto nivel presente (aunque diga "no aplica"
  si es greenfield)

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

### Caso especial: cláusula de factibilidad sin correspondencia
Si el PRD declara supuestos de factibilidad que no están en la cláusula de
PROPUESTA-CLIENTE.md (o viceversa), es bloqueante. El PRD no puede tener supuestos
de factibilidad que el cliente no haya aceptado en la propuesta.
Corrección: volver a /s5-prd y alinear con la cláusula, o volver a /s4-propuesta
si la propuesta tiene menos supuestos de los que debería (y reiterar con el cliente).
