-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: proceso-db-cluster.cluster-cm2pfqopx02f.us-west-1.rds.amazonaws.com
-- Generation Time: Feb 25, 2019 at 04:46 PM
-- Server version: 5.6.10
-- PHP Version: 7.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `procesofoto`
--
CREATE DATABASE IF NOT EXISTS `procesofoto` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `procesofoto`;

-- --------------------------------------------------------

--
-- Table structure for table `pf_carrito`
--

CREATE TABLE `pf_carrito` (
  `carrito_id` bigint(20) NOT NULL,
  `cliente_id` int(11) DEFAULT NULL,
  `fecha` datetime NOT NULL,
  `estado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Carrito de compra';

-- --------------------------------------------------------

--
-- Table structure for table `pf_carrito_media`
--

CREATE TABLE `pf_carrito_media` (
  `carrito_media_id` bigint(20) NOT NULL,
  `carrito_id` bigint(20) NOT NULL,
  `media_id` int(11) NOT NULL,
  `precio` float NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_cliente`
--

CREATE TABLE `pf_cliente` (
  `cliente_id` int(11) NOT NULL COMMENT 'Identificador del cliente',
  `nombre` varchar(60) NOT NULL COMMENT 'Nombre del cliente',
  `apellido` varchar(120) NOT NULL COMMENT 'Apellido del cliente',
  `emailpf` varchar(120) NOT NULL COMMENT 'Correo electrónico del cliente',
  `passpf` varchar(40) NOT NULL COMMENT 'Contraseña cifrada en SHA1',
  `activo` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Estado del registro',
  `saldo` float NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de clientes';

-- --------------------------------------------------------

--
-- Table structure for table `pf_cliente_media`
--

CREATE TABLE `pf_cliente_media` (
  `cliente_media_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `descargas` int(10) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_cliente_sesion`
--

CREATE TABLE `pf_cliente_sesion` (
  `cliente_sesion_id` int(10) UNSIGNED NOT NULL,
  `session_id` varchar(40) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de sesiones del cliente';

-- --------------------------------------------------------

--
-- Table structure for table `pf_cmeta`
--

CREATE TABLE `pf_cmeta` (
  `cmeta_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `llave` varchar(120) NOT NULL,
  `valor` varchar(16384) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Metadatos del cliente';

-- --------------------------------------------------------

--
-- Table structure for table `pf_domicilio`
--

CREATE TABLE `pf_domicilio` (
  `domicilio_id` int(10) UNSIGNED NOT NULL,
  `direccion1` varchar(250) NOT NULL,
  `direccion2` varchar(250) NOT NULL,
  `cp` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `estado` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_emeta`
--

CREATE TABLE `pf_emeta` (
  `emeta_id` int(10) UNSIGNED NOT NULL COMMENT 'Identificador del metadato',
  `empresa_id` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `llave` varchar(120) NOT NULL COMMENT 'Nombre de metadato',
  `valor` varchar(16384) NOT NULL COMMENT 'Valor del metadato'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Metadatos de la empresa';

-- --------------------------------------------------------

--
-- Table structure for table `pf_empresa`
--

CREATE TABLE `pf_empresa` (
  `empresa_id` int(11) NOT NULL COMMENT 'Identificador de la empresa',
  `empresa` varchar(45) NOT NULL COMMENT 'Nombre de la empresa',
  `activo` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de empresas';

-- --------------------------------------------------------

--
-- Table structure for table `pf_empresa_cliente`
--

CREATE TABLE `pf_empresa_cliente` (
  `empresa_cliente_id` int(10) UNSIGNED NOT NULL,
  `empresa_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `rol` varchar(120) DEFAULT NULL COMMENT 'Cargo que desempeña en la empresa',
  `administrador` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relación de empresa con clientes';

-- --------------------------------------------------------

--
-- Table structure for table `pf_estado`
--

CREATE TABLE `pf_estado` (
  `estado_id` int(10) UNSIGNED NOT NULL COMMENT 'Identificador del estado',
  `pais_id` int(10) UNSIGNED NOT NULL COMMENT 'Identificador del país',
  `codigo` varchar(4) NOT NULL COMMENT 'Código ISO del estado',
  `estado` varchar(120) NOT NULL COMMENT 'Nombre del estado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalogo de estados';

-- --------------------------------------------------------

--
-- Table structure for table `pf_evento`
--

CREATE TABLE `pf_evento` (
  `evento_id` int(11) NOT NULL COMMENT 'Identificador del evento',
  `evento` varchar(250) NOT NULL COMMENT 'Nombre del evento',
  `descripcion` varchar(16384) DEFAULT NULL COMMENT 'Descripción del evento',
  `fecha` datetime NOT NULL COMMENT 'Fecha del evento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de eventos';

-- --------------------------------------------------------

--
-- Table structure for table `pf_evento_lugar`
--

CREATE TABLE `pf_evento_lugar` (
  `evento_lugar_id` int(11) NOT NULL,
  `evento_id` int(11) NOT NULL,
  `lugar_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_evento_media`
--

CREATE TABLE `pf_evento_media` (
  `evento_media_id` int(11) NOT NULL,
  `evento_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relación de una foto con un evento';

-- --------------------------------------------------------

--
-- Table structure for table `pf_favorito`
--

CREATE TABLE `pf_favorito` (
  `favorito_id` int(11) NOT NULL COMMENT 'Identificador del registro favoritos del cliente',
  `cliente_id` int(11) NOT NULL COMMENT 'Identificador del cliente',
  `media_id` int(11) NOT NULL COMMENT 'Identificador del medio'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de favoritos del cliente';

-- --------------------------------------------------------

--
-- Table structure for table `pf_fiscal`
--

CREATE TABLE `pf_fiscal` (
  `fiscal_id` int(10) UNSIGNED NOT NULL,
  `razon` varchar(250) NOT NULL COMMENT 'Razón social',
  `rfc` varchar(14) NOT NULL,
  `telefono` varchar(45) NOT NULL,
  `emailpf` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Datos fiscales';

-- --------------------------------------------------------

--
-- Table structure for table `pf_galeria`
--

CREATE TABLE `pf_galeria` (
  `galeria_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(250) DEFAULT NULL,
  `descripcion` varchar(16384) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_pub` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Galería de medios';

-- --------------------------------------------------------

--
-- Table structure for table `pf_galeria_media`
--

CREATE TABLE `pf_galeria_media` (
  `galeria_media_id` int(10) UNSIGNED NOT NULL,
  `galeria_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `portada` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relación de una galería y sus medios';

-- --------------------------------------------------------

--
-- Table structure for table `pf_gmeta`
--

CREATE TABLE `pf_gmeta` (
  `gmeta_id` int(11) UNSIGNED NOT NULL,
  `galeria_id` int(11) NOT NULL,
  `llave` varchar(120) NOT NULL,
  `valor` varchar(16384) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Más información de la galería';

-- --------------------------------------------------------

--
-- Table structure for table `pf_importacion_autor`
--

CREATE TABLE `pf_importacion_autor` (
  `autor_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `autor` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_lmeta`
--

CREATE TABLE `pf_lmeta` (
  `lmeta_id` bigint(20) NOT NULL,
  `lugar_id` int(11) NOT NULL,
  `llave` varchar(120) NOT NULL,
  `valor` varchar(16384) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_log_cliente`
--

CREATE TABLE `pf_log_cliente` (
  `log_cliente_id` bigint(20) NOT NULL,
  `log_evento_id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_log_descarga`
--

CREATE TABLE `pf_log_descarga` (
  `log_descarga_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `cliente_media_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_log_evento`
--

CREATE TABLE `pf_log_evento` (
  `log_evento_id` bigint(20) NOT NULL COMMENT 'Identificador del evento',
  `evento` varchar(250) NOT NULL COMMENT 'Nombre del evento',
  `descripcion` varchar(16384) DEFAULT NULL COMMENT 'Descripción del evento'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalogo de eventos del usuario o cliente en el sistema';

-- --------------------------------------------------------

--
-- Table structure for table `pf_log_usuario`
--

CREATE TABLE `pf_log_usuario` (
  `log_usuario_id` bigint(20) NOT NULL,
  `log_evento_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `descripcion` varchar(16384) DEFAULT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de sesiones de los usuario';

-- --------------------------------------------------------

--
-- Table structure for table `pf_lugar`
--

CREATE TABLE `pf_lugar` (
  `lugar_id` int(11) NOT NULL COMMENT 'Identificador del lugar',
  `lugar` varchar(250) NOT NULL COMMENT 'Nombre del lugar',
  `descripcion` varchar(16384) DEFAULT NULL COMMENT 'Descripción del lugar',
  `direccion1` varchar(250) DEFAULT NULL COMMENT 'Calle y numero exterior',
  `direccion2` varchar(250) DEFAULT NULL COMMENT 'Colonia',
  `cp` varchar(7) DEFAULT NULL COMMENT 'Código postal',
  `ciudad` varchar(250) DEFAULT NULL COMMENT 'Ciudad, delegación o municipio',
  `estado` varchar(45) DEFAULT NULL COMMENT 'Estado ',
  `estado_id` int(10) UNSIGNED DEFAULT NULL,
  `pais_id` int(10) UNSIGNED DEFAULT NULL,
  `latitud` varchar(45) DEFAULT NULL COMMENT 'Ltitud',
  `longitud` varchar(45) DEFAULT NULL COMMENT 'Longitud'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalogo de lugar';

-- --------------------------------------------------------

--
-- Table structure for table `pf_lugar_media`
--

CREATE TABLE `pf_lugar_media` (
  `lugar_media_id` int(11) NOT NULL,
  `lugar_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relación de la foto con un lugar';

-- --------------------------------------------------------

--
-- Table structure for table `pf_media`
--

CREATE TABLE `pf_media` (
  `media_id` int(11) NOT NULL COMMENT 'Identificador del medio',
  `autor` varchar(250) DEFAULT NULL COMMENT 'Nombre del autor del medio',
  `titulo` varchar(250) DEFAULT NULL COMMENT 'Titulo del medio',
  `descripcion` varchar(16384) DEFAULT NULL COMMENT 'Descripción del medio',
  `ruta` varchar(250) NOT NULL COMMENT 'Ruta del medio',
  `fecha` datetime NOT NULL COMMENT 'Fecha de registro',
  `fecha_pub` datetime NOT NULL,
  `precio_id` int(10) UNSIGNED DEFAULT '1' COMMENT 'Identificador del tabulador de precios',
  `precio_individual` float DEFAULT NULL COMMENT 'Precio exclusivo del medio',
  `estado` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Estado del medio (0=inactivo 1=activo) ',
  `destacada` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Medios (fotografías y vídeos)';

-- --------------------------------------------------------

--
-- Table structure for table `pf_media_thumbnail`
--

CREATE TABLE `pf_media_thumbnail` (
  `thumbnail_id` int(10) UNSIGNED NOT NULL,
  `media_id` int(11) NOT NULL,
  `ruta` varchar(2000) DEFAULT NULL,
  `url` varchar(2000) DEFAULT NULL,
  `ancho` int(10) UNSIGNED DEFAULT NULL,
  `alto` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Imágenes de las vista previa de los medios';

-- --------------------------------------------------------

--
-- Table structure for table `pf_mmeta`
--

CREATE TABLE `pf_mmeta` (
  `mmedia_id` bigint(20) UNSIGNED NOT NULL COMMENT 'Identificador del metadata',
  `media_id` int(11) NOT NULL COMMENT 'Identificador del medio',
  `llave` varchar(120) NOT NULL COMMENT 'Nombre de dato',
  `valor` varchar(16384) NOT NULL COMMENT 'Valor del dato'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Más información del medio (foto y vídeos)';

-- --------------------------------------------------------

--
-- Table structure for table `pf_monedero`
--

CREATE TABLE `pf_monedero` (
  `monedero_id` int(10) UNSIGNED NOT NULL,
  `credito` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_ometa`
--

CREATE TABLE `pf_ometa` (
  `ometa_id` int(11) NOT NULL,
  `orden_id` int(11) NOT NULL,
  `llave` varchar(45) NOT NULL,
  `valor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_opciones`
--

CREATE TABLE `pf_opciones` (
  `opciones_id` int(10) UNSIGNED NOT NULL COMMENT 'Identificador de la opción del sitio',
  `llave` varchar(120) NOT NULL COMMENT 'Nombre e la opción',
  `valor` varchar(16384) NOT NULL COMMENT 'Valor de la opción'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Opciones del sitio';

-- --------------------------------------------------------

--
-- Table structure for table `pf_orden`
--

CREATE TABLE `pf_orden` (
  `orden_id` int(11) NOT NULL,
  `carrito_id` bigint(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` tinyint(1) NOT NULL DEFAULT '1',
  `pago` int(10) UNSIGNED NOT NULL COMMENT 'Tipo de pago',
  `vale_id` int(11) DEFAULT NULL,
  `descuento` float NOT NULL,
  `iva` float NOT NULL,
  `total` float NOT NULL COMMENT 'Precio total de la orden'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Orden de compra';

-- --------------------------------------------------------

--
-- Table structure for table `pf_pago_online`
--

CREATE TABLE `pf_pago_online` (
  `pago_online_id` int(11) NOT NULL,
  `carrito_id` int(11) NOT NULL,
  `order_code` varchar(45) NOT NULL,
  `response_date` datetime NOT NULL,
  `response_code` varchar(45) DEFAULT NULL,
  `response_msg` varchar(500) DEFAULT NULL,
  `monto` float DEFAULT NULL,
  `respondido` tinyint(1) NOT NULL DEFAULT '0',
  `facturado` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_pais`
--

CREATE TABLE `pf_pais` (
  `pais_id` int(10) UNSIGNED NOT NULL COMMENT 'Identificador del país',
  `codigo` varchar(2) NOT NULL COMMENT 'Código IOS de país',
  `pais` varchar(120) NOT NULL COMMENT 'Nombre del país'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalogo de países';

-- --------------------------------------------------------

--
-- Table structure for table `pf_paquete`
--

CREATE TABLE `pf_paquete` (
  `paquete_id` int(10) UNSIGNED NOT NULL,
  `paquete` varchar(45) NOT NULL,
  `precio` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_perfil`
--

CREATE TABLE `pf_perfil` (
  `perfil_id` int(10) UNSIGNED NOT NULL,
  `perfil` varchar(45) NOT NULL,
  `descripcion` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Catalogo de perfil del usuarios';

-- --------------------------------------------------------

--
-- Table structure for table `pf_personaje`
--

CREATE TABLE `pf_personaje` (
  `personaje_id` int(11) NOT NULL COMMENT 'Identificador del personaje',
  `nombre` varchar(120) NOT NULL COMMENT 'Nombre del personaje',
  `apelido_paterno` varchar(45) DEFAULT NULL COMMENT 'Apellido paterno del personaje',
  `apellido_materno` varchar(45) DEFAULT NULL COMMENT 'Apellido materno del personaje'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de personajes';

-- --------------------------------------------------------

--
-- Table structure for table `pf_personaje_media`
--

CREATE TABLE `pf_personaje_media` (
  `personaje_foto_id` int(11) NOT NULL,
  `presonaje_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `tag_ax` int(10) UNSIGNED DEFAULT NULL,
  `tag_ay` int(10) UNSIGNED DEFAULT NULL,
  `tag_bx` int(10) UNSIGNED DEFAULT NULL,
  `tag_by` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relación de la foto con el personaje';

-- --------------------------------------------------------

--
-- Table structure for table `pf_pmeta`
--

CREATE TABLE `pf_pmeta` (
  `pmeta_id` bigint(20) NOT NULL,
  `presonaje_id` int(11) NOT NULL,
  `llave` varchar(120) NOT NULL,
  `valor` varchar(16384) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mas información del personaje';

-- --------------------------------------------------------

--
-- Table structure for table `pf_precio`
--

CREATE TABLE `pf_precio` (
  `precio_id` int(10) UNSIGNED NOT NULL,
  `tipo` varchar(45) NOT NULL,
  `precio` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_produccion`
--

CREATE TABLE `pf_produccion` (
  `produccion_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relación de usuario con medios';

-- --------------------------------------------------------

--
-- Table structure for table `pf_sesion`
--

CREATE TABLE `pf_sesion` (
  `session_id` varchar(40) NOT NULL DEFAULT '0' COMMENT 'Identificador de la sesión',
  `ip_address` varchar(45) NOT NULL DEFAULT '0' COMMENT 'Dirección IP del usuario',
  `user_agent` varchar(120) NOT NULL COMMENT 'Sistema y navegador del usuario',
  `last_activity` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Fecha en tiempo UNIX de la ultima actividad del usuario',
  `user_data` text NOT NULL COMMENT 'Datos de la sesión del usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sesiones de usuario de CI';

-- --------------------------------------------------------

--
-- Table structure for table `pf_umeta`
--

CREATE TABLE `pf_umeta` (
  `umeta_id` bigint(20) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `llave` varchar(120) NOT NULL,
  `valor` varchar(16384) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Mas información del usuario';

-- --------------------------------------------------------

--
-- Table structure for table `pf_usuario`
--

CREATE TABLE `pf_usuario` (
  `usuario_id` int(11) NOT NULL COMMENT 'Identificador del usuario',
  `nombre` varchar(60) NOT NULL COMMENT 'Nombre del Usuario',
  `apellido` varchar(120) NOT NULL COMMENT 'Apellido del Usuario',
  `emailpf` varchar(120) NOT NULL COMMENT 'Correo electrónico',
  `passpf` varchar(40) NOT NULL COMMENT 'Contraseña cifrada en SHA1',
  `btsync` varchar(45) DEFAULT NULL COMMENT 'BtSync secret de la carpeta',
  `perfil_id` int(10) UNSIGNED NOT NULL COMMENT 'Identificador del perfil',
  `activo` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Estado resgistro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pf_usuario_sesion`
--

CREATE TABLE `pf_usuario_sesion` (
  `usuario_sesion_id` bigint(20) NOT NULL,
  `session_id` varchar(40) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de sesiones del usuario';

-- --------------------------------------------------------

--
-- Table structure for table `pf_vale`
--

CREATE TABLE `pf_vale` (
  `vale_id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descuento` int(11) NOT NULL DEFAULT '0',
  `uso` int(11) NOT NULL DEFAULT '0',
  `vigencia` datetime DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pf_carrito`
--
ALTER TABLE `pf_carrito`
  ADD PRIMARY KEY (`carrito_id`),
  ADD KEY `fk_pf_carrito_pf_cliente1_idx` (`cliente_id`);

--
-- Indexes for table `pf_carrito_media`
--
ALTER TABLE `pf_carrito_media`
  ADD PRIMARY KEY (`carrito_media_id`),
  ADD KEY `fk_pf_carrito_foto_pf_carrito1_idx` (`carrito_id`),
  ADD KEY `fk_pf_carrito_foto_pf_foto1_idx` (`media_id`);

--
-- Indexes for table `pf_cliente`
--
ALTER TABLE `pf_cliente`
  ADD PRIMARY KEY (`cliente_id`),
  ADD UNIQUE KEY `email_UNIQUE` (`emailpf`);

--
-- Indexes for table `pf_cliente_media`
--
ALTER TABLE `pf_cliente_media`
  ADD PRIMARY KEY (`cliente_media_id`),
  ADD KEY `fk_pf_cliente_foto_pf_cliente1_idx` (`cliente_id`),
  ADD KEY `fk_pf_cliente_foto_pf_foto1_idx` (`media_id`),
  ADD KEY `fk_pf_cliente_foto_pf_orden1_idx` (`orden_id`);

--
-- Indexes for table `pf_cliente_sesion`
--
ALTER TABLE `pf_cliente_sesion`
  ADD PRIMARY KEY (`cliente_sesion_id`),
  ADD KEY `fk_pf_cliente_sesion_pf_sesion1_idx` (`session_id`),
  ADD KEY `fk_pf_cliente_sesion_pf_cliente1_idx` (`cliente_id`);

--
-- Indexes for table `pf_cmeta`
--
ALTER TABLE `pf_cmeta`
  ADD PRIMARY KEY (`cmeta_id`),
  ADD KEY `fk_pf_cmeta_pf_cliente1_idx` (`cliente_id`);

--
-- Indexes for table `pf_domicilio`
--
ALTER TABLE `pf_domicilio`
  ADD PRIMARY KEY (`domicilio_id`);

--
-- Indexes for table `pf_emeta`
--
ALTER TABLE `pf_emeta`
  ADD PRIMARY KEY (`emeta_id`),
  ADD KEY `fk_pf_emeta_pf_empresa1_idx` (`empresa_id`);

--
-- Indexes for table `pf_empresa`
--
ALTER TABLE `pf_empresa`
  ADD PRIMARY KEY (`empresa_id`);

--
-- Indexes for table `pf_empresa_cliente`
--
ALTER TABLE `pf_empresa_cliente`
  ADD PRIMARY KEY (`empresa_cliente_id`),
  ADD KEY `fk_empresa_empresa_id_idx` (`empresa_id`),
  ADD KEY `fk_emp_cli_cliente_id_idx` (`cliente_id`);

--
-- Indexes for table `pf_estado`
--
ALTER TABLE `pf_estado`
  ADD PRIMARY KEY (`estado_id`),
  ADD KEY `fk_pf_estado_pf_pais1_idx` (`pais_id`);

--
-- Indexes for table `pf_evento`
--
ALTER TABLE `pf_evento`
  ADD PRIMARY KEY (`evento_id`);

--
-- Indexes for table `pf_evento_lugar`
--
ALTER TABLE `pf_evento_lugar`
  ADD PRIMARY KEY (`evento_lugar_id`),
  ADD KEY `fk_pf_evento_lugar_pf_evento1_idx` (`evento_id`),
  ADD KEY `fk_pf_evento_lugar_pf_lugar1_idx` (`lugar_id`);

--
-- Indexes for table `pf_evento_media`
--
ALTER TABLE `pf_evento_media`
  ADD PRIMARY KEY (`evento_media_id`),
  ADD KEY `fk_pf_evento_foto_pf_foto1_idx` (`media_id`),
  ADD KEY `fk_pf_evento_foto_pf_evento1_idx` (`evento_id`);

--
-- Indexes for table `pf_favorito`
--
ALTER TABLE `pf_favorito`
  ADD PRIMARY KEY (`favorito_id`),
  ADD KEY `fk_fav_media_id_idx` (`media_id`);

--
-- Indexes for table `pf_fiscal`
--
ALTER TABLE `pf_fiscal`
  ADD PRIMARY KEY (`fiscal_id`);

--
-- Indexes for table `pf_galeria`
--
ALTER TABLE `pf_galeria`
  ADD PRIMARY KEY (`galeria_id`),
  ADD KEY `fk_pf_galeria_pf_usuario1_idx` (`usuario_id`);

--
-- Indexes for table `pf_galeria_media`
--
ALTER TABLE `pf_galeria_media`
  ADD PRIMARY KEY (`galeria_media_id`),
  ADD KEY `fk_galfot_id_galeria_idx` (`galeria_id`),
  ADD KEY `fk_galfot_id_foto_idx` (`media_id`);

--
-- Indexes for table `pf_gmeta`
--
ALTER TABLE `pf_gmeta`
  ADD PRIMARY KEY (`gmeta_id`),
  ADD KEY `fk_pf_gmeta_pf_galeria1_idx` (`galeria_id`);

--
-- Indexes for table `pf_importacion_autor`
--
ALTER TABLE `pf_importacion_autor`
  ADD PRIMARY KEY (`autor_id`),
  ADD UNIQUE KEY `autor_UNIQUE` (`autor`),
  ADD KEY `fk_pf_importacion_autor_pf_usuario1_idx` (`usuario_id`);

--
-- Indexes for table `pf_lmeta`
--
ALTER TABLE `pf_lmeta`
  ADD PRIMARY KEY (`lmeta_id`),
  ADD KEY `fk_pf_lmeta_pf_lugar1_idx` (`lugar_id`);

--
-- Indexes for table `pf_log_cliente`
--
ALTER TABLE `pf_log_cliente`
  ADD PRIMARY KEY (`log_cliente_id`),
  ADD KEY `fk_pf_log_cliente_pf_log_evento1_idx` (`log_evento_id`),
  ADD KEY `fk_pf_log_cliente_pf_cliente1_idx` (`cliente_id`);

--
-- Indexes for table `pf_log_descarga`
--
ALTER TABLE `pf_log_descarga`
  ADD PRIMARY KEY (`log_descarga_id`),
  ADD KEY `fk_cliente_media_id_idx` (`cliente_media_id`);

--
-- Indexes for table `pf_log_evento`
--
ALTER TABLE `pf_log_evento`
  ADD PRIMARY KEY (`log_evento_id`),
  ADD UNIQUE KEY `evento_UNIQUE` (`evento`);

--
-- Indexes for table `pf_log_usuario`
--
ALTER TABLE `pf_log_usuario`
  ADD PRIMARY KEY (`log_usuario_id`),
  ADD KEY `fk_pf_log_usuario_pf_usuario1_idx` (`usuario_id`),
  ADD KEY `fk_pf_log_usuario_pf_log_evento1_idx` (`log_evento_id`);

--
-- Indexes for table `pf_lugar`
--
ALTER TABLE `pf_lugar`
  ADD PRIMARY KEY (`lugar_id`),
  ADD KEY `fk_pf_lugar_pf_pais1_idx` (`pais_id`),
  ADD KEY `fk_pf_lugar_pf_estado1_idx` (`estado_id`);

--
-- Indexes for table `pf_lugar_media`
--
ALTER TABLE `pf_lugar_media`
  ADD PRIMARY KEY (`lugar_media_id`),
  ADD KEY `fk_pf_lugar_foto_pf_lugar1_idx` (`lugar_id`),
  ADD KEY `fk_pf_lugar_foto_pf_foto1_idx` (`media_id`);

--
-- Indexes for table `pf_media`
--
ALTER TABLE `pf_media`
  ADD PRIMARY KEY (`media_id`),
  ADD UNIQUE KEY `ruta_UNIQUE` (`ruta`),
  ADD KEY `fk_foto_id_precio_idx` (`precio_id`);
ALTER TABLE `pf_media` ADD FULLTEXT KEY `autor_full_text` (`autor`);
ALTER TABLE `pf_media` ADD FULLTEXT KEY `titulo_full_text` (`titulo`);
ALTER TABLE `pf_media` ADD FULLTEXT KEY `descripcion_full_text` (`descripcion`);
ALTER TABLE `pf_media` ADD FULLTEXT KEY `fields_full_text` (`autor`,`titulo`,`descripcion`);

--
-- Indexes for table `pf_media_thumbnail`
--
ALTER TABLE `pf_media_thumbnail`
  ADD PRIMARY KEY (`thumbnail_id`),
  ADD KEY `fk_pf_media_thumbnail_pf_media1_idx` (`media_id`);

--
-- Indexes for table `pf_mmeta`
--
ALTER TABLE `pf_mmeta`
  ADD PRIMARY KEY (`mmedia_id`),
  ADD KEY `fk_pf_umedia_pf_media1_idx` (`media_id`);

--
-- Indexes for table `pf_monedero`
--
ALTER TABLE `pf_monedero`
  ADD PRIMARY KEY (`monedero_id`);

--
-- Indexes for table `pf_ometa`
--
ALTER TABLE `pf_ometa`
  ADD PRIMARY KEY (`ometa_id`),
  ADD KEY `fk_ometa_orden_id_idx` (`orden_id`);

--
-- Indexes for table `pf_opciones`
--
ALTER TABLE `pf_opciones`
  ADD PRIMARY KEY (`opciones_id`);

--
-- Indexes for table `pf_orden`
--
ALTER TABLE `pf_orden`
  ADD PRIMARY KEY (`orden_id`),
  ADD KEY `fk_pf_orden_pf_carrito1_idx` (`carrito_id`),
  ADD KEY `unq_orden_carrito` (`orden_id`,`carrito_id`),
  ADD KEY `fk_vale_id_idx` (`vale_id`);

--
-- Indexes for table `pf_pago_online`
--
ALTER TABLE `pf_pago_online`
  ADD PRIMARY KEY (`pago_online_id`);

--
-- Indexes for table `pf_pais`
--
ALTER TABLE `pf_pais`
  ADD PRIMARY KEY (`pais_id`);

--
-- Indexes for table `pf_paquete`
--
ALTER TABLE `pf_paquete`
  ADD PRIMARY KEY (`paquete_id`);

--
-- Indexes for table `pf_perfil`
--
ALTER TABLE `pf_perfil`
  ADD PRIMARY KEY (`perfil_id`),
  ADD UNIQUE KEY `perfil_UNIQUE` (`perfil`);

--
-- Indexes for table `pf_personaje`
--
ALTER TABLE `pf_personaje`
  ADD PRIMARY KEY (`personaje_id`);

--
-- Indexes for table `pf_personaje_media`
--
ALTER TABLE `pf_personaje_media`
  ADD PRIMARY KEY (`personaje_foto_id`),
  ADD KEY `fk_pf_personaje_foto_pf_presonaje1_idx` (`presonaje_id`),
  ADD KEY `fk_pf_personaje_foto_pf_foto1_idx` (`media_id`);

--
-- Indexes for table `pf_pmeta`
--
ALTER TABLE `pf_pmeta`
  ADD PRIMARY KEY (`pmeta_id`),
  ADD KEY `fk_pf_pmeta_pf_presonaje1_idx` (`presonaje_id`);

--
-- Indexes for table `pf_precio`
--
ALTER TABLE `pf_precio`
  ADD PRIMARY KEY (`precio_id`);

--
-- Indexes for table `pf_produccion`
--
ALTER TABLE `pf_produccion`
  ADD PRIMARY KEY (`produccion_id`),
  ADD KEY `fk_compra_id_usuario_idx` (`usuario_id`),
  ADD KEY `fk_compra_id_foto_idx` (`media_id`);

--
-- Indexes for table `pf_sesion`
--
ALTER TABLE `pf_sesion`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `last_activity_idx` (`last_activity`);

--
-- Indexes for table `pf_umeta`
--
ALTER TABLE `pf_umeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `fk_pf_umeta_pf_usuario1_idx` (`usuario_id`);

--
-- Indexes for table `pf_usuario`
--
ALTER TABLE `pf_usuario`
  ADD PRIMARY KEY (`usuario_id`),
  ADD UNIQUE KEY `email_UNIQUE` (`emailpf`),
  ADD KEY `fk_pf_usuario_pf_perfil1_idx` (`perfil_id`);

--
-- Indexes for table `pf_usuario_sesion`
--
ALTER TABLE `pf_usuario_sesion`
  ADD PRIMARY KEY (`usuario_sesion_id`),
  ADD KEY `fk_pf_usuario_sesion_pf_sesion1_idx` (`session_id`),
  ADD KEY `fk_pf_usuario_sesion_pf_usuario1_idx` (`usuario_id`);

--
-- Indexes for table `pf_vale`
--
ALTER TABLE `pf_vale`
  ADD PRIMARY KEY (`vale_id`),
  ADD UNIQUE KEY `nombre_UNIQUE` (`nombre`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pf_carrito`
--
ALTER TABLE `pf_carrito`
  MODIFY `carrito_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_carrito_media`
--
ALTER TABLE `pf_carrito_media`
  MODIFY `carrito_media_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_cliente`
--
ALTER TABLE `pf_cliente`
  MODIFY `cliente_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del cliente';

--
-- AUTO_INCREMENT for table `pf_cliente_media`
--
ALTER TABLE `pf_cliente_media`
  MODIFY `cliente_media_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_cliente_sesion`
--
ALTER TABLE `pf_cliente_sesion`
  MODIFY `cliente_sesion_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_cmeta`
--
ALTER TABLE `pf_cmeta`
  MODIFY `cmeta_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_domicilio`
--
ALTER TABLE `pf_domicilio`
  MODIFY `domicilio_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_emeta`
--
ALTER TABLE `pf_emeta`
  MODIFY `emeta_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del metadato';

--
-- AUTO_INCREMENT for table `pf_empresa`
--
ALTER TABLE `pf_empresa`
  MODIFY `empresa_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la empresa';

--
-- AUTO_INCREMENT for table `pf_empresa_cliente`
--
ALTER TABLE `pf_empresa_cliente`
  MODIFY `empresa_cliente_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_estado`
--
ALTER TABLE `pf_estado`
  MODIFY `estado_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del estado';

--
-- AUTO_INCREMENT for table `pf_evento`
--
ALTER TABLE `pf_evento`
  MODIFY `evento_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del evento';

--
-- AUTO_INCREMENT for table `pf_evento_lugar`
--
ALTER TABLE `pf_evento_lugar`
  MODIFY `evento_lugar_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_evento_media`
--
ALTER TABLE `pf_evento_media`
  MODIFY `evento_media_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_favorito`
--
ALTER TABLE `pf_favorito`
  MODIFY `favorito_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del registro favoritos del cliente';

--
-- AUTO_INCREMENT for table `pf_fiscal`
--
ALTER TABLE `pf_fiscal`
  MODIFY `fiscal_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_galeria`
--
ALTER TABLE `pf_galeria`
  MODIFY `galeria_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_galeria_media`
--
ALTER TABLE `pf_galeria_media`
  MODIFY `galeria_media_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_gmeta`
--
ALTER TABLE `pf_gmeta`
  MODIFY `gmeta_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_importacion_autor`
--
ALTER TABLE `pf_importacion_autor`
  MODIFY `autor_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_lmeta`
--
ALTER TABLE `pf_lmeta`
  MODIFY `lmeta_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_log_cliente`
--
ALTER TABLE `pf_log_cliente`
  MODIFY `log_cliente_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_log_descarga`
--
ALTER TABLE `pf_log_descarga`
  MODIFY `log_descarga_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_log_evento`
--
ALTER TABLE `pf_log_evento`
  MODIFY `log_evento_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del evento';

--
-- AUTO_INCREMENT for table `pf_log_usuario`
--
ALTER TABLE `pf_log_usuario`
  MODIFY `log_usuario_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_lugar`
--
ALTER TABLE `pf_lugar`
  MODIFY `lugar_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del lugar';

--
-- AUTO_INCREMENT for table `pf_lugar_media`
--
ALTER TABLE `pf_lugar_media`
  MODIFY `lugar_media_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_media`
--
ALTER TABLE `pf_media`
  MODIFY `media_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del medio';

--
-- AUTO_INCREMENT for table `pf_media_thumbnail`
--
ALTER TABLE `pf_media_thumbnail`
  MODIFY `thumbnail_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_mmeta`
--
ALTER TABLE `pf_mmeta`
  MODIFY `mmedia_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del metadata';

--
-- AUTO_INCREMENT for table `pf_monedero`
--
ALTER TABLE `pf_monedero`
  MODIFY `monedero_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_ometa`
--
ALTER TABLE `pf_ometa`
  MODIFY `ometa_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_opciones`
--
ALTER TABLE `pf_opciones`
  MODIFY `opciones_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador de la opción del sitio';

--
-- AUTO_INCREMENT for table `pf_orden`
--
ALTER TABLE `pf_orden`
  MODIFY `orden_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_pago_online`
--
ALTER TABLE `pf_pago_online`
  MODIFY `pago_online_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_pais`
--
ALTER TABLE `pf_pais`
  MODIFY `pais_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Identificador del país';

--
-- AUTO_INCREMENT for table `pf_paquete`
--
ALTER TABLE `pf_paquete`
  MODIFY `paquete_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_perfil`
--
ALTER TABLE `pf_perfil`
  MODIFY `perfil_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_personaje`
--
ALTER TABLE `pf_personaje`
  MODIFY `personaje_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del personaje';

--
-- AUTO_INCREMENT for table `pf_personaje_media`
--
ALTER TABLE `pf_personaje_media`
  MODIFY `personaje_foto_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_pmeta`
--
ALTER TABLE `pf_pmeta`
  MODIFY `pmeta_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_precio`
--
ALTER TABLE `pf_precio`
  MODIFY `precio_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_produccion`
--
ALTER TABLE `pf_produccion`
  MODIFY `produccion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_umeta`
--
ALTER TABLE `pf_umeta`
  MODIFY `umeta_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_usuario`
--
ALTER TABLE `pf_usuario`
  MODIFY `usuario_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del usuario';

--
-- AUTO_INCREMENT for table `pf_usuario_sesion`
--
ALTER TABLE `pf_usuario_sesion`
  MODIFY `usuario_sesion_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pf_vale`
--
ALTER TABLE `pf_vale`
  MODIFY `vale_id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
