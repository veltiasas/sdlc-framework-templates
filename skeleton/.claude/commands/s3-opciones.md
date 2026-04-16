# Sesión 3 — Exploración de opciones de solución

## Instrucciones de ejecución
- MODO: Plan Mode (Shift+Tab x2)
- MODELO: Opus 4.6
- DURACIÓN ESTIMADA: 45-60 minutos
- PREREQUISITO: Sesiones 1 y 2 completadas (verificar en tracker)

## Tu tarea

Lee docs/_tracking/FASE-01-STATUS.md — verificá que Sesiones 1 y 2 estén ✅.
Luego lee docs/PROBLEM-STATEMENT.md y docs/PERSONAS.md.

Vamos a explorar OPCIONES de solución. No estamos definiendo LA solución todavía.

### PASO 1: Restricciones y preferencias
Haceme preguntas sobre:
- ¿Restricciones de presupuesto? (rango aproximado)
- ¿Restricciones de timeline? (¿cuándo necesita el cliente algo funcionando?)
- ¿Infraestructura existente que reutilizar o respetar?
- ¿Experiencia del equipo con algún stack?
- ¿Preferencias del cliente? (mobile, integración con X, etc.)
- ¿Restricciones regulatorias o de compliance?
- ¿El cliente prefiere ver UNA recomendación o MÚLTIPLES opciones para elegir?

### PASO 2: Análisis competitivo desde la solución
En S1 vimos qué problema resuelven mal los competidores.
Ahora: ¿cómo lo resolvieron? ¿qué enfoque técnico/de producto eligieron?
Tabla: Alternativa | Enfoque técnico | Por qué eligieron eso | Qué aprender / Qué evitar

### PASO 3: Proponer 2-3 opciones de solución
Enfoques GENUINAMENTE distintos. Para cada opción:

OPCIÓN [A/B/C]: [Nombre descriptivo]
ENFOQUE: [1-2 oraciones de estrategia]
PROPUESTA DE VALOR: [1 oración: cómo esta opción específicamente resuelve el problema]
USER STORIES QUE CUBRE: [IDs o descripción de stories de PERSONAS.md]
USER STORIES QUE NO CUBRE: [Qué queda afuera]
COMPLEJIDAD: Alta / Media / Baja
TIMELINE ESTIMADO MVP: [semanas]
RIESGO PRINCIPAL: [El mayor riesgo de este enfoque]
VENTAJA CLAVE: [Por qué alguien elegiría esta opción]

Ejemplo de opciones distintas:
- A: Automatizar flujo completo (más valor, más riesgo)
- B: Resolver solo cuello de botella (rápido, validable)
- C: Integrar con herramienta existente (menos desarrollo, más dependencia)

### PASO 4: Análisis de trade-offs

| Criterio | Opción A | Opción B | Opción C |
|----------|----------|----------|----------|
| User stories MUST tentativas | | | |
| Tiempo de desarrollo MVP | | | |
| Complejidad técnica | | | |
| Riesgo de no validar hipótesis | | | |
| Escalabilidad posterior | | | |
| Dependencias externas | | | |
| Costo relativo | | | |
| Reversibilidad si falla | | | |

Preguntar: ¿criterio que pese más? ¿Alguna opción descartada de entrada?

### PASO 5: Recomendación con plan B
- ¿Qué opción recomendás y por qué?
- ¿Elementos de otras opciones a incorporar?
- Riesgo principal de la recomendada + mitigación
- Plan B si la recomendación falla
Presentá para mi aprobación antes de documentar.

### PASO 6: Generar documentación
1. Creá docs/OPCIONES-SOLUCION.md: contexto, restricciones, análisis competitivo solución,
   fichas completas de opciones, tabla trade-offs, recomendación + plan B, modalidad propuesta.
2. Actualizá tracker items 3.1 a 3.7 como [x]. Estado → ✅. Historial.

### PASO 7: Context dump
docs/_session-notes/session-03.md. Marcá item 3.8. Indicame que ejecute /clear.
