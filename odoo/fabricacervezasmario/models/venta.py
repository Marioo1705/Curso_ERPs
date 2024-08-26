from odoo import models, fields, api

class Venta(models.Model):
    _name = 'fabricacervezasmario.venta'
    _description = 'Ventas'

    fecha = fields.Date(string='Fecha', required=True)
    numero_pedido = fields.Char(string='Número de pedido')
    cliente_id = fields.Many2one('fabricacervezasmario.cliente', string='Cliente', required=True)
    stockcerveza_id = fields.Many2one('fabricacervezasmario.stockcerveza', string='Código de producto', required=True)
    cantidad = fields.Integer(string='Cantidad', required=True)
    precio_total = fields.Monetary(string='Importe Total', compute='_compute_precio_total', store=True, currency_field='currency_id')
    
    currency_id = fields.Many2one('res.currency', string='Moneda', default=lambda self: self.env.user.company_id.currency_id)
    
    @api.depends('cantidad', 'stockcerveza_id.precio', 'cliente_id.descuento')
    def _compute_precio_total(self):
         for record in self:
              descuento = record.cliente_id.descuento or 0.0
              precio_con_descuento = record.stockcerveza_id.precio * (1 - descuento / 100)
              record.precio_total = record.cantidad * precio_con_descuento
    
    @api.model
    def create(self, vals):
         record = super(Venta, self).create(vals)
         if record.stockcerveza_id.stock < record.cantidad:
              raise ValueError('No hay suficiente stock disponible.')
         record.stockcerveza_id.stock -= record.cantidad
         return record     
