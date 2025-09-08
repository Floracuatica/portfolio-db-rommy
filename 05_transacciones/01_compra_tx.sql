-- 01_compra_tx.sql
-- Simula una reposición de stock (compra al proveedor)
BEGIN;
  -- Aumentar stock de producto 1 en 5 unidades
  UPDATE producto SET stock = stock + 5 WHERE id_producto = 1;
COMMIT;

-- Ejemplo de rollback por validación fallida
BEGIN;
  -- Intento de reducir stock por debajo de 0 (fallará por CHECK)
  UPDATE producto SET stock = stock - 1000 WHERE id_producto = 1;
-- Si hay error se debe ROLLBACK manualmente desde el cliente o por handler en app
ROLLBACK;
