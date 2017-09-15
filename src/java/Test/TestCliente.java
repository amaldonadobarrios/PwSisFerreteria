/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import java.util.List;
import logica.LogicVenta;
import logica.grilla.LogicTablaCliente;
import model.dto.Cliente;

/**
 *
 * @author 31424836
 */
public class TestCliente {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws Exception {
        List<Cliente> cli=LogicVenta.getInstance().buscarclientexAPERAZ("flo");
        System.out.println("clientes:"+cli.size());
        String list=LogicTablaCliente.getInstance().construirGrillaBuscarCliente(cli);
        System.out.println(list);
    }
    
}
