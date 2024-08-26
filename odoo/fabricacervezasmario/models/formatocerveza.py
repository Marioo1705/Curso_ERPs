from odoo import models, fields

class FormatoCerveza(models.Model):
    _name = 'fabricacervezasmario.formatocerveza'
    _description = 'Formato de cerveza'

    nombre = fields.Char(string='Formato', required=True)
    tipocerveza_ids = fields.Many2many(
        'fabricacervezasmario.tipocerveza',
        'tipocerveza_formatocerveza_rel',
        'formatocerveza_id',
        'tipocerveza_id',
        string='Tipos de cerveza'
    )
    
    def name_get(self):
        result = []
        for record in self:
            name = record.nombre
            result.append((record.id, name))
        return result
