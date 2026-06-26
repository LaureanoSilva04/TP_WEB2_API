<?php

require_once('config/config.php');

class Model {
    protected $db; 

    public function __construct() {
        $this->db = $this->crearConexion(); 
    }

    private function crearConexion() {
        global $configuracion;

        $user = $configuracion['usuario'];
        $password = $configuracion['password'];
        $database = $configuracion['basenombre'];
        $host = $configuracion['host'];

        try {
            $pdo = new PDO("mysql:host=$host;charset=utf8", $user, $password);
            $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

            $pdo->exec("CREATE DATABASE IF NOT EXISTS `$database` ");
            $pdo->exec("USE `$database` ");
            
            $tables = $pdo->query("SHOW TABLES LIKE 'pais' ")->fetchAll();
            
            if (count($tables) == 0) {
                $sql = file_get_contents('BBDD/turismo_db.sql');
                if ($sql !== false) {
                    $pdo->exec($sql);
                }
            }
            
            return $pdo;
            
        } catch (\Throwable $th) {
            die($th);
        }
    }
}