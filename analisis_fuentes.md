# Análisis de fuentes

| Información | Modelo Odoo | Tabla PostgreSQL | Campos que se usan |
|---|---|---|---|
| Cliente | `res.partner` | `res_partner` | `id`, `name` |
| Pedido | `sale.order` | `sale_order` | `partner_id`, `state` ,`date_order` , `amount_untaxed`  |
| Línea de venta | `sale.order.line` | `sale_order_line` | `order_id`,`product_id` ,`display_type` , `product_uom_qty`, `price_subtotal` |
| Servicio (variante) | `product.product` | `product_product` | `id`, `product_tmpl_id` |
| Servicio (plantilla) | `product.template` | `product_template` | `name`, `type` |


