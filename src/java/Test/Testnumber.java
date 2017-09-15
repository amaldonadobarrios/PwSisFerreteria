/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test;
import org.bolivia.qulqi.Qulqi;
import org.bolivia.qulqi.Qulqi$COIN;
import org.bolivia.qulqi.Qulqi$FLOATING;
import util.n2t;
/**
 *
 * @author Admin-amb
 */
public class Testnumber {
    public static void main(String[] args) {
        int numero=957;
        n2t letra=new n2t();
        String leer=letra.convertirLetras(numero);
        Qulqi qulqi = new Qulqi();
        qulqi.setDecimalPartVisible(true);//parte decimal .00
        qulqi.setCoin(Qulqi$COIN.nuevo_sol_peruano);//moneda
        qulqi.setFloating(Qulqi$FLOATING.COMMA);//punto flotante (.) o (,)
        String leerlib=qulqi.showMeTheMoney("284,56");
        System.out.println(leer);
          System.out.println(leerlib);
        
    }
    
}
