-- 01_insert_data.sql
-- Clientes
INSERT INTO cliente (nombre, apellido, email, telefono, direccion) VALUES
('Sofía', 'Mendoza', 'sofia@example.com', '912345678', 'Av. Paz 1001'),
('Miriam', 'Rojas', 'miri@example.com', '923456789', 'Calle Lago 22');

-- Proveedores
INSERT INTO proveedor (nombre, direccion, telefono, email) VALUES
('TecnoSur', 'Av. Andes 501', '932112233', 'ventas@tecnosur.cl'),
('ElectroMax', 'Calle Norte 90', '945667788', 'contacto@electromax.cl');

-- Productos
INSERT INTO producto (nombre, descripcion, precio, stock) VALUES
('Teclado Mecánico', 'Switches Blue', 39990, 30),
('Mouse Inalámbrico', '2.4G + BT', 18990, 50),
('Monitor 24"', 'IPS 75Hz', 129990, 12);

-- Relación producto-proveedor
INSERT INTO producto_proveedor (id_producto, id_proveedor, precio_compra) VALUES
(1, 1, 25000),
(1, 2, 26000),
(2, 1, 12000),
(3, 2, 98000);

-- Pedido de ejemplo
INSERT INTO pedido (fecha, estado, id_cliente, total) VALUES
(CURRENT_DATE, 'pendiente', 1, 0);  -- se actualiza luego con el detalle

-- Detalle del pedido (2 productos)
INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario) VALUES
(1, 1, 1, 39990),
(1, 2, 2, 18990);

-- Actualizamos total del pedido basado en su detalle
UPDATE pedido p
SET total = (
  SELECT COALESCE(SUM(cantidad * precio_unitario), 0)
  FROM detalle_pedido d
  WHERE d.id_pedido = p.id_pedido
)
WHERE p.id_pedido = 1;
