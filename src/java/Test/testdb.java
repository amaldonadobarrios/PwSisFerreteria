/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import util.Util;
import util.jdbc.ConectaDB;

/**
 *
 * @author Alexander
 */
public class testdb {
    public static void main(String[] args) throws SQLException {
        Util uti = new Util();
         ConectaDB CONEX = new ConectaDB();
        Connection cn = CONEX.getConnection();
        String sqlResult = "";
        String sqlResult1 = "";
        String sqlResult2 = "";
        try {
            sqlResult = uti.getLocalResource("/sql/selectUsuario.sql");
              } catch (Throwable ex) {
            System.out.println("ERROR DE AUTENTICACION " + ex);
        }

        if (cn != null) {
            System.out.println("existe");
            try {
                PreparedStatement ps = cn.prepareStatement(sqlResult);
                ResultSet rs = null;
                rs = ps.executeQuery();
                while (rs.next()) {
                    System.out.println(rs.getString(4));

                }
                } catch (Exception e) {
                System.out.println("error "+e);
            }
            } else {
            System.out.println("ERROR");
        }
    }
}
