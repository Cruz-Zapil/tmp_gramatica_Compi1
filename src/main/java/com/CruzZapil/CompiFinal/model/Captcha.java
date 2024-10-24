package com.CruzZapil.CompiFinal.model;

import java.util.List;

import com.CruzZapil.CompiFinal.model.etiqueta.Etiqueta;
import com.google.gson.annotations.SerializedName;

public class Captcha {

    @SerializedName("ID_TRIVIA")
    private String id;
    @SerializedName("NOMBRE")
    private String nombre;
    @SerializedName("HEAD")
    private String head;
    @SerializedName("LINK")
    private String link;
    @SerializedName("TITLE")
    private String titulo;
    @SerializedName("BODY")
    private List<Etiqueta> etiqueta;
 

    public Captcha(String id, String nombre, String head, String link, String titulo,
            List<Etiqueta> etiqueta) {

        this.id = id;
        this.nombre = nombre;
        this.head = head;
        this.link = link;
        this.titulo = titulo;
        this.etiqueta = etiqueta;

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

    public String getHead() {
        return head;
    }

    public void setHead(String head) {
        this.head = head;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public List<Etiqueta> getEtiqueta() {
        return etiqueta;
    }

    public void setEtiqueta(List<Etiqueta> etiqueta) {
        this.etiqueta = etiqueta;
    }

    @Override
    public String toString() {
        return "Captcha [etiqueta=" + etiqueta + ", head=" + head + ", id=" + id + ", link=" + link + ", nombre=" + nombre
                + ", titulo=" + titulo + "]";
    }


}
