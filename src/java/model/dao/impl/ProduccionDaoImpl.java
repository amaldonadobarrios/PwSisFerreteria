/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.dao.ProduccionDao;
import model.dto.ListaReglaProduccion;
import org.apache.log4j.Logger;
import util.Util;
import util.jdbc.ConectaDB;

/**
 *
 * @author 31424836
 */
public class ProduccionDaoImpl  implements ProduccionDao{
      final static Logger logger = Logger.getLogger(ProductoDaoImpl.class);
    Util uti = new Util();
    Connection cn = null;
    ConectaDB db = new ConectaDB();  

    @Override
    public List<ListaReglaProduccion> listarreglas() throws Exception {
        String sqlResult = "";
        List<ListaReglaProduccion> listTemp = null;

        try {
            cn = db.getConnection();
            sqlResult = uti.getLocalResource("/sql/selectProducto.sql");
        } catch (SQLException ex) {
            logger.error(ex);
            throw new Exception("Problemas de Conexion...");
        } catch (Throwable ex) {
            logger.error(ex);
            throw new Exception("Problemas del sistema...");
        }

        if (cn != null) {

            try {
                 PreparedStatement ps = cn.prepareStatement(sqlResult);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {

                    listTemp = new ArrayList<>();
                    ListaReglaProduccion temp;

                    // regresa el puntero al principio
                    rs.beforeFirst();
                    while (rs.next()) {

                        temp = new ListaReglaProduccion();
                       // temp.setId_producto(0);
                        listTemp.add(temp);

                    }
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

        return listTemp;
    }
}
