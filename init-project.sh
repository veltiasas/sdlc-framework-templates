#!/bin/bash
# =============================================================================
# init-project.sh — Inicializar proyecto nuevo desde sdlc-framework-templates
# =============================================================================
# USO: ./init-project.sh nombre-del-proyecto "Descripción en una oración"
#
# PREREQUISITO: Ejecutar desde el directorio sdlc-framework-templates/
# RESULTADO: Carpeta nueva con estructura completa lista para Claude Code
# =============================================================================

set -e

PROJECT_NAME=$1
PROJECT_DESC=$2
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKELETON_DIR="$SCRIPT_DIR/skeleton"
TARGET_DIR="$(pwd)/$PROJECT_NAME"
TODAY=$(date +%Y-%m-%d)

# --- Validaciones ---
if [ -z "$PROJECT_NAME" ]; then
  echo ""
  echo "ERROR: Falta el nombre del proyecto."
  echo ""
  echo "  Uso: ./init-project.sh nombre-del-proyecto \"Descripción breve\""
  echo ""
  exit 1
fi

if [ -z "$PROJECT_DESC" ]; then
  echo ""
  echo "ERROR: Falta la descripción del proyecto."
  echo ""
  echo "  Uso: ./init-project.sh nombre-del-proyecto \"Descripción breve\""
  echo ""
  exit 1
fi

if [ -d "$TARGET_DIR" ]; then
  echo ""
  echo "ERROR: Ya existe un directorio llamado '$PROJECT_NAME'."
  echo "  Elegí otro nombre o borrá el directorio existente."
  echo ""
  exit 1
fi

if [ ! -d "$SKELETON_DIR" ]; then
  echo ""
  echo "ERROR: No se encontró el directorio skeleton/ en $SCRIPT_DIR"
  echo "  Asegurate de ejecutar este script desde sdlc-framework-templates/"
  echo ""
  exit 1
fi

# --- Crear proyecto ---
echo ""
echo "Creando proyecto '$PROJECT_NAME'..."
echo ""

cp -r "$SKELETON_DIR" "$TARGET_DIR"
cd "$TARGET_DIR"

# Renombrar CLAUDE-INIT.md a CLAUDE.md
mv .claude/CLAUDE-INIT.md .claude/CLAUDE.md

# Reemplazar placeholders
find . -name "*.md" | while read f; do
  sed -i "s/\[NOMBRE_PROYECTO\]/$PROJECT_NAME/g" "$f"
  sed -i "s/\[DESCRIPCION\]/$PROJECT_DESC/g" "$f"
  sed -i "s/\[FECHA\]/$TODAY/g" "$f"
done

# Configurar Git
if [ -f "$SCRIPT_DIR/.gitignore-template" ]; then
  cp "$SCRIPT_DIR/.gitignore-template" .gitignore
else
  cat > .gitignore << 'GITIGNORE'
# Dependencies
node_modules/
vendor/
.venv/
__pycache__/

# Build outputs
dist/
build/
*.egg-info/
.next/
.nuxt/

# Environment
.env
.env.local
.env.*.local

# IDE
.vscode/
.idea/
*.swp
*.swo
.DS_Store
Thumbs.db

# Testing
coverage/
.coverage
*.lcov

# Logs
*.log
logs/

# Docker
docker-compose.override.yml

# Secrets (never commit)
*.pem
*.key
*.p12
GITIGNORE
fi

if [ -f "$SCRIPT_DIR/.commitlintrc-template.json" ]; then
  cp "$SCRIPT_DIR/.commitlintrc-template.json" .commitlintrc.json
else
  cat > .commitlintrc.json << 'COMMITLINT'
{
  "rules": {
    "type-enum": [2, "always", [
      "feat", "fix", "docs", "refactor", "test", "chore", "ci", "perf", "style"
    ]],
    "type-case": [2, "always", "lower-case"],
    "subject-empty": [2, "never"],
    "subject-case": [2, "never", ["upper-case"]],
    "header-max-length": [2, "always", 100]
  }
}
COMMITLINT
fi

# README inicial del proyecto
cat > README.md << READMEFILE
# $PROJECT_NAME

$PROJECT_DESC

## Estado

- Fase: 01 — Descubrimiento y planificación (en progreso)
- Iniciado: $TODAY
- Framework: sdlc-framework-templates v3.1

## Documentación

- [PRD](docs/PRD.md) — Product Requirements Document
- [Personas](docs/PERSONAS.md) — Arquetipos de usuario y user stories
- [Opciones de solución](docs/OPCIONES-SOLUCION.md) — Enfoques evaluados
- [Propuesta al cliente](docs/PROPUESTA-CLIENTE.md) — Propuesta aprobada
- [MVP Scope](docs/MVP-SCOPE.md) — Alcance del MVP

## Inicio rápido (desarrollo)

\`\`\`bash
# TODO: completar en Fase 03 al implementar servicios
\`\`\`

## Estructura

\`\`\`
services/          → Microservicios (se crean en Fase 03)
infrastructure/    → Docker, CI/CD (se configura en Fase 03)
docs/              → Documentación del producto
docs/_tracking/    → Estado de avance por fase
\`\`\`
READMEFILE

# Inicializar Git
git init
git add -A
git commit -m "chore: init project '$PROJECT_NAME' from sdlc-framework-templates v3.1"

# --- Resultado ---
echo "╔══════════════════════════════════════════════════════╗"
echo "║  Proyecto '$PROJECT_NAME' creado exitosamente        "
echo "╚══════════════════════════════════════════════════════╝"
echo ""
echo "  ✓ Estructura de directorios lista"
echo "  ✓ Commands de Claude Code: .claude/commands/"
echo "  ✓ Tracker de Fase 01:      docs/_tracking/FASE-01-STATUS.md"
echo "  ✓ Templates reutilizables: docs/templates/"
echo "  ✓ Git inicializado con commit base"
echo ""
echo "  Siguiente paso:"
echo ""
echo "    cd $PROJECT_NAME"
echo "    claude"
echo "    # Shift+Tab x2    → Plan Mode"
echo "    # /s1-relevamiento → Iniciar Sesión 1"
echo ""
