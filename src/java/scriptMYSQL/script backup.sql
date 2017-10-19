DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `VerificarProduccion`(
in cantidadreglas int,
in cadena_cant_insumos varchar(1000),
in cadena_id_regla varchar(1000),
in cadena_id_producto varchar(1000),
in cadena_cantidad_produccion varchar(1000),
out veristock int,
out rpta int
)
BEGIN
DECLARE v1 INT DEFAULT 1;
DECLARE idregla int DEFAULT 0;
DECLARE cantinsumo int DEFAULT 0;
DECLARE idproducto int DEFAULT 0;
DECLARE cantproduccion double DEFAULT 0;
DECLARE v_id_produccion int;

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
CREATE TEMPORARY TABLE REQ_INSUMOS (id_insumo int, requerimiento double,existencias double);
CREATE TEMPORARY TABLE RESUMEN_REQ_INSUMOS (id_insumo int, requerimiento double,existencias double); 
/*Primer INSERT datos ACTA*/ 

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
/*Fin de transaccion*/ 
COMMIT; 
/*Mandamos 0 si todo salio bien*/ 
set rpta =1;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `errorProduccion`(in cantidadreglas int,
in cadena_cant_insumos varchar(1000),
in cadena_id_regla varchar(1000),
in cadena_id_producto varchar(1000),
in cadena_cantidad_produccion varchar(1000)
)
BEGIN
DECLARE cur_json varchar(1000);
DECLARE cur_json2 varchar(1000) default "";
DECLARE v1 INT DEFAULT 1;
DECLARE idregla int DEFAULT 0;
DECLARE cantinsumo int DEFAULT 0;
DECLARE idproducto int DEFAULT 0;
DECLARE cantproduccion double DEFAULT 0;



/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLEXCEPTION 
BEGIN 

ROLLBACK; 
END; 

/*Handler para error SQL*/ 
DECLARE EXIT HANDLER FOR SQLWARNING 
BEGIN 

ROLLBACK; 
END; 

/*Inicia transaccion*/ 
START TRANSACTION; 
/*Primer INSERT datos ACTA*/ 
CREATE TEMPORARY TABLE REQ_INSUMOS (id_insumo int, requerimiento double,existencias double);
CREATE TEMPORARY TABLE RESUMEN_REQ_INSUMOS (id_insumo int, requerimiento double,existencias double);

WHILE v1 <= cantidadreglas DO
SET idregla = (SELECT strSplit (cadena_id_regla, '@', v1));
SET idproducto = (SELECT strSplit (cadena_id_producto, '@', v1));
SET cantproduccion = (SELECT strSplit (cadena_cantidad_produccion, '@', v1));
SET cantinsumo = (SELECT strSplit (cadena_cant_insumos, '@', v1));
INSERT INTO  REQ_INSUMOS (select a.id_insumo,(a.cantidad *cantproduccion),b.existencia from detalle_regla_produccion a, producto b where a.id_regla=idregla and a.id_producto=idproducto and a.estado=1 and a.id_insumo=b.id_producto);
SET v1 = v1+1;
END WHILE;
SELECT id_insumo,sum(requerimiento) as requerimiento, existencias from REQ_INSUMOS group by id_insumo;


/*Fin de transaccion*/ 
COMMIT; 
/*Mandamos 0 si todo salio bien*/ 

END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `GrabarProduccion`(
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
