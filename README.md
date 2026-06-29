# API Rest - Sistema de Gestión de Turismo Internacional

## Integrantes del Grupo : Silva, Laureano Nicolas

## Endpoints de la API

La URL base de la API de manera local es: `http://localhost/Proyectos-Web2/TP_API/api/`

### 1. Listar Colección de Alojamientos
* **Endpoint:** `/alojamientos`
* **Método:** `GET`
* **Descripción:** Devuelve la lista completa de alojamientos cargados en el sistema. Posee ordenamiento por cualquier campo, filtrado por tipo y paginación de manera opcional
* **Query Params (opcionales):**
    * `sort`: Campo por el cual ordenar (`id_alojamiento`, `id_ciudad`, `nombre`, `tipo`, `precio_noche`, `disponible`). Por defecto es `id_alojamiento`.
    * `order`: Sentido del ordenamiento (`ASC` o `DESC`). Por defecto es `DESC`.
    * `tipo`: Filtra los alojamientos por su clasificación (ej. `Hotel`, `Hostal`, `Departamento`, `Cabaña`).
    * `page`: Número de página para activar el paginado fijo (muestra 5 registros por página).
* **Ejemplo de solicitud:**
    `GET http://localhost/Proyectos-Web2/TP_API/api/alojamientos?sort=precio_noche&order=ASC&tipo=Hotel&page=1`
* **Ejemplo de respuesta (200 OK):**
    ```json
    [
      {
        "id_alojamiento": "1",
        "id_ciudad": "1",
        "nombre": "Hotel Castillo Infinito",
        "tipo": "Hotel",
        "precio_noche": "65000.00",
        "disponible": "1"
      },
      {
        "id_alojamiento": "10",
        "id_ciudad": "24",
        "nombre": "Hotel Saint-Laurent",
        "tipo": "Hotel",
        "precio_noche": "50000.00",
        "disponible": "1"
      }
    ]
    ```

### 2. Obtener un Alojamiento por ID
* **Endpoint:** `/alojamientos/:id`
* **Método:** `GET`
* **Descripción:** Devuelve la información detallada de un único alojamiento según su ID
* **Ejemplo de solicitud:**
    `GET http://localhost/Proyectos-Web2/TP_API/api/alojamientos/1`
* **Ejemplo de respuesta (200 OK):**
    ```json
    {
      "id_alojamiento": "1",
      "id_ciudad": "1",
      "nombre": "Hotel Castillo Infinito",
      "tipo": "Hotel",
      "precio_noche": "65000.00",
      "disponible": "1"
    }
    ```
### 3. Crear un Nuevo Alojamiento
* **Endpoint:** `/alojamientos`
* **Método:** `POST`
* **Descripción:** Da de alta un nuevo alojamiento en el sistema. Todos los campos del cuerpo son estrictamente obligatorios
* **Cuerpo de la petición (JSON Raw):**
    ```json
    {
      "id_ciudad": 1,
      "nombre": "Hotel de Prueba",
      "tipo": "Hotel",
      "precio_noche": 35000.00,
      "disponible": 1
    }
    ```
* **Ejemplo de respuesta (201 Created):**
    ```json
    "Creación completa con el id: 11"
    ```

### 4. Modificar un Alojamiento Existente
* **Endpoint:** `/alojamientos/:id`
* **Método:** `PUT`
* **Descripción:** Reemplaza y actualiza todos los datos de un alojamiento existente identificado por su ID
* **Cuerpo de la petición (JSON Raw):**
    ```json
    {
      "id_ciudad": 1,
      "nombre": "Hotel de Prueba Modificado",
      "tipo": "Hotel",
      "precio_noche": 40000.00,
      "disponible": 1
    }
    ```
* **Ejemplo de respuesta (200 OK):**
    ```json
    "Alojamiento ID 1 actualizado con éxito"
    ```