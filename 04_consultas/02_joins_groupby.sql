-- 02_joins_groupby.sql
-- JOIN: Detalle de pedidos con cliente y producto
SELECT dp.id_pedido, c.nombre AS cliente, pr.nombre AS producto, dp.cantidad, dp.precio_unitario
FROM detalle_pedido dp
JOIN pedido p ON p.id_pedido = dp.id_pedido
JOIN cliente c ON c.id_cliente = p.id_cliente
JOIN producto pr ON pr.id_producto = dp.id_producto;

-- GROUP BY: Ventas por producto (monto)
SELECT pr.id_producto, pr.nombre, SUM(dp.cantidad * dp.precio_unitario) AS venta_total
FROM detalle_pedido dp
JOIN producto pr ON pr.id_producto = dp.id_producto
GROUP BY pr.id_producto, pr.nombre
ORDER BY venta_total DESC;
