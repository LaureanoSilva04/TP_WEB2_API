-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 14, 2026 at 06:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `turismo_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `alojamiento`
--

CREATE TABLE `alojamiento` (
  `id_alojamiento` int(11) NOT NULL,
  `id_ciudad` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `precio_noche` decimal(10,2) NOT NULL,
  `disponible` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ciudad`
--

CREATE TABLE `ciudad` (
  `id_ciudad` int(11) NOT NULL,
  `id_pais` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `es_capital` tinyint(1) NOT NULL,
  `sitios_turisticos` int(11) NOT NULL,
  `toman_mate` tinyint(1) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ciudad`
--

INSERT INTO `ciudad` (`id_ciudad`, `id_pais`, `nombre`, `es_capital`, `sitios_turisticos`, `toman_mate`, `descripcion`) VALUES
(1, 100, 'Tokio', 1, 150, 0, 'Metrópolis vibrante donde la tecnología de punta se cruza con callejones tradicionales. El distrito de Akihabara es ideal para los coleccionistas de cultura pop y tecnología.'),
(2, 100, 'Kioto', 0, 120, 0, 'Antigua capital imperial, famosa por sus clásicos templos budistas, sus santuarios sintoístas, sus casas de madera tradicionales y el famoso bosque de bambú de Arashiyama.'),
(3, 100, 'Osaka', 0, 85, 0, 'Conocida como la cocina de la nación, es una ciudad dinámica famosa por su moderna arquitectura, su vida nocturna y su excepcional comida callejera en la zona de Dotonbori.'),
(4, 100, 'Sapporo', 0, 40, 0, 'Capital de la montañosa isla de Hokkaido, célebre por su cerveza, el esquí y el enorme festival anual de la nieve que atrae a turistas de todo el mundo con sus esculturas de hielo.'),
(5, 100, 'Yokohama', 0, 60, 0, 'Importante centro comercial y la segunda ciudad más grande del país. Destaca por su enorme barrio chino, su hermoso puerto y sus modernos rascacielos costeros.'),
(6, 101, 'Roma', 1, 200, 0, 'La Ciudad Eterna. Un extenso museo al aire libre que alberga ruinas icónicas como el Coliseo y el Foro Romano, además de rodear a la Ciudad del Vaticano.'),
(7, 101, 'Venecia', 0, 110, 0, 'Construida sobre más de 100 pequeñas islas en una laguna del mar Adriático. No tiene caminos, sino canales bordeados de palacios renacentistas y góticos.'),
(8, 101, 'Florencia', 0, 140, 0, 'Cuna del Renacimiento, alberga muchas de las obras maestras del arte y la arquitectura de esa época, como el Duomo y la Galería Uffizi.'),
(9, 101, 'Milán', 0, 90, 0, 'Metrópolis global del norte de Italia, mundialmente famosa por ser la capital de la moda y el diseño, además de ser un importante centro financiero.'),
(10, 101, 'Nápoles', 0, 75, 0, 'Ubicada en el sur frente al volcán Monte Vesubio. Es una ciudad llena de historia antigua, arte, y la cuna indiscutible de la pizza auténtica.'),
(11, 102, 'Brasilia', 1, 45, 0, 'Una ciudad planificada y construida en el siglo XX, famosa por su arquitectura moderna y distintiva, diseñada en gran parte por Oscar Niemeyer.'),
(12, 102, 'Río de Janeiro', 0, 160, 1, 'Famosa por sus impresionantes playas como Copacabana e Ipanema, la icónica estatua del Cristo Redentor y su inmenso festival de Carnaval.'),
(13, 102, 'São Paulo', 0, 130, 0, 'El centro financiero de Brasil y una de las ciudades más pobladas del mundo. Se destaca por su arquitectura, gastronomía diversa y robusta escena cultural.'),
(14, 102, 'Salvador de Bahía', 0, 85, 0, 'Conocida por su arquitectura colonial portuguesa, su cultura afrobrasileña y su costa tropical. Es considerada el corazón musical del país.'),
(15, 102, 'Florianópolis', 0, 60, 1, 'Capital del estado de Santa Catarina, muy popular entre turistas (especialmente sudamericanos) por sus más de 40 playas y excelente infraestructura para el surf.'),
(16, 103, 'Canberra', 1, 35, 0, 'La capital planificada del país, situada en el interior. Está repleta de monumentos nacionales, museos y amplias zonas verdes y parques naturales.'),
(17, 103, 'Sídney', 0, 145, 0, 'La ciudad más grande, conocida mundialmente por su icónica Casa de la Ópera, el majestuoso puente del puerto y playas excepcionales para surfear como Bondi Beach.'),
(18, 103, 'Melbourne', 0, 120, 0, 'Considerada la capital cultural de Australia. Es famosa por su arte urbano, sus estrechos callejones llenos de cafeterías de especialidad y su pasión por el deporte.'),
(19, 103, 'Brisbane', 0, 70, 0, 'Ciudad cálida y vibrante en la costa este, centrada alrededor del sinuoso río Brisbane. Es una puerta de entrada a la famosa Gold Coast.'),
(20, 103, 'Perth', 0, 55, 0, 'Ubicada en la costa oeste, es una de las ciudades más aisladas del mundo, pero cuenta con hermosos parques naturales, playas soleadas y un ambiente muy relajado.'),
(21, 104, 'Ottawa', 1, 65, 0, 'Capital bilingüe de la nación, famosa por el complejo arquitectónico victoriano del Parliament Hill y el Canal Rideau, que en invierno se convierte en pista de hielo.'),
(22, 104, 'Toronto', 0, 135, 0, 'Una metrópolis inmensa y diversa. Es el principal centro financiero del país y hogar de la icónica CN Tower, dominando el horizonte junto al lago Ontario.'),
(23, 104, 'Vancouver', 0, 110, 0, 'Ubicada en la costa oeste de la Columbia Británica, está rodeada de imponentes montañas y el océano, lo que la hace perfecta para actividades al aire libre y deportes de invierno.'),
(24, 104, 'Montreal', 0, 95, 0, 'La ciudad francófona más grande del país. Su encanto reside en la mezcla de su distrito histórico de estilo europeo con modernos centros artísticos subterráneos.'),
(25, 104, 'Quebec', 0, 80, 0, 'Ciudad amurallada con calles adoquinadas que ofrece una profunda atmósfera europea. El imponente castillo y hotel Château Frontenac es su principal símbolo.');

-- --------------------------------------------------------

--
-- Table structure for table `pais`
--

CREATE TABLE `pais` (
  `id_pais` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `continente` varchar(100) NOT NULL,
  `es_futbolero` tinyint(1) NOT NULL,
  `puntaje_turistico` int(11) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pais`
--

INSERT INTO `pais` (`id_pais`, `nombre`, `continente`, `es_futbolero`, `puntaje_turistico`, `descripcion`) VALUES
(100, 'Japón', 'Asia', 1, 98, 'País insular en el este de Asia, famoso por su rica tradición histórica, sus templos milenarios, su avanzada tecnología y por ser el epicentro mundial del manga y el anime. Una mezcla perfecta entre lo tradicional y lo hipermoderno.'),
(101, 'Italia', 'Europa', 1, 95, 'Ubicada en el corazón del mar Mediterráneo, es mundialmente reconocida por su inmenso legado histórico, su arquitectura renacentista y romano-antigua, y su inigualable gastronomía clásica.'),
(102, 'Brasil', 'América', 1, 92, 'El país más grande de América del Sur, famoso mundialmente por su vibrante cultura, el carnaval, sus extensas costas de playas paradisíacas y por albergar la inmensa selva amazónica.'),
(103, 'Australia', 'Oceanía', 0, 88, 'País soberano que comprende la masa principal del continente oceánico. Es mundialmente conocido por su fauna endémica única, la Gran Barrera de Coral y sus extensos desiertos.'),
(104, 'Canadá', 'América', 0, 90, 'Extenso país norteamericano destacado por su altísima calidad de vida y sus impresionantes paisajes naturales, que incluyen inmensos lagos, montañas rocosas y vastos bosques boreales.');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id_user` int(11) NOT NULL,
  `user` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id_user`, `user`, `password`) VALUES
(1, 'webadmin', '$2a$12$KxHaj0ew1rmt/9q.n7gSMufIWiZoH843wCsfkgs9Dybqwtv0eRxyi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `alojamiento`
--
ALTER TABLE `alojamiento`
  ADD PRIMARY KEY (`id_alojamiento`),
  ADD KEY `fk_ciudad_alojamiento` (`id_ciudad`);

--
-- Indexes for table `ciudad`
--
ALTER TABLE `ciudad`
  ADD PRIMARY KEY (`id_ciudad`),
  ADD KEY `fk_id_pais` (`id_pais`);

--
-- Indexes for table `pais`
--
ALTER TABLE `pais`
  ADD PRIMARY KEY (`id_pais`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alojamiento`
--
ALTER TABLE `alojamiento`
  MODIFY `id_alojamiento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ciudad`
--
ALTER TABLE `ciudad`
  MODIFY `id_ciudad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `pais`
--
ALTER TABLE `pais`
  MODIFY `id_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=105;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alojamiento`
--
ALTER TABLE `alojamiento`
  ADD CONSTRAINT `fk_ciudad_alojamiento` FOREIGN KEY (`id_ciudad`) REFERENCES `ciudad` (`id_ciudad`) ON DELETE CASCADE;

--
-- Constraints for table `ciudad`
--
ALTER TABLE `ciudad`
  ADD CONSTRAINT `fk_ciudad_pais` FOREIGN KEY (`id_pais`) REFERENCES `pais` (`id_pais`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
