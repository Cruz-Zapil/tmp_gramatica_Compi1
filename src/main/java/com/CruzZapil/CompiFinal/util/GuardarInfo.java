package com.CruzZapil.CompiFinal.util;

import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

import com.CruzZapil.CompiFinal.model.Captcha;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class GuardarInfo {


        public void guardarDatoTrivia(ArrayList<Captcha> captcha) {

        // guardar los cambios en el archivo
        try (FileWriter writer = new FileWriter("/webApp/captcha.cc")) {

            // Crear instancia de Gson sin serializar campos nulos
            Gson json = new GsonBuilder().disableHtmlEscaping().setPrettyPrinting().create();

          
            writer.write("captcha1.");
            writer.write(json.toJson(captcha)); // Usa el JSON bonito
            writer.flush();
            /// datos guardados
            System.out.println("Datos guardados de captcha.cc");

        } catch (IOException e) {
            System.out.println("Error al escribir en el archivo: captcha.cc");
            e.printStackTrace();
        }
    }    
}
