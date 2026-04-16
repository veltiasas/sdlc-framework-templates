# [NOMBRE_PROYECTO]

## Estado actual
- Fase: 01 — Descubrimiento y planificación
- Sesión activa: Ninguna (ejecutar /s1-relevamiento para iniciar)
- No hay código. Modo planificación exclusivamente.

## [DESCRIPCION]

## Reglas de Fase 01
- NO generar código bajo ninguna circunstancia
- Trabajar en Plan Mode (Shift+Tab x2), excepto S7 que usa Normal Mode
- Todos los outputs son documentos markdown en /docs/
- Hacer preguntas guiadoras antes de producir documentos
- Al terminar cada sesión: /context-dump y después /clear
- Actualizar docs/_tracking/FASE-01-STATUS.md al completar cada paso

## Gate humano intermedio
Entre S4 (propuesta) y S5 (PRD) hay un gate humano — el cliente aprueba.
Estados posibles del gate:
- ⬜ Pendiente: propuesta no generada aún
- ⏸️ Esperando aprobación: propuesta generada, cliente no respondió
- 🔄 Iterando: cliente pidió cambios, re-ejecutar /s4-propuesta
- ❌ Rechazada: cliente rechazó, volver a /s3-opciones
- ✅ Aprobada: ejecutar /cliente-aprobo para avanzar a S5

## Estructura
```
docs/                  → Documentación del producto
docs/_tracking/        → Estado de avance de cada fase
docs/_session-notes/   → Notas de cada sesión
docs/_propuestas/      → Versiones históricas de propuestas
docs/templates/        → Templates reutilizables (no editar)
.claude/commands/      → Commands por sesión (no editar)
```

## Commands disponibles
```
/s1-relevamiento    → Sesión 1: Relevamiento del problema
/s2-personas        → Sesión 2: Personas y user stories
/s3-opciones        → Sesión 3: Opciones de solución
/s4-propuesta       → Sesión 4: Propuesta al cliente (versionable)
/cliente-aprobo     → Registrar aprobación del cliente
/s5-prd             → Sesión 5: PRD y alcance MVP
/s6-arquitectura    → Sesión 6: Arquitectura de microservicios
/s7-config          → Sesión 7: Configuración final
/context-dump       → Guardar estado y preparar /clear
/gate-check         → Validación cruzada de cierre de fase
```
