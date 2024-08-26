from odoo import models, fields

class Contacto(models.Model):
    _name = 'fabricacervezasmario.contacto'
    _description = 'Contactos'

    nombre = fields.Char(string='Nombre completo', required=True)
    cargo = fields.Char(string='Cargo')
    telefono = fields.Char(string='Teléfono')
    email = fields.Char(string='Email')
    cliente_id = fields.Many2one('fabricacervezasmario.cliente', string='Cliente', ondelete='cascade', required=True)

