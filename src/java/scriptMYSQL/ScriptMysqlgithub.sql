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
(1, 'ADM', 'ADMIN', 'ADMINISTRADOR', 'A'),
(2, 'SEC', 'SEC', 'USUARIO', 'A'),
(3, 'OPE', 'OPE', 'OPERADOR', 'A');

INSERT INTO `usuario` (`id_usuario`, `usuario`, `password`, `dni`, `apellido_paterno`, `apellido_materno`, `nombres`, `telefono`, `estado`, `fecha_reg`, `fecha_mod`, `usuario_mod`, `usuario_reg`, `perfil_idperfil`) VALUES
(3, 'ferreteria', '120c11210a181006000e', '45206131', 'MALDONADO', 'BARRIOS', 'ALEXANDER', '333333333', 'A', '2017-08-15', '2017-08-18', 3, 1, 3);

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
CREATE  PROCEDURE `GrabarCompra`(
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
out rpta int,
out id_compra varchar(100))
BEGIN
DECLARE v1 INT DEFAULT 1;
DECLARE prod int DEFAULT 0;
DECLARE sub double DEFAULT 0;
DECLARE cant double DEFAULT 0;
DECLARE v_id_comprobante int;
DECLARE v_existenciax double default 0;

/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 
set rpta =0;
set id_compra='ERROR';
ROLLBACK; 
END; 

/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLWARNING 
BEGIN 
set rpta =0;
set id_compra='ERROR';
ROLLBACK; 
END; 

/*Inicia transaccion*/ 
START TRANSACTION; 
/*Primer INSERT datos ACTA*/ 
INSERT INTO comprobante_compra (numero_comprobante,tipo,fecha,id_proveedor,estado,id_usuario,fecha_reg,total,igv,neto,items) VALUES(numero,tipocomprobante,fecha,proveedor,'COMPRADO',usuario,now(),FORMAT(total,2),FORMAT(igv, 2),FORMAT(neto, 2),registros);
SET v_id_comprobante =(SELECT LAST_INSERT_ID());
/*SECOND INSERT datos ACTA*/ 
WHILE v1 <= registros DO
SET prod = (SELECT strSplit (productox, '@', v1));
SET sub = (SELECT strSplit (subtotalX, '@', v1));
SET cant = (SELECT strSplit (cantidadx, '@', v1));
SET v_existenciax = (SELECT  existencia FROM producto where  id_producto = prod);
if (v_existenciax is null) then
set v_existenciax=0;
end if;
UPDATE producto SET existencia = (v_existenciax +cant), fecha_mod = now(), usuario_mod = usuario WHERE id_producto = prod;
INSERT INTO detalle_comprobante_compra(numero_detalle,numero_comprobante,id_producto,cantidad,subtotal,id_usuario,fecha_reg,estado,id_comprobante)VALUES(v1,numero,prod,FORMAT(cant, 2),FORMAT(sub, 2),usuario,now(),'COMPRADO',v_id_comprobante);    
    SET v1 = v1+1;
  END WHILE;
/*Fin de transaccion*/ 
COMMIT; 
/*Mandamos 0 si todo salio bien*/ 
set rpta =1;
set id_compra=v_id_comprobante;
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `GrabarVenta`(
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
SET v_id_comprobante =(SELECT LAST_INSERT_ID());
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
CREATE DEFINER=`root`@`localhost` PROCEDURE `select_producto`()
BEGIN
SELECT `producto`.`id_producto`,
    `producto`.`descripcion`,
    `producto`.`marca`,
    `producto`.`presentacion`,
    `producto`.`medida`,
    `producto`.`producto_insumo`,
    `producto`.`pv1`,
    `producto`.`pv2`,
    `producto`.`pv3`,
    `producto`.`existencia`,
    `producto`.`foto`,
    `producto`.`type`,
    `producto`.`estado`,
    `producto`.`fecha_reg`,
    `producto`.`fecha_mod`,
    `producto`.`usuario_reg`,
    `producto`.`usuario_mod`
FROM `dbferreteria`.`producto`;


END$$
DELIMITER ;


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ganancia_anual`(
in fecha1 date,
in fecha2 date)
BEGIN
select l.FECHA, (l.totalpormes-m.totalpormes) as ganancia_anual 
from 
(select  DATE_FORMAT(a.fecha, "%Y") AS FECHA, a.estado, SUM(a.total) as totalpormes from comprobante_venta a where  a.fecha BETWEEN fecha1 AND fecha2 and a.estado='VENDIDO' group by DATE_FORMAT(a.fecha, "%Y")) l ,
(select  DATE_FORMAT(b.fecha, "%Y") AS FECHA, b.estado, SUM(b.total) as totalpormes from comprobante_compra b where  b.fecha BETWEEN fecha1 AND fecha2 and b.estado='COMPRADO'group by DATE_FORMAT(b.fecha, "%Y")) m
where l.FECHA=m.FECHA;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `ganancia_mensual`(
in fecha1 date,
in fecha2 date
)
BEGIN
select l.FECHA, (l.totalpormes-m.totalpormes) as ganancia_mensual from
(select  DATE_FORMAT(z.fecha, "%m-%Y") AS FECHA, z.estado, SUM(z.total) as totalpormes
from 
(select a.fecha, a.total, a.estado from comprobante_venta a where  a.fecha BETWEEN fecha1 AND fecha2 and a.estado='VENDIDO'
union select b.fecha,b.total,b.estado from comprobante_compra b where  b.fecha BETWEEN fecha1 AND fecha2   and b.estado='COMPRADO') z
where z.estado='VENDIDO' group by DATE_FORMAT(z.fecha, "%m-%Y"),z.estado order by z.fecha asc) l ,(select  DATE_FORMAT(z.fecha, "%m-%Y") AS FECHA, z.estado, SUM(z.total) as totalpormes
from 
(select a.fecha, a.total, a.estado from comprobante_venta a where  a.fecha BETWEEN fecha1 AND fecha2 and a.estado='VENDIDO'
union select b.fecha,b.total,b.estado from comprobante_compra b where  b.fecha BETWEEN fecha1 AND fecha2 and b.estado='COMPRADO') z
 where z.estado='COMPRADO' group by DATE_FORMAT(z.fecha, "%m-%Y"),z.estado order by z.fecha asc) m
 where l.FECHA=m.FECHA;
 END$$
DELIMITER ;


CREATE TABLE `regla_produccion` (
  `id_regla` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `cantidad_insumo` int(11) NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `usuario_reg` int(11) NOT NULL,
  `usuario_mod` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL COMMENT '1= activo\n0= desactivado',
  PRIMARY KEY (`id_regla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla registro de reglas de produccion ';

CREATE TABLE `detalle_regla_produccion` (
  `id_detalle_regla` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) NOT NULL,
  `id_regla` int(11) NOT NULL,
  `id_insumo` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `fecha_mod` datetime DEFAULT NULL,
  `usuario_reg` int(11) NOT NULL,
  `usuario_mod` int(11) DEFAULT NULL,
  `estado` int(11) NOT NULL COMMENT '1 = activo\n0= desactivado',
  PRIMARY KEY (`id_detalle_regla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla de detalle de reglas de produccion , insumos necesarios para fabircacion de un producto';


DELIMITER $$
CREATE  PROCEDURE `GrabarRegla`(
in idproducto int,
in idusuario int, 
in nroInsumos int,
in cadena_id_insumo varchar(1000),
in cadena_cantidad varchar(1000),
out rpta int)
BEGIN
DECLARE v1 INT DEFAULT 1;
DECLARE insu int DEFAULT 0;
DECLARE cant double DEFAULT 0;
DECLARE v_id_regla int;

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
INSERT INTO regla_produccion (id_producto,cantidad_insumo,fecha_reg,usuario_reg,estado)
VALUES
(idproducto,nroInsumos,now(),idusuario,1);
SET v_id_regla =(SELECT LAST_INSERT_ID());
/*SECOND INSERT datos ACTA*/ 
WHILE v1 <= nroInsumos DO
SET insu = (SELECT strSplit (cadena_id_insumo, '@', v1));
SET cant = (SELECT strSplit (cadena_cantidad, '@', v1));
INSERT INTO detalle_regla_produccion(id_producto,id_regla,id_insumo,cantidad,fecha_reg,usuario_reg,estado)
VALUES
(idproducto,v_id_regla,insu,FORMAT(cant, 2),now(),idusuario,1);
SET v1 = v1+1;
END WHILE;
/*Fin de transaccion*/ 
COMMIT; 
/*Mandamos 0 si todo salio bien*/ 
set rpta =1;
END$$
DELIMITER ;

DELIMITER $$
CREATE  PROCEDURE `EliminarRegla`(
in idregla int,
in idproducto int,
out rpta int
)
BEGIN

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
 UPDATE regla_produccion set estado=0 where id_regla=idregla and id_producto=idproducto;
 UPDATE detalle_regla_produccion set estado=0 where id_regla=idregla and id_producto=idproducto;
/*Fin de transaccion*/ 
COMMIT; 
/*Mandamos 1 si todo salio bien*/ 
set rpta =1;

END$$
DELIMITER ;







CREATE TABLE `produccion` (
  `id_produccion` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_reg` datetime NOT NULL,
  `fecha` date DEFAULT NULL,
  `usuario_reg` int(11) DEFAULT NULL,
  `doc` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `numero` varchar(45) COLLATE utf8_spanish_ci DEFAULT NULL,
  `cantidad_reglas` int(11) DEFAULT NULL,
  `estado` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `detalle_produccion` (
  `id_detalle_produccion` int(11) NOT NULL AUTO_INCREMENT,
  `id_produccion` int(11) NOT NULL,
  `id_regla` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad_insumos` int(11) NOT NULL,
  `cantidad_produccion` double NOT NULL,
  `fecha_reg` datetime NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle_produccion`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

CREATE TABLE `descuento_produccion` (
  `id_produccion` int(11) DEFAULT NULL,
  `id_insumo` int(11) DEFAULT NULL,
  `requerimiento` double DEFAULT NULL,
  `existencias` double DEFAULT NULL,
  `inventario` double DEFAULT NULL,
  `fecha_reg` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;


DELIMITER $$
CREATE  PROCEDURE `GrabarProduccion`(
in cantidadreglas int,
in fecha_doc date,
in documento varchar(45),
in numero_doc varchar(45),
in idusuario int, 
in cadena_cant_insumos varchar(1000),
in cadena_id_regla varchar(1000),
in cadena_id_producto varchar(1000),
in cadena_cantidad_produccion varchar(1000),
out rpta int,
out veristock int,
out idproduccion int,
out requerimientos varchar(1000)
)
BEGIN
DECLARE cur_json varchar(1000);
DECLARE cur_json2 varchar(1000) default "";
DECLARE v1 INT DEFAULT 1;
DECLARE idregla int DEFAULT 0;
DECLARE cantinsumo int DEFAULT 0;
DECLARE idproducto int DEFAULT 0;
DECLARE cantproduccion double DEFAULT 0;
DECLARE v_id_produccion int;

DECLARE _START INTEGER default 0;
DECLARE _LIMIT INTEGER default 1;
DECLARE _SIZEREQ INTEGER default 0;

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
CREATE TEMPORARY TABLE REQ_INSUMOS (id_insumo int, requerimiento double,existencias double);
CREATE TEMPORARY TABLE RESUMEN_REQ_INSUMOS (id_insumo int, requerimiento double,existencias double);
INSERT INTO produccion (fecha_reg,fecha,usuario_reg,doc,numero,cantidad_reglas,estado)VALUES(now(),fecha_doc,idusuario,documento,numero_doc,cantidadreglas,1);
SET v_id_produccion =(SELECT LAST_INSERT_ID());
set idproduccion=v_id_produccion;
WHILE v1 <= cantidadreglas DO
SET idregla = (SELECT strSplit (cadena_id_regla, '@', v1));
SET idproducto = (SELECT strSplit (cadena_id_producto, '@', v1));
SET cantproduccion = (SELECT strSplit (cadena_cantidad_produccion, '@', v1));
SET cantinsumo = (SELECT strSplit (cadena_cant_insumos, '@', v1));
INSERT INTO  REQ_INSUMOS (select a.id_insumo,(a.cantidad *cantproduccion),b.existencia from detalle_regla_produccion a, producto b where a.id_regla=idregla and a.id_producto=idproducto and a.estado=1 and a.id_insumo=b.id_producto);
SET v1 = v1+1;
END WHILE;
INSERT INTO  RESUMEN_REQ_INSUMOS (SELECT id_insumo,sum(requerimiento), existencias from REQ_INSUMOS group by id_insumo);
set veristock=(select count(id_insumo) from RESUMEN_REQ_INSUMOS where existencias<requerimiento);
set _SIZEREQ=(select count(id_insumo) from RESUMEN_REQ_INSUMOS where existencias<requerimiento);
SET _LIMIT=1;
WHILE _START <_SIZEREQ DO
Set cur_json=(select concat('El insumo : ',b.descripcion,' ',b.marca,' requiere de : ',FORMAT(a.requerimiento,2),' ',b.medida,' Pero existe en inventario: ',FORMAT(a.existencias,2),' ',b.medida,'\n') from RESUMEN_REQ_INSUMOS a, producto b where a.existencias<a.requerimiento and a.id_insumo=b.id_producto limit _START,_LIMIT);
set cur_json2= concat(cur_json2,cur_json);
SET _START = _START+1;
SET _LIMIT=_LIMIT+1;
END WHILE;
set requerimientos=cur_json2;
if(veristock>0)
then rollback;
end if;

UPDATE producto INNER JOIN RESUMEN_REQ_INSUMOS on producto.id_producto=RESUMEN_REQ_INSUMOS.id_insumo SET producto.existencia = producto.existencia - RESUMEN_REQ_INSUMOS.requerimiento, producto.fecha_mod = now(), producto.usuario_mod = idusuario;

SET v1 = 1;
WHILE v1 <= cantidadreglas DO
SET idregla = (SELECT strSplit (cadena_id_regla, '@', v1));
SET cantinsumo = (SELECT strSplit (cadena_cant_insumos, '@', v1));
SET idproducto = (SELECT strSplit (cadena_id_producto, '@', v1));
SET cantproduccion = (SELECT strSplit (cadena_cantidad_produccion, '@', v1));
UPDATE producto set existencia = existencia + cantproduccion, fecha_mod = now(), usuario_mod = idusuario WHERE id_producto=idproducto;
INSERT INTO detalle_produccion (id_produccion,id_regla,id_producto,cantidad_insumos,cantidad_produccion,fecha_reg,estado)
VALUES (v_id_produccion,idregla,idproducto,cantinsumo,cantproduccion,now(),1);
SET v1 = v1+1;
END WHILE;
INSERT INTO descuento_produccion (SELECT v_id_produccion as id_produccion ,id_insumo,requerimiento, existencias  ,(existencias-requerimiento) as inventario,now() as fecha_reg from RESUMEN_REQ_INSUMOS);
/*Fin de transaccion*/ 
COMMIT; 
/*Mandamos 0 si todo salio bien*/ 
set rpta =1;
END$$
DELIMITER ;


DELIMITER $$
CREATE  PROCEDURE `EliminarProduccion`(
in id int,
out rpta int
)
BEGIN
DECLARE fin INTEGER DEFAULT 0;
DECLARE finx INTEGER DEFAULT 0;
DECLARE v_id_produccion int;
DECLARE id_prod int;
DECLARE cant double;
DECLARE v_id_produ int;
DECLARE id_produc int;
DECLARE canti double;
DECLARE v_existencia double;
DECLARE v_existenciainsumo double;
DECLARE cur_produccion CURSOR FOR SELECT id_produccion ,id_producto,cantidad_produccion FROM detalle_produccion where id_produccion=id and estado=1;
DECLARE cur_descuento CURSOR FOR SELECT id_produccion, id_insumo, requerimiento FROM descuento_produccion where  id_produccion=id;
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
OPEN cur_descuento;
 read_loop: LOOP
    FETCH cur_descuento INTO v_id_produ,id_produc, canti;
   IF fin = 1 THEN
       LEAVE read_loop;
    END IF;
	SET v_existenciainsumo= (select existencia from producto where id_producto=id_produc);
	UPDATE producto SET existencia =v_existenciainsumo+canti  WHERE id_producto=id_produc;
  END LOOP;
 CLOSE cur_descuento;
 
 set fin=0;
OPEN cur_produccion;
 read_loop: LOOP
    FETCH cur_produccion INTO v_id_produccion,id_prod, cant;
   IF fin = 1 THEN
       LEAVE read_loop;
    END IF;
	SET v_existencia= (select existencia from producto where id_producto=id_prod);
	UPDATE producto SET existencia =v_existencia-cant  WHERE id_producto=id_prod;
    UPDATE detalle_produccion SET estado =0  WHERE id_produccion=v_id_produccion;
  END LOOP;
 CLOSE cur_produccion;
 UPDATE produccion set estado=0 where id_produccion=id;
/*Fin de transaccion*/ 
COMMIT; 
/*Mandamos 1 si todo salio bien*/ 
set rpta =1;

END$$
DELIMITER ;
