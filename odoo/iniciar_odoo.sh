#!/bin/bash

# Cambiar al usuario odoo16 e iniciar un shell bash
sudo su - odoo16 -s /bin/bash <<EOF

# Activar el entorno virtual
source venv/bin/activate

# Ejecutar el comando de inicio de Odoo
odoo/odoo-bin -s

EOF
