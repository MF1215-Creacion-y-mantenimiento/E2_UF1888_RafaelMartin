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
SELECT  COALESCE(pt._____->>'_____', pt._____->>'_____') AS servicio,
        SUM(sol._____)                                   AS cantidad_vendida,
        SUM(sol._____)                                   AS importe_generado
FROM    _____  sol
JOIN    _____  so ON so._____ = sol._____
JOIN    _____  pp ON pp._____ = sol._____
JOIN    _____  pt ON pt._____ = pp._____
WHERE   so._____ = '_____'
  AND   sol._____ IS NULL
  AND   pt._____ = '_____'
GROUP BY pt._____, servicio
ORDER BY cantidad_vendida _____, importe_generado _____;


-- ---------------------------------------------------------------------
-- TAREA 3 · CONSULTA 3 · Detalle de operaciones comerciales
-- Columnas: fecha · cliente · servicio · cantidad · importe
-- ---------------------------------------------------------------------
SELECT  (so._____ AT TIME ZONE '_____' AT TIME ZONE '_____')::date AS fecha,
        so._____                                         AS pedido,
        rp._____                                         AS cliente,
        COALESCE(pt._____->>'_____', pt._____->>'_____') AS servicio,
        sol._____                                        AS cantidad,
        sol._____                                        AS importe
FROM    _____  sol
JOIN    _____  so ON so._____ = sol._____
JOIN    _____  rp ON rp._____ = so._____
JOIN    _____  pp ON pp._____ = sol._____
JOIN    _____  pt ON pt._____ = pp._____
WHERE   so._____ = '_____'
  AND   sol._____ IS NULL
  AND   pt._____ = '_____'
ORDER BY fecha _____, pedido, servicio;


-- ---------------------------------------------------------------------
-- TAREA 6 · PRUEBA 1 · Consulta 1 limitada a los clientes de control
-- ---------------------------------------------------------------------
SELECT  rp._____ AS cliente, COUNT(so._____) AS num_operaciones, SUM(so._____) AS importe_total
FROM    _____ so
JOIN    _____ rp ON rp._____ = so._____
WHERE   so._____ = '_____'
  AND   rp._____ LIKE '_____'
GROUP BY rp._____, rp._____
ORDER BY importe_total _____;


-- ---------------------------------------------------------------------
-- TAREA 6 · PRUEBA 2 · Cuadre: total de cabeceras frente a total de líneas
-- ---------------------------------------------------------------------
SELECT
  (SELECT SUM(so._____)
     FROM _____ so
     JOIN _____ rp ON rp._____ = so._____
    WHERE so._____ = '_____'
      AND rp._____ LIKE '_____')                       AS total_cabeceras,
  (SELECT SUM(sol._____)
     FROM _____ sol
     JOIN _____ so ON so._____ = sol._____
     JOIN _____ rp ON rp._____ = so._____
    WHERE so._____ = '_____'
      AND sol._____ IS NULL
      AND rp._____ LIKE '_____')                       AS total_lineas;


-- ---------------------------------------------------------------------
-- TAREA 6 · PRUEBA 3 · Pedidos de control agrupados por estado
-- ---------------------------------------------------------------------
SELECT  so._____, COUNT(*) AS pedidos, SUM(so._____) AS importe
FROM    _____ so
JOIN    _____ rp ON rp._____ = so._____
WHERE   rp._____ LIKE '_____'
GROUP BY so._____
ORDER BY so._____;