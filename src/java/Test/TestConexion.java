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
 * @author Admin-amb
 */
public class TestConexion {

    public static void main(String[] args) throws SQLException {

        Util uti = new Util();
        ConectaDB CONEX = new ConectaDB();
        Connection cn = CONEX.getConnection();
        String sqlResult = "";
        String sqlResult1 = "";
        String sqlResult2 = "";
        try {
            sqlResult = uti.getLocalResource("/sql/test.sql");
            sqlResult1 = uti.getLocalResource("/sql/insert.sql");
            sqlResult2 = uti.getLocalResource("/sql/update.sql");
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
                PreparedStatement ps1 = cn.prepareStatement(sqlResult1);
                int i = ps1.executeUpdate();
                if (i > 0) {
                    System.out.println(" INSERT  IS  OK");
                }

                PreparedStatement ps2 = cn.prepareStatement(sqlResult2);
                int h = ps2.executeUpdate();
                if (h > 0) {
                    System.out.println(" UPDATE  IS  OK");
                }
                
                cn.close();
            } catch (Exception e) {
                System.out.println("error "+e);
            }
        } else {
            System.out.println("ERROR");
        }

    }

}
