##############################################################################
#
#    OpenERP, Open Source Management Solution
#    This module copyright (C) 2018 Marlon Falcon Hernandez
#    (<http://www.marlonfalcon.com>).
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as
#    published by the Free Software Foundation, either version 3 of the
#    License, or (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
##############################################################################

{

    'name': 'Fábrica de Cervezas Mario',
    'version': '1.0',
    'category': 'Sales',
    'summary': 'Gestión de Ventas en la fábrica Cervezas Mario',
    'description': """
        Módulo para la gestión de ventas en la fábrica de Cervezas Mario, incluyendo clientes, dsintintos tipos de cervezas comercializadas y ventas.
    """,
    'author': 'by Mario',
    'website': 'https://www.mahou.es',
    'depends': ['base'],
    'data': [
        'security/ir.model.access.csv',
        'views/cliente_views.xml',
	'views/contacto_views.xml',
	'views/tipocerveza_views.xml',
	'views/formatocerveza_views.xml',
	'views/stockcerveza_views.xml',
	'views/venta_views.xml',
    ],
    'installable': True,
    'application': True,

}
