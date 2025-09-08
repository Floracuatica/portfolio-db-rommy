-- 02_update_delete_examples.sql
-- Actualizar dirección de un cliente
UPDATE cliente SET direccion = 'Av. Paz 2002' WHERE id_cliente = 1;

-- Eliminar un detalle no procesado
DELETE FROM detalle_pedido WHERE id_detalle = 2;

-- Recalcular total tras eliminación
UPDATE pedido p
SET total = (
  SELECT COALESCE(SUM(cantidad * precio_unitario), 0)
  FROM detalle_pedido d
  WHERE d.id_pedido = p.id_pedido
)
WHERE p.id_pedido = 1;
