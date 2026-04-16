# Sesión 4 — Propuesta al cliente (versionable)

## Instrucciones de ejecución
- MODO: Plan Mode (Shift+Tab x2)
- MODELO: Opus 4.6
- DURACIÓN ESTIMADA: 30-45 min (primera vez), 15-25 min (iteraciones)
- PREREQUISITO: Sesiones 1-3 completadas (verificar en tracker)

## Tu tarea

Lee docs/_tracking/FASE-01-STATUS.md — verificá que Sesiones 1-3 estén ✅.
Luego lee docs/PROBLEM-STATEMENT.md, docs/PERSONAS.md y docs/OPCIONES-SOLUCION.md.

### PASO 0: Detectar si es primera versión o iteración
Verificá si existe docs/PROPUESTA-CLIENTE.md:
- NO existe → primera versión (v1).
- SÍ existe → iteración. Preguntame:
  * ¿Cuál fue el feedback del cliente?
  * ¿Qué partes modificar?
  * ¿Es ajuste menor (alcance/timeline) o cambio de opción?
  * Si CAMBIO DE OPCIÓN: detené y recomendame volver a /s3-opciones con el feedback.
  * Si ajuste: continuá.
Determiná número de versión y agregá nota en tracker: "Iteración #[N] por: [resumen]"

### PASO 1: Definir formato de propuesta
Preguntame (o confirmá de iteración previa):
- ¿El cliente espera formato específico?
- ¿Debe incluir precio/cotización?
- ¿Quién aprueba del lado del cliente? (nivel técnico del lector)
- ¿Punto crítico o innegociable del cliente?
- ¿Fases de pago o hitos de entrega?
- ⭐ ¿Modalidad: UNA recomendación (default) o MÚLTIPLES opciones para que el cliente elija?

### PASO 2: Armar la propuesta

#### MODO RECOMENDACIÓN (default)

# Propuesta: [NOMBRE_PROYECTO]

## 1. Entendimiento del problema
[Resumen del relevamiento. Demostrar que entendimos la situación del cliente.
Usar el lenguaje y términos del cliente, no jerga técnica.]

## 2. Solución propuesta
[Descripción de la opción recomendada en lenguaje NO técnico.
Qué va a poder hacer el usuario que hoy no puede. Hablar de resultados, no de tecnología.]

## 3. Alcance del MVP (primera entrega)
Lo que SÍ incluye:
- [Feature 1 en lenguaje de negocio]
Lo que NO incluye (y por qué):
- [Feature excluida: razón]

## 4. Etapas de trabajo
| Etapa | Duración estimada | Entregable |
|-------|-------------------|-----------|

## 5. Qué necesitamos del cliente
[Acceso, información, personas disponibles para validación, aprobaciones]

## 6. Criterio de éxito
[Métricas concretas en términos de negocio, no técnicos]

## 7. Evolución posterior
[Qué viene después del MVP si valida. Sin comprometer alcance.]

## 8. Condiciones y supuestos
[Lo que asumimos como cierto. Si cambia, el alcance cambia.]

## 9. Alternativas consideradas (anexo)
[Otras opciones evaluadas y por qué elegimos la recomendada]

## 10. [Inversión — si aplica]

#### MODO OPCIONES ABIERTAS (alternativo)
Adaptar estructura para presentar 2-3 opciones con nuestra recomendación al final.

---
Estado: BORRADOR | Versión: v[N] | Fecha: [FECHA]
Aprobado por cliente: ____________ | Fecha: ____________

### PASO 3: Refinar lenguaje
Verificar: sin jerga técnica, usa términos del cliente, legible en 10 min, tono profesional.

### PASO 4: Generar documentación versionada
1. Si v1: crear docs/PROPUESTA-CLIENTE.md.
   Si iteración: mover versión actual a docs/_propuestas/propuesta-v[N-1].md, crear nueva v[N].
2. Agregar al inicio: "Versión v[N] — [FECHA]"
3. Actualizá tracker: items 4.1 a 4.6 [x], iteraciones++, Estado → ⏸️ Esperando aprobación.
4. Historial: "Propuesta v[N] generada, pendiente aprobación del cliente"

### PASO 5: Context dump
docs/_session-notes/session-04-v[N].md. Marcá item 4.7.
Indicame que:
1. Ejecute /clear
2. Presente docs/PROPUESTA-CLIENTE.md al cliente
3. Si aprobó → /cliente-aprobo | Si pidió cambios → /s4-propuesta | Si rechazó → /s3-opciones
