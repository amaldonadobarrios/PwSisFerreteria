/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import model.dao.ProduccionDao;
import model.dto.ListaReglaProduccion;
import org.apache.log4j.Logger;
import util.Util;
import util.jdbc.ConectaDB;

/**
 *
 * @author 31424836
 */
public class ProduccionDaoImpl implements ProduccionDao {

    final static Logger logger = Logger.getLogger(ProduccionDaoImpl.class);
    Util uti = new Util();
    Connection cn = null;
    ConectaDB db = new ConectaDB();    
    
    @Override
    public List<ListaReglaProduccion> listarreglas() throws Exception {
        String sqlResult = "";
        List<ListaReglaProduccion> listTemp = null;
        
        try {
            cn = db.getConnection();
            sqlResult = uti.getLocalResource("/sql/selectReglaProduccion.sql");
        } catch (SQLException ex) {
            logger.error(ex);
            throw new Exception("Problemas de Conexion...");
        } catch (Throwable ex) {
            logger.error(ex);
            throw new Exception("Problemas del sistema...");
        }
        
        if (cn != null) {
            
            try {
                PreparedStatement ps = cn.prepareStatement(sqlResult);
                ResultSet rs = ps.executeQuery();
                
                if (rs.next()) {
                    
                    listTemp = new ArrayList<>();
                    ListaReglaProduccion temp;

                    // regresa el puntero al principio
                    rs.beforeFirst();
                    while (rs.next()) {
                        
                        temp = new ListaReglaProduccion();
                        temp.setId_regla(rs.getInt("id_regla"));
                        temp.setId_producto(rs.getInt("id_producto"));
                        temp.setNro_insumos(rs.getInt("cantidad_insumo"));
                        temp.setDescripcion(rs.getString("descripcion"));
                        temp.setMarca(rs.getString("marca"));
                        temp.setPresentacion(rs.getString("presentacion"));
                        temp.setMedida(rs.getString("medida"));
                        listTemp.add(temp);
                        
                    }
                }
                
            } catch (SQLException e) {
                logger.error(e);
                throw new Exception("Problemas del sistema...");
            } finally {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    logger.error(ex);
                }
            }
        }
        
        return listTemp;
    }

    @Override
    public boolean validarReglaProducto(int id_producto) throws Exception {
         boolean estado = false;
        String sqlResult = "";
        try {
            cn = db.getConnection();
            sqlResult = uti.getLocalResource("/sql/selectReglaxIdActivo.sql");
        } catch (SQLException ex) {
            logger.error(ex);
            throw new Exception("Problemas de Conexion...");
        } catch (Throwable ex) {
            logger.error(ex);
            throw new Exception("Problemas del sistema...");
        }
        if (cn != null) {
            try {
                PreparedStatement ps = cn.prepareStatement(sqlResult);
                ps.setInt(1, id_producto);
                ResultSet rs = ps.executeQuery();

                if (rs.next() == true) {
                    estado = false;
                } else {
                    estado = true;
                }

            } catch (SQLException e) {
                logger.error(e);
                throw new Exception("Problemas del sistema...");
            } finally {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    logger.error(ex);
                }
            }
        }
        return estado;
    }

    @Override
    public String GrabarRegla(ListaReglaProduccion regla) throws Exception {
         String mensaje = null;
        String sqlResult = "";
        System.out.println("model.dao.impl.ProduccionDaoImpl.GrabarRegla()"+regla.toString());
        try {
            cn = db.getConnection();
            sqlResult = uti.getLocalResource("/sql/insertRegla.sql");
        } catch (SQLException ex) {
            logger.error(ex);
            throw new Exception("Problemas del sistema...");
        } catch (Throwable ex) {
            logger.error(ex);
        }

        if (cn != null) {

            try {
                CallableStatement ps = cn.prepareCall(sqlResult);
                ps.setInt(1, regla.getId_producto());
                ps.setInt(2, regla.getId_usuario());
                ps.setInt(3, regla.getNro_insumos());
                ps.setString(4, regla.getCandena_Id_insumo());
                ps.setString(5, regla.getCadena_cantidad());
                ps.registerOutParameter(6, Types.INTEGER);
                ps.execute();
                // devuelve el valor del parametro de salida del procedimiento
                int resultado = ps.getInt(6);
                if (resultado > 0) {
//                    cn.commit();
                    logger.info("OK");
                    mensaje = "OK";
                } else {
                    //cn.rollback();
                    mensaje = "NOK";
                }

            } catch (SQLException e) {
                logger.error(e);
                throw new Exception("Problemas del sistema...");
            } finally {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    logger.error(ex);
                }
            }
        }

        return mensaje;
    }

    @Override
    public String EliminarRegla(int id_regla, int id_producto) throws Exception {
         String mensaje = null;
        String sqlResult = "";

        try {
            cn = db.getConnection();
            sqlResult = uti.getLocalResource("/sql/callEliminarRegla.sql");
        } catch (SQLException ex) {
            logger.error(ex);
            throw new Exception("Problemas del sistema...");
        } catch (Throwable ex) {
            logger.error(ex);
        }

        if (cn != null) {

            try {

                CallableStatement ps = cn.prepareCall(sqlResult);
                ps.setInt(1, id_regla);
                ps.setInt(2, id_producto);
                ps.registerOutParameter(3, Types.INTEGER);
                ps.execute();
                // devuelve el valor del parametro de salida del procedimiento
                int resultado = ps.getInt(3);
                if (resultado > 0) {
//                    cn.commit();
                    logger.info("OK");
                    mensaje = "OK";
                } else {
                    //cn.rollback();
                    mensaje = "NOK";
                }

            } catch (SQLException e) {
                logger.error(e);
                throw new Exception("Problemas del sistema...");
            } finally {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    logger.error(ex);
                }
            }
        }

        return mensaje;
    }

    @Override
    public List<ListaReglaProduccion> MostrarInsumo(int id_regla, int id_producto) throws Exception {
       String sqlResult = "";
        List<ListaReglaProduccion> listTemp = null;
        
        try {
            cn = db.getConnection();
            sqlResult = uti.getLocalResource("/sql/selectReglaInsumos.sql");
        } catch (SQLException ex) {
            logger.error(ex);
            throw new Exception("Problemas de Conexion...");
        } catch (Throwable ex) {
            logger.error(ex);
            throw new Exception("Problemas del sistema...");
        }
        
        if (cn != null) {
            
            try {
                PreparedStatement ps = cn.prepareStatement(sqlResult);
                ps.setInt(1, id_regla);
                ps.setInt(2, id_producto);
                ResultSet rs = ps.executeQuery();
                
                if (rs.next()) {
                    
                    listTemp = new ArrayList<>();
                    ListaReglaProduccion temp;

                    // regresa el puntero al principio
                    rs.beforeFirst();
                    while (rs.next()) {
                        
                        temp = new ListaReglaProduccion();
                        temp.setId_regla(rs.getInt("id_regla"));
                        temp.setId_insumo(rs.getInt("id_insumo"));
                        temp.setCantidad(rs.getDouble("cantidad"));
                        temp.setDescripcion(rs.getString("descripcion"));
                        temp.setMarca(rs.getString("marca"));
                        temp.setPresentacion(rs.getString("presentacion"));
                        temp.setMedida(rs.getString("medida"));
                        listTemp.add(temp);
                        
                    }
                }
                
            } catch (SQLException e) {
                logger.error(e);
                throw new Exception("Problemas del sistema...");
            } finally {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    logger.error(ex);
                }
            }
        }
        
        return listTemp;  
    }

    @Override
    public ListaReglaProduccion BuscarRegla(int id_regla) throws Exception {
        String sqlResult = "";
        ListaReglaProduccion temp = null;
        
        try {
            cn = db.getConnection();
            sqlResult = uti.getLocalResource("/sql/selectReglaxId.sql");
        } catch (SQLException ex) {
            logger.error(ex);
            throw new Exception("Problemas de Conexion...");
        } catch (Throwable ex) {
            logger.error(ex);
            throw new Exception("Problemas del sistema...");
        }
        
        if (cn != null) {
            
            try {
                PreparedStatement ps = cn.prepareStatement(sqlResult);
                ps.setInt(1, id_regla);
                 ResultSet rs = ps.executeQuery();
                
                if (rs.next()) {
                    
                    temp = new ListaReglaProduccion();
                    // regresa el puntero al principio
                    rs.beforeFirst();
                    while (rs.next()) {
                        
                        
                        temp.setId_regla(rs.getInt("id_regla"));
                        temp.setId_producto(rs.getInt("id_producto"));
                        temp.setNro_insumos(rs.getInt("cantidad_insumo"));
                        temp.setDescripcion(rs.getString("descripcion"));
                        temp.setMarca(rs.getString("marca"));
                        temp.setPresentacion(rs.getString("presentacion"));
                        temp.setMedida(rs.getString("medida"));
  
                    }
                }
                
            } catch (SQLException e) {
                logger.error(e);
                throw new Exception("Problemas del sistema...");
            } finally {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    logger.error(ex);
                }
            }
        }
        
        return temp; 
    }

    @Override
    public String GrabarProduccion(ListaReglaProduccion produccion) throws Exception {
        String mensaje = null;
        String validacion=null;
        String sqlResult = "";
        System.out.println("model.dao.impl.ProduccionDaoImpl.GrabarProduccion()"+produccion.toString());
        try {
            cn = db.getConnection();
            sqlResult = uti.getLocalResource("/sql/insertProduccion.sql");
        } catch (SQLException ex) {
            logger.error(ex);
            throw new Exception("Problemas del sistema...");
        } catch (Throwable ex) {
            logger.error(ex);
        }

        if (cn != null) {

            try {
                CallableStatement ps = cn.prepareCall(sqlResult);
                ps.setInt(1, produccion.getCant_regla());
                ps.setString(2, produccion.getFecha());
                ps.setString(3, produccion.getDocumento());
                ps.setString(4, produccion.getNumero_doc());
                ps.setInt(5, produccion.getId_usuario());
                ps.setString(6, produccion.getCadena_nro_insumos());
                ps.setString(7, produccion.getCandena_Id_Regla());
                ps.setString(8, produccion.getCandena_Id_Producto());
                ps.setString(9, produccion.getCadena_cantidad());
                ps.registerOutParameter(10, Types.INTEGER);
                ps.registerOutParameter(11, Types.INTEGER);
                ps.registerOutParameter(12, Types.INTEGER);
                ps.registerOutParameter(13, Types.VARCHAR);
                ps.execute();
                
                // devuelve el valor del parametro de salida del procedimiento
                int resultado = ps.getInt(10);
                int verificado= ps.getInt(11);
                int idproduccion= ps.getInt(12);
                String requerimiento_json="";
               requerimiento_json =ps.getString(13);
                if (verificado>0) {
                     validacion= "EXISTEN "+verificado+ " INSUMOS SIN STOCK \n" ;
                    }else{
                     validacion="CORRECTO";
                 }
                if (resultado > 0) {
//                    cn.commit();
                    logger.info("OK");
                    mensaje = "OK%"+validacion+"%"+requerimiento_json+"%"+idproduccion;
                } else {
                    //cn.rollback();
                    mensaje = "NOK%"+validacion+"%"+requerimiento_json;
                }

            } catch (SQLException e) {
                logger.error(e);
                throw new Exception("Problemas del sistema...");
            } finally {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    logger.error(ex);
                }
            }
        }
       return mensaje;
    }
}
