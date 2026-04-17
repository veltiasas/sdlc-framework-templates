# sdlc-framework-templates

Framework SDLC completo para desarrollo de software con Claude Code.
De MVP validado a producto completo, con arquitectura de microservicios.

## Matriz de versiones actual

| Artefacto | Versión | Rol |
|-----------|---------|-----|
| framework-sdlc.docx | 2.0 | Documento estratégico general |
| fase-01-prompt-templates | 3.2 | Guía operativa detallada Fase 01 |
| workplan.json schema | 2.0 | Sistema de tracking programático |
| Este repo | 3.2 | Distribución de templates y commands |

Última actualización: 2026-04-17

## Estructura del repositorio

```
sdlc-framework-templates/
├── README.md                             # Este archivo
├── CHANGELOG.md                          # Historial coordinado de versiones
├── init-project.sh                       # Script de inicialización de proyectos
├── docs/
│   ├── fase-01-prompt-templates-v3-1.md  # Versión anterior (archivo histórico)
│   └── fase-01-prompt-templates-v3-2.md  # Guía operativa actual (v3.2)
└── skeleton/                             # Estructura base por proyecto nuevo
    ├── .claude/
    │   ├── CLAUDE-INIT.md                # CLAUDE.md inicial
    │   └── commands/                     # 10 commands de Claude Code
    └── docs/
        ├── _tracking/
        │   ├── FASE-01-STATUS.md         # Tracker human-readable
        │   └── workplan.json             # Tracker programático (schema v2.0)
        ├── _session-notes/
        ├── _propuestas/
        └── templates/                    # 10 templates reutilizables
```

## Uso rápido

### 1. Clonar el repositorio (una vez)

```bash
git clone https://github.com/[tu-usuario]/sdlc-framework-templates.git
cd sdlc-framework-templates
```

### 2. Inicializar un proyecto nuevo

```bash
./init-project.sh nombre-proyecto "Descripción del producto en una oración"
cd nombre-proyecto
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
S5 /s5-prd            → PRD con MoSCoW, KPIs con umbrales, supuestos (8.2)
S6 /s6-arquitectura   → Microservicios, stack, comunicación
S7 /s7-config         → CLAUDE.md definitivo, estructura, Git
   /gate-check        → Validación cruzada de todos los documentos
```

## Filosofía v3.2: existencia vs detalle

La Fase 01 identifica QUÉ sistemas deben integrarse sin detallarlos técnicamente.
El detalle técnico (APIs, auth, SLAs, formatos) vive en Fase 02. Los supuestos de
factibilidad quedan documentados contractualmente con cláusula de renegociación en
la propuesta al cliente.

## Sistema de tracking dual

Cada proyecto mantiene dos trackers que se actualizan en paralelo:

- **FASE-01-STATUS.md**: human-readable, para revisar estado a ojo
- **workplan.json**: programático, para scripts, dashboards y automatización

El command `/gate-check` valida coherencia entre ambos trackers y los documentos
generados.

## Documentación

- **Framework general:** framework-sdlc-v2-0.docx (distribución externa)
- **Guía Fase 01:** docs/fase-01-prompt-templates-v3-2.md
- **Changelog coordinado:** CHANGELOG.md

## Contribuir

Cada proyecto que usa este framework puede mejorar templates y commands.
Al finalizar la Fase 06 de cada proyecto:

1. Identificar mejoras a templates, commands o flujo
2. Hacer fork o trabajar en rama `improve/[descripcion]`
3. Aplicar cambios con justificación en el commit
4. Bump de versión coordinado según la regla de actualización (ver CHANGELOG.md)
5. Mergear para que proyectos futuros hereden las mejoras
