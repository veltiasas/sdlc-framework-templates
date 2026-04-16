# Sesión 6 — Arquitectura de microservicios objetivo

## Instrucciones de ejecución
- MODO: Plan Mode (Shift+Tab x2)
- MODELO: Opus 4.6
- DURACIÓN ESTIMADA: 45-60 minutos
- PREREQUISITO: Sesiones 1-5 completadas (verificar en tracker)

## Tu tarea

Lee docs/_tracking/FASE-01-STATUS.md — verificá que Sesiones 1-5 estén ✅.
Luego lee docs/PRD.md y docs/MVP-SCOPE.md para cargar contexto.

NOTA: Parte de las restricciones técnicas ya surgieron en S3. No re-preguntar.
Enfocate en lo técnico que no cubrimos antes.

### PASO 1: Explorar dominio técnico
Preguntas pendientes sobre:
- Entidades y relaciones del negocio
- Preferencias o restricciones de stack no cubiertas en S3
- Datos sensibles que requieran aislamiento especial
- Integraciones externas con detalles técnicos
- Escala esperada al inicio vs 1 año

### PASO 2: Definir servicios
Para cada microservicio:

NOMBRE: [nombre-service]
RESPONSABILIDAD: [1 oración, responsabilidad única]
DATOS QUE POSEE: [entidades/tablas propias]
APIS QUE EXPONE: [2-3 endpoints principales]
EVENTOS QUE PRODUCE: [qué notifica a otros]
EVENTOS QUE CONSUME: [qué escucha de otros]
MVP: Sí / No

Reglas: 1 responsabilidad por servicio, DB propia, comunicación por API/eventos.
Después armar diagrama textual:
[servicio-a] --REST--> [servicio-b]
[servicio-b] --evento: user.created--> [servicio-c]

### PASO 3: Stack tecnológico
Preguntar sobre experiencia del equipo. Proponer:
- Por servicio: lenguaje, framework, DB (con justificación)
- Infraestructura: containers, CI/CD, orquestación futura, monitoreo
Reglas: priorizar lo conocido, no sobre-engineerear MVP, que escale después.
Si hay dos opciones igual de válidas, presentar ambas y preguntar.

### PASO 4: Comunicación entre servicios
| Origen | Destino | Tipo (sync/async) | Dato que viaja | Fallback si destino caído |

### PASO 5: Generar ARCHITECTURE-VISION (docs/ARCHITECTURE-VISION.md)
1. Principios (3-5 principios guía)
2. Servicios (ficha completa)
3. Mapa de comunicación (diagrama textual)
4. Stack tecnológico (tabla)
5. Patrones de comunicación (tabla)
6. MVP vs producto completo
7. Decisiones pendientes para Fase 02

### PASO 6: Actualizar tracker y context dump
Items 6.1 a 6.6. Estado → ✅. Historial.
docs/_session-notes/session-06.md. Indicame que ejecute /clear.
