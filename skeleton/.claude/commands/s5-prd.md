# Sesión 5 — PRD, MoSCoW definitivo y KPIs con umbrales

## Instrucciones de ejecución
- MODO: Plan Mode (Shift+Tab x2)
- MODELO: Opus 4.6
- DURACIÓN ESTIMADA: 60-90 minutos (la más larga)
- PREREQUISITO: /cliente-aprobo ejecutado (gate intermedio ✅)

## Tu tarea

Lee docs/_tracking/FASE-01-STATUS.md — verificá que el gate intermedio esté ✅.
Si NO está aprobado:
- Sin propuesta: /s4-propuesta
- Sin presentar al cliente: presentar docs/PROPUESTA-CLIENTE.md
- Aprobado pero no registrado: /cliente-aprobo

Luego lee TODOS los archivos en docs/. En particular docs/PROPUESTA-CLIENTE.md.

RECORDÁ: Las stories de S2 no tienen MoSCoW. Los KPIs de S1 no tienen umbrales.
Esta sesión formaliza ambas cosas con la opción aprobada como contexto.

### PASO 1: MoSCoW definitivo
Tomá las user stories de PERSONAS.md y el alcance aprobado en PROPUESTA-CLIENTE.md.
Para cada story, definí prioridad DEFINITIVA (Must/Should/Could/Won't).
Para cada MUST candidato, preguntame:
1. ¿Es indispensable para el alcance aprobado?
2. ¿Se puede validar SIN esta feature?
3. ¿Cuál es el MÍNIMO que alcanza?
4. ¿Está dentro de lo aprobado por el cliente?

REGLAS: Máx 5-7 MUST. No incluir nada fuera del alcance aprobado.
Si aparece un MUST que no estaba en la propuesta → STOP. Hay que volver a /s4-propuesta.

### PASO 2: Abogado del diablo
1. ¿Se puede validar la hipótesis con estas features?
2. ¿Falta algo que sacamos que es crítico?
3. ¿Algún SHOULD es MUST disfrazado?
4. ¿Se construye en el timeline aprobado?
Si 4 es "no": recortar más O volver a /s4-propuesta para renegociar timeline.

### PASO 3: KPIs finales con umbrales
Tomá los KPIs candidatos de PROBLEM-STATEMENT.md (sin umbrales).
Con la opción elegida, definí para cada KPI:
- Nombre (puede actualizarse)
- Cómo se mide
- Umbral de éxito MVP
- Umbral de éxito producto completo
- Cómo se instrumenta
Pueden surgir KPIs nuevos propios de la opción. Documentar.

### PASO 4: Riesgos y supuestos
Preguntame por categoría: Supuestos, Riesgos técnicos, Riesgos de producto.
Para cada uno: Probabilidad (A/M/B) + Impacto (A/M/B) + Mitigación.
Consolidar con riesgos ya identificados en S3/S4 sin duplicar.

### PASO 5: Generar PRD (docs/PRD.md)
10 secciones OBLIGATORIAS:
1. Resumen ejecutivo
2. Problema (referencia a PROBLEM-STATEMENT.md)
3. Propuesta de valor (de la opción elegida, referencia a OPCIONES-SOLUCION.md)
4. Usuarios objetivo (referencia a PERSONAS.md)
5. Alcance MVP — feature por feature con: descripción, user story, criterios de aceptación BINARIOS
6. Features futuras: Should / Could / Won't con razón
7. Métricas de éxito (KPIs finales con umbrales)
8. Riesgos y supuestos (tabla)
9. Timeline (alineado con PROPUESTA-CLIENTE.md aprobada)
10. Dependencias externas
Pie: Estado BORRADOR, fecha, espacio para aprobación interna.
REGLA: criterios de aceptación BINARIOS. Nada de "mejorar" o "optimizar".

### PASO 6: Generar MVP-SCOPE (docs/MVP-SCOPE.md)
Features incluidas (Must), excluidas con razón, criterio de éxito, supuestos que validamos,
timeline alineado con propuesta, condiciones para pasar a producto completo.

### PASO 7: Actualizar tracker y context dump
Items 5.1 a 5.8. Estado → ✅. Historial.
docs/_session-notes/session-05.md. Indicame que ejecute /clear.
