package com.CruzZapil.CompiFinal.model.etiqueta;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.annotations.SerializedName;

public class Etiqueta {

    @SerializedName("ETIQUETA")
    private String nombre;
    @SerializedName("PARAMETRO")
    private String parametro;
    @SerializedName("CONTENIDO")
    private String contenido;
    @SerializedName("HIJOS")
    private List<Etiqueta> hijos;


    public Etiqueta(  String nombre , String parametro  , String contenido  ){

        this.nombre    = nombre  ;
        this.parametro  = parametro  ;        
        this.contenido = contenido  ;
        this.hijos = new ArrayList<>();
    }

    public void agregarHijo(Etiqueta hijo) {
        this.hijos.add(hijo);
    }

    public String getNombre() {
        return nombre;
    }


    public void setNombre(String nombre) {
        this.nombre = nombre;
    }


    public String getParametro() {
        return parametro;
    }


    public void setParametro(String parametro) {
        this.parametro = parametro;
    }


    public String getContenido() {
        return contenido;
    }


    public void setContenido(String contenido) {
        this.contenido = contenido;
    }


}
