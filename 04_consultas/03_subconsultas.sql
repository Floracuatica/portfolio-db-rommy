-- 03_subconsultas.sql
-- Productos nunca vendidos (sin aparecer en detalle_pedido)
SELECT * FROM producto
WHERE id_producto NOT IN (SELECT DISTINCT id_producto FROM detalle_pedido);

-- Pedidos sin pago asociado
SELECT * FROM pedido
WHERE id_pedido NOT IN (SELECT DISTINCT id_pedido FROM pago);
