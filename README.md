# sdlc-framework-templates

Framework SDLC completo para desarrollo de software con Claude Code.
De MVP validado a producto completo, con arquitectura de microservicios.

## Versión actual

- Framework: v3.2
- Fase 01 Prompt Templates: v3.2
- Última actualización: 2026-04-17

## Qué contiene este repositorio

```
sdlc-framework-templates/
├── README.md                        # Este archivo
├── CHANGELOG.md                     # Historial de versiones del framework
├── init-project.sh                  # Script de inicialización de proyectos nuevos
├── docs/
│   ├── fase-01-prompt-templates-v3-1.md  # Versión anterior (archivo histórico)
│   └── fase-01-prompt-templates-v3-2.md  # Guía operativa Fase 01 (versión actual)
└── skeleton/                        # Estructura base que se copia a cada proyecto nuevo
    ├── .claude/
    │   ├── CLAUDE-INIT.md           # CLAUDE.md inicial (se personaliza al crear proyecto)
    │   └── commands/                # Commands de Claude Code por sesión
    │       ├── s1-relevamiento.md   # Relevamiento + inventario técnico de alto nivel
    │       ├── s2-personas.md
    │       ├── s3-opciones.md       # Opciones con dependencias de integración
    │       ├── s4-propuesta.md      # Propuesta con cláusula de factibilidad
    │       ├── cliente-aprobo.md
    │       ├── s5-prd.md            # PRD con supuestos de factibilidad (8.2)
    │       ├── s6-arquitectura.md
    │       ├── s7-config.md
    │       ├── context-dump.md
    │       └── gate-check.md
    ├── docs/
    │   ├── _session-notes/          # Notas de sesiones (se llena por proyecto)
    │   ├── _tracking/
    │   │   └── FASE-01-STATUS.md    # Tracker de avance de Fase 01
    │   ├── _propuestas/             # Versiones históricas de propuestas al cliente
    │   ├── templates/               # Templates de documentación reutilizables
    │   │   ├── PRD-TEMPLATE.md
    │   │   ├── PERSONAS-TEMPLATE.md
    │   │   ├── MVP-SCOPE-TEMPLATE.md
    │   │   ├── OPCIONES-TEMPLATE.md
    │   │   ├── PROPUESTA-CLIENTE-TEMPLATE.md
    │   │   ├── ARCHITECTURE-TEMPLATE.md
    │   │   ├── SERVICE-SPEC-TEMPLATE.md
    │   │   ├── ADR-TEMPLATE.md
    │   │   ├── AUDIT-REPORT-TEMPLATE.md
    │   │   └── RETROSPECTIVE-TEMPLATE.md
    │   └── architecture/
    │       ├── adr/
    │       └── sequences/
    ├── services/
    ├── infrastructure/
    ├── tests/e2e/
    └── audit/
```

## Cambios clave v3.2

La v3.2 ataca un problema identificado en proyectos de integración (agentes de IA,
orquestadores de sistemas legacy, integraciones complejas). La Fase 01 ahora distingue
entre "existencia" (qué sistemas hay que tocar) y "detalle" (cómo se tocan técnicamente).

- S1 incluye un PASO 6 de inventario técnico de alto nivel, sin detallar APIs ni SLAs
- S3 hace que cada opción declare sus dependencias de integración
- S4 agrega una cláusula de factibilidad técnica a la propuesta con compromiso de
  renegociación si la validación falla en Fase 02
- S5 agrega al PRD una subsección de supuestos de factibilidad pendientes

## Uso rápido

### 1. Clonar este repositorio (una sola vez)

```bash
git clone https://github.com/[tu-usuario]/sdlc-framework-templates.git
cd sdlc-framework-templates
```

### 2. Inicializar un proyecto nuevo

```bash
./init-project.sh nombre-del-proyecto "Descripción del producto en una oración"
cd nombre-del-proyecto
```

### 3. Empezar la Fase 01

```bash
claude                    # Abrir Claude Code
# Shift+Tab x2            # Activar Plan Mode
# /s1-relevamiento        # Iniciar Sesión 1
```

## Flujo de la Fase 01 (7 sesiones)

```
S1 /s1-relevamiento   → Problema, proceso, actores, KPIs candidatos, inventario técnico
S2 /s2-personas       → Personas y user stories (descriptivas, sin MoSCoW)
S3 /s3-opciones       → 2-3 opciones con trade-offs y dependencias de integración
S4 /s4-propuesta      → Propuesta con cláusula de factibilidad técnica
⭐ /cliente-aprobo    → Registrar aprobación del cliente (gate intermedio)
S5 /s5-prd            → PRD con MoSCoW definitivo, KPIs con umbrales, supuestos (8.2)
S6 /s6-arquitectura   → Microservicios, stack, comunicación
S7 /s7-config         → CLAUDE.md definitivo, estructura, Git
   /gate-check        → Validación cruzada de todos los documentos
```

## Documentación del framework

- **Guía completa Fase 01 v3.2:** `docs/fase-01-prompt-templates-v3-2.md`
- **Changelog:** `CHANGELOG.md`

## Contribuir al framework

Cada proyecto que usa este framework puede mejorar los templates y commands.
Al finalizar la Fase 06 (Operación y mejora continua) de cada proyecto:

1. Identificar mejoras a templates, commands o flujo
2. Hacer fork de este repo o trabajar en rama `improve/[descripcion]`
3. Aplicar cambios con justificación en el commit
4. Mergear para que proyectos futuros hereden las mejoras
