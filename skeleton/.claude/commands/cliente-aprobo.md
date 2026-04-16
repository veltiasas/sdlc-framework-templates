# Registrar aprobación del cliente

## Instrucciones de ejecución
- MODO: Normal Mode (no requiere Plan Mode)
- MODELO: Sonnet 4.6
- DURACIÓN: 5 minutos
- PREREQUISITO: Cliente aprobó la propuesta (confirmación verbal/email/chat)

## Tu tarea

El cliente aprobó la propuesta. Registramos la aprobación formalmente
para habilitar la S5 (PRD).

### PASO 1: Recopilar datos de aprobación
Preguntame:
- ¿Cómo aprobó? (email, reunión, mensaje escrito, acta firmada)
- ¿Fecha de aprobación?
- ¿Nombre completo de quien aprobó del lado del cliente?
- ¿Rol/cargo de quien aprobó?
- ¿Hubo ajustes finales aceptados verbalmente no reflejados en el documento?
  (si sí, agregarlos ANTES de marcar como aprobado)

### PASO 2: Actualizar docs/PROPUESTA-CLIENTE.md
Reemplazar en el pie del documento:
"Aprobado por cliente: ____________ | Fecha: ____________"
Por:
"Aprobado por cliente: [Nombre] ([Rol]) | Fecha: [Fecha] | Medio: [email/reunión/...]"

Si hubo ajustes verbales, agregar sección "Ajustes finales aceptados" antes del pie.

### PASO 3: Actualizar tracker
En docs/_tracking/FASE-01-STATUS.md:
1. Sección "Gate intermedio — Aprobación del cliente":
   - Marcar todos items [x]
   - Estado: ✅ Aprobado
   - Fecha de aprobación: [fecha]
2. Sección "Sesión 4": Estado sesión → ✅ Completada
3. Sección "Resumen": "Aprobación del cliente: ✅ [Fecha]"
4. Historial: "[Fecha] | Gate | Cliente aprobó propuesta v[N] | /s5-prd habilitada"

### PASO 4: Commit
git add -A
git commit -m "docs: client approved proposal - S5 enabled"

### PASO 5: Confirmar
Informame:
- ✅ Aprobación registrada en la propuesta y en el tracker
- ✅ S5 (/s5-prd) habilitada
- Siguiente paso: /clear y después /s5-prd
