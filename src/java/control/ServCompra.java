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
import logica.LogicCompra;
import logica.LogicProducto;
import logica.LogicProveedor;
import logica.grilla.LogicTablaProveedor;
import logica.grilla.LogicTablaVenta;
import model.dto.ComprobanteCompra;
import model.dto.ListaVenta;
import model.dto.Producto;
import model.dto.Proveedor;
import model.dto.Usuario;
import util.DirDate;
import util.HtmlUtil;

/**
 *
 * @author 31424836
 */
public class ServCompra extends HttpServlet {

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
                    if (evento.equals("BuscarProveedorxDOC")) {
                        BuscarProveedorxDOC(request, response);
                    } else if (evento.equals("BuscarProveedorxAPERAZ")) {
                        BuscarProveedorxAPERAZ(request, response);
                    } else if (evento.equals("RegistrarProveedorAJAX")) {
                        RegistrarProveedorAJAX(request, response);
                    } else if (evento.equals("AñadirProductoAJAX")) {
                        System.out.println("control.ServVenta.processRequest()" + " SERVLET COMPRA - AGREGANDO PRODUCTO");
                        AñadirProductoAJAX(request, response);
                    } else if (evento.equals("EliminarProductoAJAX")) {
                        System.out.println("control.ServVenta.processRequest()" + " SERVLET COMPRA - ELIMINANDO PRODUCTO");
                        EliminarProductoAJAX(request, response);
                    } else if (evento.equals("RegistrarCompraJAX")) {
                        System.out.println("control.ServVenta.processRequest()" + "REGISTRANDO COMPRA");
                        RegistrarCompraJAX(request, response);
                    } else if (evento.equals("EliminarCompraAjax")) {
                        System.out.println("ELIMINAR COMPRA");
                        EliminarCompraAjax(request, response);
                    }
                }
            } catch (Exception ex) {
                Logger.getLogger(ServVenta.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

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

    private void BuscarProveedorxDOC(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String parametro_busq = request.getParameter("parametro").trim();
        List<Proveedor> lstcli = null;
        lstcli = BuscarProveedorxDOC(parametro_busq);
        String respuestaHTML = null;
        respuestaHTML = LogicTablaProveedor.getInstance().construirGrillaBuscarProveedor(lstcli);
        HtmlUtil.getInstance().escrituraHTML(response, respuestaHTML);
    }

    private void BuscarProveedorxAPERAZ(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String parametro_busq = request.getParameter("parametro").trim();
        List<Proveedor> lstcli = null;
        lstcli = BuscarProveedorxAPERAZ(parametro_busq);
        String respuestaHTML = null;
        respuestaHTML = LogicTablaProveedor.getInstance().construirGrillaBuscarProveedor(lstcli);
        HtmlUtil.getInstance().escrituraHTML(response, respuestaHTML);
    }

    private void AñadirProductoAJAX(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        List<ListaVenta> listatemp = new ArrayList<ListaVenta>();
        List<ListaVenta> lista = new ArrayList<ListaVenta>();
        try {
            lista = (List<ListaVenta>) session.getAttribute("listacompra");
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
        objlista.setCantidad(Double.parseDouble(cantidad));
        objlista.setPrecio(Double.parseDouble(precio));
        objlista.setCantidad(Double.parseDouble(cantidad));
        objlista.setId_producto(id_producto);
        objlista.setSubtotal((Double.parseDouble(cantidad) * Double.parseDouble(precio)));
        boolean validacion = false;
        String msg = null;
        double subtotal = 0;
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
        session.setAttribute("listacompra", listatemp);
        respuesta = LogicTablaVenta.getInstance().construirGrillaVenta(listatemp);
        HtmlUtil.getInstance().escrituraHTML(response, "OK%" + subtotal + "%" + respuesta);
    }

    private void EliminarProductoAJAX(HttpServletRequest request, HttpServletResponse response) {
       HttpSession session = request.getSession();
        double subtotal = 0;
        String item = request.getParameter("item");
        List<ListaVenta> listatemp = new ArrayList<ListaVenta>();
        List<ListaVenta> lista = new ArrayList<ListaVenta>();
        try {
            lista = (List<ListaVenta>) session.getAttribute("listacompra");
        } catch (Exception e) {
        }
        if (lista != null) {
            listatemp = lista;

        }
        listatemp.remove(Integer.parseInt(item));
        session.setAttribute("listacompra", listatemp);
        String respuesta = LogicTablaVenta.getInstance().construirGrillaVenta(listatemp);
        for (ListaVenta listaVenta : listatemp) {
            subtotal = subtotal + listaVenta.getSubtotal();
        }
        HtmlUtil.getInstance().escrituraHTML(response, "OK%" + subtotal + "%" + respuesta);

    }

    private void RegistrarProveedorAJAX(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String mensaje = "";
        String naturaleza = request.getParameter("naturaleza");
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

        Proveedor cli = null;
        if (naturaleza.equals("P")) {
            cli = new Proveedor();
            cli.setApellidoMaterno(DirTexto.getInstance().cambiarFormatoUTF8(materno.toUpperCase()));
            cli.setApellidoPaterno(DirTexto.getInstance().cambiarFormatoUTF8(paterno.toUpperCase()));
            cli.setDireccion(DirTexto.getInstance().cambiarFormatoUTF8(direccion.toUpperCase()));
            cli.setEmail(DirTexto.getInstance().cambiarFormatoUTF8(correo));
            cli.setDniRuc(dni);
            cli.setNaturalezaProveedor(naturaleza);
            cli.setNombres(DirTexto.getInstance().cambiarFormatoUTF8(nombres.toUpperCase()));
            cli.setRazonSocial("");
            cli.setTelefono(telefono);
            cli.setUsuarioReg(usuario_reg);
        } else if (naturaleza.equals("E")) {
            cli = new Proveedor();
            cli.setApellidoMaterno("");
            cli.setApellidoPaterno("");
            cli.setDireccion(DirTexto.getInstance().cambiarFormatoUTF8(direccion.toUpperCase()));
            cli.setEmail(DirTexto.getInstance().cambiarFormatoUTF8(correo));
            cli.setDniRuc(ruc);
            cli.setNaturalezaProveedor(naturaleza);
            cli.setNombres("");
            cli.setRazonSocial(DirTexto.getInstance().cambiarFormatoUTF8(RazonSocial.toUpperCase()));
            cli.setTelefono(telefono);
            cli.setUsuarioReg(usuario_reg);
        }
        String msg = LogicProveedor.getInstance().registrarProveedor(cli);
        if (msg == "OK") {
            mensaje = "Cliente registrado exitosamente";
            String cliente = Consultarproveedorgrabado(cli);
            mensaje = mensaje + "%" + cliente;
        } else {
            mensaje = "Error, no se registró el Cliente";
        }
        HtmlUtil.getInstance().escrituraHTML(response, mensaje);
    }

    private void RegistrarCompraJAX(HttpServletRequest request, HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        String doc = request.getParameter("documento");
        String numero = request.getParameter("numero");
        String id_cliente = request.getParameter("id_cliente");
        String total = request.getParameter("total");
        String igv = request.getParameter("igv");
        String neto = request.getParameter("neto");
        List<ListaVenta> listatemp = new ArrayList<ListaVenta>();
        List<ListaVenta> lista = new ArrayList<ListaVenta>();
        try {
            lista = (List<ListaVenta>) session.getAttribute("listacompra");
        } catch (Exception e) {
        }
        if (lista != null) {
            listatemp = lista;
        }
        //declaro variables locales;
        String precio = "";
        String id_producto = "";
        String cantidad = "";
        int contador = 0;
        //verificar cliente
        String msg;
        ComprobanteCompra venta = ComprobanteCompra.getInstance();
        if (listatemp.size() > 0) {
            String numeradorcomprobante = doc + "-" + numero + "-" + DirDate.getInstance().getFechaYYYY();
            boolean boletaok = LogicCompra.getInstance().verificarNumComprobante(numeradorcomprobante.trim());
            if (boletaok == false) {
                msg = "ERROR%" + "NÚMERO DE COMPROBANTE YA EXISTE";
                HtmlUtil.getInstance().escrituraHTML(response, msg);
                return;
            }
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

                precio = precio + String.valueOf(listaVenta.getPrecio() + "@");
                id_producto = id_producto + String.valueOf(listaVenta.getId_producto() + "@");
                cantidad = cantidad + String.valueOf(listaVenta.getCantidad() + "@");
                contador++;
            }
            Usuario usuario = usuario = new Usuario();
            usuario = (Usuario) session.getAttribute("usuario");
            int usuario_mod = usuario.getIdUsuario();
            venta.setCantProductos(contador);
            venta.setCantidad(cantidad);
            venta.setEstado("PAGADO");
            venta.setId_proveedor(Integer.parseInt(id_cliente));
            venta.setId_producto(id_producto);
            venta.setNumero_comprobante(numero);
            venta.setPrecio(precio);
            venta.setTipo(doc);
            venta.setId_usuario(usuario_mod);
            venta.setIgv(Double.parseDouble(igv));
            venta.setTotal(Double.parseDouble(total));
            venta.setNeto(Double.parseDouble(neto));
        }
        String respuesta = LogicCompra.getInstance().grabarCompra(venta);
        // verreporte(response,respuesta);
        msg = "OK%" + "VALIDADO% " + respuesta;
        HtmlUtil.getInstance().escrituraHTML(response, msg);
    }

    private void EliminarCompraAjax(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String numero = request.getParameter("num");
        String id = request.getParameter("id");
        String respuesta=null;
        respuesta=LogicCompra.getInstance().eliminarCompra(numero,id);
         HtmlUtil.getInstance().escrituraHTML(response, respuesta); 
    }

    private List<Proveedor> BuscarProveedorxDOC(String parametro_busq) throws Exception {
        List<Proveedor> cli = null;
        cli = LogicCompra.getInstance().buscarproveedorxDOC(parametro_busq);
        return cli;
    }

    private List<Proveedor> BuscarProveedorxAPERAZ(String parametro_busq) throws Exception {
        List<Proveedor> cli = null;
        cli = LogicCompra.getInstance().buscarproveedorxAPERAZ(parametro_busq);
        return cli;
    }

    private String Consultarproveedorgrabado(Proveedor cli) throws Exception {
       String cliente = null;
        cliente = LogicCompra.getInstance().buscarProveedorRegistrado(cli);
        return cliente;
    }

}