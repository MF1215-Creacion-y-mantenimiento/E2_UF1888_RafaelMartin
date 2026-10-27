# Vista o informe en Odoo
Solución recomenda es el Análisis de ventas estandar (sale.report) con un filtro de servicios, una tabla dinámica cliente + servicio

sale.report es el modelo de ORM sin tabla propia. Odoo crea una vista SQL que une sale_order_line, sale_order, res_partner, prodcut_product, product_template, y que ya excluye secciones y notas con display_type IS NULL.

```csv
"2026-10-26 19:27:20","E2 Mantenimiento mensual","E2 Mantenimiento mensual","Rafael Martín","E2 Cliente beta","6.0","90.0","653.4","Pedido de venta"
"2026-10-26 19:27:20","E2 Alojamiento web anual","E2 Alojamiento web anual","Rafael Martín","E2 Cliente beta","1.0","240.0","290.4","Pedido de venta"
"2026-10-26 16:26:57","E2 Mantenimiento mensual","E2 Mantenimiento mensual","Rafael Martín","E2 Cliente alfa","12.0","90.0","1306.8","Presupuesto"
"2026-10-26 16:26:57","E2 Desarrollo web a medida","E2 Desarrollo web a medida","Rafael Martín","E2 Cliente alfa","1.0","1500.0","1815.0","Presupuesto"
"2026-10-26 16:19:30","E2 Desarrollo web a medida","E2 Desarrollo web a medida","Rafael Martín","E2 Cliente alfa","1.0","1500.0","1815.0","Presupuesto"
"2026-10-26 16:19:30","E2 Mantenimiento mensual","E2 Mantenimiento mensual","Rafael Martín","E2 Cliente alfa","12.0","90.0","1306.8","Presupuesto"
"2026-10-25 19:06:09","E2 Desarrollo web a medida","E2 Desarrollo web a medida","Rafael Martín","E2 Cliente beta","1.0","1500.0","1815.0","Presupuesto"
"2026-10-25 19:04:55","E2 Alojamiento web anual","E2 Alojamiento web anual","Rafael Martín","E2 Cliente alfa","1.0","240.0","290.4","Pedido de venta"
"2026-10-25 19:04:06","E2 Desarrollo web a medida","E2 Desarrollo web a medida","Rafael Martín","E2 Cliente alfa","1.0","1500.0","1815.0","Pedido de venta"
"2026-10-25 19:04:06","E2 Mantenimiento mensual","E2 Mantenimiento mensual","Rafael Martín","E2 Cliente alfa","12.0","90.0","1306.8","Pedido de venta"


```