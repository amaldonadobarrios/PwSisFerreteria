CREATE DATABASE `dbferreteria` /*!40100 DEFAULT CHARACTER SET utf8 */;
use dbferreteria;

CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT,
  `naturaleza_cliente` varchar(45) CHARACTER SET utf8 NOT NULL,
  `id_tipo_cliente` int(11) NOT NULL,
  `dni_ruc` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `razon_social` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `nombres` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `apellido_paterno` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `apellido_materno` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `telefono` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `direccion` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `usuario_reg` int(11) DEFAULT NULL,
  `usuario_mod` int(11) DEFAULT NULL,
  `fecha_reg` date DEFAULT NULL,
  `fecha_mod` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='tabla de clientes';

CREATE TABLE `cliente_historial` (
  `id_cliente` int(11) NOT NULL,
  `naturaleza_cliente` varchar(45) CHARACTER SET utf8 NOT NULL,
  `id_tipo_cliente` int(11) NOT NULL,
  `dni_ruc` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `razon_social` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `nombre` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `apellido_paterno` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `apellido_materno` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `telefono` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `direccion` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `usuario_reg` int(11) DEFAULT NULL,
  `usuario_mod` int(11) DEFAULT NULL,
  `fecha_reg` date DEFAULT NULL,
  `fecha_mod` date DEFAULT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='tabla de clientes';

CREATE TABLE `comprobante_venta` (
  `id_comprobante` int(11) NOT NULL AUTO_INCREMENT,
  `numero_comprobante` varchar(45) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_reg` date DEFAULT NULL,
  PRIMARY KEY (`id_comprobante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `detalle_comprobante_venta` (
  `id_detalle_comprobante_venta` int(11) NOT NULL AUTO_INCREMENT,
  `numero_detalle` int(11) NOT NULL,
  `numero_comprobante` varchar(45) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` float NOT NULL,
  `precio` float NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_reg` date DEFAULT NULL,
  PRIMARY KEY (`id_detalle_comprobante_venta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `perfil` (
  `id_perfil` int(11) NOT NULL AUTO_INCREMENT,
  `codigo` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_perfil`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(45) NOT NULL,
  `marca` varchar(45) NOT NULL,
  `presentacion` varchar(45) NOT NULL,
  `medida` varchar(45) NOT NULL,
  `producto_insumo` varchar(45) NOT NULL,
  `pv1` float DEFAULT NULL,
  `pv2` float DEFAULT NULL,
  `pv3` float DEFAULT NULL,
  `existencia` float DEFAULT NULL,
  `foto` mediumblob,
  `type` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_reg` date DEFAULT NULL,
  `fecha_mod` date DEFAULT NULL,
  `usuario_reg` int(11) DEFAULT NULL,
  `usuario_mod` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `naturaleza_proveedor` varchar(45) CHARACTER SET utf8 NOT NULL,
  `dni_ruc` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `razon_social` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `nombres` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `apellido_paterno` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `apellido_materno` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `telefono` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `direccion` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `usuario_reg` int(11) DEFAULT NULL,
  `usuario_mod` int(11) DEFAULT NULL,
  `fecha_reg` date DEFAULT NULL,
  `fecha_mod` date DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='tabla de proveedores';

CREATE TABLE `proveedor_historial` (
  `id_proveedor` int(11) NOT NULL,
  `naturaleza_proveedor` varchar(45) CHARACTER SET utf8 NOT NULL,
  `dni_ruc` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `razon_social` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `nombre` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `apellido_paterno` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `apellido_materno` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `telefono` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `direccion` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `usuario_reg` int(11) DEFAULT NULL,
  `usuario_mod` int(11) DEFAULT NULL,
  `fecha_reg` date DEFAULT NULL,
  `fecha_mod` date DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='tabla de proveedores';

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(45) CHARACTER SET utf8 NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 NOT NULL,
  `dni` varchar(45) CHARACTER SET utf8 NOT NULL,
  `apellido_paterno` varchar(45) CHARACTER SET utf8 NOT NULL,
  `apellido_materno` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `nombres` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `telefono` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `estado` varchar(2) CHARACTER SET utf8 NOT NULL,
  `fecha_reg` date DEFAULT NULL,
  `fecha_mod` date DEFAULT NULL,
  `usuario_mod` int(11) DEFAULT NULL,
  `usuario_reg` int(11) DEFAULT NULL,
  `perfil_idperfil` int(11) NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario_perfil1_idx` (`perfil_idperfil`),
  CONSTRAINT `fk_usuario_perfil1` FOREIGN KEY (`perfil_idperfil`) REFERENCES `perfil` (`id_perfil`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci COMMENT='usuarios';

CREATE TABLE `usuario_historial` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(45) CHARACTER SET utf8 NOT NULL,
  `password` varchar(45) CHARACTER SET utf8 NOT NULL,
  `dni` varchar(45) CHARACTER SET utf8 NOT NULL,
  `apellido_paterno` varchar(45) CHARACTER SET utf8 NOT NULL,
  `apellido_materno` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `nombres` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `telefono` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  `estado` varchar(2) CHARACTER SET utf8 NOT NULL,
  `fecha_reg` date DEFAULT NULL,
  `fecha_mod` date DEFAULT NULL,
  `usuario_mod` int(11) DEFAULT NULL,
  `usuario_reg` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_danish_ci COMMENT='usuarios';

INSERT INTO `perfil` (`id_perfil`, `codigo`, `tipo`, `descripcion`, `estado`) VALUES
(1, 'ADMIN', 'ADMIN', 'ADMINISTRADOR', 'A'),
(2, 'USER', 'USER', 'USUARIO', 'A'),
(3, 'OPE', 'OPERADOR', 'OPERADOR', 'A');

INSERT INTO `usuario` (`id_usuario`, `usuario`, `password`, `dni`, `apellido_paterno`, `apellido_materno`, `nombres`, `telefono`, `estado`, `fecha_reg`, `fecha_mod`, `usuario_mod`, `usuario_reg`, `perfil_idperfil`) VALUES
(3, 'ferreteria', '120c11210a181006000e', '45206131', 'MALDONADO', 'BARRIOS', 'ALEXANDER', '333333333', 'A', '2017-08-15', '2017-08-18', 3, 1, 3);



delimiter //
CREATE PROCEDURE  GrabarVenta
(
in numero_detalle varchar(50),
in numero_comprobante varchar(50),
in id_producto int,
in cantidad float,
in precio float,
in id_usuario int,
in tipo varchar(50),
in id_cliente int
)
BEGIN
/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 
SELECT 1 as error; 
ROLLBACK; 
END; 

/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLWARNING 
BEGIN 
SELECT 1 as error; 
ROLLBACK; 
END; 

/*Inicia transaccion*/ 
START TRANSACTION; 
/*Primer INSERT datos ACTA*/ 
INSERT INTO comprobante_venta (numero_comprobante,tipo,fecha,id_cliente,estado,id_usuario,fecha_reg) VALUES(numero_comprobante,tipo,now(),id_cliente,'VENDIDO',id_usuario,now());
/*SECOND INSERT datos ACTA*/ 
INSERT INTO detalle_comprobante_venta(numero_detalle,numero_comprobante,id_producto,cantidad,precio,id_usuario,fecha_reg)VALUES(numero_detalle,numero_comprobante,id_producto,cantidad,precio,id_usuario,now());

/*Fin de transaccion*/ 
COMMIT; 


/*Mandamos 0 si todo salio bien*/ 
SELECT 0 as error; 

END
//

CREATE FUNCTION strSplit (cadena VARCHAR(255), delimitador VARCHAR(12), posicion INT) RETURNS VARCHAR(255) 
BEGIN
     RETURN ltrim(replace(substring(substring_index(cadena, delimitador, posicion), length(substring_index(cadena, delimitador, posicion - 1)) + 1), delimitador, ''));
END


CREATE  PROCEDURE `test`(
in texto varchar(50)
)
begin
DECLARE prod float DEFAULT 0;
DECLARE v1 int DEFAULT 1;
WHILE v1 <= 2 DO
    SET prod = (SELECT strSplit (texto, '@', v1));
    INSERT INTO detalle_comprobante_venta(numero_detalle,numero_comprobante,id_producto,cantidad,precio,id_usuario,fecha_reg)VALUES(v1,'hola',1,prod,1,1,now());    
    SET v1 = v1+1;
  END WHILE;
END