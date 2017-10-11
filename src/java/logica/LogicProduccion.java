/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import java.util.List;
import model.dao.ProductoDao;
import model.dao.impl.ProductoDaoImpl;
import model.dto.Producto;

/**
 *
 * @author Alexander
 */
public class LogicProduccion {
    
    private LogicProduccion() {
    }
    
    public static LogicProduccion getInstance() {
        return LogicProduccionHolder.INSTANCE;
    }
    
    private static class LogicProduccionHolder {

        private static final LogicProduccion INSTANCE = new LogicProduccion();
    }
    
    public List<Producto> listarInsumos() throws Exception{
       List<Producto> lista=null;
       ProductoDao dao=new ProductoDaoImpl();
       lista=dao.listainsumos();
       return lista;
    }
     public List<Producto> listarProductoFinalLike(String parametro) throws Exception{
       List<Producto> lista=null;
       ProductoDao dao=new ProductoDaoImpl();
       lista=dao.listaProductosFinales(parametro);
       return lista;
    }
}
