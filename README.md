# Portafolio DB – Rommy Bejar

Repositorio de evidencia para el portafolio del curso (RDBMS + SQL). 
Incluye modelado ER, DDL, DML, consultas, transacciones y documentación.

## Estructura
- `01_modelado/` – Diagramas ER y decisiones de diseño.
- `02_ddl/` – Creación y alteración de objetos (tablas, índices, constraints).
- `03_dml/` – Inserciones, actualizaciones y eliminaciones.
- `04_consultas/` – SELECTs con `WHERE`, `JOIN`, `GROUP BY`, subconsultas.
- `05_transacciones/` – Operaciones atómicas de compra/venta con `BEGIN/COMMIT/ROLLBACK`.
- `06_docs/` – Normalización (3FN), notas y bitácora de commits.

## Requisitos previos
- PostgreSQL 14+ o DBeaver.
- Crear una base de datos, por ejemplo: `portafolio_rommy`.

## Cómo ejecutar
1. Ejecuta `02_ddl/01_create_tables.sql` en tu DB.
2. Ejecuta `03_dml/01_insert_data.sql` para datos de ejemplo.
3. Prueba las consultas en `04_consultas/`.
4. Simula transacciones con los scripts en `05_transacciones/`.

## Commits sugeridos
1. `chore: scaffold del repo + ERD inicial`
2. `feat: DDL base con constraints (PK/FK, CHECK)`
3. `feat: DML de ejemplo + consultas JOIN/GROUP BY + transacciones`
