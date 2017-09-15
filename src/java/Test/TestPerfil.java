/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import java.util.List;
import model.dao.PerfilDao;
import model.dao.impl.PerfilDaoImpl;
import model.dto.Perfil;

/**
 *
 * @author FARID
 */
public class TestPerfil {

    public static void main(String[] args) {
//        
        try {
            PerfilDao dao = new PerfilDaoImpl();
            List<Perfil> lista =   dao.getPerfils();
            
            for (Perfil perfil : lista) {
                System.out.println(perfil.toString());
            }
            
        } catch (Exception ex) {
            System.out.println("Test.TestPerfil.main()" + ex.getMessage()) ;
        }

//        try {
//            PerfilDao dao = new PerfilDaoImpl();
//            Perfil perfil = dao.getPerfilId(4);
//
//            System.out.println(perfil.toString());
//
//        } catch (Exception ex) {
//            System.out.println("Test.TestPerfil.main()" + ex.getMessage());
//        }

    }

}
