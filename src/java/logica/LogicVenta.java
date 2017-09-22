/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package logica;

import com.google.gson.Gson;
import java.util.List;
import model.dao.ClienteDao;
import model.dao.ComprobanteVentaDao;
import model.dao.ProductoDao;
import model.dao.impl.ClienteDaoImpl;
import model.dao.impl.ComprobanteVentaDaoImpl;
import model.dao.impl.ProductoDaoImpl;
import model.dto.Cliente;
import model.dto.ComprobanteVenta;
import model.dto.Producto;

/**
 *
 * @author 31424836
 */
public class LogicVenta {

    private LogicVenta() {
    }

    public static LogicVenta getInstance() {
        return LogicVentaHolder.INSTANCE;
    }

    public boolean verificarNumComprobante(String numeradorcomprobante) {
        boolean estado = false;
        //numeradorcomprobante
        return estado;

    }

    private static class LogicVentaHolder {

        private static final LogicVenta INSTANCE = new LogicVenta();
    }

    public List<Cliente> buscarclientexDOC(String arg) throws Exception {
        List<Cliente> cli = null;
        ClienteDao dao = new ClienteDaoImpl();
        cli = dao.getClienteXdoc(arg);
        return cli;
    }

    public List<Cliente> buscarclientexAPERAZ(String arg) throws Exception {
        List<Cliente> cli = null;
        ClienteDao dao = new ClienteDaoImpl();
        cli = dao.getClienteXaperaz(arg.toUpperCase());
        return cli;
    }

    public String buscarClienteRegistrado(Cliente cli) throws Exception {
        String json = null;
        Cliente cl = null;
        ClienteDao dao = new ClienteDaoImpl();
        cl = dao.getClienteRegistrado(cli);
        if (cl != null) {
            Gson gson = new Gson();
            json = gson.toJson(cl);
        }
        return json;
    }

    public List<Producto> listarproductoscomboventa() throws Exception {
        List<Producto> list = null;
        ProductoDao dao = new ProductoDaoImpl();
        list = dao.listarproductoscomboventa();
        return list;
    }

    public String grabarVenta(ComprobanteVenta venta) throws Exception {
        String rpta = null;
        ComprobanteVentaDao dao = new ComprobanteVentaDaoImpl();
        rpta = dao.GrabarVenta(venta);
        return rpta;
    }
}
