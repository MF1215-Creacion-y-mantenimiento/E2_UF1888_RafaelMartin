# Consultas SQL

### Ventas por cliente
```sql
SELECT rp.name  AS cliente,
		COUNT(so.id) As num_operaciones,
		SUM(so.amount_untaxed) AS importe_total

FROM sale_order so
JOIN res_partner rp ON rp.id = so.partner_id
WHERE so.state = 'sale'
GROUP BY rp.id, rp.name
ORDER BY importe_total DESC;

```


### Servicios más contratados
```sql
SELECT COALESCE(pt.name->>'es_ES', pt.name->>'en_US') AS servicio,
	SUM(sol.product_uom_qty)  AS cantidad_vendida,
	SUM(sol.price_subtotal) AS importe_generado

FROM sale_order_line sol
JOIN sale_order so ON so.id = sol.order_id
JOIN product_product pp ON pp.id = sol.product_id
JOIN product_template pt ON pt.id = pp.product_tmpl_id

WHERE so.state = 'sale'
	AND sol.display_type IS NULL
	AND pt.type = 'service'
GROUP BY pt.id, servicio

```

### Detalle de operaciones
```sql


```


-- ---------------------------------------------------------------------
-- TAREA 3 · CONSULTA 1 · Ventas realizadas por cliente
-- Columnas: cliente · número de operaciones · importe total vendido
-- ---------------------------------------------------------------------
SELECT  rp._____                AS cliente,
        COUNT(so._____)         AS num_operaciones,
        SUM(so._____)           AS importe_total
FROM    _____  so
JOIN    _____  rp ON rp._____ = so._____
WHERE   so._____ = '_____'
GROUP BY rp._____, rp._____
ORDER BY importe_total _____;


-- ---------------------------------------------------------------------
-- TAREA 3 · CONSULTA 2 · Servicios más contratados
-- Columnas: servicio · cantidad vendida · importe generado
-- ---------------------------------------------------------------------
SELECT  COALESCE(pt.name->>'es_ES', pt.name->'en_US') AS servicio,
        SUM(sol.product_uom_qty)                                   AS cantidad_vendida,
        SUM(sol.price_subtotal)                                    AS importe_generado
FROM    sale_order_line  sol
JOIN    sale_order  so ON so.id = sol.order_id
JOIN    product_product  pp ON pp.id = sol.product_id
JOIN    product_template  pt ON pt.id = pp.product_tmpl_id
WHERE   so.state = 'sale'
  AND   sol.display_type IS NULL
  AND   pt.type = 'service'
GROUP BY pt.id, servicio
ORDER BY cantidad_vendida DESC, importe_generado DESC;


-- ---------------------------------------------------------------------
-- TAREA 3 · CONSULTA 3 · Detalle de operaciones comerciales
-- Columnas: fecha · cliente · servicio · cantidad · importe
-- ---------------------------------------------------------------------
SELECT  (so.date_order AT TIME ZONE 'UTC' 
					   AT TIME ZONE 'Atlantic/Canary')::date AS fecha,
        so.name                                          AS pedido,
        rp.name                                          AS cliente,
        COALESCE(pt.name->>'es_ES', pt.name->>'en_US')   AS servicio,
        sol.product_uom_qty                              AS cantidad,
        sol.price_subtotal                               AS importe
FROM    sale_order_line  sol
JOIN    sale_order  so ON so.id = sol.order_id
JOIN    res_partner  rp ON rp.id = so.partner_id
JOIN    product_product  pp ON pp.id = sol.product_id
JOIN    product_template  pt ON pt.id = pp.product_tmpl_id
WHERE   so.state = 'sale'
  AND   sol.display_type IS NULL
  AND   pt.type = 'service'
ORDER BY fecha DESC, pedido, servicio;


-- ---------------------------------------------------------------------
-- TAREA 6 · PRUEBA 1 · Consulta 1 limitada a los clientes de control
-- ---------------------------------------------------------------------
SELECT  rp.name AS cliente, COUNT(so.id) AS num_operaciones, SUM(so.amount_untaxed) AS importe_total
FROM    sale_order so
JOIN    res_partner rp ON rp.id = so.partner_id
WHERE   so.state = 'sale'
  AND   rp.name LIKE 'E2 Cliente%'
GROUP BY rp.id, rp.name
ORDER BY importe_total DESC;


-- ---------------------------------------------------------------------
-- TAREA 6 · PRUEBA 2 · Cuadre: total de cabeceras frente a total de líneas
-- ---------------------------------------------------------------------
SELECT 
	(SELECT SUM(so.amount_untaxed)
		FROM sale_order so 
		JOIN res_partner rp ON rp.id = so.partner_id
		WHERE so.state = 'sale' AND rp.name LIKE 'E2 Cliente%') AS total_cabeceras,
	(SELECT SUM(sol.price_subtotal)
		FROM sale_order_line sol
		JOIN sale_order so ON so.id = sol.order_id
		JOIN res_partner rp ON rp.id = so.partner_id
	WHERE so.state = 'sale' AND sol.display_type IS NULL AND rp.name LIKE 'E2 Cliente%') AS total_lineas;


-- ---------------------------------------------------------------------
-- TAREA 6 · PRUEBA 3 · Pedidos de control agrupados por estado
-- ---------------------------------------------------------------------
SELECT  so.id, COUNT(*) AS pedidos, SUM(so.amount_untaxed) AS importe
FROM    sale_order so
JOIN    res_partner rp ON rp.id = so.partner_id
WHERE   rp.name LIKE 'E2 Cliente%'
GROUP BY so.id
ORDER BY so.id;