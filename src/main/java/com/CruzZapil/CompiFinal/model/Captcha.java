package com.CruzZapil.CompiFinal.model;

import java.util.List;

import com.CruzZapil.CompiFinal.gramatica.BodyContent;
import com.CruzZapil.CompiFinal.model.etiqueta.Etiqueta;
import com.google.gson.annotations.SerializedName;

public class Captcha {

    @SerializedName("ID_TRIVIA")
    private String id;
    @SerializedName("NOMBRE")
    private String nombre;
    @SerializedName("HEAD")
    private List<Etiqueta> etiquetaHead;
    @SerializedName("BODY")
    private BodyContent etiqueta;

    public Captcha(String id, String nombre, List<Etiqueta> etiquetaHead,
            BodyContent bo) {

        this.id = id;
        this.nombre = nombre;
        this.etiquetaHead = etiquetaHead;

        this.etiqueta = bo;

    }

    public List<Etiqueta> getEtiquetaHead() {
        return etiquetaHead;
    }

    public void setEtiquetaHead(List<Etiqueta> etiquetaHead) {
        this.etiquetaHead = etiquetaHead;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public BodyContent getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(BodyContent etiqueta) {
        this.etiqueta = etiqueta;
    }

    @Override
    public String toString() {
        return "Captcha [etiqueta=" + etiqueta + ", etiquetaHead=" + etiquetaHead + ", id=" + id + ", nombre=" + nombre
                + "]";
    }
}
