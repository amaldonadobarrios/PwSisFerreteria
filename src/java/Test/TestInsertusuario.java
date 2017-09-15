/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import java.util.ArrayList;
import java.util.List;
import logica.LogicUsuario;
import model.dao.UsuarioDao;
import model.dao.impl.UsuarioDaoImpl;
import model.dto.Perfil;
import model.dto.Usuario;

/**
 *
 * @author FARID
 */
public class TestInsertusuario {
    
    
    public static void main(String[] args) throws Exception {
        
//        Perfil p = new Perfil();
//        p.setIdperfil(1);
//        
//        Usuario usuario = new Usuario();
//        usuario.setNombres("farid");
//        usuario.setApellidoPaterno("gamarra");
//        usuario.setApellidoMaterno("Floreano");
//        usuario.setDni("0123456");
//        usuario.setTelefonos("1111");
//        usuario.setUsuario("xxx");
//        usuario.setPassword("11");
//        usuario.setPerfil(p);
//        
//        System.out.println(usuario.toString());
//        
//        UsuarioDao dao = new UsuarioDaoImpl();
//        String resultado = dao.insertarUsuario(usuario);
//        
//        System.out.println("Test.TestInsertusuario.main() " + resultado);
        
        
        List<Usuario> usuario = new ArrayList();
        LogicUsuario usu=new LogicUsuario();
        usuario=usu.listarUsuarios();
        if (usuario!=null) {
            System.out.println("Test.TestInsertusuario.main() " + usuario.toString());
        }
        
    }
    
}
