-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-05-2022 a las 07:03:37
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ingresos_egresos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuenta`
--

CREATE TABLE `cuenta` (
  `id_cuenta` int(11) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `banco` varchar(60) NOT NULL,
  `nombre_cuenta` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cuenta`
--

INSERT INTO `cuenta` (`id_cuenta`, `tipo`, `banco`, `nombre_cuenta`) VALUES
(1, 'Debito', 'Santander', 'Universidades'),
(2, 'Ahorro', 'GBM', 'GBM+'),
(3, 'Credito', 'Santander', 'Like U'),
(4, 'Credito', 'Santander', 'Free'),
(5, 'Credito', 'Banorte', 'Rappi'),
(6, 'Credito', 'Citibanamex', 'Costco');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gastos_pagos`
--

CREATE TABLE `gastos_pagos` (
  `id_gastos_pagos` int(11) NOT NULL,
  `cuenta` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `concepto` varchar(45) DEFAULT NULL,
  `subtipo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(99) DEFAULT NULL,
  `cantidad` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingreso_egreso`
--

CREATE TABLE `ingreso_egreso` (
  `id` int(11) NOT NULL,
  `Cuenta_id_cuenta` int(11) NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `fecha` date NOT NULL,
  `concepto` varchar(45) NOT NULL,
  `subtipo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(99) DEFAULT NULL,
  `cantidad` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ingreso_egreso`
--

INSERT INTO `ingreso_egreso` (`id`, `Cuenta_id_cuenta`, `tipo`, `fecha`, `concepto`, `subtipo`, `descripcion`, `cantidad`) VALUES
(1, 1, 'Ingreso', '2022-01-31', 'Otros', 'Otros', 'Balance del mes enero', 2076.86),
(2, 1, 'Ingreso', '2022-02-01', 'Otros', 'Deposito', 'DEPOSITO EN EFECTIVO ATM', 1000),
(3, 1, 'Egreso', '2022-02-01', 'Pago Tarjeta', 'Santander Free', 'CARGO PAGO TARJETA CREDITO', -2000),
(4, 1, 'Egreso', '2022-02-03', 'Pago Tarjeta', 'Pago Tarjeta', 'CARGO PAGO TARJETA CREDITO', -190),
(5, 1, 'Ingreso', '2022-02-04', 'Nomina', 'Teleperformance', 'NOMINA', 4009.52),
(6, 1, 'Egreso', '2022-02-04', 'Comida', 'Dulce Espuma', 'CLIP MX*DULCE E MORELIA 0000000', -40.8),
(7, 1, 'Egreso', '2022-02-04', 'Pago Tarjeta', 'Rappi', 'PAGO ABONO A RA CMX 2699570', -623.91),
(8, 1, 'Egreso', '2022-02-04', 'Pago Tarjeta', 'Santander Free', 'CARGO PAGO TARJETA CREDITO', -2000),
(9, 1, 'Egreso', '2022-02-07', 'Ahorro', 'GBM', 'DEPOSITO', -1500),
(10, 1, 'Ingreso', '2022-02-08', 'Otros', 'Comision', 'VERIF CUENTAS AUTO', 0.01),
(11, 1, 'Ingreso', '2022-02-08', 'Servicios', 'Youtube', 'YOUTUBE LUIS ALBERTO MATEO', 700),
(12, 1, 'Ingreso', '2022-02-08', 'Otros', 'Pago de Internet', 'PAL INTERNET', 2500),
(13, 1, 'Egreso', '2022-02-08', 'Comida', 'Amor Eterno', 'CAFE AMOR ENTER MORELIA MICH 0000000', -96),
(14, 1, 'Egreso', '2022-02-08', 'Transporte', 'Gasolina', 'MULTISERV LA ES MORELIA MICH 0000000', -100),
(15, 1, 'Egreso', '2022-02-08', 'Servicios', 'Megacable', 'MEGACABLE SETIT GUADALAJARA J 0000000', -789),
(16, 1, 'Egreso', '2022-02-08', 'Servicios', 'Megacable', 'MEGACABLE SETIT GUADALAJARA J 0000000', -909),
(17, 1, 'Ingreso', '2022-02-09', 'Servicios', 'Youtube', 'YOUTUBE JAVIER MATEO', 100),
(18, 1, 'Egreso', '2022-02-09', 'Pago Tarjeta', 'Pago Tarjeta', 'CARGO PAGO TARJETA CREDITO', -400),
(19, 1, 'Egreso', '2022-02-11', 'Transporte', 'Uber', 'ST*UBER CIUDAD DE MEX 0000000', -56.92),
(20, 1, 'Egreso', '2022-02-12', 'Transporte', 'Uber', 'ST*UBER CIUDAD DE MEX 0000000', -79.96),
(21, 1, 'Egreso', '2022-02-14', 'Servicios', 'Youtube', 'GOOGLE *YouTube g co helppay 1888260', -179),
(22, 1, 'Ingreso', '2022-02-17', 'Servicios', 'Youtube', 'YOUTUBE MILTON', 200),
(23, 1, 'Ingreso', '2022-02-17', 'Servicios', 'Youtube', 'YOUTUBE MILTON', 500),
(24, 1, 'Ingreso', '2022-02-18', 'Nomina', 'Teleperformance', 'CATORCENA', 3133.44),
(25, 1, 'Egreso', '2022-02-18', 'Pago Tarjeta', 'Santander Free', 'CARGO PAGO TARJETA CREDITO', -1000),
(26, 1, 'Egreso', '2022-02-19', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -1463.73),
(27, 1, 'Egreso', '2022-02-19', 'Ahorro', 'GBM', 'TRANSFERENCIA INTERBANCARIA', -1800),
(28, 1, 'Ingreso', '2022-02-22', 'Servicios', 'Youtube', 'YOUTUBE CARLOS', 170),
(29, 1, 'Ingreso', '2022-02-23', 'Servicios', 'Youtube', 'YOUTUBE ISAI', 50),
(30, 1, 'Ingreso', '2022-02-23', 'Servicios', 'GGSYC', 'DEPOSITO EN EFECTIVO ATM', 640),
(31, 1, 'Ingreso', '2022-02-24', 'Otros', 'Comision', '2700 EGRESOS SPEI SVD', 0.01),
(32, 1, 'Egreso', '2022-02-24', 'Servicios', 'Paramount', 'AMAZON MX MEXICO DF 0000000', -79),
(33, 1, 'Egreso', '2022-02-24', 'Ocio', 'Cafe t2', 'consumo', -290),
(34, 1, 'Egreso', '2022-02-26', 'Transporte', 'Uber', 'ST*UBER CIUDAD DE MEX 0000000', -34.84),
(35, 1, 'Egreso', '2022-02-27', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -1426.89),
(36, 1, 'Egreso', '2022-02-28', 'Otros', '--', '44614', -2.87),
(37, 1, 'Egreso', '2022-02-28', 'Otros', '--', '44614', -17.92),
(38, 1, 'Ingreso', '2022-03-01', 'Otros', 'Devolucion', 'ST*UBER 0000000', 24.84),
(39, 1, 'Egreso', '2022-03-01', 'Otros', '--', '44593', -3.43),
(40, 1, 'Egreso', '2022-03-01', 'Otros', '--', '44593', -21.41),
(41, 1, 'Ingreso', '2022-03-03', 'Servicios', 'Youtube', 'YOUTUBE CARLO SAN JUAN', 200),
(42, 1, 'Egreso', '2022-03-03', 'Otros', '--', '44593', -16.1),
(43, 1, 'Egreso', '2022-03-03', 'Otros', '--', '44593', -100.67),
(44, 1, 'Ingreso', '2022-03-04', 'Otros', '--', 'COMISION FEBRERO', 2.87),
(45, 1, 'Ingreso', '2022-03-04', 'Otros', '--', 'COMISION FEBRERO', 3.43),
(46, 1, 'Ingreso', '2022-03-04', 'Otros', '--', 'COMISION FEBRERO', 16.1),
(47, 1, 'Ingreso', '2022-03-04', 'Otros', '--', 'COMISION FEBRERO', 17.92),
(48, 1, 'Ingreso', '2022-03-04', 'Otros', '--', 'COMISION FEBRERO', 21.41),
(49, 1, 'Ingreso', '2022-03-04', 'Otros', '--', 'COMISION FEBRERO', 100.67),
(50, 1, 'Ingreso', '2022-03-04', 'Nomina', 'Teleperformance', 'CATORCENA', 2428.64),
(51, 1, 'Egreso', '2022-03-04', 'Pago Tarjeta', 'Santander Free', 'CARGO PAGO TARJETA CREDITO', -45),
(52, 1, 'Egreso', '2022-03-04', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -499.44),
(53, 1, 'Egreso', '2022-03-04', 'Pago Tarjeta', 'Santander Free', 'CARGO PAGO TARJETA CREDITO', -1549.59),
(54, 1, 'Egreso', '2022-03-05', 'Ocio', 'Bar', 'POR SE MI AMIGA', -300),
(55, 1, 'Ingreso', '2022-03-09', 'Otros', 'Pago Universidad', 'DEPOSITO EN EFECTIVO', 3100),
(56, 1, 'Egreso', '2022-03-10', 'Retiro', 'OXXO', 'OXXO C U MOR MORELIA MICH 0000000', -217),
(57, 1, 'Egreso', '2022-03-11', 'Pago Tarjeta', 'Rappi', 'PAGO ABONO A RA CMX 2699570', -585.81),
(58, 1, 'Ingreso', '2022-03-14', 'Otros', 'Deposito', 'DEPOSITO EN EFECTIVO ATM', 600),
(59, 1, 'Egreso', '2022-03-14', 'Servicios', 'Youtube', 'GOOGLE *YouTube g co helppay 1888260', -239),
(60, 1, 'Egreso', '2022-03-15', 'Comida', 'Cafe Galafre', 'CAFE GALAFRE MORELIA MICH 0000000', -258),
(61, 1, 'Egreso', '2022-03-15', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -1484),
(62, 1, 'Ingreso', '2022-03-16', 'Servicios', 'Youtube', 'YOUTUBE PACO', 65),
(63, 1, 'Egreso', '2022-03-17', 'Ocio', 'Cafe t2', 'consumo', -110),
(64, 1, 'Egreso', '2022-03-17', 'Ocio', 'Cafe t2', 'consumo', -120),
(65, 1, 'Ingreso', '2022-03-18', 'Nomina', 'Teleperformance', 'NOMINA', 3882.55),
(66, 1, 'Ingreso', '2022-03-19', 'Servicios', 'Tutorias', 'E', 350),
(67, 1, 'Ingreso', '2022-03-20', 'Servicios', 'Youtube', 'YOUTUBE NAVIDAD Y JESUS', 100),
(68, 1, 'Ingreso', '2022-03-21', 'Otros', 'Deposito', 'DEPOSITO EN EFECTIVO ATM', 570),
(69, 1, 'Egreso', '2022-03-21', 'Pago Tarjeta', 'Santander Free', 'CARGO PAGO TARJETA CREDITO', -1000),
(70, 1, 'Egreso', '2022-03-21', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -1141),
(71, 1, 'Egreso', '2022-03-22', 'Ahorro', 'GBM', 'TRANSFERENCIA', -3492.98),
(72, 1, 'Egreso', '2022-03-23', 'Ocio', 'Boletos', 'Boletos Aquelarre', -200),
(73, 1, 'Egreso', '2022-03-24', 'Servicios', 'Paramount', 'AMAZON MX MEXICO DF 0000000', -79),
(74, 1, 'Ingreso', '2022-03-31', 'Servicios', 'GGSYC', 'Gibran Gonzalez', 161.18),
(75, 1, 'Ingreso', '2022-04-01', 'Servicios', 'GGSyC Diseño', 'PAGO MARZO', 700),
(76, 1, 'Ingreso', '2022-04-01', 'Otros', 'Deposito', 'DEPOSITO EN EFECTIVO ATM', 1500),
(77, 1, 'Ingreso', '2022-04-01', 'Nomina', 'Teleperformance', 'CATORCENA', 5951.03),
(78, 1, 'Ingreso', '2022-04-03', 'Otros', 'Lentes', 'DEPOSITO EN EFECTIVO ATM', 4820),
(79, 1, 'Ingreso', '2022-04-04', 'Otros', 'Deposito', 'DEPOSITO EN EFECTIVO ATM', 800),
(80, 1, 'Egreso', '2022-04-04', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -3339.72),
(81, 1, 'Egreso', '2022-04-05', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -200.83),
(82, 1, 'Egreso', '2022-04-05', 'Ocio', 'Palacio del Arte', 'TICKET', -500),
(83, 1, 'Egreso', '2022-04-05', 'Pago Tarjeta', 'Santander Free', 'CARGO PAGO TARJETA CREDITO', -1000),
(84, 1, 'Egreso', '2022-04-05', 'Ahorro', 'GBM', 'TRANSFERENCIA INTERBANCARIA', -3344.47),
(85, 1, 'Egreso', '2022-04-05', 'Pago Tarjeta', 'Santander Free', 'CARGO PAGO TARJETA CREDITO', -5568.19),
(86, 1, 'Ingreso', '2022-04-06', 'Nomina', 'Teleperformance', 'COMISION', 29.86),
(87, 1, 'Ingreso', '2022-04-09', 'Servicios', 'You Tube', 'YOUTUBE PACO', 60),
(88, 1, 'Ingreso', '2022-04-13', 'Otros', 'Deposito', 'DEPOSITO EN EFECTIVO ATM', 650),
(89, 1, 'Ingreso', '2022-04-13', 'Nomina', 'Teleperformance', 'NOMINA', 2700.22),
(90, 1, 'Ingreso', '2022-04-14', 'Otros', 'Proyecto deportivo', '6463160', 850),
(91, 1, 'Egreso', '2022-04-14', 'Servicios', 'You Tube', 'GOOGLE *YouTube g co helppay 1888260', -239),
(92, 1, 'Egreso', '2022-04-14', 'Salud', 'Nutriologo', 'Susana', -400),
(93, 1, 'Egreso', '2022-04-15', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -1787.13),
(94, 1, 'Egreso', '2022-04-15', 'Pago Tarjeta', 'Santander Free', 'CARGO PAGO TARJETA CREDITO', -1863.95),
(95, 1, 'Ingreso', '2022-04-16', 'Otros', 'Cooperacion', 'DE AYER', 230),
(96, 1, 'Ingreso', '2022-04-16', 'Otros', 'Cashback', 'cashback', 236.06),
(97, 1, 'Egreso', '2022-04-16', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -220),
(98, 1, 'Ingreso', '2022-04-17', 'Servicios', 'Tutorias', 'PA', 350),
(99, 1, 'Egreso', '2022-04-17', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -350),
(100, 1, 'Egreso', '2022-04-18', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -246.06),
(101, 1, 'Ingreso', '2022-04-20', 'Otros', 'Cooperacion', 'DEPOSITO EN EFECTIVO ATM', 650),
(102, 1, 'Egreso', '2022-04-20', 'Otros', 'Refacciones', 'TE AMO', -50),
(103, 1, 'Egreso', '2022-04-20', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -500),
(104, 1, 'Ingreso', '2022-04-26', 'Otros', 'Pago Internet', 'DEPOSITO EN EFECTIVO', 830),
(105, 1, 'Egreso', '2022-04-26', 'Pago Tarjeta', 'Santander Free', 'CARGO PAGO TARJETA CREDITO', -830),
(106, 1, 'Egreso', '2022-04-27', 'Otros', 'Retiro', 'X96974', -100),
(107, 1, 'Ingreso', '2022-04-29', 'Nomina', 'Teleperformance', 'NOMINA', 3100.1),
(108, 1, 'Egreso', '2022-04-29', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -1000),
(109, 1, 'Egreso', '2022-04-29', 'Pago Tarjeta', 'Rappi', 'AME*PAGOABONORA CIUDAD DE MEX 0000000', -1080.98),
(110, 1, 'Ingreso', '2022-04-30', 'Otros', 'Tutorias', 'TUTORIAS', 800),
(111, 1, 'Egreso', '2022-04-30', 'Servicios', 'You Tube', 'GOOGLE *YouTube g co helppay 1888260', -239),
(112, 1, 'Egreso', '2022-05-01', 'Pago Tarjeta', 'Santander Free', 'CARGO PAGO TARJETA CREDITO', -482.86),
(113, 1, 'Ingreso', '2022-05-02', 'Servicios', 'Youtube', 'YOUTUBE NONA', 65),
(114, 1, 'Egreso', '2022-05-05', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -1162.26),
(115, 1, 'Ingreso', '2022-05-13', 'Nomina', 'Teleperformance', 'Nomina', 3195.62),
(116, 1, 'Egreso', '2022-05-14', 'Servicios', 'Youtube', 'Nomina', -239),
(117, 1, 'Egreso', '2022-05-16', 'Pago Tarjeta', 'Santander Like U', 'CARGO PAGO TARJETA CREDITO', -2956.62),
(118, 1, 'Ingreso', '2022-05-20', 'Otros', 'Cooperacion', 'COOPERACION DE GESSAMI', 85);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  ADD PRIMARY KEY (`id_cuenta`);

--
-- Indices de la tabla `gastos_pagos`
--
ALTER TABLE `gastos_pagos`
  ADD PRIMARY KEY (`id_gastos_pagos`,`cuenta`) USING BTREE,
  ADD KEY `fk_gastos_pagos_Cuenta2` (`cuenta`);

--
-- Indices de la tabla `ingreso_egreso`
--
ALTER TABLE `ingreso_egreso`
  ADD PRIMARY KEY (`id`,`Cuenta_id_cuenta`),
  ADD KEY `fk_ingreso_egreso_Cuenta1_idx` (`Cuenta_id_cuenta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuenta`
--
ALTER TABLE `cuenta`
  MODIFY `id_cuenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `gastos_pagos`
--
ALTER TABLE `gastos_pagos`
  MODIFY `id_gastos_pagos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingreso_egreso`
--
ALTER TABLE `ingreso_egreso`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=119;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `gastos_pagos`
--
ALTER TABLE `gastos_pagos`
  ADD CONSTRAINT `fk_gastos_pagos_Cuenta2` FOREIGN KEY (`cuenta`) REFERENCES `cuenta` (`id_cuenta`);

--
-- Filtros para la tabla `ingreso_egreso`
--
ALTER TABLE `ingreso_egreso`
  ADD CONSTRAINT `fk_ingreso_egreso_Cuenta1` FOREIGN KEY (`Cuenta_id_cuenta`) REFERENCES `cuenta` (`id_cuenta`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
