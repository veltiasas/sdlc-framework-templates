# Sesión 1 — Relevamiento del problema

## Instrucciones de ejecución
- MODO: Plan Mode (verificá que esté activo con Shift+Tab x2)
- MODELO: Opus 4.6
- DURACIÓN ESTIMADA: 45-60 minutos
- PREREQUISITO: Proyecto inicializado con init-project.sh

## Tu tarea

Lee docs/_tracking/FASE-01-STATUS.md para saber el estado actual.
Luego lee todos los archivos en docs/ para cargar contexto existente.

Vamos a RELEVAR el problema. En esta sesión NO vamos a definir la solución
ni la propuesta de valor definitiva. Solo queremos entender a fondo el problema.

Procedé en este orden estricto, esperando mi respuesta en cada paso:

### PASO 1: Exploración del problema
Haceme preguntas para entender el espacio del problema. Preguntá de a 2-3, no todas juntas:
- ¿Quién tiene este problema? (tipos de usuario)
- ¿Cómo lo resuelven hoy? (alternativas actuales, herramientas, procesos manuales)
- ¿Por qué las soluciones actuales no alcanzan?
- ¿Qué cambiaría si el problema se resolviera bien?
- ¿Hay evidencia de que el problema existe?
- ¿Cuál es el proceso actual paso a paso?
- ¿Qué actores participan en el proceso?

### PASO 2: Problem statement
Con mis respuestas, sintetizá en 1 oración:
"[Tipo de usuario] necesita [capacidad] porque [dolor], lo que causa [consecuencia medible]."
Si no cabe en 1 oración, proponé cómo recortar el alcance.
IMPORTANTE: No armamos "propuesta de valor" aquí. Eso depende de la opción elegida en S3.

### PASO 3: Análisis competitivo desde el problema
Preguntame sobre competidores y alternativas conocidas.
Tabla: Alternativa | Qué problema resuelve | Qué NO resuelve / Dónde falla
Mínimo 3 alternativas (incluir workarounds manuales).
NOTA: En S3 volvemos a mirar competencia desde el ángulo de la SOLUCIÓN (cómo resolvieron).

### PASO 4: KPIs candidatos (alto nivel, sin umbrales)
Proponé 3-5 KPIs candidatos: qué querría medir el negocio si el problema estuviera resuelto.
Para cada uno: nombre, qué mide, por qué es relevante. NO definir umbral numérico aún.
Los umbrales se fijan en S5 con la opción elegida.

### PASO 5: Proceso actual y actores
Documentá: flujo de trabajo actual paso a paso, actores por paso, herramientas que usan hoy, puntos de fricción.

### PASO 6: Generar documentación
Cuando TODO lo anterior esté aprobado:
1. Creá docs/PROBLEM-STATEMENT.md con: problem statement, evidencia, proceso actual, actores, análisis competitivo, KPIs candidatos.
2. Actualizá docs/_tracking/FASE-01-STATUS.md marcando items 1.1 a 1.6 como [x].
3. Estado sesión → ✅ Completada. Fecha en historial.

### PASO 7: Context dump
Guardá docs/_session-notes/session-01.md con: decisiones, preguntas abiertas, prep para S2.
Marcá item 1.7 en el tracker.
Indicame que ejecute /clear.
