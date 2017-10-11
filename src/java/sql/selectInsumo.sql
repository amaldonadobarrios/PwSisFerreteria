SELECT `producto`.`id_producto`,
    `producto`.`descripcion`,
    `producto`.`marca`,
    `producto`.`presentacion`,
    `producto`.`medida`,
    `producto`.`producto_insumo`,
    `producto`.`existencia`,
    `producto`.`estado`,
    `producto`.`fecha_reg`,
    `producto`.`fecha_mod`,
    `producto`.`usuario_reg`,
    `producto`.`usuario_mod`
FROM `producto` where estado='A' and producto_insumo='INSUMO' OR producto_insumo='PRODUCTO E INSUMO' ;