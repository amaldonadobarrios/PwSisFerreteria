/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import logica.LogicCliente;
import logica.LogicPerfil;
import logica.LogicProducto;
import logica.LogicProveedor;
import logica.LogicUsuario;
import logica.LogicVenta;
import model.dao.UsuarioDao;
import model.dao.impl.UsuarioDaoImpl;
import model.dto.Producto;
import model.dto.Usuario;

/**
 *
 * @author FARID
 */
public class ServMenu extends HttpServletConf {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        this.confHeader(request, response);

        int respuesta = this.validaSesion(request, response);

        if (respuesta == 1) {
            try {
                String action = request.getParameter("action") != null ? request.getParameter("action") : "";
                HttpSession session = request.getSession();
                session.removeAttribute("comboprod");
                session.removeAttribute("listaventa");
                switch (action) {

                    case "pagehome":
                        this.pagehome(request, response);
                        break;

                    case "pageRegistroProductos":
                        this.pageRegistroProductos(request, response);
                        break;

                    case "pageRegistroCliente":
                        this.pageRegistroCliente(request, response);
                        break;

                    case "pageRegistroProveedor":

                        this.pageRegistroProveedor(request, response);
                        break;

                    case "pageRegistroUsuario":

                        this.pageRegistroUsuario(request, response);
                        break;

                    case "pageRegistroReglasProduccion":
                        this.pageRegistroReglasProduccion(request, response);
                        break;

                    case "pageRegistroPrecioVenta":
                        this.pageRegistroPrecioVenta(request, response);
                        break;

                    case "pageRegistroVenta":
                        this.pageRegistroVenta(request, response);
                        break;

                    case "pageConsultarVenta":
                        this.pageConsultarVenta(request, response);
                        break;

                    case "pageRegistroCompra":
                        this.pageRegistroCompra(request, response);
                        break;

                    case "pageConsultarCompra":
                        this.pageConsultarCompra(request, response);
                        break;

                    case "pageConsultarInventario":
                        this.pageConsultarInventario(request, response);
                        break;
                    case "pageConsultarInventarioProductos":
                        this.pageConsultarInventarioProductos(request, response);
                        break;
                    case "pageConsultarInventarioInsumos":
                        this.pageConsultarInventarioInsumos(request, response);
                        break;
                    case "pageReporteVentas":
                        this.pageReporteVentas(request, response);
                        break;
                    case "pageReporteCompras":
                        this.pageReporteCompras(request, response);
                        break;
                    case "pageReporteGanancias":
                        this.pageReporteGanancias(request, response);
                        break;
                    case "pagRegistroProduccion":
                        this.pagRegistroProduccion(request, response);
                        break;
                    case "pageSalir":
                        this.pageSalir(request, response);
                        break;

                }
            } catch (Exception ex) {
                Logger.getLogger(ServMenu.class.getName()).log(Level.SEVERE, null, ex);
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

    private void pageSalir(HttpServletRequest request, HttpServletResponse response) throws IOException {

        HttpSession session = request.getSession();
        session.removeAttribute("ID");
        session.removeAttribute("usuario");
        session.invalidate();
        redirect("login.jsp", response);
    }

    private void pageRegistroProductos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        request.setAttribute("lista", LogicProducto.getInstance().getProductos());
        request.setAttribute("EVENTO", "REGISTRAR");
        request.setAttribute("body", "registro_producto");
        forwar("template.jsp", request, response);
    }

    private void pageRegistroCliente(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        request.setAttribute("lista", LogicCliente.getInstance().listarCliente());
        request.setAttribute("EVENTO", "REGISTRAR");
        request.setAttribute("body", "registro_cliente");
        forwar("template.jsp", request, response);
    }

    private void pageRegistroUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        LogicPerfil logiper = new LogicPerfil();
        LogicUsuario usu = new LogicUsuario();
        List<Usuario> lista = null;
        lista = new ArrayList<>();
        lista = usu.listarUsuarios();
        request.setAttribute("lista_perfil", logiper.listarPerfiles());
        request.setAttribute("lista", lista);
        request.setAttribute("EVENTO", "REGISTRAR");
        request.setAttribute("body", "registro_usuario");
        forwar("template.jsp", request, response);
    }

    private void pageRegistroProveedor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        request.setAttribute("lista", LogicProveedor.getInstance().listarProveedor());
        request.setAttribute("EVENTO", "REGISTRAR");
        request.setAttribute("body", "registro_proveedor");
        forwar("template.jsp", request, response);
    }

    private int validaSesion(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {

        int respuesta = 1;

        HttpSession session = req.getSession();

        if (session != null) {

            Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");
            String ID = (String) session.getAttribute("ID");

            if (ID == null || usuarioSesion == null || !ID.equals(session.getId())) {
                respuesta = 0;
                session.invalidate();
                req.setAttribute("msg", "Sesion Expirada");
                forwar("login.jsp", req, resp);

            }

        } else {
            respuesta = 0;
            session.invalidate();
            req.setAttribute("msg", "Sesion Expirada");
            forwar("login.jsp", req, resp);
        }

        return respuesta;

    }

    private void pageRegistroReglasProduccion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("body", "registro_reglas_produccion");
        forwar("template.jsp", request, response);
    }

    private void pageRegistroPrecioVenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        HttpSession session = request.getSession();
        session.setAttribute("comboprod", LogicProducto.getInstance().getProductos());
        request.setAttribute("body", "registro_precio_venta");
        forwar("template.jsp", request, response);
    }

    private void pageRegistroVenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, Exception {
        request.setAttribute("combopro", LogicVenta.getInstance().listarproductoscomboventa());
        request.setAttribute("body", "registro_venta");
        forwar("template.jsp", request, response);
    }

    private void pageConsultarVenta(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("body", "consultar_venta");
        forwar("template.jsp", request, response);
    }

    private void pageRegistroCompra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("body", "registro_compra");
        forwar("template.jsp", request, response);
    }

    private void pageConsultarCompra(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("body", "consultar_compra");
        forwar("template.jsp", request, response);
    }

    private void pageConsultarInventario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("body", "consultar_inventario");
        forwar("template.jsp", request, response);
    }

    private void pageConsultarInventarioProductos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("body", "consultar_inventario_producto");
        forwar("template.jsp", request, response);
    }

    private void pageConsultarInventarioInsumos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("body", "consultar_inventario_insumo");
        forwar("template.jsp", request, response);
    }

    private void pageReporteVentas(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("body", "reporte_venta");
        forwar("template.jsp", request, response);
    }

    private void pageReporteCompras(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("body", "reporte_compra");
        forwar("template.jsp", request, response);
    }

    private void pageReporteGanancias(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("body", "reporte_ganancia");
        forwar("template.jsp", request, response);
    }

    private void pagRegistroProduccion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("body", "registro_produccion");
        forwar("template.jsp", request, response);
    }

    private void pagehome(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("body", "home");
        forwar("template.jsp", request, response);
    }

}
