/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;

import util.BatEncriptador;

/**
 *
 * @author Alexander
 */
public class TestBatEncripta {
    public static void main(String[] args) {
        String clave="ferreteria";
        clave=BatEncriptador.getInstance().Encripta(clave);
        System.out.println("Test.TestBatEncripta.main()"+clave);
                
    }
}
