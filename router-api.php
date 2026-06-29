<?php
require_once 'router/router.php';
require_once 'app/api/ApiAlojamientoController.php';

$router = new Router();

$router->addRoute('alojamientos',      'GET',   'ApiAlojamientoController', 'getAlojamientos');
$router->addRoute('alojamientos/:id',  'GET',   'ApiAlojamientoController', 'getAlojamientoID');
$router->addRoute('alojamientos',      'POST',  'ApiAlojamientoController', 'createAlojamiento');
$router->addRoute('alojamientos/:id',  'PUT',   'ApiAlojamientoController', 'updateAlojamiento');

$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);
?>