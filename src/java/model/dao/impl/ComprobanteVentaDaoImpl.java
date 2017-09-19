/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import model.dao.ComprobanteVentaDao;
import model.dto.ComprobanteVenta;
import org.apache.log4j.Logger;
import util.DirDate;
import util.Util;
import util.jdbc.ConectaDB;

/**
 *
 * @author Alexander
 */
public class ComprobanteVentaDaoImpl implements ComprobanteVentaDao {

    final static Logger logger = Logger.getLogger(ClienteDaoImpl.class);
    Util uti = new Util();
    Connection cn = null;
    ConectaDB db = new ConectaDB();

    @Override
    public String GrabarVenta(ComprobanteVenta venta) throws Exception {
        String mensaje = null;
        String sqlResult = "";

        try {
            cn = db.getConnection();
            sqlResult = uti.getLocalResource("/sql/insertVenta.sql");
        } catch (SQLException ex) {
            logger.error(ex);
            throw new Exception("Problemas del sistema...");
        } catch (Throwable ex) {
            logger.error(ex);
        }

        if (cn != null) {

            try {

                CallableStatement ps = cn.prepareCall(sqlResult);
                String num=venta.getTipo() + "-" + venta.getNumero_comprobante() + "-" + DirDate.getInstance().getFechaYYYY();
                ps.setString(1,num);
                ps.setString(2, venta.getId_producto());
                ps.setString(3, venta.getCantidad());
                ps.setString(4, venta.getPrecio());
                ps.setInt(5, venta.getId_usuario());
                ps.setString(6, venta.getTipo());
                ps.setInt(7, venta.getId_cliente());
                ps.setInt(8, venta.getCantProductos());
                ps.execute();
                // devuelve el valor del parametro de salida del procedimiento
               int resultado = ps.getInt(9);
                if (resultado > 0) {
//                    cn.commit();
                    logger.info("OK");
                    mensaje = num;
                } else {
                    //cn.rollback();
                    mensaje = "NO OK";
                }

            } catch (SQLException e) {
                logger.error(e);
                throw new Exception("Problemas del sistema...");
            } finally {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    logger.error(ex);
                }
            }
        }

        return mensaje;
    }

}
