# Sesión 1 — Relevamiento del problema

## Instrucciones de ejecución
- MODO: Plan Mode (verificá que esté activo con Shift+Tab x2)
- MODELO: Opus 4.6
- DURACIÓN ESTIMADA: 45-60 minutos (greenfield) / 60-90 minutos (integración)
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

### PASO 5: Proceso actual y actores (relevamiento operativo)
Documentá: flujo de trabajo actual paso a paso, actores por paso, herramientas que usan hoy, puntos de fricción.

### PASO 6: Inventario técnico de alto nivel (existencia, no detalle)
Este paso identifica los sistemas y actores técnicos que el producto deberá tocar,
SIN detallarlos técnicamente. El detalle (APIs, auth, formatos, SLAs) se releva en Fase 02.

Arrancá preguntando: "¿El producto que vamos a construir va a integrarse con sistemas
existentes del cliente, o es completamente nuevo (greenfield)?"

CASO A — Greenfield (no hay sistemas externos a integrar):
Confirmá en 30 segundos:
- ¿El producto funciona autónomamente sin depender de sistemas del cliente?
- ¿Hay servicios de terceros obvios (pagos, email, auth social) a considerar?
Documentá: "No se identifican integraciones con sistemas existentes del cliente.
Dependencias de terceros: [lista corta si aplica]."
Saltá al PASO 7.

CASO B — Integración con sistemas existentes:
Para cada sistema/componente que el producto necesitará tocar, relevá SIN detalle técnico:

SISTEMA: [Nombre que usa el cliente]
PROPÓSITO DE NEGOCIO: [Qué hace ese sistema para el cliente, 1 oración]
DUEÑO: [Área/equipo del cliente que lo mantiene]
EXISTE HOY: Sí / No (si Sí: confirmado por cliente; si No: está en plan construirlo)
ACCIONES QUE EL PRODUCTO NECESITARÁ: [consultar / escribir / suscribirse a eventos / disparar acciones]
¿EL CLIENTE CONFIRMA ACCESO?: Sí / No / Por verificar
SUPUESTO DE FACTIBILIDAD: [1 oración; ej: "asumimos que tiene forma programática de consulta;
  formato y performance se validan en Fase 02"]

NO preguntar ni documentar acá: endpoints, formatos, auth, rate limits, SLAs, ambientes,
credenciales, versiones de API. Todo eso es Fase 02.

SÍ preguntar:
- ¿Qué sistemas existen hoy que participan del proceso?
- ¿El cliente los controla o son de terceros?
- ¿Hay sistemas legacy, viejos o sin mantenimiento activo?
- ¿Restricciones regulatorias o compliance en estos sistemas?

Al final, listá los SUPUESTOS DE FACTIBILIDAD TÉCNICA pendientes de validación en Fase 02.

### PASO 7: Generar documentación
Cuando TODO lo anterior esté aprobado:
1. Creá docs/PROBLEM-STATEMENT.md con:
   - Problem statement (1 oración)
   - Evidencia del problema
   - Proceso actual y actores
   - Inventario técnico de alto nivel (sistemas, acciones, supuestos de factibilidad)
   - Análisis competitivo desde el problema
   - KPIs candidatos (sin umbrales)
   - Preguntas abiertas para S3
2. Actualizá docs/_tracking/FASE-01-STATUS.md marcando items 1.1 a 1.7 como [x].
3. Completá el campo "Tipo de proyecto" del tracker: Greenfield / Integración / Mixto.
4. Estado sesión → ✅ Completada. Fecha en historial.

### PASO 8: Context dump
docs/_session-notes/session-01.md con: decisiones, preguntas abiertas, supuestos de
factibilidad pendientes, prep para S2. Marcá item 1.8 en el tracker.
Indicame que ejecute /clear.
