# FASE 01 — Prompt Templates para Descubrimiento y Planificación

## Guía operativa completa para Claude Code

### Versión 3.2

> **Revisión v3.2 — Correcciones respecto a v3.1:**
>
> Esta revisión ataca un problema identificado en proyectos de integración (ej: agentes de IA
> que orquestan sistemas existentes del cliente). La Fase 01 v3.1 funcionaba bien para productos
> greenfield pero podía generar propuestas que prometían integraciones sin evidencia de su
> factibilidad. Los cambios respetan la separación Fase 01 (qué) vs Fase 02 (cómo) aplicando la
> distinción "existencia vs detalle": la Fase 01 identifica sistemas sin detallarlos técnicamente.
>
> 1. **Inventario técnico de alto nivel en S1 (nuevo PASO 5):** Paso universal que se adapta al
>    tipo de proyecto. En proyectos de integración identifica sistemas, actores técnicos y
>    acciones que el producto debe realizar sobre esos sistemas. En proyectos greenfield se
>    resuelve en 30 segundos ("no hay sistemas externos"). El detalle técnico queda para Fase 02.
>
> 2. **Dependencias de integración en cada opción de S3:** Cada opción ahora declara qué
>    sistemas necesita tocar y con qué tipo de acción (lectura, escritura, suscripción). Esto
>    permite evaluar trade-offs teniendo en cuenta la carga de integración de cada enfoque.
>
> 3. **Cláusula de renegociación por factibilidad técnica en PROPUESTA-CLIENTE.md:** La propuesta
>    cierra con una cláusula estándar que declara qué integraciones asume y que la factibilidad
>    se valida en Fase 02. Si la validación falla, se renegocia alcance sin sorpresas.
>
> 4. **Supuestos de factibilidad en PRD:** La sección 8 del PRD incluye como riesgo explícito
>    los supuestos de factibilidad técnica pendientes de validación en Fase 02.
>
> 5. **Nuevos items en el tracker:** S1 agrega el inventario técnico, S4 registra la cláusula
>    de renegociación.
>
> **Filosofía de la revisión:** Fase 01 se centra en negocio y valor. Identifica dependencias
> técnicas como hechos del contexto, no las diseña. El diseño técnico detallado vive en Fase 02.
> El cliente aprueba sabiendo que hay supuestos de factibilidad por validar, y queda
> documentado contractualmente qué pasa si alguno falla.

---

> **Revisión v3.1 — Correcciones respecto a v3.0:**
>
> 1. **User stories sin priorización prematura en S2:** En v3.0, la S2 priorizaba user stories
>    con MoSCoW antes de haber explorado opciones y sin aprobación del cliente. En v3.1, las
>    user stories se escriben SIN prioridad formal en S2 (solo con un candidato MUST tentativo).
>    La priorización MoSCoW definitiva ocurre en S5, con la opción ya elegida y aprobada.
>
> 2. **KPIs en dos momentos:** Los KPIs ahora tienen dos niveles. En S1 se definen KPIs
>    CANDIDATOS de alto nivel (qué quiere medir el negocio). En S5, con la opción elegida,
>    se definen los KPIs FINALES con umbrales concretos — porque cada opción tiene métricas
>    apropiadas distintas.
>
> 3. **Propuesta de valor en su lugar correcto:** En v3.0 se fijaba en S1 y se usaba en S4.
>    En v3.1 se declara provisoria en S1 (vinculada al problema), cada opción en S3 propone
>    su propia propuesta de valor, y la definitiva se consolida en S4 con la opción elegida.
>
> 4. **Nuevo command `/cliente-aprobo`:** Elimina el paso manual de editar el tracker tras
>    la aprobación del cliente. El command actualiza el tracker, timestamea la aprobación en
>    el documento de propuesta y habilita la S5 automáticamente.
>
> 5. **Versionado de propuesta en S4:** Si el cliente pide cambios, la re-ejecución de
>    `/s4-propuesta` detecta la propuesta existente y versiona (v1, v2...). Mantiene historial
>    de iteraciones sin perder trazabilidad.
>
> 6. **Clarificación: propuesta con recomendación vs opciones abiertas:** La S4 ahora pregunta
>    explícitamente al inicio si el cliente prefiere ver la opción recomendada (default) o si
>    quiere ver todas las opciones para elegir. Afecta cómo se estructura el documento.
>
> 7. **Análisis competitivo en dos ángulos:** S1 lo hace desde el PROBLEMA (qué resuelven mal
>    los competidores). S3 lo hace desde la SOLUCIÓN (qué enfoque tomaron, de cuál aprender).
>    Sin solapamiento.
>
> 8. **Gate humano documentado en CLAUDE.md inicial:** El CLAUDE.md incluye ahora la mecánica
>    de estados "⏸️ Esperando aprobación" para que Claude Code entienda que hay un gate humano.
>
> 9. **`/gate-check` contempla estados intermedios:** El gate distingue entre "no completado
>    aún", "rechazado por cliente" y "aprobado", y ofrece paths distintos para cada caso.
>
> 10. **Nota sobre tiempos realistas:** Las duraciones son tiempo neto de trabajo, no calendario.
>     Un proyecto real típicamente se extiende 1-2 semanas por la coordinación con el cliente.
>
> **Cambios heredados de v3.0 (se mantienen):**
> - Sesiones S3 (opciones) y S4 (propuesta) como gate intermedio
> - Artefactos: OPCIONES-SOLUCION.md y PROPUESTA-CLIENTE.md
> - Aprobación del cliente como gate no-retorno antes del PRD
>
> **Cambios heredados de v2.0 (se mantienen):**
> - Repositorio central de templates con `init-project.sh`
> - Commands ejecutables (`/s[N]-nombre`)
> - Tracking integrado en `docs/_tracking/FASE-01-STATUS.md`

---

## Índice

0. [Repositorio central de templates](#0-repositorio-central-de-templates)
1. [Visión general de la fase](#1-visión-general)
2. [Configuración previa (antes de empezar)](#2-configuración-previa)
3. [Sesión 1 — Relevamiento del problema](#3-sesión-1)
4. [Sesión 2 — Personas y user stories](#4-sesión-2)
5. [Sesión 3 — Exploración de opciones de solución](#5-sesión-3)
6. [Sesión 4 — Propuesta al cliente](#6-sesión-4)
7. [Gate intermedio — Aprobación del cliente](#7-gate-intermedio)
8. [Sesión 5 — PRD (Product Requirements Document)](#8-sesión-5)
9. [Sesión 6 — Arquitectura de microservicios objetivo](#9-sesión-6)
10. [Sesión 7 — Configuración de Claude Code para el proyecto](#10-sesión-7)
11. [Gate de salida — Checklist obligatorio](#11-gate-de-salida)
12. [Flujo de ejecución unificado](#12-flujo-de-ejecución-unificado)
13. [Referencia rápida de prompts y commands](#13-referencia-rápida)
14. [Notas importantes](#14-notas-importantes)

---

## 0. Repositorio central de templates

### Problema que resolvemos

Cada proyecto nuevo NO debe recrear estructura, archivos ni commands desde cero. Existe un **repositorio central** (`sdlc-framework-templates`) que se clona una sola vez y se usa como semilla para cada proyecto. Los templates evolucionan con cada proyecto (Fase 06: mejora continua) y los proyectos futuros heredan las mejoras automáticamente.

### Estructura del repositorio central

```
sdlc-framework-templates/
├── init-project.sh                  # Script que inicializa un proyecto nuevo
├── FRAMEWORK-README.md              # Documentación del framework
├── skeleton/                        # Estructura que se copia al proyecto nuevo
│   ├── .claude/
│   │   ├── CLAUDE-INIT.md           # CLAUDE.md inicial para Fase 01
│   │   └── commands/
│   │       ├── s1-relevamiento.md   # Command sesión 1
│   │       ├── s2-personas.md       # Command sesión 2
│   │       ├── s3-opciones.md       # Command sesión 3
│   │       ├── s4-propuesta.md      # Command sesión 4
│   │       ├── cliente-aprobo.md    # NUEVO en v3.1 — Marcar aprobación del cliente
│   │       ├── s5-prd.md            # Command sesión 5
│   │       ├── s6-arquitectura.md   # Command sesión 6
│   │       ├── s7-config.md         # Command sesión 7
│   │       ├── context-dump.md      # Command para dump de contexto
│   │       └── gate-check.md        # Command para validación de gate
│   ├── docs/
│   │   ├── _session-notes/
│   │   ├── _tracking/
│   │   │   └── FASE-01-STATUS.md
│   │   ├── _propuestas/             # NUEVO en v3.1 — Versiones históricas de propuesta
│   │   ├── templates/
│   │   │   ├── PRD-TEMPLATE.md
│   │   │   ├── PERSONAS-TEMPLATE.md
│   │   │   ├── MVP-SCOPE-TEMPLATE.md
│   │   │   ├── OPCIONES-TEMPLATE.md
│   │   │   ├── PROPUESTA-CLIENTE-TEMPLATE.md
│   │   │   ├── ARCHITECTURE-TEMPLATE.md
│   │   │   ├── SERVICE-SPEC-TEMPLATE.md
│   │   │   ├── ADR-TEMPLATE.md
│   │   │   ├── AUDIT-REPORT-TEMPLATE.md
│   │   │   └── RETROSPECTIVE-TEMPLATE.md
│   │   └── architecture/
│   │       ├── adr/
│   │       └── sequences/
│   ├── services/
│   ├── infrastructure/
│   ├── tests/
│   │   └── e2e/
│   └── audit/
├── .gitignore-template
└── .commitlintrc-template.json
```

### Script de inicialización: `init-project.sh`

Este script es lo ÚNICO que se ejecuta manualmente para crear un proyecto. Todo lo demás es automático.

```bash
#!/bin/bash
# USO: ./init-project.sh nombre-del-proyecto "Descripción en una oración"

PROJECT_NAME=$1
PROJECT_DESC=$2
TEMPLATE_DIR="$(dirname "$0")/skeleton"

if [ -z "$PROJECT_NAME" ]; then
  echo "Uso: ./init-project.sh nombre-del-proyecto \"Descripción breve\""
  exit 1
fi

# Crear proyecto desde skeleton
mkdir -p "$PROJECT_NAME"
cp -r "$TEMPLATE_DIR"/. "$PROJECT_NAME"/
cd "$PROJECT_NAME"

# Renombrar y personalizar CLAUDE.md
mv .claude/CLAUDE-INIT.md .claude/CLAUDE.md
sed -i "s/\[NOMBRE_PROYECTO\]/$PROJECT_NAME/g" .claude/CLAUDE.md
sed -i "s/\[DESCRIPCION\]/$PROJECT_DESC/g" .claude/CLAUDE.md

# Reemplazar placeholders en todos los templates
find . -name "*.md" -exec sed -i "s/\[NOMBRE_PROYECTO\]/$PROJECT_NAME/g" {} +
find . -name "*.md" -exec sed -i "s/\[FECHA\]/$(date +%Y-%m-%d)/g" {} +

# Configurar Git
cp ../.gitignore-template .gitignore
cp ../.commitlintrc-template.json .commitlintrc.json
git init
git add -A
git commit -m "chore: init project from sdlc-framework-templates"

echo ""
echo "✓ Proyecto '$PROJECT_NAME' creado"
echo "✓ Estructura de directorios lista"
echo "✓ Commands de Claude Code listos en .claude/commands/"
echo "✓ Tracker de Fase 01 en docs/_tracking/FASE-01-STATUS.md"
echo "✓ Git inicializado con commit base"
echo ""
echo "Siguiente paso:"
echo "  cd $PROJECT_NAME"
echo "  claude                          # Abrir Claude Code"
echo "  Shift+Tab x2                    # Activar Plan Mode"
echo "  /s1-relevamiento                # Iniciar Sesión 1"
```

### Tracker integrado: `docs/_tracking/FASE-01-STATUS.md`

Este archivo es la fuente de verdad del progreso. Se genera automáticamente con el script y se actualiza dentro de cada command de sesión. Claude Code lo lee al inicio de cada sesión para saber dónde retomar.

```markdown
# Fase 01 — Estado de avance

> Este archivo se actualiza automáticamente al final de cada sesión.
> Es la fuente de verdad del progreso de la fase.

## Resumen
- Inicio: [FECHA]
- Estado: 🔴 No iniciada
- Sesiones completadas: 0/7
- Aprobación del cliente: ❌ Pendiente
- Gate de salida: ❌ No aprobado

## Sesión 1 — Relevamiento del problema
- [ ] 1.1 Exploración del problema (preguntas respondidas)
- [ ] 1.2 Problem statement aprobado (1 oración)
- [ ] 1.3 Proceso actual y actores documentados
- [ ] 1.4 Análisis competitivo desde el problema (mín. 3 alternativas)
- [ ] 1.5 KPIs candidatos definidos (alto nivel)
- [ ] 1.6 Inventario técnico de alto nivel (sistemas, acciones, supuestos de factibilidad)
- [ ] 1.7 docs/PROBLEM-STATEMENT.md generado
- [ ] 1.8 Context dump → _session-notes/session-01.md
- Estado sesión: ⬜ Pendiente
- Tipo de proyecto: Greenfield / Integración / Mixto

## Sesión 2 — Personas y user stories
- [ ] 2.1 Contexto cargado desde docs/
- [ ] 2.2 Persona primaria con journey map completo
- [ ] 2.3 1-2 personas secundarias definidas
- [ ] 2.4 User stories descriptivas (10-12, sin priorización formal)
- [ ] 2.5 Candidatos a MUST marcados como tentativos
- [ ] 2.6 docs/PERSONAS.md generado
- [ ] 2.7 Context dump → _session-notes/session-02.md
- Estado sesión: ⬜ Pendiente

## Sesión 3 — Exploración de opciones de solución
- [ ] 3.1 Restricciones y preferencias relevadas
- [ ] 3.2 Análisis competitivo desde la solución (cómo resolvieron otros)
- [ ] 3.3 Enfoques de solución explorados (mín. 2-3 opciones)
- [ ] 3.4 Propuesta de valor por opción
- [ ] 3.5 Trade-offs documentados
- [ ] 3.6 Recomendación justificada con plan B
- [ ] 3.7 docs/OPCIONES-SOLUCION.md generado
- [ ] 3.8 Context dump → _session-notes/session-03.md
- Estado sesión: ⬜ Pendiente

## Sesión 4 — Propuesta al cliente
- [ ] 4.1 Formato de propuesta definido
- [ ] 4.2 Modalidad elegida: recomendación / opciones abiertas
- [ ] 4.3 Propuesta armada con alcance, timeline, condiciones
- [ ] 4.4 Revisión de lenguaje (sin jerga técnica)
- [ ] 4.5 Cláusula de factibilidad técnica incluida (con sistemas y supuestos)
- [ ] 4.6 docs/PROPUESTA-CLIENTE.md generado (versión actual)
- [ ] 4.7 Versión snapshot en docs/_propuestas/propuesta-v[N].md
- [ ] 4.8 Context dump → _session-notes/session-04.md
- Estado sesión: ⬜ Pendiente
- Iteraciones con cliente: 0

## Gate intermedio — Aprobación del cliente
- [ ] Propuesta presentada al cliente
- [ ] Cliente respondió (aprobó / pidió cambios / rechazó)
- [ ] Si aprobó: /cliente-aprobo ejecutado
- Estado: ❌ Pendiente
- Fecha de aprobación: —

## Sesión 5 — PRD y alcance MVP
- [ ] 5.1 Verificación: cliente aprobó (gate intermedio ✅)
- [ ] 5.2 Corte MoSCoW definitivo (máx 5-7 MUST)
- [ ] 5.3 MVP validado como abogado del diablo
- [ ] 5.4 KPIs finales con umbrales (refinados desde candidatos de S1)
- [ ] 5.5 Riesgos y supuestos documentados
- [ ] 5.6 docs/PRD.md generado (10 secciones)
- [ ] 5.7 docs/MVP-SCOPE.md generado
- [ ] 5.8 Context dump → _session-notes/session-05.md
- Estado sesión: ⬜ Pendiente

## Sesión 6 — Arquitectura de microservicios
- [ ] 6.1 Dominio técnico explorado
- [ ] 6.2 Servicios definidos con bounded contexts
- [ ] 6.3 Stack tecnológico seleccionado y justificado
- [ ] 6.4 Patrones de comunicación definidos
- [ ] 6.5 docs/ARCHITECTURE-VISION.md generado
- [ ] 6.6 Context dump → _session-notes/session-06.md
- Estado sesión: ⬜ Pendiente

## Sesión 7 — Configuración de Claude Code
- [ ] 7.1 .claude/CLAUDE.md definitivo (<150 líneas)
- [ ] 7.2 Estructura de directorios completa
- [ ] 7.3 Git configurado (.gitignore, commitlint)
- [ ] 7.4 Commit: "docs: complete Phase 01"
- Estado sesión: ⬜ Pendiente

## Gate de salida — Validación cruzada
- [ ] Propuesta aprobada por el cliente
- [ ] PRD alineado con propuesta aprobada (alcance, timeline)
- [ ] User stories cubren features MVP del PRD
- [ ] KPIs finales se pueden medir con features del MVP
- [ ] Arquitectura soporta todas las features del PRD
- [ ] Cada feature MUST tiene criterios de aceptación binarios
- [ ] No hay features MVP sin user story asociada
- [ ] No hay user stories MUST sin feature MVP
- [ ] Alguien externo podría leer los docs y entender qué construir
- Estado gate: ❌ No aprobado

## Historial
| Fecha | Sesión | Acción | Resultado |
|-------|--------|--------|-----------|
| [FECHA] | — | Proyecto inicializado | Estructura creada |
```

### CLAUDE.md inicial: `.claude/CLAUDE-INIT.md`

Este archivo se renombra automáticamente a `CLAUDE.md` durante la inicialización. Es el contexto mínimo para que Claude Code funcione en Fase 01.

```markdown
# [NOMBRE_PROYECTO]

## Estado actual
- Fase: 01 - Descubrimiento y planificación
- Sesión activa: Ninguna (ejecutar /s1-relevamiento para iniciar)
- No hay código. Modo planificación exclusivamente.

## [DESCRIPCION]

## Reglas de Fase 01
- NO generar código bajo ninguna circunstancia
- Trabajar SOLO en Plan Mode (Shift+Tab x2), excepto S7 que usa Normal Mode
- Todos los outputs son documentos markdown en /docs/
- Hacer preguntas guiadoras antes de producir documentos
- Al terminar cada sesión: ejecutar /context-dump y después /clear
- Actualizar docs/_tracking/FASE-01-STATUS.md al completar cada paso

## Gate humano intermedio
Entre la Sesión 4 (propuesta) y la Sesión 5 (PRD) hay un GATE HUMANO:
el cliente debe aprobar la propuesta. Estados posibles:
- ⬜ Pendiente: propuesta no generada aún
- ⏸️ Esperando aprobación: propuesta generada, cliente no respondió
- 🔄 Iterando: cliente pidió cambios, reejecutar /s4-propuesta
- ❌ Rechazada: cliente rechazó, volver a S3 para nuevas opciones
- ✅ Aprobada: ejecutar /cliente-aprobo para avanzar a S5

## Estructura
docs/                  → Documentación del producto
docs/_tracking/        → Estado de avance de cada fase
docs/_session-notes/   → Notas de cada sesión de trabajo
docs/_propuestas/      → Versiones históricas de propuestas al cliente
docs/templates/        → Templates reutilizables (no editar)
.claude/commands/      → Comandos por sesión (no editar)

## Commands disponibles
/s1-relevamiento    → Sesión 1: Relevamiento del problema
/s2-personas        → Sesión 2: Personas y user stories
/s3-opciones        → Sesión 3: Exploración de opciones de solución
/s4-propuesta       → Sesión 4: Propuesta al cliente (versionable)
/cliente-aprobo     → Registrar aprobación del cliente y habilitar S5
/s5-prd             → Sesión 5: PRD y alcance MVP
/s6-arquitectura    → Sesión 6: Arquitectura de microservicios
/s7-config          → Sesión 7: Configuración final de Claude Code
/context-dump       → Guardar estado y preparar /clear
/gate-check         → Validar si la fase está lista para cerrar
```

---

## 1. Visión general

### Objetivo de la fase
Definir **qué** se va a construir, **para quién**, evaluar **cómo resolverlo**, obtener la **aprobación del cliente** sobre la dirección, y recién entonces documentar el alcance detallado.

### Resultado esperado
Al finalizar esta fase, el proyecto debe tener 6 documentos aprobados:
- `docs/PROBLEM-STATEMENT.md` — Relevamiento del problema y evidencia
- `docs/PERSONAS.md` — Personas y user stories (descriptivas)
- `docs/OPCIONES-SOLUCION.md` — Opciones de solución con trade-offs
- `docs/PROPUESTA-CLIENTE.md` — Propuesta formal aprobada por el cliente
- `docs/PRD.md` — Product Requirements Document
- `docs/MVP-SCOPE.md` — Alcance del MVP con MoSCoW
- `docs/ARCHITECTURE-VISION.md` — Visión arquitectónica de microservicios

Más la configuración operativa:
- `.claude/CLAUDE.md` — Contexto del proyecto para Claude Code
- Estructura de directorios base del repositorio
- Repositorio Git inicializado con convenciones

Y el tracking:
- `docs/_tracking/FASE-01-STATUS.md` — Estado de avance con todos los items completados
- `docs/_session-notes/session-01..07.md` — Notas de cada sesión
- `docs/_propuestas/propuesta-v*.md` — Historial de versiones de propuesta (si hubo iteraciones)

### Reglas generales de esta fase

```
╔══════════════════════════════════════════════════════════════════╗
║  REGLA DE ORO: En toda la Fase 01, Claude Code trabaja         ║
║  EXCLUSIVAMENTE en Plan Mode (excepto S7). No se genera código.║
║  Plan Mode se activa con Shift+Tab x2.                         ║
║                                                                ║
║  MODELO RECOMENDADO: Claude Opus 4.6 para planificación.       ║
║  Sonnet 4.6 aceptable para tareas de menor complejidad.        ║
║                                                                ║
║  CADA SESIÓN ES NUEVA: Hacer /clear entre sesiones.            ║
║                                                                ║
║  COMMANDS: Cada sesión se inicia con /s[N]-nombre.             ║
║                                                                ║
║  GATE INTERMEDIO: El cliente debe aprobar la propuesta (S4)    ║
║  ANTES de escribir el PRD (S5). /cliente-aprobo registra la    ║
║  aprobación y habilita S5.                                     ║
║                                                                ║
║  PRIORIZACIÓN: MoSCoW formal solo en S5 (post-aprobación).     ║
║  En S2 las user stories son descriptivas, sin compromiso.      ║
╚══════════════════════════════════════════════════════════════════╝
```

### Estructura de sesiones

| Sesión | Command | Tarea principal | Duración neta | Artefactos |
|--------|---------|----------------|---------------|------------|
| S1 | `/s1-relevamiento` | Relevamiento del problema | 45-60 min | PROBLEM-STATEMENT.md |
| S2 | `/s2-personas` | Personas y user stories descriptivas | 30-45 min | PERSONAS.md |
| S3 | `/s3-opciones` | Exploración de opciones de solución | 45-60 min | OPCIONES-SOLUCION.md |
| S4 | `/s4-propuesta` | Propuesta formal al cliente | 30-45 min | PROPUESTA-CLIENTE.md |
| ⭐ | `/cliente-aprobo` | **Registrar aprobación del cliente** | 5 min | Tracker actualizado |
| S5 | `/s5-prd` | PRD, MoSCoW, KPIs finales | 60-90 min | PRD.md, MVP-SCOPE.md |
| S6 | `/s6-arquitectura` | Arquitectura de microservicios | 45-60 min | ARCHITECTURE-VISION.md |
| S7 | `/s7-config` | Configuración de Claude Code | 20-30 min | CLAUDE.md, estructura, Git |
| — | `/gate-check` | Validación cruzada | 10-15 min | Gate aprobado o correcciones |

> **Nota sobre tiempos:** Las duraciones son tiempo NETO de trabajo con Claude Code. Un proyecto real típicamente se extiende 1-2 semanas de calendario debido a: coordinación con el cliente, iteraciones de propuesta, y tiempos de respuesta del cliente a la aprobación del Gate Intermedio. Sumar S1-S7 da ~4.5 horas netas, pero planificar 5-10 días hábiles.

---

## 2. Configuración previa

### Antes de la primera sesión

**Paso 1: Clonar el repositorio de templates (una sola vez en la vida)**

```bash
git clone [url-del-repo] sdlc-framework-templates
```

**Paso 2: Inicializar el proyecto nuevo**

```bash
cd sdlc-framework-templates
./init-project.sh mi-proyecto "Descripción del producto en una oración"
cd mi-proyecto
```

El script crea automáticamente:
- Estructura completa de directorios
- `.claude/CLAUDE.md` personalizado con el nombre y descripción
- Todos los commands en `.claude/commands/` (listos para ejecutar)
- Tracker en `docs/_tracking/FASE-01-STATUS.md`
- Templates de documentación en `docs/templates/`
- Repositorio Git inicializado con commit base

**Paso 3: Abrir Claude Code y empezar**

```bash
claude                    # Abrir Claude Code
# Shift+Tab x2            # Activar Plan Mode
# /s1-relevamiento        # Iniciar Sesión 1
```

---

## 3. Sesión 1 — Relevamiento del problema

### Instrucciones de ejecución

```
SESIÓN:      Nueva sesión limpia
MODO:        Plan Mode (Shift+Tab x2)
MODELO:      Opus 4.6
DURACIÓN:    45-60 minutos
PREREQUISITO: Proyecto inicializado con init-project.sh
EJECUTAR:    /s1-relevamiento
```

### Command: `/s1-relevamiento`

> Archivo: `.claude/commands/s1-relevamiento.md`
> Este command se ejecuta directamente en Claude Code. No es necesario copiar el contenido.

```markdown
# Sesión 1 — Relevamiento del problema

## Instrucciones de ejecución
- MODO: Plan Mode (verificá que esté activo con Shift+Tab x2)
- MODELO: Opus 4.6
- DURACIÓN ESTIMADA: 45-60 minutos
- PREREQUISITO: Proyecto inicializado con init-project.sh

## Tu tarea

Lee docs/_tracking/FASE-01-STATUS.md para saber el estado actual.
Luego lee todos los archivos en docs/ para cargar contexto existente.

Vamos a RELEVAR el problema. En esta sesión NO vamos a definir la solución
ni la propuesta de valor definitiva. Solo queremos entender a fondo el problema
y su contexto.

Procedé en este orden estricto, esperando mi respuesta en cada paso:

### PASO 1: Exploración del problema
Haceme preguntas para entender el espacio del problema. Preguntá de a 2-3, no todas juntas:
- ¿Quién tiene este problema? (tipos de usuario)
- ¿Cómo lo resuelven hoy? (alternativas actuales, herramientas, procesos manuales)
- ¿Por qué las soluciones actuales no alcanzan?
- ¿Qué cambiaría si el problema se resolviera bien?
- ¿Hay evidencia de que el problema existe?
- ¿Cuál es el proceso actual paso a paso?
- ¿Qué actores participan en el proceso? (roles, departamentos, externos)

### PASO 2: Problem statement
Con mis respuestas, sintetizá el PROBLEM STATEMENT en 1 oración:
"[Tipo de usuario] necesita [capacidad] porque [dolor/limitación actual],
lo que causa [consecuencia negativa medible]."

Si no cabe en 1 oración, proponé cómo recortar el alcance.

IMPORTANTE: En esta sesión NO armamos "propuesta de valor". Esa la armamos en S3
cuando exploramos opciones de solución, porque depende del enfoque elegido.

### PASO 3: Análisis competitivo desde el problema
Preguntame sobre competidores y alternativas conocidas.
Armá una tabla enfocada en el PROBLEMA:
| Alternativa | Qué problema del usuario resuelve | Qué NO resuelve / Dónde falla |
Mínimo 3 alternativas (incluir workarounds manuales).

NOTA: En S3 volvemos a mirar la competencia pero desde otro ángulo
(cómo resolvieron, qué enfoque técnico tomaron). En S1 solo miramos
desde el dolor del usuario.

### PASO 4: KPIs candidatos (alto nivel)
Proponé 3-5 KPIs CANDIDATOS de alto nivel. Son lo que el NEGOCIO querría medir
para saber si el problema está resuelto, sin comprometerse aún a umbrales
específicos (eso se define en S5 con la opción elegida).

Para cada KPI candidato:
- Nombre del KPI
- Qué mide (el resultado deseado)
- Por qué es relevante al problema
- NO definir umbral numérico aún

Ejemplos correctos:
- "Tiempo de ciclo del proceso actual" — mide cuánto tarda completar X hoy
- "Tasa de abandono" — mide cuántos usuarios dejan el proceso antes de terminar
- "Satisfacción del usuario final" — mide si la experiencia mejora

Ejemplos incorrectos (dejar para S5):
- "Reducir tiempo de ciclo en 50%" (ya tiene umbral, prematuro)
- "Llegar a 1000 usuarios en 3 meses" (depende de la opción elegida)

### PASO 5: Proceso actual y actores (relevamiento operativo)
Documentá el proceso actual en detalle:
- Flujo de trabajo actual paso a paso
- Actores involucrados en cada paso
- Herramientas/sistemas que usan hoy
- Dónde se genera fricción

### PASO 6: Inventario técnico de alto nivel (existencia, no detalle)
Este paso identifica los sistemas y actores técnicos que el producto deberá tocar,
SIN detallarlos técnicamente. El detalle (APIs, auth, formatos, SLAs) se releva en Fase 02.
Acá solo confirmamos qué existe, quién es dueño y qué tipo de interacción se necesita.

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
Para cada sistema/componente que el producto necesitará tocar, relevá SIN entrar en detalle técnico:

SISTEMA: [Nombre que usa el cliente]
PROPÓSITO DE NEGOCIO: [Qué hace ese sistema para el cliente, en 1 oración]
DUEÑO: [Área/equipo del cliente que lo mantiene]
EXISTE HOY: Sí / No (si es Sí: confirmado por el cliente; si es No: está en plan construirlo)
ACCIONES QUE EL PRODUCTO NECESITARÁ: [consultar / escribir / suscribirse a eventos / disparar acciones]
¿EL CLIENTE CONFIRMA QUE ES ACCESIBLE?: Sí / No / Por verificar
SUPUESTO DE FACTIBILIDAD: [1 oración sobre qué asumimos; ej: "asumimos que tiene alguna forma
  de consulta programática de datos de cliente; formato y performance se validan en Fase 02"]

NO preguntar ni documentar en esta etapa:
- Endpoints específicos, formatos JSON/XML, métodos REST
- Rate limits, SLAs, latencia esperada
- Credenciales, esquemas de autenticación
- Ambientes de prueba disponibles
- Versiones de API, documentación técnica
Todo eso es Fase 02.

SÍ preguntar:
- ¿Qué sistemas existen hoy que participan del proceso que queremos resolver?
- ¿El cliente los controla o son de terceros?
- ¿Hay algún sistema que sabemos o sospechamos que será difícil integrar?
- ¿Hay sistemas legacy, muy viejos, o sin mantenimiento activo?
- ¿Hay restricciones regulatorias o de compliance obvias en estos sistemas
  (ej: datos personales, facturación, salud)?

Al final del paso, listá explícitamente los SUPUESTOS DE FACTIBILIDAD TÉCNICA que quedan
pendientes de validación en Fase 02. Estos se usan en S3 para evaluar opciones y en S4 para
la cláusula de renegociación de la propuesta.

### PASO 7: Generar documentación
Cuando TODO lo anterior esté aprobado:
1. Creá docs/PROBLEM-STATEMENT.md con:
   - Problem statement (1 oración)
   - Evidencia del problema
   - Proceso actual y actores
   - Inventario técnico de alto nivel (sistemas, acciones, supuestos de factibilidad)
   - Análisis competitivo desde el problema
   - KPIs candidatos (sin umbrales)
   - Preguntas abiertas para S3 (si las hay)
2. Actualizá docs/_tracking/FASE-01-STATUS.md marcando items 1.1 a 1.7 como [x].
3. Estado sesión → ✅ Completada. Agregar fecha al historial.

### PASO 8: Context dump
Guardá resumen en docs/_session-notes/session-01.md:
- Decisiones tomadas y justificación
- Preguntas abiertas (especialmente sobre restricciones técnicas, presupuesto,
  timeline — útiles para S3)
- Supuestos de factibilidad pendientes (para S3 y Fase 02)
- Qué traer preparado para S2
Marcá item 1.8 en el tracker.

Indicame que ejecute /clear.
```

### Detalle de cada paso (referencia para el usuario)

> **Cambio importante en v3.2:** Se agregó el PASO 6 de inventario técnico de alto nivel.
> Este paso NO detalla APIs, auth, SLAs ni formatos (eso es Fase 02). Solo identifica qué
> sistemas existen, quién es dueño, y qué tipo de acción necesita el producto. El resultado
> alimenta las opciones de S3 (cada opción declara sus dependencias de integración) y la
> propuesta al cliente en S4 (con cláusula de renegociación por factibilidad).

> **Cambio importante en v3.1:** En v3.0 S1 también generaba "propuesta de valor" y "KPIs con umbrales". En v3.1 S1 NO genera propuesta de valor (se hace en S3 por opción) ni KPIs con umbrales (se hace en S5). S1 se enfoca 100% en entender el problema.

Claude hace preguntas guiadoras para entender el problema completo, sintetiza un problem statement en 1 oración, arma un análisis competitivo desde el ángulo del problema (qué resuelven mal las alternativas actuales), propone 3-5 KPIs candidatos sin umbrales, documenta el proceso actual con actores, identifica los sistemas técnicos que el producto deberá tocar (sin detallarlos), y genera `docs/PROBLEM-STATEMENT.md`.

---

## 4. Sesión 2 — Personas y user stories

### Instrucciones de ejecución

```
SESIÓN:      Nueva sesión limpia (post /clear)
MODO:        Plan Mode (Shift+Tab x2)
MODELO:      Opus 4.6
DURACIÓN:    30-45 minutos
PREREQUISITO: Sesión 1 completada (el command verifica el tracker)
EJECUTAR:    /s2-personas
```

### Command: `/s2-personas`

> Archivo: `.claude/commands/s2-personas.md`

```markdown
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

IMPORTANTE: En esta sesión las user stories son DESCRIPTIVAS, NO priorizadas.
No vamos a hacer MoSCoW formal acá. Eso se hace en S5 después de elegir opción
y tener aprobación del cliente. Si priorizamos ahora, estaríamos decidiendo qué
es MUST sin saber cuál es la solución ni si el cliente aprueba la dirección.

### PASO 1: Explorar usuarios
Haceme preguntas de a 2-3 sobre:
- ¿Quiénes son los usuarios principales? (rol, contexto, nivel técnico)
- ¿En qué momento interactúan con el problema?
- ¿Qué los frustra más de la situación actual?
- ¿Qué intentaron para resolverlo?
- ¿Hay tipos de usuario con necesidades distintas?
- ¿Quién paga vs quién usa?
Esperá mis respuestas antes de avanzar.

### PASO 2: Persona primaria
Construí la persona principal con este formato exacto:

NOMBRE: [Nombre ficticio]
ROL: [Título]
CONTEXTO: [2-3 oraciones sobre su día a día]
DOLOR PRINCIPAL: [1 oración]
GOAL: [Qué quiere lograr, no qué feature quiere]
JOURNEY ACTUAL (sin producto): [3-5 pasos] → PUNTO DE DOLOR: [dónde se rompe]
JOURNEY DESEADO (con producto): [3-5 pasos genéricos] → BENEFICIO: [qué gana]
MÉTRICA DE ÉXITO PERSONAL: [Cómo sabe que le sirve]
FRASE TEXTUAL: "[Lo que diría sobre su problema]"

Nota sobre JOURNEY DESEADO: hacelo agnóstico de la solución específica.
Describí QUÉ cambia para el usuario, no CÓMO lo implementamos.
Ej bueno: "Recibe la información consolidada sin pedirla a cada área"
Ej malo: "Usa el dashboard con API del servicio X"

Presentá para revisión. No avances sin mi OK.

### PASO 3: Personas secundarias
1-2 personas más. Para cada una, solo:
- Nombre y rol
- Diferencia clave vs persona primaria
- Su dolor específico
- Qué le importa diferente que a la primaria
- Posibles conflictos con la primaria
Si no hay secundarias relevantes, justificá por qué una alcanza.

### PASO 4: User stories (descriptivas, sin priorización formal)
Escribí 10-12 user stories en formato:
COMO [persona específica], QUIERO [acción concreta], PARA [beneficio].
CRITERIOS DE ACEPTACIÓN: (descriptivos, detallaremos criterios binarios en S5)
- [ ] [Criterio qué debe pasar]
- [ ] [Criterio qué debe pasar]

CANDIDATO A MUST: Sí / No / Depende de la opción
  (solo MARCADOR TENTATIVO, sin compromiso. Sirve como input para S3 y S5)

Reglas:
- Cada story de UNA persona específica.
- NO hacer MoSCoW completo (Must/Should/Could/Won't). Solo marcador tentativo.
- Dar 10-12 stories totales, no más.
- Las que son OBVIAMENTE esenciales para cualquier opción → "Candidato MUST: Sí"
- Las que dependen de la solución elegida → "Candidato MUST: Depende"

Antes de escribir, preguntame si hay flujos o funcionalidades que no mencioné.

### PASO 5: Generar documentación
Cuando TODO esté aprobado:
1. Creá docs/PERSONAS.md con:
   - Persona primaria completa
   - Personas secundarias
   - User stories (descriptivas, con marcador tentativo de candidato a MUST)
   - Nota explicativa: "MoSCoW formal se define en S5 post-aprobación"
2. Actualizá docs/_tracking/FASE-01-STATUS.md marcando items 2.1 a 2.6 como [x].
3. Estado sesión → ✅ Completada. Historial.

### PASO 6: Context dump
Guardá resumen en docs/_session-notes/session-02.md. Marcá item 2.7.
Indicame que ejecute /clear.
```

### Detalle de cada paso (referencia para el usuario)

> **Cambio importante en v3.1:** En v3.0 S2 asignaba prioridad MoSCoW completa a cada story. En v3.1 las stories son DESCRIPTIVAS con solo un marcador tentativo "Candidato a MUST". El MoSCoW real se hace en S5 con la opción aprobada.

La razón: si priorizamos features en S2, estamos decidiendo el alcance antes de explorar opciones (S3) y antes de que el cliente apruebe dirección (S4). Eso rompe el flujo lógico. Las user stories en S2 son el inventario completo de necesidades del usuario, sin priorización comprometida.

---

## 5. Sesión 3 — Exploración de opciones de solución

### Instrucciones de ejecución

```
SESIÓN:      Nueva sesión limpia (post /clear)
MODO:        Plan Mode (Shift+Tab x2)
MODELO:      Opus 4.6
DURACIÓN:    45-60 minutos
PREREQUISITO: Sesiones 1 y 2 completadas (el command verifica el tracker)
EJECUTAR:    /s3-opciones
```

### Command: `/s3-opciones`

> Archivo: `.claude/commands/s3-opciones.md`

```markdown
# Sesión 3 — Exploración de opciones de solución

## Instrucciones de ejecución
- MODO: Plan Mode (Shift+Tab x2)
- MODELO: Opus 4.6
- DURACIÓN ESTIMADA: 45-60 minutos
- PREREQUISITO: Sesiones 1 y 2 completadas (verificar en tracker)

## Tu tarea

Lee docs/_tracking/FASE-01-STATUS.md — verificá que Sesiones 1 y 2 estén ✅.
Luego lee docs/PROBLEM-STATEMENT.md y docs/PERSONAS.md para cargar contexto.

En esta sesión vamos a explorar OPCIONES de solución. No estamos definiendo LA
solución todavía. Vamos a plantear 2-3 enfoques distintos, analizar trade-offs,
y llegar a una recomendación que después (en S4) llevamos al cliente.

Procedé en este orden estricto, esperando mi respuesta en cada paso:

### PASO 1: Entender restricciones y preferencias
Antes de proponer opciones, haceme preguntas sobre:
- ¿Hay restricciones de presupuesto? (rango, no número exacto)
- ¿Hay restricciones de timeline? (¿cuándo necesita el cliente algo funcionando?)
- ¿Hay infraestructura existente que debamos reutilizar o respetar?
- ¿El equipo tiene experiencia con algún stack particular?
- ¿Hay preferencia del cliente por algo? (ej: "que sea mobile")
- ¿Hay restricciones regulatorias o de compliance?
- ¿Cómo prefiere el cliente ver la propuesta: con una recomendación clara, o con
  varias opciones para elegir?

### PASO 2: Análisis competitivo desde la solución
En S1 vimos qué problema resuelven o no las alternativas.
Ahora miremos CÓMO lo hacen: qué enfoque técnico/de producto eligieron.

Armá una tabla:
| Alternativa | Enfoque técnico | Por qué eligieron eso | Qué aprender / Qué no imitar |

Esto alimenta las opciones del próximo paso. No repetir el análisis de S1.

### PASO 3: Proponer 2-3 opciones de solución
Basándote en el problema, las personas, las restricciones, el análisis
de cómo lo resolvieron otros, y el inventario técnico de S1, proponé 2-3 enfoques
GENUINAMENTE DISTINTOS.

Para cada opción, presentá:

OPCIÓN [A/B/C]: [Nombre descriptivo]
ENFOQUE: [1-2 oraciones explicando la estrategia]
PROPUESTA DE VALOR DE ESTA OPCIÓN: [1 oración: cómo esta opción específicamente
  resuelve el problema. Debe ser concreta y diferente por opción.]
QUÉ USER STORIES CUBRE: [Referencia a IDs de stories que resuelve plenamente]
QUÉ USER STORIES NO CUBRE O CUBRE PARCIAL: [Qué queda afuera]
DEPENDENCIAS DE INTEGRACIÓN: [Si el proyecto es greenfield: "Ninguna".
  Si es integración: lista de sistemas del inventario técnico de S1 que esta
  opción requiere tocar, con el tipo de acción esperada. Ej:
  - Sistema de facturación: lectura (consultar estado de pago del cliente)
  - Sistema de red: lectura (consultar cortes programados en zona)
  - Sistema de CRM: escritura (registrar interacción del agente)]
COMPLEJIDAD: Alta / Media / Baja
TIMELINE ESTIMADO MVP: [semanas]
RIESGO PRINCIPAL: [El mayor riesgo de este enfoque]
VENTAJA CLAVE: [Por qué alguien elegiría esta opción]
SUPUESTOS DE FACTIBILIDAD QUE HEREDA: [Cuáles de los supuestos de S1 son relevantes
  para esta opción específica. Si esta opción depende de que un sistema concreto
  sea accesible, aclararlo.]

Ejemplo de opciones genuinamente distintas:
- Opción A: Automatizar el flujo completo (más ambicioso, más valor, más riesgo)
- Opción B: Resolver solo el cuello de botella principal (rápido, validable)
- Opción C: Integrar con herramienta existente y complementar (menos desarrollo,
  más dependencia)

Presentá las opciones para revisión. Preguntame si alguna no tiene sentido.

### PASO 4: Análisis de trade-offs
Armá comparación:

| Criterio | Opción A | Opción B | Opción C |
|----------|----------|----------|----------|
| User stories MUST tentativas cubiertas | | | |
| Tiempo de desarrollo MVP | | | |
| Complejidad técnica | | | |
| Riesgo de no validar hipótesis | | | |
| Escalabilidad posterior | | | |
| Dependencias externas | | | |
| Costo relativo | | | |
| Reversibilidad (¿qué pasa si falla?) | | | |

Después preguntame:
- ¿Hay criterio que pese más para vos o el cliente?
- ¿Alguna opción queda descartada de entrada? (si sí, por qué, para documentar)

### PASO 5: Recomendación con plan B
Proponé TU recomendación:
- ¿Qué opción recomendás y por qué?
- ¿Hay elementos de otras opciones que conviene incorporar?
- Riesgo principal de la opción recomendada y mitigación
- Plan B si la opción recomendada no funciona (puede ser otra de las opciones
  analizadas, o un pivot específico)

Presentá para mi aprobación antes de documentar.

### PASO 6: Generar documentación
Cuando la recomendación esté aprobada:
1. Creá docs/OPCIONES-SOLUCION.md con:
   - Contexto del problema (referencia a PROBLEM-STATEMENT.md)
   - Restricciones y preferencias relevadas
   - Análisis competitivo desde la solución
   - Opción A, B, C con ficha completa (incluyendo propuesta de valor por opción)
   - Tabla comparativa de trade-offs
   - Recomendación con justificación
   - Plan B si la recomendación no funciona
   - Modalidad de propuesta al cliente (recomendación única / opciones abiertas)
2. Actualizá docs/_tracking/FASE-01-STATUS.md marcando items 3.1 a 3.7 como [x].
3. Estado sesión → ✅ Completada. Historial.

### PASO 7: Context dump
Guardá resumen en docs/_session-notes/session-03.md. Marcá item 3.8.
Indicame que ejecute /clear.
```

### Detalle de cada paso (referencia para el usuario)

> **Cambio importante en v3.1:** En v3.0 había riesgo de redundancia en el análisis competitivo entre S1 y S3. En v3.1 cada sesión mira desde un ángulo distinto: S1 desde el PROBLEMA (qué resuelven mal), S3 desde la SOLUCIÓN (qué enfoque técnico tomaron). También cada opción ahora tiene su propia "propuesta de valor" específica, porque la propuesta de valor depende del enfoque.

---

## 6. Sesión 4 — Propuesta al cliente

### Instrucciones de ejecución

```
SESIÓN:      Nueva sesión limpia (post /clear)
MODO:        Plan Mode (Shift+Tab x2)
MODELO:      Opus 4.6
DURACIÓN:    30-45 minutos (primera vez), 15-25 min (iteraciones)
PREREQUISITO: Sesiones 1-3 completadas (el command verifica el tracker)
EJECUTAR:    /s4-propuesta
```

### Command: `/s4-propuesta`

> Archivo: `.claude/commands/s4-propuesta.md`
> Este command es VERSIONABLE: detecta propuestas previas y numera iteraciones.

```markdown
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
- Si NO existe: es la primera versión (v1).
- Si existe: es una iteración. Preguntame:
  * ¿Cuál fue el feedback del cliente?
  * ¿Qué partes de la propuesta hay que modificar?
  * ¿El cambio es menor (ajuste de alcance/timeline) o mayor (cambio de opción)?
  * Si es CAMBIO DE OPCIÓN: detené el command y recomendame volver a /s3-opciones
    con el feedback del cliente.
  * Si es ajuste: continuá con este command.

Determiná el número de versión (v[N]) y agregá nota en el tracker:
"Iteración #[N] por feedback: [resumen]"

### PASO 1: Definir formato de propuesta
Preguntame (o revisá si ya lo definimos en iteración previa):
- ¿El cliente espera un formato específico? (si tiene template propio)
- ¿La propuesta debe incluir precio / cotización? (o solo alcance y enfoque)
- ¿Quién del lado del cliente va a leer/aprobar? (nivel técnico del lector)
- ¿Hay punto que el cliente mencionó como crítico o innegociable?
- ¿Necesita fases de pago o hitos de entrega?
- ⭐ ¿Preferís presentar la OPCIÓN RECOMENDADA (default) o las MÚLTIPLES OPCIONES
  para que el cliente elija?

Según la última respuesta, cambia la estructura de la propuesta:
- Modo "recomendación": una sola opción detallada, alternativas en anexo breve.
- Modo "opciones abiertas": 2-3 opciones con trade-offs, cliente elige.

### PASO 2: Armar la propuesta según modo elegido

#### MODO "RECOMENDACIÓN" (default)

# Propuesta: [Nombre del Proyecto]

## 1. Entendimiento del problema
[Resumen del relevamiento: qué problema, quién lo tiene, cómo lo resuelven hoy.
Demostrar al cliente que entendimos su situación.]

## 2. Solución propuesta
[Descripción de la opción recomendada en lenguaje NO técnico.
Qué va a poder hacer el usuario que hoy no puede.
NO hablar de microservicios, APIs, stack, arquitectura.
SÍ hablar de resultados y experiencia del usuario.]

## 3. Alcance del MVP (primera entrega)
Lo que SÍ incluye la primera entrega:
- [Feature 1: descripción en 1 oración, lenguaje de negocio]
- [Feature 2: descripción en 1 oración]
Lo que NO incluye (y por qué):
- [Feature excluida: razón honesta]

## 4. Etapas de trabajo
| Etapa | Duración estimada | Entregable |
|-------|-------------------|-----------|

## 5. Qué necesitamos del cliente
[Lo que el cliente debe proveer: acceso, información, feedback, aprobaciones,
personas disponibles para reuniones de validación]

## 6. Criterio de éxito
[Cómo sabremos que el MVP funciona. Métricas concretas en términos de negocio,
no técnicos.]

## 7. Evolución posterior
[Qué viene después del MVP si la validación es exitosa. Visión sin comprometer
alcance.]

## 8. Condiciones y supuestos
[Todo lo que asumimos como cierto. Si alguno cambia, el alcance cambia.]

## 9. Alternativas consideradas (anexo)
[Listar brevemente las otras 1-2 opciones que consideramos y por qué
recomendamos la elegida. Esto muestra rigor profesional.]

## 10. [Inversión / Cotización — si aplica]

## 11. Cláusula de factibilidad técnica
Esta propuesta asume que las integraciones con los sistemas identificados son
técnicamente factibles. La validación detallada (formatos, protocolos, performance,
disponibilidad de ambientes) se realiza en la fase de diseño técnico, posterior
a la aprobación de esta propuesta.

Sistemas sobre los que se asume factibilidad:
[Lista de sistemas del inventario técnico de S1 que la opción recomendada requiere tocar]

Supuestos específicos:
[Los supuestos de factibilidad de la opción recomendada, copiados de OPCIONES-SOLUCION.md]

Compromiso del proveedor: Si durante la fase de diseño técnico se detecta que
alguno de estos supuestos no se cumple (por ejemplo, un sistema no tiene forma
programática de consulta, no hay ambiente de prueba disponible, o la performance
no soporta el caso de uso), se comunicará al cliente en un plazo no mayor a [N]
días hábiles con:
- Descripción del problema detectado
- Impacto en alcance, timeline o costo
- Opciones de ajuste: reducir alcance, extender timeline, aumentar costo, o
  combinación de las tres
- Ninguna modificación se ejecuta sin acuerdo escrito del cliente

Esta cláusula protege a ambas partes: evita que el proveedor quede comprometido
con promesas imposibles, y evita que el cliente reciba sorpresas tarde en el proyecto.

#### MODO "OPCIONES ABIERTAS" (alternativo)

# Propuesta: [Nombre del Proyecto]

## 1. Entendimiento del problema
[Igual que arriba]

## 2. Opciones que planteamos
Presentamos [N] caminos posibles para resolver su problema.
Cada uno tiene ventajas y trade-offs distintos.

### Opción A: [Nombre]
[Descripción en lenguaje de negocio]
- Qué obtiene el usuario: [...]
- Tiempo estimado: [...]
- Ventaja principal: [...]
- Trade-off: [...]

### Opción B: [Nombre]
[Idem]

### Opción C: [Nombre] (si hay)
[Idem]

## 3. Nuestra recomendación
[Cuál opción recomendamos y por qué. El cliente decide.]

## 4. Qué necesitamos del cliente
[Igual que arriba]

## 5. Condiciones y supuestos
[Igual que arriba]

## 6. Cláusula de factibilidad técnica
Esta propuesta asume que las integraciones con los sistemas identificados son
técnicamente factibles. La validación detallada se realiza en la fase de diseño
técnico, posterior a la aprobación. Si durante el diseño se detecta que algún
supuesto no se cumple, se comunica al cliente con opciones de ajuste; ninguna
modificación se ejecuta sin acuerdo escrito.

Sistemas y supuestos específicos varían según la opción que el cliente elija
(ver fichas de opciones en sección 2).

---
Estado: BORRADOR | Versión: v[N] | Fecha: [hoy]
Aprobado por cliente: ____________ | Fecha: ____________

Presentá el borrador para mi revisión y ajustes.

### PASO 3: Refinar con lenguaje de cliente
Revisá que el documento:
- NO use jerga técnica innecesaria (no: "microservicios", "JWT", "CI/CD",
  "OpenAPI", "stack", "endpoint")
- SÍ use el lenguaje del cliente (los términos que el cliente usa para su proceso)
- Sea legible para alguien no técnico en 10 minutos
- Tenga tono profesional pero accesible
Hacé los ajustes que pida.

### PASO 4: Generar documentación versionada
Cuando la propuesta esté aprobada por mí (pre-aprobación interna):
1. Si es v1: creá docs/PROPUESTA-CLIENTE.md con el contenido final, incluyendo la
   cláusula de factibilidad técnica al final con sistemas y supuestos de S1/S3.
2. Si es iteración: moveé la versión actual a docs/_propuestas/propuesta-v[N-1].md
   antes de sobrescribir, y creá la nueva docs/PROPUESTA-CLIENTE.md (v[N]).
3. Agregá nota al inicio del documento: "Versión v[N] — fecha"
4. Actualizá docs/_tracking/FASE-01-STATUS.md:
   - Marcá items 4.1 a 4.7 como [x]
   - Incrementá contador "Iteraciones con cliente: [N]"
   - Estado sesión → ⏸️ Esperando aprobación del cliente
   - Agregar al historial: "Propuesta v[N] generada, pendiente aprobación"

### PASO 5: Context dump
Guardá resumen en docs/_session-notes/session-04-v[N].md (agregar versión al nombre).
Marcá item 4.8 en el tracker.
Indicame que:
1. Ejecute /clear
2. Presente docs/PROPUESTA-CLIENTE.md al cliente
3. Cuando tenga respuesta del cliente:
   - Si aprobó → ejecutar /cliente-aprobo
   - Si pidió cambios → ejecutar /s4-propuesta nuevamente (iteración)
   - Si rechazó → ejecutar /s3-opciones para replantear
```

### Detalle de cada paso (referencia para el usuario)

> **Cambios importantes en v3.1:**
>
> 1. **Versionado automático:** Si el cliente pide cambios, al re-ejecutar `/s4-propuesta`
>    el command detecta la versión anterior, la archiva en `docs/_propuestas/propuesta-vN.md`
>    y crea la nueva. Historial completo preservado.
>
> 2. **Detección de cambio de opción:** Si el feedback del cliente implica cambiar la opción
>    elegida, el command detiene la ejecución y recomienda volver a `/s3-opciones`. Evita
>    generar una propuesta sobre bases incorrectas.
>
> 3. **Modo recomendación vs opciones abiertas:** Pregunta explícita en PASO 1 sobre si el
>    cliente prefiere ver una recomendación clara o elegir entre opciones. Cambia la estructura
>    del documento.
>
> 4. **Contador de iteraciones en tracker:** Queda registrado cuántas rondas de revisión hubo
>    con el cliente (útil para retrospectivas).

---

## 7. Gate intermedio — Aprobación del cliente

> **Nuevo en v3.1:** Esta es una sección explícita para el gate humano. En v3.0 era ambiguo
> y requería edición manual del tracker.

### Qué es

Entre la Sesión 4 (generar propuesta) y la Sesión 5 (escribir PRD) hay un punto de no-retorno:
**el cliente debe aprobar la propuesta**. Hasta que eso ocurra, no se avanza.

### Estados posibles

| Estado | Significado | Siguiente acción |
|--------|-------------|------------------|
| ⬜ Pendiente | S4 no se ejecutó aún | Ejecutar /s4-propuesta |
| ⏸️ Esperando respuesta | Propuesta entregada, cliente no respondió | Esperar respuesta |
| 🔄 Iterando | Cliente pidió cambios menores | Ejecutar /s4-propuesta de nuevo |
| ❌ Rechazada | Cliente rechazó el enfoque | Volver a /s3-opciones |
| ✅ Aprobada | Cliente aprobó | Ejecutar /cliente-aprobo, luego /s5-prd |

### Command: `/cliente-aprobo`

> Archivo: `.claude/commands/cliente-aprobo.md`
> Este command es el único paso humano formalizado: confirma la aprobación y desbloquea S5.

```markdown
# Registrar aprobación del cliente

## Instrucciones de ejecución
- MODO: Normal Mode (no requiere Plan Mode)
- MODELO: Sonnet 4.6 (tarea mecánica)
- DURACIÓN: 5 minutos
- PREREQUISITO: Cliente aprobó la propuesta (confirmación verbal/email/chat)

## Tu tarea

El cliente aprobó la propuesta. Necesitamos registrar formalmente la aprobación
antes de avanzar a la S5 (PRD).

### PASO 1: Recopilar datos de aprobación
Preguntame:
- ¿Cómo aprobó el cliente? (email, reunión, mensaje escrito, acta firmada)
- ¿Fecha de aprobación?
- ¿Nombre completo de quien aprobó del lado del cliente?
- ¿Rol/cargo de quien aprobó?
- ¿Hubo ajustes finales aceptados verbalmente que no están en el documento?
  (si sí, agregarlos al documento antes de marcar como aprobado)

### PASO 2: Actualizar docs/PROPUESTA-CLIENTE.md
En el pie del documento, reemplazar:
"Aprobado por cliente: ____________ | Fecha: ____________"
Por:
"Aprobado por cliente: [Nombre] ([Rol]) | Fecha: [Fecha] | Medio: [email/reunión/...]"

Si hubo ajustes verbales, agregarlos en una sección "Ajustes finales aceptados"
al final del documento antes del pie de aprobación.

### PASO 3: Actualizar tracker
Editar docs/_tracking/FASE-01-STATUS.md:
1. En "Gate intermedio — Aprobación del cliente":
   - Marcar todos los items como [x]
   - Estado: ✅ Aprobado
   - Fecha de aprobación: [la fecha]
2. En "Sesión 4":
   - Cambiar Estado sesión a: ✅ Completada
3. En "Resumen":
   - "Aprobación del cliente: ✅ [Fecha]"
4. Agregar al historial:
   - "[Fecha] | Gate | Cliente aprobó la propuesta v[N] | /s5-prd habilitada"

### PASO 4: Commit
git add -A
git commit -m "docs: client approved proposal v[N] - enables PRD phase"

### PASO 5: Confirmar próximo paso
Informame:
- ✅ Aprobación del cliente registrada
- ✅ La S5 está habilitada
- Siguiente paso: /clear y después /s5-prd
```

### Detalle del paso humano

El usuario presenta `docs/PROPUESTA-CLIENTE.md` al cliente por su medio habitual (reunión, email, mensaje). El cliente responde. Según la respuesta:

- **Aprueba:** ejecutar `/cliente-aprobo` en Claude Code para formalizar.
- **Pide cambios menores:** ejecutar `/s4-propuesta` nuevamente; el command detecta la versión previa y maneja la iteración.
- **Pide cambios mayores (cambio de opción):** ejecutar `/s3-opciones` para replantear desde las opciones.
- **Rechaza sin quererse rever:** el proyecto no continúa en Fase 01. Registrar en historial.

---

## 8. Sesión 5 — PRD (Product Requirements Document)

### Instrucciones de ejecución

```
SESIÓN:      Nueva sesión limpia (post /clear)
MODO:        Plan Mode (Shift+Tab x2)
MODELO:      Opus 4.6
DURACIÓN:    60-90 minutos (la más larga de la fase)
PREREQUISITO: /cliente-aprobo ejecutado exitosamente (gate intermedio ✅)
EJECUTAR:    /s5-prd
```

### Command: `/s5-prd`

> Archivo: `.claude/commands/s5-prd.md`

```markdown
# Sesión 5 — PRD, MoSCoW y KPIs finales

## Instrucciones de ejecución
- MODO: Plan Mode (Shift+Tab x2)
- MODELO: Opus 4.6
- DURACIÓN ESTIMADA: 60-90 minutos (la más larga)
- PREREQUISITO: /cliente-aprobo ejecutado (gate intermedio ✅)

## Tu tarea

Lee docs/_tracking/FASE-01-STATUS.md — verificá que el gate intermedio esté ✅.
Si el gate NO está aprobado, indicame que debo:
- Ejecutar /s4-propuesta si no hay propuesta
- Presentar la propuesta al cliente si no la presenté
- Ejecutar /cliente-aprobo si el cliente aprobó pero no lo registré

Luego lee TODOS los archivos en docs/ para cargar contexto completo.
En particular docs/PROPUESTA-CLIENTE.md que define la dirección aprobada.

Recordá:
- En S2 las user stories quedaron SIN prioridad formal (solo candidatos tentativos)
- En S1 los KPIs quedaron SIN umbrales
- En S3 definimos la opción recomendada y plan B
- En S4 el cliente aprobó el alcance de la propuesta
- En S5 ahora formalizamos MoSCoW, KPIs con umbrales, y consolidamos todo en PRD

### PASO 1: Corte MoSCoW definitivo
Tomá las user stories de PERSONAS.md y el alcance aprobado en PROPUESTA-CLIENTE.md.
Para cada user story, decidamos ahora su prioridad DEFINITIVA:
- MUST: Indispensable para validar la hipótesis del MVP aprobado
- SHOULD: Valioso pero se puede vivir sin esto en el MVP
- COULD: Idea interesante, sin compromiso
- WON'T (por ahora): Conscientemente excluido, con razón

Para cada MUST candidato, preguntame:
1. ¿Es REALMENTE indispensable para el alcance aprobado por el cliente?
2. ¿Se puede validar SIN esta feature?
3. ¿Cuál es el MÍNIMO de esta feature que alcanza?
4. ¿Está dentro de lo que el cliente aprobó?

REGLAS:
- Máximo 5-7 features MUST
- No incluir features que NO estén en el alcance aprobado del cliente
- Si aparece algo que sería MUST pero no estaba en la propuesta: STOP.
  Eso requiere volver a /s4-propuesta para re-aprobar alcance expandido.

### PASO 2: Abogado del diablo
Desafiá el corte:
1. ¿Se puede validar la hipótesis con solo estas features?
2. ¿Qué pasa si un usuario llega y le falta algo que sacamos?
3. ¿Hay algún SHOULD que es MUST disfrazado?
4. ¿Se puede construir en el timeline que aprobó el cliente?
Si la respuesta a 4 es "no": ayudame a recortar, O sugerime ir a /s4-propuesta
para renegociar el timeline.
Presentá lista final: MUST / SHOULD / COULD / WON'T con razón por cada WON'T.

### PASO 3: KPIs finales con umbrales
Tomá los KPIs candidatos de PROBLEM-STATEMENT.md (sin umbrales) y ahora,
con la opción elegida y el alcance aprobado, definí umbrales concretos:

Para cada KPI:
- Nombre del KPI (puede mantenerse o renombrarse)
- Cómo se mide
- Umbral de éxito para el MVP (con esta opción)
- Umbral de éxito para el producto completo
- Cómo se instrumenta (qué datos hay que capturar)

Puede haber KPIs nuevos que surgen con la opción elegida, y KPIs candidatos
que ya no aplican. Documentar ambos casos.

### PASO 4: Riesgos y supuestos
Preguntame por categoría:
SUPUESTOS: ¿Asumimos que van a pagar? ¿Adopción mínima? ¿La tech funciona?
RIESGOS TÉCNICOS: ¿Componentes nunca hechos? ¿APIs externas? ¿Performance difícil?
RIESGOS DE PRODUCTO: ¿No entienden la propuesta? ¿Competidor más rápido?
Para cada riesgo: Probabilidad (A/M/B) + Impacto (A/M/B) + Mitigación.

NOTA: Muchos riesgos ya surgieron en S3 (opciones) y S4 (condiciones de propuesta).
Consolidá acá sin duplicar.

Además, listá por separado los SUPUESTOS DE FACTIBILIDAD TÉCNICA que se heredan de la
cláusula de la propuesta aprobada. Son los supuestos de integración con sistemas
existentes del cliente, pendientes de validación en Fase 02. Para cada uno:
- Sistema afectado
- Supuesto asumido
- Impacto si falla la validación (alcance / timeline / costo)
- Referencia a la cláusula de factibilidad de PROPUESTA-CLIENTE.md

Estos supuestos NO son riesgos ordinarios: son compromisos contractuales con el cliente.
Si en Fase 02 alguno no se cumple, se activa la cláusula de renegociación.

### PASO 5: Generar PRD
Creá docs/PRD.md con TODAS estas secciones:
1. Resumen ejecutivo (1 párrafo)
2. Problema (statement + evidencia, referencia a PROBLEM-STATEMENT.md)
3. Propuesta de valor (la de la opción elegida, referencia a OPCIONES-SOLUCION.md)
4. Usuarios objetivo (referencia a PERSONAS.md)
5. Alcance MVP — cada feature con:
   - Descripción
   - User story asociada (de PERSONAS.md)
   - Criterios de aceptación BINARIOS (refinados desde los descriptivos de S2)
6. Features futuras: Should / Could / Won't (con razón)
7. Métricas de éxito (KPIs finales con umbrales)
8. Riesgos y supuestos:
   8.1 Tabla de riesgos ordinarios (Probabilidad / Impacto / Mitigación)
   8.2 Supuestos de factibilidad técnica pendientes de validación en Fase 02
       (Sistema / Supuesto / Impacto si falla / Referencia a PROPUESTA-CLIENTE.md)
9. Timeline estimado (alineado con PROPUESTA-CLIENTE.md aprobada)
10. Dependencias externas

Pie: Estado BORRADOR, fecha, espacio para aprobación interna.
IMPORTANTE: Cada criterio de aceptación DEBE ser binario. Nada de "mejorar",
"optimizar" o "buena experiencia". Concreto y verificable.

### PASO 6: Generar MVP-SCOPE
Creá docs/MVP-SCOPE.md separado:
- Features incluidas (Must Have)
- Features excluidas con razón (Should/Could/Won't)
- Criterio de éxito del MVP
- Supuestos que validamos
- Timeline interno (alineado con propuesta aprobada)
- Condiciones para pasar a producto completo
Este documento es el contrato de lo que entra y lo que no.

### PASO 7: Actualizar tracker y context dump
1. Actualizá docs/_tracking/FASE-01-STATUS.md items 5.1 a 5.8.
2. Estado sesión → ✅ Completada. Historial.
3. Guardá resumen en docs/_session-notes/session-05.md.
Indicame que ejecute /clear.
```

### Detalle de cada paso (referencia para el usuario)

> **Cambios importantes en v3.1:**
>
> 1. **MoSCoW se hace aquí por primera vez** (no en S2). Con dirección aprobada del cliente,
>    las user stories se priorizan definitivamente.
>
> 2. **KPIs finales con umbrales se definen aquí** (no en S1). Con la opción elegida,
>    los umbrales concretos tienen sentido.
>
> 3. **Validación contra alcance aprobado:** Si aparece un feature MUST que NO estaba en la
>    propuesta aprobada, el command detiene y sugiere volver a /s4-propuesta para renegociar.
>    Evita scope creep invisible.

---

## 9. Sesión 6 — Arquitectura de microservicios objetivo

### Instrucciones de ejecución

```
SESIÓN:      Nueva sesión limpia (post /clear)
MODO:        Plan Mode (Shift+Tab x2)
MODELO:      Opus 4.6
DURACIÓN:    45-60 minutos
PREREQUISITO: Sesiones 1-5 completadas (el command verifica el tracker)
EJECUTAR:    /s6-arquitectura
```

### Command: `/s6-arquitectura`

> Archivo: `.claude/commands/s6-arquitectura.md`

```markdown
# Sesión 6 — Arquitectura de microservicios

## Instrucciones de ejecución
- MODO: Plan Mode (Shift+Tab x2)
- MODELO: Opus 4.6
- DURACIÓN ESTIMADA: 45-60 minutos
- PREREQUISITO: Sesiones 1-5 completadas (verificar en tracker)

## Tu tarea

Lee docs/_tracking/FASE-01-STATUS.md — verificá que Sesiones 1-5 estén ✅.
Luego lee docs/PRD.md y docs/MVP-SCOPE.md para cargar contexto.

### PASO 1: Explorar dominio técnico
Haceme preguntas sobre:
- Conceptos principales del negocio (entidades, procesos)
- Preferencias o restricciones de stack
- Escala esperada (inicio vs 1 año)
- Datos sensibles que requieran aislamiento
- Integraciones externas necesarias

NOTA: Parte de esto ya salió en S3 (restricciones). No re-preguntar.
Enfocate en lo técnico que no cubrimos antes.

### PASO 2: Definir servicios
Para cada microservicio, proponé:
NOMBRE: [nombre-service]
RESPONSABILIDAD: [1 oración, responsabilidad única]
DATOS QUE POSEE: [entidades/tablas propias]
APIS QUE EXPONE: [2-3 endpoints principales]
EVENTOS QUE PRODUCE: [qué notifica]
EVENTOS QUE CONSUME: [qué escucha]
MVP: Sí / No

Reglas: cada servicio con 1 responsabilidad, DB propia, comunicación por
API/eventos (nunca DB compartida).
Diagrama textual de comunicación:
[servicio-a] --REST--> [servicio-b]
[servicio-b] --evento: user.created--> [servicio-c]

### PASO 3: Stack tecnológico
Preguntame sobre experiencia del equipo. Después proponé:
- Por servicio: lenguaje, framework, DB (con justificación)
- Infraestructura: containers, CI/CD, orquestación futura, monitoreo
Reglas: priorizar lo conocido, no sobre-engineerear el MVP, que escale después.
Si hay dos opciones igual de válidas, presentá ambas y preguntame.

### PASO 4: Comunicación entre servicios
Para cada interacción:
| Origen | Destino | Tipo (sync/async) | Dato que viaja | Fallback si destino caído |

### PASO 5: Generar ARCHITECTURE-VISION
Creá docs/ARCHITECTURE-VISION.md con:
1. Principios (3-5 principios guía)
2. Servicios (ficha completa por servicio)
3. Mapa de comunicación (diagrama textual)
4. Stack tecnológico (tabla)
5. Patrones de comunicación (tabla de interacciones)
6. MVP vs producto completo (qué se implementa primero)
7. Decisiones pendientes para Fase 02

### PASO 6: Actualizar tracker y context dump
1. Actualizá docs/_tracking/FASE-01-STATUS.md items 6.1 a 6.6.
2. Estado sesión → ✅. Historial.
3. docs/_session-notes/session-06.md.
Indicame que ejecute /clear.
```

---

## 10. Sesión 7 — Configuración de Claude Code para el proyecto

### Instrucciones de ejecución

```
SESIÓN:      Nueva sesión limpia (post /clear)
MODO:        Normal Mode (esta es la ÚNICA sesión que sale de Plan Mode)
MODELO:      Sonnet 4.6 (suficiente para configuración)
DURACIÓN:    20-30 minutos
PREREQUISITO: Sesiones 1-6 completadas (el command verifica el tracker)
EJECUTAR:    /s7-config
```

### Command: `/s7-config`

> Archivo: `.claude/commands/s7-config.md`

```markdown
# Sesión 7 — Configuración final de Claude Code

## Instrucciones de ejecución
- MODO: Normal Mode
- MODELO: Sonnet 4.6
- DURACIÓN ESTIMADA: 20-30 minutos
- PREREQUISITO: Sesiones 1-6 completadas

## Tu tarea

Lee docs/_tracking/FASE-01-STATUS.md — verificá que Sesiones 1-6 estén ✅.
Luego lee TODOS los archivos en docs/ para contexto completo.

### PASO 1: Generar CLAUDE.md definitivo
Reescribí .claude/CLAUDE.md con la versión DEFINITIVA del proyecto.
Máximo 150 líneas. Estructura obligatoria:

# [Nombre del Proyecto]

## Visión
[1 oración: qué es y para quién]

## Arquitectura
[Microservicios con su responsabilidad]
[Stack por servicio]
[Patrones de comunicación]

## Estándares de código
- Lenguaje y estilo
- Naming conventions
- Estructura de archivos por servicio
- Manejo de errores
- Logging

## Testing
- Framework: [...]
- Cobertura mínima: 80% en servicios core
- TDD obligatorio para features nuevas

## Git
- Commits convencionales: feat|fix|docs|refactor|test|chore
- Branch naming: feature/xxx, fix/xxx, docs/xxx

## Comandos
- Dev / Test / Build / Lint: [...]

## Estado actual
- Fase: 01 completada, lista para Fase 02
- Cliente aprobó propuesta v[N] el [fecha]

## Reglas para Claude Code
- Antes de implementar, leer la spec en docs/architecture/
- No saltear tests
- Pedir clarificación antes de asumir
- Context dump cuando contexto > 50%

### PASO 2: Completar estructura de directorios
Verificá que existan todos los directorios y creá los que falten.

### PASO 3: Configurar Git
1. Actualizá .gitignore para el stack elegido
2. Verificá .commitlintrc.json
3. Generá README.md: nombre, descripción, estado, link a PRD, estructura
4. Commit: git add -A && git commit -m "docs: complete Phase 01"

### PASO 4: Actualizar tracker
1. Actualizá items 7.1 a 7.4.
2. Estado sesión → ✅. Historial.
3. NO context dump (la siguiente acción es /gate-check).

Indicame que ejecute /gate-check.
```

---

## 11. Gate de salida — Checklist obligatorio

### No se puede pasar a Fase 02 sin completar TODO lo siguiente.

El gate se ejecuta con `/gate-check` directamente en Claude Code.

### Command: `/gate-check`

> Archivo: `.claude/commands/gate-check.md`

```markdown
# Gate de salida — Validación cruzada de Fase 01

Lee TODOS los archivos en docs/ y hacé una validación exhaustiva.

## Verificaciones obligatorias

### 1. EXISTENCIA
- [ ] docs/PROBLEM-STATEMENT.md
- [ ] docs/PERSONAS.md
- [ ] docs/OPCIONES-SOLUCION.md
- [ ] docs/PROPUESTA-CLIENTE.md (con aprobación formalizada)
- [ ] docs/PRD.md
- [ ] docs/MVP-SCOPE.md
- [ ] docs/ARCHITECTURE-VISION.md
- [ ] .claude/CLAUDE.md (versión definitiva)

### 2. APROBACIÓN DEL CLIENTE
- [ ] Gate intermedio marcado como ✅ en tracker
- [ ] docs/PROPUESTA-CLIENTE.md tiene fecha y firmante de aprobación
- [ ] Resumen del tracker indica "Aprobación del cliente: ✅ [Fecha]"

### 3. CONSISTENCIA
- ¿Features en MVP-SCOPE vs PRD? (deben coincidir)
- ¿Features en PRD vs alcance aprobado en PROPUESTA-CLIENTE? (deben coincidir)
- ¿Hay user stories MUST sin feature MVP asociada?
- ¿Hay features MVP sin user story asociada?
- ¿Los servicios en ARCHITECTURE-VISION cubren todas las features del PRD?
- ¿Los KPIs (con umbrales) se pueden medir con las features del MVP?
- ¿El timeline del PRD está alineado con el de la propuesta aprobada?
- ¿Los supuestos de factibilidad del PRD (8.2) se corresponden con los de la
  cláusula de PROPUESTA-CLIENTE.md?
- ¿Los sistemas listados en la cláusula de factibilidad se corresponden con el
  inventario técnico de PROBLEM-STATEMENT.md?

### 4. COMPLETITUD
- PRD: ¿10 secciones? ¿criterios de aceptación binarios?
  ¿Sección 8.2 de supuestos de factibilidad presente?
- PERSONAS: ¿persona primaria con journey map? ¿user stories descriptivas?
  (OJO: MoSCoW formal debe estar en PRD, no acá)
- OPCIONES: ¿mín. 2 opciones con trade-offs? ¿recomendación con plan B?
  ¿cada opción declara dependencias de integración?
- PROPUESTA: ¿alcance MVP? ¿timeline? ¿condiciones? ¿aprobación formalizada?
  ¿cláusula de factibilidad técnica con sistemas, supuestos y compromiso de
  renegociación?
- MVP-SCOPE: ¿features excluidas con razón? ¿criterio de éxito?
- ARCHITECTURE: ¿servicios con boundaries? ¿stack justificado?
- PROBLEM-STATEMENT: ¿inventario técnico de alto nivel presente
  (aunque diga "no aplica" si es greenfield)?

### 5. VIABILIDAD
- ¿MVP construible en timeline comprometido con el cliente?
- ¿Cantidad de MUST razonable (5-7)?
- ¿Stack conocido por el equipo?

### 6. CLARIDAD
- ¿Alguien que NO participó podría leer los docs y entender qué construir?

## Output

Clasificar hallazgos en:

**✅ Aprobados** (listar checks que pasan)

**❌ Bloqueantes** (listar con referencia a documento y sección)
→ Para cada uno, indicar en qué sesión corregir:
  - Correcciones de documentos generados: inline
  - Falta aprobación del cliente: /cliente-aprobo
  - Cliente nunca aprobó: indicar que el proyecto NO puede cerrar Fase 01
  - Falta PRD: /s5-prd
  - Falta arquitectura: /s6-arquitectura
  - Falta config: /s7-config

**⚠️ Warnings** (no bloqueantes, mejorar si hay tiempo)

## Acciones según resultado

### Si TODOS los checks pasan:
1. Actualizá tracker: marcá todos los items del gate como [x].
2. Estado gate: ✅ Aprobado.
3. Estado general: 🟢 Completada.
4. Agregar al historial: "Gate de salida aprobado - Fase 01 cerrada"
5. Commit: git add -A && git commit -m "docs: Phase 01 gate approved"

### Si algún BLOQUEANTE falla:
1. Listá exactamente qué corregir y en qué sesión.
2. NO marques el gate como aprobado.
3. NO commitees la validación hasta que se corrija.

### Caso especial: cliente nunca aprobó
Si el tracker indica que la aprobación del cliente está pendiente/rechazada:
- NO es un bloqueante arreglable inline
- Indicar que Fase 01 no puede cerrarse sin resolver el gate intermedio
- Opciones:
  a) Obtener aprobación formal y ejecutar /cliente-aprobo
  b) Volver a /s3-opciones si el cliente rechazó el enfoque
  c) Pausar el proyecto si el cliente no responde
```

### Checklist visual de referencia

```
CHECKLIST DE SALIDA — FASE 01

═══════════════════════════════════════════════════════
DOCUMENTACIÓN
═══════════════════════════════════════════════════════

□  docs/PROBLEM-STATEMENT.md — problem statement, KPIs candidatos, proceso actual
□  docs/PERSONAS.md — personas + user stories descriptivas (sin MoSCoW)
□  docs/OPCIONES-SOLUCION.md — 2-3 opciones con trade-offs, recomendación, plan B
□  docs/PROPUESTA-CLIENTE.md — propuesta en lenguaje no técnico, con aprobación firmada
□  docs/PRD.md — PRD con MoSCoW formal, KPIs con umbrales, criterios binarios
□  docs/MVP-SCOPE.md — alcance del MVP
□  docs/ARCHITECTURE-VISION.md — servicios, stack, comunicación

═══════════════════════════════════════════════════════
GATE HUMANO
═══════════════════════════════════════════════════════

□  Cliente aprobó la propuesta (gate intermedio ✅)
□  /cliente-aprobo ejecutado
□  Aprobación formalizada en el documento con fecha y firmante

═══════════════════════════════════════════════════════
CONFIGURACIÓN DE CLAUDE CODE
═══════════════════════════════════════════════════════

□  .claude/CLAUDE.md personalizado (<150 líneas)
□  Estructura de directorios completa
□  Repositorio Git con commit de Phase 01
□  Templates de Fase 02 en docs/templates/

═══════════════════════════════════════════════════════
VALIDACIÓN CRUZADA
═══════════════════════════════════════════════════════

□  PRD alineado con propuesta aprobada (alcance, timeline)
□  User stories cubren features MVP del PRD
□  KPIs finales (con umbrales) medibles con features del MVP
□  Arquitectura soporta todas las features del PRD
□  Cada feature MUST tiene criterios de aceptación binarios
□  No hay features MVP sin user story asociada
□  No hay user stories MUST sin feature MVP asociada
```

### Command auxiliar: `/context-dump`

> Archivo: `.claude/commands/context-dump.md`
> Para usar cuando una sesión se extiende demasiado y necesitás limpiar contexto antes de terminar.

```markdown
# Context dump — Guardar estado antes de /clear

Guardá un resumen de esta sesión en docs/_session-notes/session-[NUMERO].md con:

1. DECISIONES TOMADAS: Lista con justificación breve.
2. PREGUNTAS ABIERTAS: Lo que quedó sin resolver.
3. PREPARAR PARA SIGUIENTE SESIÓN: Qué necesito traer o pensar.
4. ARTEFACTOS GENERADOS: Lista de archivos creados o modificados.
5. ESTADO DEL TRACKER: Qué items se marcaron como completados.

Después indicame que ejecute /clear para limpiar el contexto.
```

---

## 12. Flujo de ejecución unificado

### Lo que el usuario hace paso a paso (sin tareas implícitas)

```
PREPARACIÓN (una sola vez en la vida)
───────────────────────────────────────
1.  git clone [url-del-repo] sdlc-framework-templates


INICIO DE CADA PROYECTO NUEVO
───────────────────────────────────────
2.  cd sdlc-framework-templates
3.  ./init-project.sh mi-proyecto "Descripción del producto"
4.  cd mi-proyecto


SESIÓN 1 — Relevamiento del problema
───────────────────────────────────────
5.  claude
6.  Shift+Tab x2                ← Plan Mode
7.  /s1-relevamiento
8.  [Responder preguntas del problema, iterar]
9.  [Claude pregunta: greenfield o integración con sistemas existentes]
10. [Si integración: relevar inventario técnico de alto nivel, sin detalle]
11. [Claude genera PROBLEM-STATEMENT.md con inventario técnico y supuestos de factibilidad]
12. /clear


SESIÓN 2 — Personas y user stories (descriptivas)
───────────────────────────────────────
13. Shift+Tab x2
14. /s2-personas
15. [Responder, iterar]
16. [Claude genera PERSONAS.md sin priorización formal]
17. /clear


SESIÓN 3 — Exploración de opciones
───────────────────────────────────────
18. Shift+Tab x2
19. /s3-opciones
20. [Responder sobre restricciones y preferencias]
21. [Claude propone 2-3 opciones con dependencias de integración y trade-offs]
22. [Claude genera OPCIONES-SOLUCION.md]
23. /clear


SESIÓN 4 — Propuesta al cliente (primera versión)
───────────────────────────────────────
24. Shift+Tab x2
25. /s4-propuesta
26. [Responder sobre modalidad: recomendación o opciones abiertas]
27. [Claude genera PROPUESTA-CLIENTE.md v1 con cláusula de factibilidad técnica]
28. /clear


⭐ GATE INTERMEDIO — Aprobación del cliente
───────────────────────────────────────
29. Presentar PROPUESTA-CLIENTE.md al cliente (incluye cláusula de factibilidad)
30. [Cliente revisa y responde]

CASO A: Cliente aprueba sin cambios
  31a. /cliente-aprobo
  32a. [Command registra aprobación, actualiza tracker, commit]
  33a. Ir al paso 40

CASO B: Cliente pide cambios menores
  31b. /s4-propuesta                  ← command detecta iteración
  32b. [Responder con feedback del cliente]
  33b. [Claude genera PROPUESTA-CLIENTE.md v2, archiva v1 en _propuestas/]
  34b. Volver al paso 29 (nueva ronda con cliente)

CASO C: Cliente rechaza el enfoque (cambio mayor)
  31c. /s3-opciones                   ← volver a replantear opciones
  32c. [Nueva iteración con feedback del cliente]
  33c. Continuar desde paso 24 con las opciones revisadas


SESIÓN 5 — PRD, MoSCoW, KPIs finales (post-aprobación)
───────────────────────────────────────
40. Shift+Tab x2
41. /s5-prd                       ← verifica gate intermedio
42. [Responder, iterar, aprobar MoSCoW y KPIs]
43. [Claude genera PRD.md con supuestos de factibilidad en sección 8.2 y MVP-SCOPE.md]
44. /clear


SESIÓN 6 — Arquitectura
───────────────────────────────────────
45. Shift+Tab x2
46. /s6-arquitectura
47. [Responder, iterar, aprobar]
48. [Claude genera ARCHITECTURE-VISION.md]
49. /clear


SESIÓN 7 — Configuración
───────────────────────────────────────
50. Shift+Tab x1                 ← Normal Mode
51. /s7-config
52. [Claude genera CLAUDE.md definitivo, estructura, Git, commit]
53. NO hacer /clear todavía


CIERRE
───────────────────────────────────────
54. /gate-check
55. [Si TODO pasa → commit automático, Fase 01 cerrada]
    [Si falta algo → lista de correcciones]
56. /clear                       ← Listo para Fase 02
```

---

## 13. Referencia rápida de prompts y commands

| ID | Nombre | Sesión | Command | Para qué |
|----|--------|--------|---------|----------|
| 1.1 | Exploración del problema | S1 | `/s1-relevamiento` PASO 1 | Relevar situación y actores |
| 1.2 | Problem statement | S1 | `/s1-relevamiento` PASO 2 | Sintetizar el problema en 1 oración |
| 1.3 | Análisis competitivo (desde problema) | S1 | `/s1-relevamiento` PASO 3 | Qué resuelven mal los competidores |
| 1.4 | KPIs candidatos | S1 | `/s1-relevamiento` PASO 4 | KPIs alto nivel sin umbrales |
| 1.5 | Proceso actual y actores | S1 | `/s1-relevamiento` PASO 5 | Documentar flujo actual |
| 1.6 | Doc + Tracker S1 | S1 | `/s1-relevamiento` PASO 6-7 | Generar PROBLEM-STATEMENT.md |
| 2.1 | Explorar usuarios | S2 | `/s2-personas` PASO 1 | Entender a los usuarios |
| 2.2 | Persona primaria | S2 | `/s2-personas` PASO 2 | Arquetipo principal con journey |
| 2.3 | Personas secundarias | S2 | `/s2-personas` PASO 3 | Completar arquetipos |
| 2.4 | User stories descriptivas | S2 | `/s2-personas` PASO 4 | Stories sin MoSCoW formal |
| 2.5 | Doc + Tracker S2 | S2 | `/s2-personas` PASO 5-6 | Generar PERSONAS.md |
| 3.1 | Restricciones | S3 | `/s3-opciones` PASO 1 | Entender limitaciones |
| 3.2 | Análisis competitivo (desde solución) | S3 | `/s3-opciones` PASO 2 | Cómo resolvieron otros |
| 3.3 | Opciones de solución | S3 | `/s3-opciones` PASO 3 | 2-3 enfoques distintos con propuesta de valor |
| 3.4 | Trade-offs | S3 | `/s3-opciones` PASO 4 | Comparar opciones |
| 3.5 | Recomendación + Plan B | S3 | `/s3-opciones` PASO 5 | Elegir opción + plan B |
| 3.6 | Doc + Tracker S3 | S3 | `/s3-opciones` PASO 6-7 | Generar OPCIONES-SOLUCION.md |
| 4.0 | Detección iteración | S4 | `/s4-propuesta` PASO 0 | Versionado automático |
| 4.1 | Formato propuesta | S4 | `/s4-propuesta` PASO 1 | Modalidad: recomendación/opciones |
| 4.2 | Propuesta formal | S4 | `/s4-propuesta` PASO 2 | Armar documento para cliente |
| 4.3 | Refinamiento lenguaje | S4 | `/s4-propuesta` PASO 3 | Quitar jerga técnica |
| 4.4 | Doc + Tracker S4 | S4 | `/s4-propuesta` PASO 4-5 | Generar PROPUESTA-CLIENTE.md |
| ⭐ | Aprobación cliente | Gate | Manual + `/cliente-aprobo` | Cliente aprueba → formalizar |
| 5.1 | MoSCoW definitivo | S5 | `/s5-prd` PASO 1 | Priorizar features por primera vez |
| 5.2 | Abogado del diablo | S5 | `/s5-prd` PASO 2 | Challenge del alcance |
| 5.3 | KPIs con umbrales | S5 | `/s5-prd` PASO 3 | KPIs finales numéricos |
| 5.4 | Riesgos | S5 | `/s5-prd` PASO 4 | Consolidar riesgos |
| 5.5 | PRD completo | S5 | `/s5-prd` PASO 5 | Generar PRD.md |
| 5.6 | MVP Scope | S5 | `/s5-prd` PASO 6 | Generar MVP-SCOPE.md |
| 6.1 | Explorar arquitectura | S6 | `/s6-arquitectura` PASO 1 | Preguntas dominio técnico |
| 6.2 | Bounded contexts | S6 | `/s6-arquitectura` PASO 2 | Definir servicios |
| 6.3 | Stack tecnológico | S6 | `/s6-arquitectura` PASO 3 | Elegir tecnologías |
| 6.4 | Comunicación | S6 | `/s6-arquitectura` PASO 4 | Patrones entre servicios |
| 6.5 | Doc + Tracker S6 | S6 | `/s6-arquitectura` PASO 5-6 | Generar ARCHITECTURE-VISION.md |
| 7.1 | CLAUDE.md | S7 | `/s7-config` PASO 1 | Configurar Claude Code |
| 7.2 | Estructura dirs | S7 | `/s7-config` PASO 2 | Crear carpetas del proyecto |
| 7.3 | Git inicial | S7 | `/s7-config` PASO 3 | Configurar repo y commit |
| VAL | Validación cruzada | Final | `/gate-check` | Verificar consistencia total |
| AUX | Context dump | Cualquier | `/context-dump` | Guardar estado antes de /clear |

---

## 14. Notas importantes

### Sobre la separación de concerns entre sesiones
- **S1** releva el problema (sin soluciones).
- **S2** describe usuarios y necesidades (sin priorización).
- **S3** explora cómo resolver (sin comprometerse al cliente).
- **S4** consolida una propuesta para el cliente.
- **⭐ Gate intermedio:** cliente aprueba dirección.
- **S5** detalla qué se construye (con aprobación y MoSCoW formal).
- **S6** diseña cómo se construye técnicamente.
- **S7** configura el entorno.

Cada sesión tiene su foco y no invade territorio de otras. La v3.1 corrigió
solapamientos que había en versiones anteriores.

### Sobre el gate humano intermedio
- No es opcional. Sin aprobación del cliente no se puede pasar a S5.
- Se formaliza con `/cliente-aprobo` (no edición manual del tracker).
- El tracker registra iteraciones: cuántas rondas hubo con el cliente.
- Si el cliente rechaza, se vuelve a S3 (opciones), no se fuerza el flujo.

### Sobre el repositorio central de templates
- Se clona UNA VEZ. Cada proyecto se inicializa con `./init-project.sh`.
- Los templates evolucionan (Fase 06: mejora continua).
- Los commands se copian automáticamente — no se crean por proyecto.

### Sobre los commands vs prompts para copiar
- Un command se ejecuta con `/nombre`. Sin copiar, sin pegar.
- Incluye instrucciones de modo, modelo, prerequisito.
- Incluye actualización del tracker como parte del flujo.

### Sobre el tracking integrado
- `docs/_tracking/FASE-01-STATUS.md` se actualiza como parte de cada command.
- `/gate-check` lo verifica automáticamente.
- Se commitea con el proyecto, queda en el historial de Git.

### Sobre el manejo de contexto
- Cada sesión empieza con `/clear`.
- Cada command empieza leyendo docs/ para reconstruir contexto desde archivos.
- Si una sesión se extiende mucho: `/context-dump` y `/clear`.

### Sobre el modelo a usar
- **Opus 4.6** para Sesiones 1-6 (análisis, decisiones complejas).
- **Sonnet 4.6** para `/cliente-aprobo` y Sesión 7 (tareas mecánicas).

### Sobre cuándo crear skills
- En Fase 01 NO se crean skills. Se crean en Fase 03 cuando los patrones
  se estabilizan. Los commands cubren todo lo necesario en esta fase.

### Sobre tiempos reales vs netos
- Las duraciones son tiempo neto de trabajo con Claude Code.
- Total neto: ~4.5 horas (S1 a S7 + gate-check).
- Tiempo calendario típico: 5-10 días hábiles debido a:
  * Coordinación con el cliente
  * Iteraciones de propuesta (CASO B del flujo)
  * Espera de respuesta del cliente al gate intermedio
  * Procesamiento y validación entre sesiones

### Sobre qué pasa si una sesión falla o queda incompleta
- El tracker refleja exactamente qué items se completaron.
- Re-ejecutar el command: Claude lee el tracker y retoma donde quedó.
- Si el contexto se llenó: `/context-dump` y `/clear`, después re-ejecutar.

### Sobre la iteración con el cliente
- Si el cliente pide cambios menores: `/s4-propuesta` maneja versionado.
- Si el cliente pide cambios mayores: volver a `/s3-opciones`.
- Cada iteración queda registrada con número de versión en docs/_propuestas/.
- El tracker cuenta iteraciones para retrospectiva.
