# Consultas ORM

```python

# Modelo + Criterio de busqueda
pedidos = env['sale.order'].search([
                    ('state', '=', 'sale'),
                    ('partner_id.name', '=like', 'E2 Cliente%' ),
                    ])
# Agupar por cliente
resumen = {}
for pedido in pedidos:
    cliente = pedido.partner_id.display_name
    if cliente not in resumen:
        resumen[cliente] = {'num':0, 'importe':0.0}
    resumen[cliente]['num'] += 1
    resumen[cliente]['importe'] += pedido.amount_untaxed
 
# Ordenar   
clientes = sorted(resumen, key=lambda c: resumen[c]['importe'], reverse=True)

# Dar formato a cada fila
lineas = ['%s: %d pedidos - %.2f €' % (c, resumen[c]['num'], resumen[c]['importe']) for c in clientes]

# Presentar resultados
log('\n'.join(lineas) or 'No hay pedidos confirmados ')
action = {
    'type': 'ir.actions.client',
    'tag' : 'display_notification',
    'params': {
        'title': 'Ventas por cliente (ORM)',
        'message' : ' | '.join(lineas) or 'No hay pedidos confirmados',
        'sticky' : True
    },
}
    
```