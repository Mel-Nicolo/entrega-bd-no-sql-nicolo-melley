# Entrega - Base de Datos NoSQL

Este repositorio contiene el proyecto de procesamiento, modelado y carga de datos en una base de datos NoSQL (MongoDB). A continuación, se detalla la estructura del proyecto y los pasos para replicar el entorno.

---

## Estructura del Repositorio

Basado en la organización del espacio de trabajo:

* **`data/`**: Gestión de los conjuntos de datos.
    * `raw/`: Archivos originales (CSV y JSON).
    * `cleaned/`: CSVs procesados listos para el modelado.
    * `output/`: Archivos `.jsonl` finales generados para la carga masiva.
* **`notebooks/`**: Organización por fases de desarrollo.
    * **`01/`**: Reto 1 -> Exploración inicial de datos (Actividad Económica, Licencias, Locales y Terrazas). Incluye carpeta `pdfs_htmls_cuadernos` con exportaciones.
    * **`02/`**: Reto 2 -> Pipeline principal de datos Incluye carpeta `pdfs_htmls_cuadernos` con exportaciones:
        * `01_limpieza_datasets.ipynb`: Limpieza técnica y normalización.
        * `02_modelado_documental.ipynb`: Transformación de datos y gestión de nulos ($NaN \to None$).
        * `03_carga.ipynb`: Ingesta de datos en MongoDB.
        * `04_consultas.ipynb`: Validación y consultas de negocio.
        * `05_indices.ipynb`: Optimización y análisis de rendimiento.
        * **`parte_2/`**: Subproyecto específico de Alojamientos (Exploración, Limpieza/Carga y Consultas) Incluye carpeta `pdfs_htmls_cuadernos` con exportaciones.
    * **`03/`**: Reto 3 -> Script para insertar directamente en Neo4J.
* **`venv/`**: Entorno virtual de Python (Tiene que estar en la raiz).
* **`requirements.txt`**: Dependencias.

---

## Flujo de Trabajo (Pipeline)

1.  **Limpieza**: Ejecutar los notebooks de la fase `01` para exploración y `02/01` para generar los archivos en `data/cleaned/`.
2.  **Modelado**: Utilizar `notebooks/02/02_modelado_documental.ipynb` para convertir los DataFrames a formato JSONL, aplicando la función `df_to_python_nulls` para compatibilidad con MongoDB.
3.  **Carga**: Ingestar los archivos resultantes en la base de datos mediante `notebooks/02/03_carga.ipynb`.
4.  **Consultas**: Consulta los datos mediante distintas querys para validar el modelo  `notebooks/02/04_consultas.ipynb`.
5.  **Optimización**: Ejecutar `05_indices.ipynb` para visualizar la mejora tras la creación de indices.

---

## Configuración del entorno

### 1. Crear y activar el entorno virtual

Desde la raíz del proyecto, crea y activa un entorno virtual para aislar las dependencias:

#### **Windows (PowerShell)**
```powershell
# Crear el entorno virtual
python -m venv venv

# Activar el entorno
venv\Scripts\activate
```

#### **Linux / macOS (Bash)**
```bash
# Crear el entorno virtual
python3 -m venv venv

# Activar el entorno
source venv/bin/activate
```

### 2. Instalar dependencias
Con el entorno activado, instala las librerías necesarias:

```bash
# Actualizar pip
python -m pip install --upgrade pip

# Instalar dependencias del proyecto
pip install -r .\entrega-bd-no-sql-nicolo-melley-master\requirements.txt
```

### 3. Verificar Instalación
Comprueba que las librerías clave están correctamente instaladas:

```bash
pip list
```

### 4. Desactivar el entorno virtual
Cuando termines de trabajar:

```bash
deactivate
```


## Notas Adicionales
- MongoDB: El proyecto asume una conexión por defecto a localhost:27017. Si utilizas una instancia en la nube (MongoDB Atlas), asegúrate de actualizar la cadena de conexión en el notebook 02/03_carga.ipynb.

- Rutas Relativas: Los notebooks están configurados para buscar los datos en las carpetas data/raw, data/cleaned y output. Se recomienda abrir el entorno de trabajo siempre desde la carpeta raíz del repositorio.

- Tratamiento de Nulos: En el modelado documental, es vital el uso de la     función df_to_python_nulls para evitar que los valores NaN de Pandas se inserten como strings, permitiendo que MongoDB los reconozca como tipos null reales.

