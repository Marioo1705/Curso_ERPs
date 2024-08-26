from odoo import models, fields, api

class StockCerveza(models.Model):
     _name = 'fabricacervezasmario.stockcerveza'
     _description = 'Stock'
     
     codigo = fields.Char(string='Código de producto', required=True)
     tipocerveza_id = fields.Many2one('fabricacervezasmario.tipocerveza', string='Tipo de cerveza', required=True)
     formatocerveza_id = fields.Many2one('fabricacervezasmario.formatocerveza', string='Formato de cerveza', required=True)
     ubicacion = fields.Char(string='Ubicación')
     stock = fields.Integer(string='Stock', required=True)
     precio = fields.Monetary(string='Precio', required=True, currency_field='currency_id')
             
     currency_id = fields.Many2one('res.currency', string='Moneda', default=lambda self: self.env.user.company_id.currency_id)
     
     _sql_constraints = [
         ('codigo_unique', 'unique(codigo)', 'El Código de Producto debe ser único.')
    ]
     
     def name_get(self):
        result = []
        for record in self:
            name = record.codigo
            result.append((record.id, name))
        return result 
        
     @api.constrains('stock')
     def _check_stock(self):
          for record in self:
               if record.stock < 0:
                    raise ValueError('El stock no puede ser negativo.')
    
