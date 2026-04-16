# Sesión 2 — Personas y user stories (descriptivas)

## Instrucciones de ejecución
- MODO: Plan Mode (Shift+Tab x2)
- MODELO: Opus 4.6
- DURACIÓN ESTIMADA: 30-45 minutos
- PREREQUISITO: Sesión 1 completada (verificar en tracker)

## Tu tarea

Lee docs/_tracking/FASE-01-STATUS.md — verificá que Sesión 1 esté ✅.
Si no lo está, indicame que debo completarla primero.
Luego lee docs/PROBLEM-STATEMENT.md para cargar contexto.

IMPORTANTE: Las user stories en esta sesión son DESCRIPTIVAS, sin MoSCoW formal.
La priorización definitiva se hace en S5 después de elegir la opción y obtener
aprobación del cliente. Si priorizamos acá, estaríamos decidiendo alcance sin
saber cuál es la solución ni si el cliente aprueba la dirección.

### PASO 1: Explorar usuarios
Haceme preguntas de a 2-3 sobre:
- ¿Quiénes son los usuarios principales? (rol, contexto, nivel técnico)
- ¿En qué momento interactúan con el problema?
- ¿Qué los frustra más de la situación actual?
- ¿Qué intentaron para resolverlo?
- ¿Hay tipos de usuario con necesidades distintas?
- ¿Quién paga vs quién usa?

### PASO 2: Persona primaria
Construí la persona principal con este formato:

NOMBRE: [Nombre ficticio]
ROL: [Título]
CONTEXTO: [2-3 oraciones sobre su día a día]
DOLOR PRINCIPAL: [1 oración]
GOAL: [Qué quiere lograr, no qué feature quiere]
JOURNEY ACTUAL: [3-5 pasos] → PUNTO DE DOLOR: [dónde se rompe]
JOURNEY DESEADO: [3-5 pasos genéricos, agnósticos de solución] → BENEFICIO: [qué gana]
MÉTRICA DE ÉXITO PERSONAL: [Cómo sabe que le sirve]
FRASE TEXTUAL: "[Lo que diría sobre su problema]"

El JOURNEY DESEADO debe describir QUÉ cambia para el usuario, no CÓMO se implementa.
Presentá para revisión. No avances sin mi OK.

### PASO 3: Personas secundarias
1-2 personas más: nombre/rol, diferencia clave vs primaria, dolor específico,
qué le importa diferente, posibles conflictos con la primaria.
Si no hay secundarias relevantes, justificá por qué una alcanza.

### PASO 4: User stories descriptivas
Escribí 10-12 user stories:
COMO [persona], QUIERO [acción concreta], PARA [beneficio].
CRITERIOS DESCRIPTIVOS (detallaremos criterios binarios en S5):
- [ ] [Qué debe ocurrir]
CANDIDATO A MUST: Sí / No / Depende de la opción elegida

Reglas: story de UNA persona. NO hacer MoSCoW completo. Solo marcador tentativo.
"Candidato Sí" = esencial para cualquier opción de solución.
"Candidato Depende" = depende del enfoque elegido en S3.

### PASO 5: Generar documentación
1. Creá docs/PERSONAS.md con: persona primaria, secundarias, stories con marcador tentativo.
   Incluir nota: "MoSCoW formal se define en S5 post-aprobación del cliente."
2. Actualizá tracker items 2.1 a 2.6 como [x].
3. Estado sesión → ✅ Completada. Historial.

### PASO 6: Context dump
docs/_session-notes/session-02.md. Marcá item 2.7. Indicame que ejecute /clear.
