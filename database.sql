-- phpMyAdmin SQL Dump
-- version 4.6.1
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 15-05-2016 a las 16:01:14
-- Versión del servidor: 10.0.23-MariaDB
-- Versión de PHP: 5.6.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `automeet`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinos`
--

CREATE TABLE `destinos` (
  `id_destino` int(16) NOT NULL,
  `nombre_universidad` varchar(100) NOT NULL,
  `provincia` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `destinos`
--

INSERT INTO `destinos` (`id_destino`, `nombre_universidad`, `provincia`) VALUES
(1, 'Reina Mercedes', 0),
(2, 'Pabo de olavide', 0),
(3, 'Cartuja', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id_provincia` int(16) NOT NULL,
  `provincia` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id_provincia`, `provincia`) VALUES
(0, 'Sevilla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pueblos`
--

CREATE TABLE `pueblos` (
  `id_pueblo` int(16) NOT NULL,
  `nombre_pueblo` varchar(80) NOT NULL,
  `id_provincia` int(16) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pueblos`
--

INSERT INTO `pueblos` (`id_pueblo`, `nombre_pueblo`, `id_provincia`) VALUES
(3, 'ADRIANO', 0),
(4, 'AGUADULCE', 0),
(5, 'ALANIS', 0),
(6, 'ALBAIDA DEL ALJARAFE', 0),
(7, 'ALCALA DE GUADAIRA', 0),
(8, 'ALCALA DEL RIO', 0),
(9, 'ALCOLEA DEL RIO', 0),
(10, 'ALFONSO XIII', 0),
(11, 'ALGAMITAS', 0),
(12, 'ALMADEN DE LA PLATA', 0),
(13, 'ALMENSILLA', 0),
(14, 'ARAHAL', 0),
(15, 'ARCHIDONA', 0),
(16, 'ARROYO DE LA PLATA', 0),
(17, 'AZNALCAZAR', 0),
(18, 'AZNALCOLLAR', 0),
(19, 'BADOLATOSA', 0),
(20, 'BELLAVISTA', 0),
(21, 'BENACAZON', 0),
(22, 'BOLLULLOS DE LA MITACION', 0),
(23, 'BORMUJOS', 0),
(24, 'BRENES', 0),
(25, 'BUITRAGO', 0),
(26, 'BURGUILLOS', 0),
(27, 'CAMAS', 0),
(28, 'CAÑADA ROSAL', 0),
(29, 'CANTILLANA', 0),
(30, 'CARMONA', 0),
(31, 'CARRION DE LOS CESPEDES', 0),
(32, 'CASARICHE', 0),
(33, 'CASTILBLANCO DE LOS ARROYOS', 0),
(34, 'CASTILLEJA DE GUZMAN', 0),
(35, 'CASTILLEJA DE LA CUESTA', 0),
(36, 'CASTILLEJA DEL CAMPO', 0),
(37, 'CASTILLO DE LAS GUARDAS', 0),
(38, 'CAZALLA DE LA SIERRA', 0),
(39, 'CERRO DEL HIERRO', 0),
(40, 'CERRO PEREA', 0),
(41, 'CONSTANTINA', 0),
(42, 'CORCOYA', 0),
(43, 'CORIA DEL RIO', 0),
(44, 'CORIPE', 0),
(45, 'CORTIJO DE LAS FRANCAS', 0),
(46, 'CORTIJO LOS PAJAROS', 0),
(47, 'DON RODRIGO', 0),
(48, 'DOS HERMANAS', 0),
(49, 'ECIJA', 0),
(50, 'EL ALAMO', 0),
(51, 'EL CAMPILLO', 0),
(52, 'EL CAÑUELO', 0),
(53, 'EL CORONIL', 0),
(54, 'EL CUERVO', 0),
(55, 'EL GALEON', 0),
(56, 'EL GARROBO', 0),
(57, 'EL MADROÑO', 0),
(58, 'EL PEDROSILLO', 0),
(59, 'EL PEDROSO', 0),
(60, 'EL PERALEJO', 0),
(61, 'EL PINTADO', 0),
(62, 'EL PRIORATO', 0),
(63, 'EL REAL DE LA JARA', 0),
(64, 'EL RONQUILLO', 0),
(65, 'EL RUBIO', 0),
(66, 'EL SAUCEJO', 0),
(67, 'EL TORBISCAL', 0),
(68, 'EL TROBAL', 0),
(69, 'EL VIAR', 0),
(70, 'EL VISO DEL ALCOR', 0),
(71, 'ESCOBAR', 0),
(72, 'ESPARTINAS', 0),
(73, 'ESQUIVEL', 0),
(74, 'ESTEPA', 0),
(75, 'FABRICA DEL PEDROSO', 0),
(76, 'FUENTES DE ANDALUCIA', 0),
(77, 'GELVES', 0),
(78, 'GERENA', 0),
(79, 'GILENA', 0),
(80, 'GINES', 0),
(81, 'GUADAJOZ', 0),
(82, 'GUADALCANAL', 0),
(83, 'GUADALEMA DE LOS QUINTEROS', 0),
(84, 'GUILLENA', 0),
(85, 'HERRERA', 0),
(86, 'HUEVAR', 0),
(87, 'ISLA REDONDA', 0),
(88, 'JUAN ANTON', 0),
(89, 'JUAN GALLEGO', 0),
(90, 'LA ALCORNOCOSA', 0),
(91, 'LA ALGABA', 0),
(92, 'LA AULAGA', 0),
(93, 'LA CAMPANA', 0),
(94, 'LA CORCHUELA', 0),
(95, 'LA GANCHOSA', 0),
(96, 'LA LANTEJUELA', 0),
(97, 'LA LUISIANA', 0),
(98, 'LA MEZQUITILLA', 0),
(99, 'LA PUEBLA DE CAZALLA', 0),
(100, 'LA PUEBLA DE LOS INFANTES', 0),
(101, 'LA PUEBLA DEL RIO', 0),
(102, 'LA RINCONADA', 0),
(103, 'LA RODA DE ANDALUCIA', 0),
(104, 'LA SALADA', 0),
(105, 'LAS CABEZAS DE SAN JUAN', 0),
(106, 'LAS CORTECILLAS', 0),
(107, 'LAS MONJAS', 0),
(108, 'LAS NAVAS DE LA CONCEPCION', 0),
(109, 'LAS PAJANOSAS', 0),
(110, 'LEBRIJA', 0),
(111, 'LORA DE ESTEPA', 0),
(112, 'LORA DEL RIO', 0),
(113, 'LOS CHAPATALES', 0),
(114, 'LOS CORRALES', 0),
(115, 'LOS MOLARES', 0),
(116, 'LOS PALACIOS Y VILLAFRANCA', 0),
(117, 'LOS PERENOS', 0),
(118, 'LOS PEREZ', 0),
(119, 'LOS ROSALES', 0),
(120, 'MAIRENA DEL ALCOR', 0),
(121, 'MAIRENA DEL ALJARAFE', 0),
(122, 'MARCHENA', 0),
(123, 'MARIBAÑEZ', 0),
(124, 'MARINALEDA', 0),
(125, 'MARISMILLA', 0),
(126, 'MARTIN DE LA JARA', 0),
(127, 'MATARREDONDA', 0),
(128, 'MINAS DE EL CASTILLO DE LAS GU', 0),
(129, 'MONTELLANO', 0),
(130, 'MONTEQUINTO', 0),
(131, 'MORON DE LA FRONTERA', 0),
(132, 'NAVARREDONDA', 0),
(133, 'OLIVARES', 0),
(134, 'OSUNA', 0),
(135, 'PALMAR DE TROYA', 0),
(136, 'PALOMARES DEL RIO', 0),
(137, 'PARADAS', 0),
(138, 'PEDRERA', 0),
(139, 'PEÑAFLOR', 0),
(140, 'PEROAMIGO', 0),
(141, 'PILAS', 0),
(142, 'PINZON', 0),
(143, 'PRUNA', 0),
(144, 'PUERTO DE LA ENCINA', 0),
(145, 'QUEIPO DE LLANO', 0),
(146, 'RANCHO DE TERRONES', 0),
(147, 'RIGUELO', 0),
(148, 'SACRAMENTO', 0),
(149, 'SALTERAS', 0),
(150, 'SAN IGNACIO DEL VIAR', 0),
(151, 'SAN JOSE DE LA RINCONADA', 0),
(152, 'SAN JUAN DE AZNALFARACHE', 0),
(153, 'SAN LEANDRO', 0),
(154, 'SAN NICOLAS DEL PUERTO', 0),
(155, 'SANLUCAR LA MAYOR', 0),
(156, 'SANTIPONCE', 0),
(157, 'SETEFILLA', 0),
(158, 'SEVILLA', 0),
(159, 'TOCINA', 0),
(160, 'TOMARES', 0),
(161, 'TORRE DE LA REINA', 0),
(162, 'TORREBLANCA DE LOS CAÑOS', 0),
(163, 'TRAJANO', 0),
(164, 'UMBRETE', 0),
(165, 'UTRERA', 0),
(166, 'VALDEFLORES', 0),
(167, 'VALENCINA DE LA CONCEPCION', 0),
(168, 'VEGAS DE ALMENARA', 0),
(169, 'VENTA NUEVA', 0),
(170, 'VETAHERRADO', 0),
(171, 'VILAFRANCO DEL GUADALQUIVIR', 0),
(172, 'VILLAGORDO', 0),
(173, 'VILLAMANRRIQUE DE LA CONDESA', 0),
(174, 'VILLANUEVA DE SAN JUAN', 0),
(175, 'VILLANUEVA DEL ARISCAL', 0),
(176, 'VILLANUEVA DEL REY', 0),
(177, 'VILLANUEVA DEL RIO', 0),
(178, 'VILLANUEVA DEL RIO Y MINAS', 0),
(179, 'VILLAVERDE DEL RIO', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(16) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `telefono` int(16) NOT NULL,
  `pueblo_origen` int(16) NOT NULL,
  `pass` varchar(512) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `token` varchar(512) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellidos`, `telefono`, `pueblo_origen`, `pass`, `correo`, `token`) VALUES
(1, 'pepe', 'polla', 666555444, 5, 'INACCESIBLE', 'pepepolla@correo.com', 'tokendepepepolla');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

CREATE TABLE `viajes` (
  `id_viaje` int(16) NOT NULL,
  `salida` datetime NOT NULL,
  `llegada` datetime NOT NULL,
  `detalles` varchar(250) NOT NULL,
  `id_usuario` int(16) NOT NULL,
  `plazas` int(16) NOT NULL,
  `precio` decimal(10,0) NOT NULL,
  `destino` int(16) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `viajes`
--

INSERT INTO `viajes` (`id_viaje`, `salida`, `llegada`, `detalles`, `id_usuario`, `plazas`, `precio`, `destino`) VALUES
(1, '2016-01-01 08:30:00', '2016-01-01 09:00:00', 'Escucho radiohead y fumo marijuana', 1, 4, '3', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id_destino`),
  ADD KEY `id_destino` (`id_destino`),
  ADD KEY `provincia` (`provincia`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id_provincia`),
  ADD KEY `id_provincia` (`id_provincia`);

--
-- Indices de la tabla `pueblos`
--
ALTER TABLE `pueblos`
  ADD PRIMARY KEY (`id_pueblo`),
  ADD KEY `id_pueblo` (`id_pueblo`),
  ADD KEY `id_provincia` (`id_provincia`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `correo` (`correo`),
  ADD KEY `pueblo_origen` (`pueblo_origen`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `correo_2` (`correo`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD PRIMARY KEY (`id_viaje`),
  ADD KEY `id_viaje` (`id_viaje`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `destino` (`destino`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id_destino` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id_provincia` int(16) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `pueblos`
--
ALTER TABLE `pueblos`
  MODIFY `id_pueblo` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=180;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `viajes`
--
ALTER TABLE `viajes`
  MODIFY `id_viaje` int(16) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD CONSTRAINT `destinos_ibfk_1` FOREIGN KEY (`provincia`) REFERENCES `provincias` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pueblos`
--
ALTER TABLE `pueblos`
  ADD CONSTRAINT `pueblo_en_provincia` FOREIGN KEY (`id_provincia`) REFERENCES `provincias` (`id_provincia`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`pueblo_origen`) REFERENCES `pueblos` (`id_pueblo`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD CONSTRAINT `viajes_ibfk_1` FOREIGN KEY (`destino`) REFERENCES `destinos` (`id_destino`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `viajes_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
