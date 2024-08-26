from odoo import models, fields

class TipoCerveza(models.Model):
    _name = 'fabricacervezasmario.tipocerveza'
    _description = 'Tipos de cerveza'

    nombre = fields.Char(string='Nombre comercial', required=True)
    descripcion = fields.Text(string='Descripción')
    formato_ids = fields.Many2many(
         'fabricacervezasmario.formatocerveza', 
         'tipocerveza_formatocerveza_rel',
         'tipocerveza_id',
         'formatocerveza_id', 
         string='Formatos'
    )
    stock_ids = fields.One2many('fabricacervezasmario.stockcerveza', 'tipocerveza_id', string='Stock')
    
    def name_get(self):
        result = []
        for record in self:
            name = record.nombre
            result.append((record.id, name))
        return result
    
    def get_stock(self):
         # Metodo para calcular stock total
         total_stock = sum(stock.stock for stock in self.stock_ids)
         return total_stock   
    
