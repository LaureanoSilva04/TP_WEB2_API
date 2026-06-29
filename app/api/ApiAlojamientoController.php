<?php
require_once('app/modelos/AlojamientoModel.php');

class ApiAlojamientoController{
    
    private $model = null;
    private $view = null;

    function __construct(){
        $this->model = new AlojamientoModel();
    }

    function getAlojamientos($req, $res) {
        //verifico si hay un campo de ordenamiento distinto
        if(isset($req->query->sort)) {
            $campo = $req->query->sort;
        } else {
            $campo = 'id_alojamiento';
        }

        if(isset($req->query->order)) {
            $orden = $req->query->order;
        } else {
            $orden = 'DESC';
        }

        //por defecto asumo que NO quieren paginado (valores nulos)
        $limit = null;
        $offset = null;

        //si user escribe ?page= en la URL activo las variables
        if(isset($req->query->page)) {
            $limit = 5;
            $page = $req->query->page;
            
            if($page < 1) {
                $page = 1;
            }
            $offset = ($page - 1) * $limit;
        }

        //verifico si me piden filtrado
        if(isset($req->query->tipo)) {
            $tipo = $req->query->tipo;
        } else {
            $tipo = null;
        }

        $respuesta = $this->model->getAll($campo, $orden, $limit, $offset, $tipo);
        return $res->json($respuesta, 200);
    }

    function getAlojamientoID($req, $res) {
        $alojamiento = $this->model->get($req->params->id);

        if ($alojamiento === false) {
            return $res->json("No existe ese alojamiento", 404);
        }
    
        return $res->json($alojamiento, 200);
    }

    function createAlojamiento($req, $res) {
        $body = $req->body;

        //valido que los campos esten llenos antes de insertarlos en la bbdd
        if(empty($body->id_ciudad) || empty($body->nombre) || empty($body->tipo) || empty($body->precio_noche) || !isset($body->disponible)){
            return $res->json("Faltan completar campos obligatorios de la tabla", 400);
        }

        $nombre = $body->nombre;
        $tipo = $body->tipo;
        $precio = $body->precio_noche;
        $id_ciudad = $body->id_ciudad;
        $disponible = $body->disponible;

        $newID = $this->model->insert($nombre, $tipo, $precio, $id_ciudad, $disponible);

        if ($newID === false) {
            return $res->json("No se pudo insertar el alojamiento en la base de datos", 500);
        }

        return $res->json("Creación completa con el id: " . $newID, 201);
    }

    function updateAlojamiento($req, $res) {
        $id = $req->params->id;
        $alojamiento = $this->model->get($id);
        
        if($alojamiento === false) {
            return $res->json("Este alojamiento no existe", 404);
        }

        $body = $req->body;

        //valido que los campos esten llenos antes de insertarlos en la bbdd
        if(empty($body->id_ciudad) || empty($body->nombre) || empty($body->tipo) || empty($body->precio_noche) || !isset($body->disponible)){
            return $res->json("Faltan completar campos obligatorios de la tabla", 400);
        }

        $nombre = $body->nombre;
        $tipo = $body->tipo;
        $precio = $body->precio_noche;
        $id_ciudad = $body->id_ciudad;
        $disponible = $body->disponible;

        $this->model->update($id, $nombre, $tipo, $precio, $id_ciudad, $disponible);
        return $res->json("Alojamiento ID " . $id . " actualizado con éxito", 200);
    }
}
?>