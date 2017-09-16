/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import com.mi.diredu.util.DirTexto;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.LogicCliente;
import logica.LogicProducto;
import logica.LogicVenta;
import logica.grilla.LogicTablaCliente;
import logica.grilla.LogicTablaVenta;
import model.dto.Cliente;
import model.dto.ListaVenta;
import model.dto.Producto;
import model.dto.Usuario;
import util.HtmlUtil;

/**
 *
 * @author 31424836
 */
public class ServVenta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int respuesta = this.validaSesion(request, response);
        if (respuesta == 1) {
            try {
                String evento = null;
                evento = request.getParameter("evento");
                if (evento != null) {
                    if (evento.equals("BuscarClientexDOC")) {
                        BuscarClientexDOC(request, response);
                    } else if (evento.equals("BuscarClientexAPERAZ")) {
                        BuscarClientexAPERAZ(request, response);
                    } else if (evento.equals("RegistrarClienteAJAX")) {
                        RegistrarClienteAJAX(request, response);
                    } else if (evento.equals("AñadirProductoAJAX")) {
                        System.out.println("control.ServVenta.processRequest()" + " SERVLET VENTA - AGREGANDO PRODUCTO");
                        AñadirProductoAJAX(request, response);
                    } else if (evento.equals("EliminarProductoAJAX")) {
                        System.out.println("control.ServVenta.processRequest()" + " SERVLET VENTA - ELIMINANDO PRODUCTO");
                        EliminarProductoAJAX(request, response);
                    } else if (evento.equals("RegistrarVentaAJAX")) {
                        System.out.println("control.ServVenta.processRequest()"+ "REGISTRANDO VENTA");
                        RegistrarVentaAJAX(request, response);
                    }

                }
            } catch (Exception ex) {
                Logger.getLogger(ServVenta.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private int validaSesion(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int respuesta = 1;

        HttpSession session = request.getSession();

        if (session != null) {

            Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");
            String ID = (String) session.getAttribute("ID");

            if (ID == null || usuarioSesion == null || !ID.equals(session.getId())) {
                respuesta = 0;
                session.invalidate();
                request.setAttribute("msg", "Sesion Expirada");
                HtmlUtil.getInstance().escrituraHTML(response, "NOSESION");

            }

        } else {
            respuesta = 0;
            session.invalidate();
            request.setAttribute("msg", "Sesion Expirada");
            HtmlUtil.getInstance().escrituraHTML(response, "NOSESION");
        }

        return respuesta;
    }

    private void forwar(String templatejsp, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher(templatejsp).forward(request, response);
    }

    private List<Cliente> BuscarClientexDOC(String arg) throws Exception {
        List<Cliente> cli = null;
        cli = LogicVenta.getInstance().buscarclientexDOC(arg);
        return cli;
    }

    private List<Cliente> BuscarClientexAPERAZ(String parametro_busq) throws Exception {
        List<Cliente> cli = null;
        cli = LogicVenta.getInstance().buscarclientexAPERAZ(parametro_busq);
        return cli;
    }

    private void BuscarClientexDOC(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String parametro_busq = request.getParameter("parametro").trim();
        List<Cliente> lstcli = null;
        lstcli = BuscarClientexDOC(parametro_busq);
        String respuestaHTML = null;
        respuestaHTML = LogicTablaCliente.getInstance().construirGrillaBuscarCliente(lstcli);
        HtmlUtil.getInstance().escrituraHTML(response, respuestaHTML);
    }

    private void BuscarClientexAPERAZ(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String parametro_busq = request.getParameter("parametro").trim();
        List<Cliente> lstcli = null;
        lstcli = BuscarClientexAPERAZ(parametro_busq);
        String respuestaHTML = null;
        respuestaHTML = LogicTablaCliente.getInstance().construirGrillaBuscarCliente(lstcli);
        HtmlUtil.getInstance().escrituraHTML(response, respuestaHTML);
    }

    private void RegistrarClienteAJAX(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String mensaje = "";
        String naturaleza = request.getParameter("naturaleza");
        String tipo = request.getParameter("tipo");
        int tipoCliente = Integer.parseInt(tipo);
        String ruc = request.getParameter("ruc");
        String dni = request.getParameter("dni");
        String RazonSocial = request.getParameter("RazonSocial");
        String nombres = request.getParameter("nombres");
        String paterno = request.getParameter("paterno");
        String materno = request.getParameter("materno");
        String telefono = request.getParameter("telefono");
        String direccion = request.getParameter("direccion");
        String correo = request.getParameter("correo");
        HttpSession session = request.getSession();
        Usuario usuario = usuario = new Usuario();
        usuario = (Usuario) session.getAttribute("usuario");
        int usuario_reg = usuario.getIdUsuario();

        Cliente cli = null;
        if (naturaleza.equals("P")) {
            cli = new Cliente();
            cli.setApellidoMaterno(DirTexto.getInstance().cambiarFormatoUTF8(materno.toUpperCase()));
            cli.setApellidoPaterno(DirTexto.getInstance().cambiarFormatoUTF8(paterno.toUpperCase()));
            cli.setDireccion(DirTexto.getInstance().cambiarFormatoUTF8(direccion.toUpperCase()));
            cli.setEmail(DirTexto.getInstance().cambiarFormatoUTF8(correo));
            cli.setDniRuc(dni);
            cli.setIdTipoCliente(tipoCliente);
            cli.setNaturalezaCliente(naturaleza);
            cli.setNombres(DirTexto.getInstance().cambiarFormatoUTF8(nombres.toUpperCase()));
            cli.setRazonSocial("");
            cli.setTelefono(telefono);
            cli.setUsuarioReg(usuario_reg);
        } else if (naturaleza.equals("E")) {
            cli = new Cliente();
            cli.setApellidoMaterno("");
            cli.setApellidoPaterno("");
            cli.setDireccion(DirTexto.getInstance().cambiarFormatoUTF8(direccion.toUpperCase()));
            cli.setEmail(DirTexto.getInstance().cambiarFormatoUTF8(correo));
            cli.setDniRuc(ruc);
            cli.setIdTipoCliente(tipoCliente);
            cli.setNaturalezaCliente(naturaleza);
            cli.setNombres("");
            cli.setRazonSocial(DirTexto.getInstance().cambiarFormatoUTF8(RazonSocial.toUpperCase()));
            cli.setTelefono(telefono);
            cli.setUsuarioReg(usuario_reg);
        }
        String msg = LogicCliente.getInstance().registrarCliente(cli);
        if (msg == "OK") {
            mensaje = "Cliente registrado exitosamente";
            String cliente = Consultarclientegrabado(cli);
            mensaje = mensaje + "%" + cliente;
        } else {
            mensaje = "Error, no se registró el Cliente";
        }
        HtmlUtil.getInstance().escrituraHTML(response, mensaje);
    }

    private String Consultarclientegrabado(Cliente cli) throws Exception {
        String cliente = null;
        cliente = LogicVenta.getInstance().buscarClienteRegistrado(cli);
        return cliente;
    }

    private void AñadirProductoAJAX(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        List<ListaVenta> listatemp = new ArrayList<ListaVenta>();
        List<ListaVenta> lista = new ArrayList<ListaVenta>();
        try {
            lista = (List<ListaVenta>) session.getAttribute("listaventa");
        } catch (Exception e) {
        }
        if (lista != null) {
            listatemp = lista;

        }
        String idCliente = request.getParameter("id_cliente");
        String idtipocliente = request.getParameter("idtipocliente");
        String cantidad = request.getParameter("cantidad");
        String precio = request.getParameter("precio");
        String id_producto = request.getParameter("id_producto");
        int id_prod = Integer.parseInt(id_producto);
        String respuesta = null;
        ListaVenta objlista = new ListaVenta();
        Producto prod = LogicProducto.getInstance().buscarProductoID(id_prod);
        objlista.setDescripcion(prod.getDescripcion());
        objlista.setMarca(prod.getMarca());
        objlista.setPresentacion(prod.getPresentacion());
        objlista.setIdtipocliente(idtipocliente);
        objlista.setId_cliente(idCliente);
        objlista.setCantidad(Float.parseFloat(cantidad));
        objlista.setPrecio(Float.parseFloat(precio));
        objlista.setCantidad(Float.parseFloat(cantidad));
        objlista.setId_producto(id_producto);
        objlista.setSubtotal((Float.parseFloat(cantidad) * Float.parseFloat(precio)));
        boolean validacion = false;
        String msg = null;
        float subtotal = 0;
        if (listatemp != null) {
            if (listatemp.size() > 0) {
                for (ListaVenta listaVenta : listatemp) {
                    if (listaVenta.getId_cliente().equals(objlista.getId_cliente())) {
                        validacion = true;
                    } else {
                        validacion = false;
                        msg = "ERROR%" + subtotal + "%HA CAMBIADO CLIENTE DURANTE LA TRANSACCION";
                        HtmlUtil.getInstance().escrituraHTML(response, msg);
                        return;
                    }
                    if (listaVenta.getId_producto().trim().equals(objlista.getId_producto().trim())) {
                        validacion = false;
                        msg = "ERROR%" + subtotal + "%EL PRODUCTO YA SE ENCUENTRA REGISTRADO";
                        HtmlUtil.getInstance().escrituraHTML(response, msg);
                        return;
                    } else {
                        validacion = true;
                    }
                }
            }

        }

        System.out.println("control.ServVenta.AñadirProductoAJAX()" + objlista.toString());
        listatemp.add(objlista);
        for (ListaVenta listaVenta : listatemp) {
            subtotal = subtotal + listaVenta.getSubtotal();
        }
        session.setAttribute("listaventa", listatemp);
        respuesta = LogicTablaVenta.getInstance().construirGrillaVenta(listatemp);
        HtmlUtil.getInstance().escrituraHTML(response, "OK%" + subtotal + "%" + respuesta);
    }

    private void EliminarProductoAJAX(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        float subtotal = 0;
        String item = request.getParameter("item");
        List<ListaVenta> listatemp = new ArrayList<ListaVenta>();
        List<ListaVenta> lista = new ArrayList<ListaVenta>();
        try {
            lista = (List<ListaVenta>) session.getAttribute("listaventa");
        } catch (Exception e) {
        }
        if (lista != null) {
            listatemp = lista;

        }
        listatemp.remove(Integer.parseInt(item));
        session.setAttribute("listaventa", listatemp);
        String respuesta = LogicTablaVenta.getInstance().construirGrillaVenta(listatemp);
        for (ListaVenta listaVenta : listatemp) {
            subtotal = subtotal + listaVenta.getSubtotal();
        }
        HtmlUtil.getInstance().escrituraHTML(response, "OK%" + subtotal + "%" + respuesta);

    }

    private void RegistrarVentaAJAX(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String doc = request.getParameter("documento");
        String numero = request.getParameter("numero");
        String id_cliente = request.getParameter("id_cliente");
        String total = request.getParameter("total");
        List<ListaVenta> listatemp = new ArrayList<ListaVenta>();
        List<ListaVenta> lista = new ArrayList<ListaVenta>();
        try {
            lista = (List<ListaVenta>) session.getAttribute("listaventa");
        } catch (Exception e) {
        }
        if (lista != null) {
            listatemp = lista;
        }
        //verificar cliente
        String msg;
        if (listatemp.size() > 0) {
            for (ListaVenta listaVenta : listatemp) {
                if (listaVenta.getId_cliente().equals(id_cliente)) {
                    Producto prod = new Producto();
                    prod = LogicProducto.getInstance().buscarProductoID(Integer.parseInt(listaVenta.getId_producto()));
                    if (prod.getExistencia() >= listaVenta.getCantidad()) {
                        
                    } else {
                        msg = "ERROR%" + "NO SE CUENTA CON SUFICIENTES PRODUCTOS: " + listaVenta.getDescripcion().concat(" ").concat(listaVenta.getMarca());
                        HtmlUtil.getInstance().escrituraHTML(response, msg);
                        return;
                    }
                } else {
                    msg = "ERROR%" + "HA CAMBIADO CLIENTE DURANTE LA TRANSACCION";
                    HtmlUtil.getInstance().escrituraHTML(response, msg);
                    return;
                }
            }
        }
        grabarComprobante();
        grabardetalle_comprobante();
        
        msg = "OK%" + "VALIDADO ";
        HtmlUtil.getInstance().escrituraHTML(response, msg);

    }

    private void grabarComprobante() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void grabardetalle_comprobante() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
