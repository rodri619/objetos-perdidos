# Sistema de Gestión de Objetos Perdidos — UNAM 🎒

Diseño e implementación de una base de datos relacional en **MySQL** para gestionar objetos perdidos y encontrados en las facultades y dependencias de la UNAM. Cubre todo el ciclo: alguien **reporta** un objeto que encontró, el objeto queda **resguardado** en una ubicación física con un **estado**, y su dueño puede **reclamarlo**.

Proyecto académico de la Facultad de Ciencias, UNAM. Incluye el modelado completo (entidades, relaciones, diagrama entidad-relación y normalización hasta 4FN), la implementación física con datos de ejemplo y 15 consultas SQL.

## Contenido

- [Qué resuelve](#qué-resuelve)
- [Diagrama entidad-relación](#diagrama-entidad-relación)
- [Relaciones entre tablas](#relaciones-entre-tablas)
- [Normalización hasta 4FN](#normalización-hasta-4fn)
- [Consultas](#consultas)
- [Cómo ejecutarlo en MySQL Workbench](#cómo-ejecutarlo-en-mysql-workbench)
- [Estructura del repositorio](#estructura-del-repositorio)

## Qué resuelve

En una universidad grande, los objetos que se pierden terminan en conserjerías, bibliotecas u oficinas distintas, sin un registro central. Este sistema propone un modelo de datos para:

- Registrar quién encontró un objeto y cuándo (**Reporte**).
- Saber dónde está guardado y en qué estado se encuentra (**Ubicación física** y **Estado**).
- Clasificar los objetos para buscarlos fácilmente (**Categoría**).
- Registrar a quien lo reclama y qué relata sobre la pérdida para verificar que es el dueño (**Reclamo**).
- Distinguir tres tipos de usuario: **Alumno**, **Profesor** y **Administrativo**, ligados a su facultad o dependencia.

## Diagrama entidad-relación

![Diagrama entidad-relación](docs/modelo_entidad_relacion.png)


## Relaciones entre tablas

| Relación | Cardinalidad | Descripción |
|---|---|---|
| Usuario → Reporte | 1 a N | Un usuario puede hacer cero o varios reportes; cada reporte lo hace exactamente un usuario |
| Usuario → Reclamo | 1 a N | Un usuario puede hacer cero o varios reclamos; cada reclamo lo hace exactamente un usuario |
| Reporte ↔ Objeto | 1 a 1 | Cada objeto es resultado de exactamente un reporte, y cada reporte registra exactamente un objeto |
| Objeto ↔ Reclamo | 1 a 0..1 | Un objeto puede tener cero o un reclamo; cada reclamo es sobre exactamente un objeto |
| Categoría → Objeto | 1 a N | Cada objeto pertenece a una categoría |
| Estado → Objeto | 1 a N | Cada objeto tiene exactamente un estado actual |
| UbicaciónFísica → Objeto | 1 a N | Cada objeto está guardado en exactamente una ubicación |
| Facultad → Usuario | 1 a N | Cada usuario pertenece a exactamente una facultad o dependencia |

El análisis de correspondencia de cada relación (con diagramas) está en [`docs/relaciones.pdf`](docs/relaciones.pdf), y la descripción detallada de cada entidad y atributo en [`docs/entidades_y_atributos.pdf`](docs/entidades_y_atributos.pdf).

## Normalización hasta 4FN

El documento completo está en [`docs/normalizacion.pdf`](docs/normalizacion.pdf). Resumen:

| Forma normal | Cómo se cumple |
|---|---|
| **1FN** | Todos los atributos son atómicos; no hay listas dentro de una celda ni grupos repetitivos |
| **2FN** | Todas las tablas usan llaves primarias simples, así que ningún atributo depende de solo una parte de la llave |
| **3FN** | Se extrajeron los catálogos (`Facultad`, `Categoria`, `Estado`, `UbicacionFisica`) a tablas propias, eliminando dependencias transitivas |
| **4FN** | Los eventos de `Reporte` y `Reclamo` están en tablas separadas, por lo que no se mezclan hechos multivaluados independientes |

## Consultas

Las 15 consultas están en [`sql/consultas/`](sql/consultas/) y el resultado de cada una, exportado a CSV, en [`resultados/`](resultados/).

| # | Qué resuelve |
|---|---|
| 01 | Objetos perdidos en la Facultad de Filosofía y Letras durante la última semana |
| 02 | Objetos de la categoría "Electrónicos" que aún no han sido reclamados |
| 03 | Todos los reportes hechos por un usuario específico, buscado por su número de cuenta |
| 04 | Objetos cuya descripción contiene la palabra "termo" |
| 05 | Cantidad de objetos encontrados por cada facultad en el último mes |
| 06 | Usuarios que han reportado más de 3 objetos (los "héroes anónimos") |
| 07 | Reclamos pendientes de un usuario específico |
| 08 | El objeto que lleva más tiempo sin ser reclamado |
| 09 | Objetos "En Custodia" en la Biblioteca Central |
| 10 | Cantidad de objetos reclamados en lo que va del año |
| 11 | Objetos perdidos más comunes, agrupados por categoría |
| 12 | Objetos reportados en una fecha específica |
| 13 | Información de contacto de quien reportó un objeto específico |
| 14 | Objetos "Donados" reportados hace más de 6 meses (política de retención) |
| 15 | Detalle de un reclamo, con la información del objeto y del usuario que reclama |

Técnicas que se usan: `JOIN` de hasta cinco tablas, `LEFT JOIN` con `IS NULL` para encontrar registros sin relación, `GROUP BY` con `HAVING`, `COUNT`, `ORDER BY` con `LIMIT`, `LIKE`, `NOT IN` y funciones de fecha (`DATE_SUB`, `DATEDIFF`, `YEAR`).

## Cómo ejecutarlo en MySQL Workbench

Necesitas **MySQL Server** y **MySQL Workbench** instalados.

1. Abre Workbench y conéctate a tu servidor local.
2. Ve a **File → Open SQL Script** y elige [`sql/01_base_de_datos.sql`](sql/01_base_de_datos.sql).
3. Ejecuta todo el script con el icono del rayo ⚡. Esto crea la base de datos `gestion_objetos`, sus 8 tablas y los datos de ejemplo.
4. Abre cualquier archivo de [`sql/consultas/`](sql/consultas/). Asegúrate de tener seleccionada la base con `USE gestion_objetos;` (o haz doble clic en `gestion_objetos` en el panel de la izquierda).
5. Ejecuta la consulta con el rayo ⚡ (o `Ctrl + Enter` para una sola sentencia) y mira el resultado en el *Result Grid*.

> ⚠️ El primer script ejecuta `DROP DATABASE IF EXISTS gestion_objetos;`, así que **borra y recrea** esa base si ya existía. No lo corras si tienes una con ese nombre que quieras conservar.


## Estructura del repositorio

```text
.
├── README.md
├── sql/
│   ├── 01_base_de_datos.sql      # Creación de tablas y datos de ejemplo
│   └── consultas/                # consulta_01.sql ... consulta_15.sql
├── resultados/                   # consulta_01.csv ... consulta_15.csv
└── docs/
    ├── modelo_entidad_relacion.png
    ├── entidades_y_atributos.pdf
    ├── relaciones.pdf
    └── normalizacion.pdf
```

## Autor

**Ángel Rodrigo Jiménez Cázares** — Ciencias de la Computación, Facultad de Ciencias, UNAM
GitHub: [@rodri619](https://github.com/rodri619)
