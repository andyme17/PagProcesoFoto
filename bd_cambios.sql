---------------------------------------------------------------------------------------------------------------
--Cambios BD procesofoto
---------------------------------------------------------------------------------------------------------------

------------------------------------------Tabla pf_cliente-----------------------------------------------------------------------------------------------------
--Cambio de nombre al campo cliente_id, a id

ALTER TABLE `pf_cliente` CHANGE `cliente_id` `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del cliente';

---------------------------------------------------------------------------------------------------------------------------------------------------------------
--Cambio de nombre y longitud a la columna passpf a password

ALTER TABLE `pf_cliente` CHANGE `passpf` `password` VARCHAR(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Contraseña cifrada en bcrypt';
---------------------------------------------------------------------------------------------------------------------------------------------------------------
--Cambio de nombre a la columna emailpf a email

ALTER TABLE `pf_cliente` CHANGE `emailpf` `email` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Correo electrónico del cliente';

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Adición de la columna telefono y celular a la tabla cliente

ALTER TABLE `pf_cliente` ADD `telpf` VARCHAR(20) NOT NULL COMMENT 'Telefono del cliente' AFTER `emailpf`, ADD `celpf` VARCHAR(20) NOT NULL COMMENT 'Celular del cliente' AFTER `telpf`;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Adición del campo remember_token para poder recordar la contraseña del usuario

ALTER TABLE `pf_cliente` ADD `remember_token` VARCHAR(100) NULL COMMENT 'Token para recordar cuenta' AFTER `password`;

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Adicion de los campos created_at y updated_at para laravel

ALTER TABLE `pf_cliente` ADD `created_at` TIMESTAMP NULL COMMENT 'Fecha de creación de registro' AFTER `saldo`, ADD `updated_at` TIMESTAMP NULL COMMENT 'Fecha de actualización de registro' AFTER `created_at`;

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----Estructura final de la tabla pf_cliente

CREATE TABLE `pf_cliente` (
	`id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del cliente',
	`nombre` VARCHAR(60) NOT NULL COMMENT 'Nombre del cliente',
	`apellido` VARCHAR(120) NOT NULL COMMENT 'Apellido del cliente',
	`emailpf` VARCHAR(120) NOT NULL COMMENT 'Correo electrónico del cliente',
	`telpf` VARCHAR(20) NOT NULL COMMENT 'Telefono del cliente',
	`celpf` VARCHAR(20) NOT NULL COMMENT 'Celular del cliente',
	`password` VARCHAR(191) NOT NULL COMMENT 'Contraseña cifrada en bcrypt',
	`remember_token` VARCHAR(100) NULL DEFAULT NULL COMMENT 'Token para recordar cuenta',
	`activo` TINYINT(1) NOT NULL DEFAULT '0' COMMENT 'Estado del registro',
	`saldo` FLOAT NOT NULL DEFAULT '0',
	`created_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha de creación de registro',
	`updated_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha de actualización de registro',
	PRIMARY KEY (`id`),
	UNIQUE INDEX `email_UNIQUE` (`emailpf`)
)
COMMENT='Registro de clientes'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=2
;

------------------------------------------Tabla pf_sesion---------------------------------------------------------------------------------------------
--El campo user_data permite valores nulos

ALTER TABLE `pf_sesion` CHANGE `user_data` `user_data` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Datos de la sesión del usuario';

------------------------------------------------------------------------------------------------------------------------------------------------------
--Cambio del tipo de dato del campo last_activity de int a datetime

ALTER TABLE `pf_sesion` CHANGE `last_activity` `last_activity` DATETIME NOT NULL COMMENT 'Fecha de la ultima actividad del usuario';

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----Estructura final de la tabla pf_sesion

CREATE TABLE `pf_sesion` (
	`session_id` VARCHAR(40) NOT NULL DEFAULT '0' COMMENT 'Identificador de la sesión',
	`ip_address` VARCHAR(45) NOT NULL DEFAULT '0' COMMENT 'Dirección IP del usuario',
	`user_agent` VARCHAR(120) NOT NULL COMMENT 'Sistema y navegador del usuario',
	`last_activity` DATETIME NOT NULL COMMENT 'Fecha de la ultima actividad del usuario',
	`user_data` TEXT NULL COMMENT 'Datos de la sesión del usuario',
	PRIMARY KEY (`session_id`),
	INDEX `last_activity_idx` (`last_activity`)
)
COMMENT='Sesiones de usuario de CI'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

---------------------------------------------Tabla pf_usuario-------------------------------------------------------------------------------------------------------------------------------------------------------
--Adición del campo created_at y updated_at a la tabla usuarios

ALTER TABLE `pf_usuario` ADD `created_at` TIMESTAMP NULL COMMENT 'Fecha de creación de registro' AFTER `activo`, ADD `updated_at` TIMESTAMP NULL COMMENT 'Fecha de actualización de registro' AFTER `created_at`;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Cambio de nombre al campo usuario_id, a id

ALTER TABLE `pf_usuario` CHANGE `usuario_id` `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del usuario';

--------------------------------------------------------------------------------------------------------------------------
--Cambio de nombre del campo passpf a password

ALTER TABLE `pf_usuario` CHANGE `passpf` `password` VARCHAR(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Contraseña cifrada en bcrypt';

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----Estructura final de la tabla pf_sesion

CREATE TABLE `pf_usuario` (
	`id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del usuario',
	`nombre` VARCHAR(60) NOT NULL COMMENT 'Nombre del Usuario',
	`apellido` VARCHAR(120) NOT NULL COMMENT 'Apellido del Usuario',
	`emailpf` VARCHAR(120) NOT NULL COMMENT 'Correo electrónico',
	`password` VARCHAR(191) NOT NULL COMMENT 'Contraseña cifrada en bcrypt',
	`remember_token` VARCHAR(100) NULL DEFAULT NULL COMMENT 'Token para recordar cuenta',
	`btsync` VARCHAR(45) NULL DEFAULT NULL COMMENT 'BtSync secret de la carpeta',
	`perfil_id` INT(10) UNSIGNED NOT NULL COMMENT 'Identificador del perfil',
	`activo` TINYINT(1) NOT NULL DEFAULT '1' COMMENT 'Estado resgistro',
	`created_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha de creación de registro',
	`updated_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha de actualización de registro',
	PRIMARY KEY (`id`),
	UNIQUE INDEX `email_UNIQUE` (`emailpf`),
	INDEX `fk_pf_usuario_pf_perfil1_idx` (`perfil_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

-----------------------------------------Tabla pf_usuario_sesion----------------------------------------------------
--La llave primario usuario_sesion_id se cambia a auto_incrementable

ALTER TABLE `pf_usuario_sesion` CHANGE `usuario_sesion_id` `usuario_sesion_id` BIGINT(20) NOT NULL AUTO_INCREMENT;

----------------------------------------------------------------------------------------------------------------------------------------------------------------
----Estructura final de la tabla pf_sesion

CREATE TABLE `pf_usuario_sesion` (
	`usuario_sesion_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`session_id` VARCHAR(40) NOT NULL,
	`usuario_id` INT(11) NOT NULL,
	`fecha` DATETIME NOT NULL,
	PRIMARY KEY (`usuario_sesion_id`),
	INDEX `fk_pf_usuario_sesion_pf_sesion1_idx` (`session_id`),
	INDEX `fk_pf_usuario_sesion_pf_usuario1_idx` (`usuario_id`)
)
COMMENT='Registro de sesiones del usuario'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

---------------------------------------------Tabla Fotografo----------------------------------------------------------------------------------
--Creación de tabla fotografos
/*CREATE TABLE `pf_fotografo` (
  `fotografo_id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(60) NOT NULL COMMENT 'Nombre del Fotografo',
  `apellido` varchar(120) NOT NULL COMMENT 'Apellido del Fotografo',
  `email` varchar(120) NOT NULL COMMENT 'Correo electrónico',
  `fecha_nac` date NOT NULL COMMENT 'Año de nacimiento del Fotografo',
  `foto_perfil`
  `descripcion` 
  `created_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha de creación de registro',
  `updated_at` TIMESTAMP NULL DEFAULT NULL COMMENT 'Fecha de actualización de registro'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Registro de los fotografos';*/

