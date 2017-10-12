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
        return "ListaReglaProduccion{" + "id_producto=" + id_producto + ", id_insumo=" + id_insumo + ", descripcion=" + descripcion + ", marca=" + marca + ", presentacion=" + presentacion + ", medida=" + medida + ", cantidad=" + cantidad + '}';
    }

    public int getNro_insumos() {
        return nro_insumos;
    }

    public void setNro_insumos(int nro_insumos) {
        this.nro_insumos = nro_insumos;
    }
    
}
