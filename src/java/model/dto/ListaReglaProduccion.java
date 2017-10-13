/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.dto;

/**
 *
 * @author 31424836
 */
public class ListaReglaProduccion {
    private int id_producto;
    private int id_insumo;
    private String descripcion;
    private String marca;
    private String presentacion;
    private String medida;
    private double cantidad;
    private int nro_insumos;
    private int id_regla;
    private int id_usuario;
    private int estado;
    private String candena_Id_insumo;
    private String cadena_cantidad;

    
    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getId_insumo() {
        return id_insumo;
    }

    public void setId_insumo(int id_insumo) {
        this.id_insumo = id_insumo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getPresentacion() {
        return presentacion;
    }

    public void setPresentacion(String presentacion) {
        this.presentacion = presentacion;
    }

    public String getMedida() {
        return medida;
    }

    public void setMedida(String medida) {
        this.medida = medida;
    }

    public double getCantidad() {
        return cantidad;
    }

    public void setCantidad(double cantidad) {
        this.cantidad = cantidad;
    }

    @Override
    public String toString() {
        return "ListaReglaProduccion{" + "id_producto=" + id_producto + ", id_insumo=" + id_insumo + ", descripcion=" + descripcion + ", marca=" + marca + ", presentacion=" + presentacion + ", medida=" + medida + ", cantidad=" + cantidad + ", nro_insumos=" + nro_insumos + ", id_regla=" + id_regla + ", id_usuario=" + id_usuario + ", estado=" + estado + ", candena_Id_insumo=" + candena_Id_insumo + ", cadena_cantidad=" + cadena_cantidad + '}';
    }
    public int getNro_insumos() {
        return nro_insumos;
    }

    public void setNro_insumos(int nro_insumos) {
        this.nro_insumos = nro_insumos;
    }

    public int getId_regla() {
        return id_regla;
    }

    public void setId_regla(int id_regla) {
        this.id_regla = id_regla;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    public String getCandena_Id_insumo() {
        return candena_Id_insumo;
    }

    public void setCandena_Id_insumo(String candena_Id_insumo) {
        this.candena_Id_insumo = candena_Id_insumo;
    }

    public String getCadena_cantidad() {
        return cadena_cantidad;
    }

    public void setCadena_cantidad(String cadena_cantidad) {
        this.cadena_cantidad = cadena_cantidad;
    }
    
}
