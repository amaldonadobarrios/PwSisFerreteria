/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dto.Usuario;
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
                    }else if (evento.equals("EliminarCompraAjax")) {
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

    private void BuscarProveedorxDOC(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void BuscarProveedorxAPERAZ(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void AñadirProductoAJAX(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void EliminarProductoAJAX(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void RegistrarProveedorAJAX(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void RegistrarCompraJAX(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    private void EliminarCompraAjax(HttpServletRequest request, HttpServletResponse response) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
