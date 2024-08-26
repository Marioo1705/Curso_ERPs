from odoo import models, fields

class Cliente(models.Model):
    _name = 'fabricacervezasmario.cliente'
    _description = 'Clientes'
    
    codigo = fields.Char(string='Código', required=True)
    razon_social = fields.Char(string='Razón social', required=True)
    nombre_comercial = fields.Char(string='Nombre comercial')
    nif = fields.Char(string='NIF', required=True)
    direccion = fields.Char(string='Dirección', required=True)
    poblacion = fields.Char(string='Población', required=True)
    provincia = fields.Char(string='Provincia', required=True)
    codigo_postal = fields.Char(string='Código postal')
    email = fields.Char(string='Email', required=True)
    telefono = fields.Char(string='Teléfono', required=True)
    riesgo = fields.Monetary(string='Riesgo', required=True, currency_field='currency_id')
    forma_pago = fields.Selection([
	('contado', 'Contado'),
	('giro_domiciliado', 'Giro domiciliado'),
	('pagare', 'Pagaré'),
	('confirming', 'Confirming')
    ], string='Forma de pago', default='contado')
    plazo_pago = fields.Selection([
	('1', '1 día'),
	('30', '30 días'),
	('60', '60 días')
    ], string='Plazo de pago', default='1')
    dia_pago = fields.Integer(string='Día fijo de pago')
    descuento = fields.Float(string='Descuento (%)', default=0.0)
    observaciones = fields.Text(string='Observaciones')
    comercial = fields.Char(string='Comercial asignado')
    activo = fields.Boolean(string='Activo', default=True)
    contacto_ids = fields.One2many('fabricacervezasmario.contacto', 'cliente_id', string='Contactos')
    venta_ids = fields.One2many('fabricacervezasmario.venta', 'cliente_id', string='Venta')
    
    currency_id = fields.Many2one('res.currency', string='Currency')
    
    # Para especificar que el valor de un campo es unique, tenemos que utilizar una
    # restricción SQL en el modelo a través del atributo _sql_constraints
    _sql_constraints = [
        ('nif_unique', 'unique(nif)', 'El NIF debe ser único.'),
        ('codigo_unique', 'unique(codigo)', 'El Código de Cliente debe ser único.')
    ]

    def name_get(self):
        result = []
        for record in self:
            name = record.razon_social
            result.append((record.id, name))
        return result    
