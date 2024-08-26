# Ejercicios de Odoo

## Ejercicio 1: Instalación de Odoo 16 en Ubuntu 22.04

Al final de la instalación el resultado será el siguiente:

* Odoo estará instalado en el directorio /opt/odoo16.

* La instalación se realizará con un usuario odoo16, cuyo home es /opt/odoo16. Este usuario tendrá los permisos necesarios y suficientes para correr Odoo correctamente.

* Se creará un virtual environment de Python en /opt/odoo16/venv con las librerías requeridas por Odoo.

* La base de datos estará en PostgreSQL 14.

* Odoo estará accesible desde la URL http://IP:8069.

### Paso 1. Actualizar el servidor

Estamos asumiendo que el servidor Ubuntu está recién instalado, por tanto debemos ejecutar:

```
sudo apt-get update && sudo apt-get upgrade
```

### Paso 2. Crear usuario de Odoo

```
sudo adduser -system -home=/opt/odoo16 -group odoo16
```

Este comando creará un usuario con nombre odoo16 con el directorio /opt/odoo16 como el home. Además creará un grupo con nombre odoo16.

### Paso 3. Instalar PostgreSQL

```
sudo apt-get install postgresql postgresql-contrib

sudo su - postgres -c "createuser -s odoo16" 2> /dev/null
```

El primer comando instala PostgreSQL (la versión por defecto en Ubunto 22.04 es la 14).

El segundo comando crea un usuario de PostgreSQL que usaremos luego para conectarnos desde Odoo.

### Paso 4. Instalar dependencias de Python y pip

```
sudo apt install python3-pip wget python3-dev python3-venv python3-wheel libxml2-dev libpq-dev libjpeg8-dev liblcms2-dev libxslt1-dev zlib1g-dev libsasl2-dev libldap2-dev build-essential git libssl-dev libffi-dev libmysqlclient-dev libjpeg-dev libblas-dev libatlas-base-dev

sudo apt-get install libpq-dev libxml2-dev libxslt1-dev libldap2-dev libsasl2-dev libffi-dev
```

### Paso 5. Crear virtual environment de Python

La creación del virtual environment la haremos con el usuario de Odoo. Para esto hacemos login como odoo16.

```
sudo su - odoo16 -s /bin/bash

python3.10 -m venv venv

pip install --upgrade pip
```

### Paso 6. Clonar el código de Odoo (Community)

En este paso todavía estamos autenticados con el usuario odoo16 y trabajando en el home de este (/opt/odoo16).

Lo primero es clonar el código de Odoo con git. Luego activamos el virtual environment de Python y a continuación instalamos las librerías requeridas. Estas librerías se encuentran en el fichero requirements.txt dentro del directorio de Odoo (clonado anteriormente).

```
git clone --depth 1 -b 16.0 https://github.com/odoo/odoo.git

source venv/bin/activate

pip3 install -r odoo/requirements.txt

exit
```

Este última comando (exit) nos regresa al usuario con el que iniciamos la instalación.

### Paso 7. Instalar wkhtmltopdf

```
wget http://mirrors.kernel.org/ubuntu/pool/universe/w/wkhtmltopdf/wkhtmltopdf_0.12.6-2_amd64.deb

sudo apt-get install libqt5core5a, libqt5gui5

sudo dpkg -i wkhtmltopdf_0.12.6-2_amd64.deb
```

### Paso 8. Generar fichero de configuración de Odoo

Con el comando siguiente Odoo genera un fichero de configuración con parámetros por defecto. El nombre el fichero es .odoorc y estará en el directorio /opt/odoo16, que es el home el usuario odoo16.

Primero hacemos login nuevamente como odoo16.

```
sudo su - odoo16 -s /bin/bash

source venv/bin/activate

odoo/odoo-bin -s
```

Ahora ya podríamos acceder a Odoo mediante la URL http://IP:8069.

---

## Ejercicio 2: Realización de un script en bash que ejecute directamente el paso 8 de la instalación de Odoo

**Archivo:** [iniciar_odoo.sh](./iniciar_odoo.sh)

---

## Ejercicio 3: Creación de un módulo Odoo sobre la gestión de ventas de una fábrica de cervezas

### Estructura del módulo:

```plaintext
fabricacervezasmario/
│
├── __manifest__.py
├── __init__.py
│
├── models/
│   ├── __init__.py
│   ├── cliente.py
│   ├── contacto.py
│   ├── tipocerveza.py
│   ├── formatocerveza.py
│   ├── stockcerveza.py
│   └── venta.py
│
├── views/
│   ├── cliente_views.xml
│   ├── contacto_views.xml
│   ├── tipocerveza_views.xml
│   ├── formatocerveza_views.xml
│   ├── stockcerveza_views.xml
│   └── venta_views.xml
│
├── security/
│   └── ir.model.access.csv
│
└── static/
    └── description/
        ├── index.html
        ├── icon.png
        └── fabricaCervezasMario.png
```

### Se ha instalado con éxito el módulo en Odoo 16 y se ha realizado CRUD
