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
public class ListaVenta {

    private String idtipocliente;
    private float cantidad;
    private float precio;
    private String id_cliente;
    private String id_producto;
    private float subtotal;
    private String descripcion;
    private String marca;
    private String presentacion;
    
    public String getIdtipocliente() {
        return idtipocliente;
    }

    public void setIdtipocliente(String idtipocliente) {
        this.idtipocliente = idtipocliente;
    }

    public float getCantidad() {
        return cantidad;
    }

    public void setCantidad(float cantidad) {
        this.cantidad = cantidad;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

       public String getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(String id_cliente) {
        this.id_cliente = id_cliente;
    }

    public String getId_producto() {
        return id_producto;
    }

    public void setId_producto(String id_producto) {
        this.id_producto = id_producto;
    }

    public float getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(float subtotal) {
        this.subtotal = subtotal;
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

    @Override
    public String toString() {
        return "ListaVenta{" + "idtipocliente=" + idtipocliente + ", cantidad=" + cantidad + ", precio=" + precio + ", id_cliente=" + id_cliente + ", id_producto=" + id_producto + ", subtotal=" + subtotal + ", descripcion=" + descripcion + ", marca=" + marca + ", presentacion=" + presentacion + '}';
    }

   
    
}
