/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package control;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

/**
 *
 * @author 31424836
 */
public class ServReporte extends HttpServlet {

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
            throws ServletException, IOException, SQLException, JRException, ClassNotFoundException {
        String evento = request.getParameter("evento");
        System.out.println("control.ServReporte.processRequest()" + evento);
        if (evento.equals("venta")) {
            String id = request.getParameter("num").trim();
            String estado = null;
            estado = request.getParameter("estado");
            System.out.println("control.ServReporte.processRequest()" + id);
            verreporte(request, response, id, estado);
        }

    }

    private void verreporte(HttpServletRequest request, HttpServletResponse response, String respuesta, String estado) throws SQLException, IOException, JRException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = null;
        try {
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbferreteria", "root", "mauricio");
            String jrxmlfile = getServletContext().getRealPath("/jrxml/ComprobanteVentaReporte.jrxml");
            Map parameters = new HashMap();
            String sSubCadenacomprobante = respuesta.substring(0, 3);
            String TipoComprob = null;
            String tipodoc = null;
            if (sSubCadenacomprobante.equals("BOL")) {
                TipoComprob = "BOLETA DE VENTA";
                tipodoc = "DNI :";
            } else if (sSubCadenacomprobante.equals("FAC")) {
                TipoComprob = "FACTURA";
                tipodoc = "RUC :";
            } else if (sSubCadenacomprobante.equals("GDV")) {
                TipoComprob = "GUÍA DE VENTA";
                tipodoc = "DNI/RUC:";
            }
            if (estado.equals("VENDIDO")) {
                parameters.put("in_estado", "VENDIDO");
            } else if (estado.equals("ELIMINADO")) {
                parameters.put("in_estado", "ELIMINADO");
            }
            parameters.put("id", respuesta.trim());
            parameters.put("tipo_documento", tipodoc);
            parameters.put("tipo_comprobante", TipoComprob);
            InputStream input = new FileInputStream(new File(jrxmlfile));
            JasperReport jasperReport = JasperCompileManager.compileReport(input);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, conexion);
            JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
            response.getOutputStream().flush();
            response.getOutputStream().close();
        } catch (SQLException ex) {
            System.out.println("className.methodName()" + ex);
        } finally {
            conexion.close();
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServReporte.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException ex) {
            Logger.getLogger(ServReporte.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServReporte.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(ServReporte.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JRException ex) {
            Logger.getLogger(ServReporte.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ServReporte.class.getName()).log(Level.SEVERE, null, ex);
        }
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

}
