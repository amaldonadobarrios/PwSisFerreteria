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
  `id_usuario` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `total` double NOT NULL,
  `igv` double NOT NULL,
  `neto` double NOT NULL,
  `items` int(11) NOT NULL,
  PRIMARY KEY (`id_comprobante`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

CREATE TABLE `detalle_comprobante_venta` (
  `id_detalle_comprobante_venta` int(11) NOT NULL AUTO_INCREMENT,
  `numero_detalle` int(11) NOT NULL,
  `numero_comprobante` varchar(45) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `precio` double NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `estado` varchar(45) NOT NULL DEFAULT 'VENDIDO',
  `id_comprobante` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_comprobante_venta`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;




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
  `pv1` double DEFAULT NULL,
  `pv2` double DEFAULT NULL,
  `pv3` double DEFAULT NULL,
  `existencia` double DEFAULT NULL,
  `foto` mediumblob,
  `type` varchar(45) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `fecha_mod` datetime DEFAULT NULL,
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


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GrabarVenta`(
in numero varchar(45),
in productox varchar(1000), 
in cantidadx varchar(1000),
in preciox varchar(1000),
in usuario int,
in tipocomprobante varchar(45),
in cliente int,
in registros int,
in total double,
in igv double,
in neto double,
out rpta int)
BEGIN
DECLARE v1 INT DEFAULT 1;
DECLARE prod int DEFAULT 0;
DECLARE prec float DEFAULT 0;
DECLARE cant float DEFAULT 0;
DECLARE v_id_comprobante int;

/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 
set rpta =0;
ROLLBACK; 
END; 

/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLWARNING 
BEGIN 
set rpta =0;
ROLLBACK; 
END; 

/*Inicia transaccion*/ 
START TRANSACTION; 
/*Primer INSERT datos ACTA*/ 
INSERT INTO comprobante_venta (numero_comprobante,tipo,fecha,id_cliente,estado,id_usuario,fecha_reg,total,igv,neto,items) VALUES(numero,tipocomprobante,now(),cliente,'VENDIDO',usuario,now(),FORMAT(total,2),FORMAT(igv, 2),FORMAT(neto, 2),registros);
SET v_id_comprobante =(select id_comprobante from comprobante_venta where numero_comprobante=numero and estado='VENDIDO' and items=registros and FORMAT(total, 2) limit 1 );
/*SECOND INSERT datos ACTA*/ 
WHILE v1 <= registros DO
SET prod = (SELECT strSplit (productox, '@', v1));
SET prec = (SELECT strSplit (preciox, '@', v1));
SET cant = (SELECT strSplit (cantidadx, '@', v1));
UPDATE producto SET existencia = (existencia -cant), fecha_mod = now(), usuario_mod = usuario WHERE id_producto = prod;
INSERT INTO detalle_comprobante_venta(numero_detalle,numero_comprobante,id_producto,cantidad,precio,id_usuario,fecha_reg,estado,id_comprobante)VALUES(v1,numero,prod,FORMAT(cant, 2),FORMAT(prec, 2),usuario,now(),'VENDIDO',v_id_comprobante);    
    SET v1 = v1+1;
  END WHILE;
/*Fin de transaccion*/ 
COMMIT; 
/*Mandamos 0 si todo salio bien*/ 
set rpta =1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarVenta`(
in numero varchar(45),
in id int,
out rpta int
)
BEGIN
DECLARE fin INTEGER DEFAULT 0;
DECLARE v_id_detalle_venta int;
DECLARE id_prod int;
DECLARE cant double;
DECLARE v_existencia double;
DECLARE cur1 CURSOR FOR SELECT id_detalle_comprobante_venta,id_producto,cantidad FROM detalle_comprobante_venta where numero_comprobante=numero and estado='VENDIDO';
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 
set rpta =0;
ROLLBACK; 
END; 

/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLWARNING 
BEGIN 
set rpta =0;
ROLLBACK; 
END; 

/*Inicia transaccion*/ 
START TRANSACTION; 
OPEN cur1;
 read_loop: LOOP
    FETCH cur1 INTO v_id_detalle_venta,id_prod, cant;
   IF fin = 1 THEN
       LEAVE read_loop;
    END IF;
	SET v_existencia= (select existencia from producto where id_producto=id_prod);
	UPDATE producto SET existencia =v_existencia+cant  WHERE id_producto=id_prod;
    UPDATE detalle_comprobante_venta SET estado ='ELIMINADO'  WHERE id_detalle_comprobante_venta=v_id_detalle_venta;
  END LOOP;
 CLOSE cur1;
 UPDATE comprobante_venta set estado='ELIMINADO' where id_comprobante=id and numero_comprobante=numero;
/*Fin de transaccion*/ 
COMMIT; 
/*Mandamos 1 si todo salio bien*/ 
set rpta =1;

END$$
DELIMITER ;




DELIMITER $$
CREATE DEFINER=`root`@`localhost` FUNCTION `strSplit`(cadena VARCHAR(255), delimitador VARCHAR(12), posicion INT) RETURNS varchar(255) CHARSET utf8
BEGIN
     RETURN ltrim(replace(substring(substring_index(cadena, delimitador, posicion), length(substring_index(cadena, delimitador, posicion - 1)) + 1), delimitador, ''));
END$$
DELIMITER ;


CREATE TABLE `comprobante_compra` (
  `id_comprobante` int(11) NOT NULL AUTO_INCREMENT,
  `numero_comprobante` varchar(45) NOT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `id_proveedor` int(11) DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `total` double NOT NULL,
  `igv` double NOT NULL,
  `neto` double NOT NULL,
  `items` int(11) NOT NULL,
  PRIMARY KEY (`id_comprobante`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `detalle_comprobante_compra` (
  `id_detalle_comprobante_compra` int(11) NOT NULL AUTO_INCREMENT,
  `numero_detalle` int(11) NOT NULL,
  `numero_comprobante` varchar(45) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `subtotal` double NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL,
  `estado` varchar(45) NOT NULL DEFAULT 'VENDIDO',
  `id_comprobante` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_comprobante_compra`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `EliminarCompra`(
in numero varchar(45),
in id int,
out rpta int
)
BEGIN
DECLARE fin INTEGER DEFAULT 0;
DECLARE v_id_detalle_compra int;
DECLARE id_prod int;
DECLARE cant double;
DECLARE v_existencia double;
DECLARE cur1 CURSOR FOR SELECT id_detalle_comprobante_compra,id_producto,cantidad FROM detalle_comprobante_compra where numero_comprobante=numero and estado='COMPRADO';
DECLARE CONTINUE HANDLER FOR NOT FOUND SET fin=1;
/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 
set rpta =0;
ROLLBACK; 
END; 

/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLWARNING 
BEGIN 
set rpta =0;
ROLLBACK; 
END; 

/*Inicia transaccion*/ 
START TRANSACTION; 
OPEN cur1;
 read_loop: LOOP
    FETCH cur1 INTO v_id_detalle_compra,id_prod, cant;
   IF fin = 1 THEN
       LEAVE read_loop;
    END IF;
	SET v_existencia= (select existencia from producto where id_producto=id_prod);
	UPDATE producto SET existencia =v_existencia-cant  WHERE id_producto=id_prod;
    UPDATE detalle_comprobante_compra SET estado ='ELIMINADO'  WHERE id_detalle_comprobante_compra=v_id_detalle_compra;
  END LOOP;
 CLOSE cur1;
 UPDATE comprobante_compra set estado='ELIMINADO' where id_comprobante=id and numero_comprobante=numero;
/*Fin de transaccion*/ 
COMMIT; 
/*Mandamos 1 si todo salio bien*/ 
set rpta =1;

END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GrabarCompra`(
in numero varchar(45),
in productox varchar(1000), 
in cantidadx varchar(1000),
in subtotalX varchar(1000),
in usuario int,
in tipocomprobante varchar(45),
in proveedor int,
in registros int,
in total double,
in igv double,
in neto double,
in fecha date,
out rpta int)
BEGIN
DECLARE v1 INT DEFAULT 1;
DECLARE prod int DEFAULT 0;
DECLARE sub float DEFAULT 0;
DECLARE cant float DEFAULT 0;
DECLARE v_id_comprobante int;

/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 
set rpta =0;
ROLLBACK; 
END; 

/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLWARNING 
BEGIN 
set rpta =0;
ROLLBACK; 
END; 

/*Inicia transaccion*/ 
START TRANSACTION; 
/*Primer INSERT datos ACTA*/ 
INSERT INTO comprobante_compra (numero_comprobante,tipo,fecha,id_proveedor,estado,id_usuario,fecha_reg,total,igv,neto,items) VALUES(numero,tipocomprobante,fecha,proveedor,'COMPRADO',usuario,now(),FORMAT(total,2),FORMAT(igv, 2),FORMAT(neto, 2),registros);
SET v_id_comprobante =(select id_comprobante from comprobante_compra where numero_comprobante=numero and estado='COMPRADO' and items=registros and FORMAT(total, 2) limit 1 );
/*SECOND INSERT datos ACTA*/ 
WHILE v1 <= registros DO
SET prod = (SELECT strSplit (productox, '@', v1));
SET sub = (SELECT strSplit (subtotalX, '@', v1));
SET cant = (SELECT strSplit (cantidadx, '@', v1));
UPDATE producto SET existencia = (existencia +cant), fecha_mod = now(), usuario_mod = usuario WHERE id_producto = prod;
INSERT INTO detalle_comprobante_compra(numero_detalle,numero_comprobante,id_producto,cantidad,subtotal,id_usuario,fecha_reg,estado,id_comprobante)VALUES(v1,numero,prod,FORMAT(cant, 2),FORMAT(sub, 2),usuario,now(),'COMPRADO',v_id_comprobante);    
    SET v1 = v1+1;
  END WHILE;
/*Fin de transaccion*/ 
COMMIT; 
/*Mandamos 0 si todo salio bien*/ 
set rpta =1;
END$$
DELIMITER ;



