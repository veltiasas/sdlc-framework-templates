# Sesión 7 — Configuración final de Claude Code

## Instrucciones de ejecución
- MODO: Normal Mode (la ÚNICA sesión sin Plan Mode)
- MODELO: Sonnet 4.6
- DURACIÓN ESTIMADA: 20-30 minutos
- PREREQUISITO: Sesiones 1-6 completadas (verificar en tracker)

## Tu tarea

Lee docs/_tracking/FASE-01-STATUS.md — verificá que Sesiones 1-6 estén ✅.
Luego lee TODOS los archivos en docs/.

### PASO 1: Generar CLAUDE.md definitivo
Reescribí .claude/CLAUDE.md. Máximo 150 líneas. Estructura obligatoria:

# [NOMBRE_PROYECTO]

## Visión
[1 oración: qué es y para quién]

## Arquitectura
[Microservicios con responsabilidades]
[Stack por servicio]
[Patrones de comunicación]

## Estándares de código
- Lenguaje y estilo
- Naming conventions
- Estructura de archivos por servicio
- Manejo de errores (patrón estándar)
- Logging (formato, niveles)

## Testing
- Framework: [...]
- Cobertura mínima: 80% en servicios core
- TDD obligatorio para features nuevas

## Git
- Commits convencionales: feat|fix|docs|refactor|test|chore
- Branch naming: feature/xxx, fix/xxx, docs/xxx
- PR requiere: tests pasando + review

## Comandos
- Dev / Test / Build / Lint: [completar en Fase 03]

## Estado actual
- Fase: 01 completada, lista para Fase 02
- Cliente aprobó propuesta v[N] el [fecha]

## Reglas para Claude Code
- Antes de implementar, leer la spec en docs/architecture/
- No saltear tests
- Pedir clarificación antes de asumir
- Context dump cuando contexto > 50%

IMPORTANTE: No superar 150 líneas. Conciso.

### PASO 2: Completar estructura de directorios
Verificar que existan y crear los que falten:
.claude/ → CLAUDE.md, settings.json (placeholder), agents/, skills/, commands/
docs/ → PRD.md, PERSONAS.md, OPCIONES-SOLUCION.md, PROPUESTA-CLIENTE.md,
        MVP-SCOPE.md, ARCHITECTURE-VISION.md, PROBLEM-STATEMENT.md,
        _tracking/, _session-notes/, _propuestas/, architecture/adr/, architecture/sequences/,
        api/, runbooks/, templates/
services/, infrastructure/, tests/e2e/, audit/

### PASO 3: Configurar Git
1. Actualizar .gitignore para el stack elegido
2. Verificar .commitlintrc.json
3. Generar README.md del proyecto: nombre, descripción, estado actual, link a PRD, estructura
4. Commit: git add -A && git commit -m "docs: complete Phase 01 - discovery and planning"

### PASO 4: Actualizar tracker
Items 7.1 a 7.4. Estado → ✅. Historial.
NO hacer context dump. Indicame que ejecute /gate-check.
