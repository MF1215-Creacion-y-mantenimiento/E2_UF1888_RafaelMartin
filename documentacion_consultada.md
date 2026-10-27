# Documentación técnica consultada

| Fuente | Apartado consultado | Para qué se utilizó |
|---|---|---|
| Odoo 19 · Developer · ORM API — https://www.odoo.com/documentation/19.0/developer/reference/backend/orm.html | *Search domains* y *Recordsets*; método `_read_group` | Escribir el dominio `[('state', '=', 'sale')]` y la variante agregada de la acción |
| Odoo 19 · Developer · Actions — https://www.odoo.com/documentation/19.0/developer/reference/backend/actions.html | *Server Actions (ir.actions.server)* | Saber qué variables hay en el código (`env`, `model`, `records`, `log`, `action`) |
| Odoo 19 · Essentials · Reporting — https://www.odoo.com/documentation/19.0/applications/essentials/reporting.html | Vistas pivot y graph, medidas, agrupaciones | Configurar el informe de la tarea 5 |
| Odoo 19 · Essentials · Search, filter and group — https://www.odoo.com/documentation/19.0/applications/essentials/search.html | Filtros personalizados y favoritos | Filtro de servicios y favorito |
| PostgreSQL 16 · Tutorial · Aggregate Functions — https://www.postgresql.org/docs/16/tutorial-agg.html | `GROUP BY`, `COUNT`, `SUM` | Consultas 1 y 2 |
| PostgreSQL 16 · JSON Functions and Operators — https://www.postgresql.org/docs/16/functions-json.html | Operador `->>` | Extraer el nombre traducido del servicio |
| PostgreSQL 16 · Date/Time Functions — https://www.postgresql.org/docs/16/functions-datetime.html | `AT TIME ZONE` | Pasar `date_order` de UTC a la hora de Canarias |

## Qué se ha interpretado

- **ORM API (inglés):** un dominio es una lista de tuplas `(campo, operador, valor)`; varias tuplas se combinan con Y por defecto. `search()` devuelve un *recordset* y los campos relacionales se recorren con punto (`partner_id.name`).
- **Actions:** en una acción de servidor de código, si se asigna un diccionario a la variable `action`, Odoo lo ejecuta al terminar. Así se muestra la notificación.
- **JSON Functions:** `->` devuelve JSON y `->>` devuelve texto. Por eso el nombre del servicio sale limpio con `name->>'es_ES'`.
