select  DATE_FORMAT(fecha_reg, "%m-%Y") as intervalo,SUM(total) as totalpormes from comprobante_compra  where fecha_reg BETWEEN ? AND ? and estado='COMPRADO' group by DATE_FORMAT(fecha_reg, "%m-%Y") order by fecha_reg asc;