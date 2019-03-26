---------------------------------------------------------------------------------------------------------------
--Cambios BD procesofoto
---------------------------------------------------------------------------------------------------------------


------------------------------------------Tabla pf_cliente----------------------------------------------

--Cambio de nombre y longitud a la columna passpf a password

ALTER TABLE `pf_cliente` CHANGE `passpf` `password` VARCHAR(191) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Contraseña cifrada en bcrypt';
---------------------------------------------------------------------------------------------------------
--Cambio de nombre a la columna emailpf a email

ALTER TABLE `pf_cliente` CHANGE `emailpf` `email` VARCHAR(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'Correo electrónico del cliente';

----------------------------------------------------------------------------------------------------------
--Adición de la columna telefono y celular a la tabla cliente

ALTER TABLE `pf_cliente` ADD `telpf` VARCHAR(20) NOT NULL COMMENT 'Telefono del cliente' AFTER `emailpf`, ADD `celpf` VARCHAR(20) NOT NULL COMMENT 'Celular del cliente' AFTER `telpf`;

------------------------------------------------------------------------------------------------------------
--Adición del campo remember_token para poder recordar la contraseña del usuario

ALTER TABLE `pf_cliente` ADD `remember_token` VARCHAR(100) NULL COMMENT 'Token para recordar cuenta' AFTER `passpf`;

------------------------------------------------------------------------------------------------------------
--Adicion de los campos para laravel
ALTER TABLE `pf_cliente` ADD `created_at` TIMESTAMP NULL COMMENT 'Fecha de creación de registro' AFTER `saldo`, ADD `updated_at` TIMESTAMP NULL COMMENT 'Fecha de actualización de registro' AFTER `created_at`;

-----------------------------------------------------------------------------------------------------------------------
--Cambio de nombre al campo cliente_id, a id

ALTER TABLE `pf_cliente` CHANGE `cliente_id` `id` INT(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del cliente';

-----------------------------------------------------------------------------------------------------------------------------------------------------------------
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


------------------------------------------Tabla pf_sesion------------------------------------------------------------------------------
--El campo user_data permite valores nulos
ALTER TABLE `pf_sesion` CHANGE `user_data` `user_data` TEXT CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT 'Datos de la sesión del usuario';


--?????? ALTER TABLE `pf_sesion` CHANGE `last_activity` `last_activity` DATETIME NOT NULL COMMENT 'Fecha de la ultima actividad del usuario';

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

---------------------------------------------Tabla pf_usuario------------------------------------------------------------------------------------

--Adición del campo created_at y updated_at a la tabla usuarios
ALTER TABLE `pf_usuario` ADD `created_at` TIMESTAMP NULL COMMENT 'Fecha de creación de registro' AFTER `activo`, ADD `updated_at` TIMESTAMP NULL COMMENT 'Fecha de actualización de registro' AFTER `created_at`;