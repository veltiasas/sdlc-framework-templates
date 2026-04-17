# Sesión 4 — Propuesta al cliente (versionable)

## Instrucciones de ejecución
- MODO: Plan Mode (Shift+Tab x2)
- MODELO: Opus 4.6
- DURACIÓN ESTIMADA: 30-45 min (primera vez), 15-25 min (iteraciones)
- PREREQUISITO: Sesiones 1-3 completadas (verificar en tracker)

## Tu tarea

Lee docs/_tracking/FASE-01-STATUS.md — verificá que Sesiones 1-3 estén ✅.
Luego lee docs/PROBLEM-STATEMENT.md (incluido el inventario técnico), docs/PERSONAS.md
y docs/OPCIONES-SOLUCION.md.

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
Preguntame:
- ¿El cliente espera formato específico?
- ¿Debe incluir precio/cotización?
- ¿Quién aprueba del lado del cliente? (nivel técnico del lector)
- ¿Punto crítico o innegociable?
- ¿Fases de pago o hitos de entrega?
- ⭐ ¿Modalidad: UNA recomendación (default) o MÚLTIPLES opciones para que el cliente elija?

### PASO 2: Armar la propuesta

#### MODO RECOMENDACIÓN (default)

# Propuesta: [NOMBRE_PROYECTO]

## 1. Entendimiento del problema
[Resumen del relevamiento. Lenguaje del cliente, no jerga técnica.]

## 2. Solución propuesta
[Descripción de la opción recomendada en lenguaje NO técnico.
Qué va a poder hacer el usuario que hoy no puede.]

## 3. Alcance del MVP (primera entrega)
Lo que SÍ incluye / Lo que NO incluye (con razón)

## 4. Etapas de trabajo
| Etapa | Duración | Entregable |

## 5. Qué necesitamos del cliente
[Acceso, información, personas disponibles, aprobaciones]

## 6. Criterio de éxito
[Métricas en términos de negocio]

## 7. Evolución posterior
[Qué viene después del MVP si valida]

## 8. Condiciones y supuestos
[Lo que asumimos como cierto]

## 9. Alternativas consideradas (anexo)
[Otras opciones evaluadas y por qué elegimos la recomendada]

## 10. [Inversión — si aplica]

## 11. Cláusula de factibilidad técnica
Esta propuesta asume que las integraciones con los sistemas identificados son
técnicamente factibles. La validación detallada (formatos, protocolos, performance,
disponibilidad de ambientes) se realiza en la fase de diseño técnico posterior
a la aprobación de esta propuesta.

Sistemas sobre los que se asume factibilidad:
[Lista de sistemas del inventario técnico de S1 que la opción recomendada requiere tocar.
Si es proyecto greenfield sin integraciones: "No aplica. El producto se construye
de forma autónoma sin depender de sistemas existentes del cliente."]

Supuestos específicos:
[Los supuestos de factibilidad de la opción recomendada, copiados de OPCIONES-SOLUCION.md]

Compromiso del proveedor: Si durante la fase de diseño técnico se detecta que
alguno de estos supuestos no se cumple (por ejemplo: sistema sin forma programática
de consulta, sin ambiente de prueba, performance no soporta el caso de uso), se
comunicará al cliente en un plazo no mayor a [N] días hábiles con:
- Descripción del problema detectado
- Impacto en alcance / timeline / costo
- Opciones de ajuste
- Ninguna modificación se ejecuta sin acuerdo escrito del cliente

Esta cláusula protege a ambas partes: evita promesas imposibles del lado del
proveedor y evita sorpresas tardías del lado del cliente.

#### MODO OPCIONES ABIERTAS (alternativo)
Adaptar estructura para presentar 2-3 opciones con recomendación al final.
Incluir cláusula de factibilidad como sección 6 (sistemas y supuestos varían por opción).

---
Estado: BORRADOR | Versión: v[N] | Fecha: [FECHA]
Aprobado por cliente: ____________ | Fecha: ____________

### PASO 3: Refinar lenguaje
Verificar: sin jerga técnica en el cuerpo del documento, usa términos del cliente,
legible en 10 min, tono profesional. La cláusula de factibilidad puede usar términos
técnicos (es su función) pero debe ser comprensible para un lector de negocio.

### PASO 4: Generar documentación versionada
Cuando esté aprobada internamente:
1. Si es v1: crear docs/PROPUESTA-CLIENTE.md con cláusula de factibilidad completa.
   Si iteración: mover versión actual a docs/_propuestas/propuesta-v[N-1].md, crear nueva v[N].
2. Agregar al inicio: "Versión v[N] — [FECHA]"
3. Actualizá tracker: items 4.1 a 4.7 como [x], iteraciones++, Estado → ⏸️ Esperando aprobación.
4. Historial: "Propuesta v[N] generada, pendiente aprobación del cliente"

### PASO 5: Context dump
docs/_session-notes/session-04-v[N].md. Marcá item 4.8.
Indicame que:
1. Ejecute /clear
2. Presente docs/PROPUESTA-CLIENTE.md al cliente (incluye cláusula de factibilidad)
3. Si aprobó → /cliente-aprobo | Si pidió cambios → /s4-propuesta | Si rechazó → /s3-opciones
