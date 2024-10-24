package com.CruzZapil.CompiFinal.gramatica;

import java.util.List;

import com.CruzZapil.CompiFinal.model.etiqueta.Etiqueta;
import com.google.gson.annotations.SerializedName;

public class BodyContent {
    
    @SerializedName("BACKGROUND")
    public String background;
    @SerializedName("ETIQUETAS")
    public List<Etiqueta> etiquetas;

}
