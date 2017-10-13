/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao;

import java.util.List;
import model.dto.ListaReglaProduccion;

/**
 *
 * @author 31424836
 */
public interface ProduccionDao {
    
    public List<ListaReglaProduccion> listarreglas() throws Exception;
    public boolean validarReglaProducto(int id_producto) throws  Exception;
    public String GrabarRegla(ListaReglaProduccion regla) throws Exception;
}
