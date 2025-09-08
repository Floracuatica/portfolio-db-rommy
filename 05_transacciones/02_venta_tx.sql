-- 02_venta_tx.sql
-- Venta: crea pedido, detalle y descuenta stock de manera atómica
BEGIN;
  -- 1) Crear pedido (cliente 1)
  INSERT INTO pedido (fecha, estado, id_cliente, total) VALUES (CURRENT_DATE, 'pendiente', 1, 0);
  -- 2) Determinar id del pedido recién creado
  -- En una app/función usarías RETURNING o currval; aquí para demo:
  WITH ultimo AS (
    SELECT max(id_pedido) AS id FROM pedido
  )
  -- 3) Agregar detalle (1 unidad de producto 1)
  INSERT INTO detalle_pedido (id_pedido, id_producto, cantidad, precio_unitario)
  SELECT id, 1, 1, (SELECT precio FROM producto WHERE id_producto = 1) FROM ultimo;

  -- 4) Descontar stock validando no negativo
  UPDATE producto
  SET stock = stock - 1
  WHERE id_producto = 1
    AND stock - 1 >= 0;

  -- 5) Recalcular total
  UPDATE pedido p
  SET total = (
    SELECT COALESCE(SUM(cantidad * precio_unitario), 0)
    FROM detalle_pedido d
    WHERE d.id_pedido = p.id_pedido
  )
  WHERE p.id_pedido = (SELECT max(id_pedido) FROM pedido);

  -- 6) Confirmar pago
  INSERT INTO pago (id_pedido, metodo, monto)
  VALUES ((SELECT max(id_pedido) FROM pedido), 'tarjeta', (SELECT total FROM pedido WHERE id_pedido = (SELECT max(id_pedido) FROM pedido)));

  -- 7) Marcar como pagado
  UPDATE pedido SET estado = 'pagado' WHERE id_pedido = (SELECT max(id_pedido) FROM pedido);
COMMIT;
