-- 01_select_basicas.sql
-- Todos los productos
SELECT * FROM producto;

-- Todos los pedidos de un cliente específico (por email)
SELECT p.* 
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE c.email = 'sofia@example.com';

-- Productos con bajo stock (< 10)
SELECT id_producto, nombre, stock
FROM producto
WHERE stock < 10;
