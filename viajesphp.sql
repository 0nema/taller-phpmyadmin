-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-04-2022 a las 19:05:00
-- Versión del servidor: 8.0.28
-- Versión de PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `viajesphp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `avion`
--

CREATE TABLE `avion` (
  `idAvion` int NOT NULL,
  `nombreAerolinea` varchar(45) COLLATE utf32_spanish2_ci NOT NULL,
  `idViajeFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `avion`
--

INSERT INTO `avion` (`idAvion`, `nombreAerolinea`, `idViajeFK`) VALUES
(1, 'IBERIA', 2),
(2, 'VUELING', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `oficina`
--

CREATE TABLE `oficina` (
  `idOficina` int NOT NULL,
  `direccionOficina` varchar(100) COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `oficina`
--

INSERT INTO `oficina` (`idOficina`, `direccionOficina`) VALUES
(1, 'Avenida Pintor Joaquín Sorolla, 288'),
(2, 'Calle Encarnación Fontiveros, 7');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tren`
--

CREATE TABLE `tren` (
  `idTren` int NOT NULL,
  `nombreFerroviaria` varchar(45) COLLATE utf32_spanish2_ci NOT NULL,
  `idViajeFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `tren`
--

INSERT INTO `tren` (`idTren`, `nombreFerroviaria`, `idViajeFK`) VALUES
(1, 'RENFE', 1),
(2, 'OUIGO', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viaje`
--

CREATE TABLE `viaje` (
  `idViaje` int NOT NULL,
  `origenViaje` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `destinoViaje` varchar(30) COLLATE utf32_spanish2_ci NOT NULL,
  `duracionViaje` time NOT NULL,
  `precioViaje` decimal(6,2) NOT NULL,
  `fechaHorarioViaje` datetime NOT NULL,
  `idOficinaFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `viaje`
--

INSERT INTO `viaje` (`idViaje`, `origenViaje`, `destinoViaje`, `duracionViaje`, `precioViaje`, `fechaHorarioViaje`, `idOficinaFK`) VALUES
(1, 'Málaga', 'Madrid', '03:00:00', '40.50', '2022-04-25 10:30:00', 1),
(2, 'Málaga', 'Barcelona', '01:37:00', '100.75', '2022-04-28 10:00:00', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajero`
--

CREATE TABLE `viajero` (
  `dniViajero` varchar(9) COLLATE utf32_spanish2_ci NOT NULL,
  `nombreViajero` varchar(100) COLLATE utf32_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `viajero`
--

INSERT INTO `viajero` (`dniViajero`, `nombreViajero`) VALUES
('74888499Z', 'Juan Manuel Campos'),
('87445469A', 'Lucía Guzmán Bueno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajeviajero`
--

CREATE TABLE `viajeviajero` (
  `idCompra` int NOT NULL,
  `idViajeFK` int NOT NULL,
  `dniViajeroFK` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish2_ci;

--
-- Volcado de datos para la tabla `viajeviajero`
--

INSERT INTO `viajeviajero` (`idCompra`, `idViajeFK`, `dniViajeroFK`) VALUES
(1, 1, 74888499),
(2, 2, 87445469);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `avion`
--
ALTER TABLE `avion`
  ADD PRIMARY KEY (`idAvion`),
  ADD KEY `idViajeFK` (`idViajeFK`);

--
-- Indices de la tabla `oficina`
--
ALTER TABLE `oficina`
  ADD PRIMARY KEY (`idOficina`);

--
-- Indices de la tabla `tren`
--
ALTER TABLE `tren`
  ADD PRIMARY KEY (`idTren`),
  ADD KEY `idViajeFK` (`idViajeFK`);

--
-- Indices de la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD PRIMARY KEY (`idViaje`),
  ADD KEY `idOficinaFK` (`idOficinaFK`);

--
-- Indices de la tabla `viajero`
--
ALTER TABLE `viajero`
  ADD PRIMARY KEY (`dniViajero`);

--
-- Indices de la tabla `viajeviajero`
--
ALTER TABLE `viajeviajero`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `idViajeFK` (`idViajeFK`) USING BTREE,
  ADD KEY `dniViajeroFK` (`dniViajeroFK`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `avion`
--
ALTER TABLE `avion`
  MODIFY `idAvion` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `oficina`
--
ALTER TABLE `oficina`
  MODIFY `idOficina` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tren`
--
ALTER TABLE `tren`
  MODIFY `idTren` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `viaje`
--
ALTER TABLE `viaje`
  MODIFY `idViaje` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `viajeviajero`
--
ALTER TABLE `viajeviajero`
  MODIFY `idCompra` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `avion`
--
ALTER TABLE `avion`
  ADD CONSTRAINT `avion_ibfk_1` FOREIGN KEY (`idViajeFK`) REFERENCES `viaje` (`idViaje`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `tren`
--
ALTER TABLE `tren`
  ADD CONSTRAINT `tren_ibfk_1` FOREIGN KEY (`idViajeFK`) REFERENCES `viaje` (`idViaje`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `viaje`
--
ALTER TABLE `viaje`
  ADD CONSTRAINT `viaje_ibfk_1` FOREIGN KEY (`idOficinaFK`) REFERENCES `oficina` (`idOficina`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `viajeviajero`
--
ALTER TABLE `viajeviajero`
  ADD CONSTRAINT `viajeviajero_ibfk_1` FOREIGN KEY (`idViajeFK`) REFERENCES `viaje` (`idViaje`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
