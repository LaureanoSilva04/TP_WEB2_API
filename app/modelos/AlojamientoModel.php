<?php
require_once('app/modelos/Model.php');

class AlojamientoModel extends Model{

    function getAll($campo, $orden, $limit, $offset, $tipo) {
        //verifico los campos validos
        $camposValidos = ['id_alojamiento', 'id_ciudad', 'nombre', 'tipo', 'precio_noche', 'disponible'];

        if (!in_array($campo, $camposValidos)) {
            $campo = 'id_alojamiento';
        }

        if(strtoupper($orden) === 'ASC') {
            $orden = 'ASC';
        } else {
            $orden = 'DESC';
        }

        //armo la estructura de la consulta, pasoa a paso, según lo que me pidieron
        $sql = "select * from alojamiento";
        $to_execute = [];

        if($tipo !== null) {
            $sql = $sql . " where tipo = ?";
            $to_execute[] = $tipo;
        }

        $sql = $sql . " order by $campo $orden";

        if($limit !== null && $offset !== null) {
            $sql = $sql . " limit " . $limit . " offset "  $offset;
        }

        $query = $this->db->prepare($sql);
        $query->execute($to_execute);
        $alojamiento = $query->fetchAll(PDO::FETCH_OBJ)
        return $alojamiento;
    }

    function get($id) {
        $query = $this->db->prepare("select *
                                    from alojamiento
                                    where id_alojamiento = ?");
        $query->execute([$id]);
        $alojamiento = $query->fetch(PDO::FETCH_OBJ)
        return $alojamiento;
    }

    function insert($nombre, $tipo, $precio_noche, $id_ciudad, $disponible) {
        try {
            $query = $this->db->prepare("insert into alojamiento (id_ciudad, nombre, tipo, precio_noche, disponible)
                                        values (?, ?, ?, ?, ?");
            $query->execute([$id_ciudad, $nombre, $tipo, $precio_noche, $disponible]);

            $ultimoID = $this->db->lastInsertId();
            return $ultimoID;
        } catch (\Throwable $th) {
            return false;
        }
    }

    function update($id, $nombre, $tipo, $precio, $id_ciudad, $disponible) {
        try {
            $query = $this->db->prepare("update alojamiento set 
                                        nombre = ?, 
                                        tipo = ?, 
                                        precio_noche = ?, 
                                        id_ciudad = ?, 
                                        disponible = ? 
                                        where id_alojamiento = ?");
            $query->execute([$nombre, $tipo, $precio, $id_ciudad, $disponible, $id]);
            return true;
        } catch (\Throwable $th) {
            return false;
        }
    }
}
?>