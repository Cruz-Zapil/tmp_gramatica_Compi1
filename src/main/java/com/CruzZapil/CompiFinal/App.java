package com.CruzZapil.CompiFinal;

import java.io.StringReader;

import org.apache.tools.ant.filters.ReplaceTokens.Token;

import com.CruzZapil.CompiFinal.gramatica.LexerCC;
import com.CruzZapil.CompiFinal.gramatica.parser;

import java_cup.runtime.Symbol;

import java.io.Reader;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args ) throws Exception
    {
        System.out.println("hola mundo ");

        String prueva= "<!-- Mi primer captcha en el curso de Organización de Lenguajes y Compiladores 1 -->\n" +
"<C_CC [id= \"captcha_matematico_1\"] [name= \"Captcha Matemático 1\"]>\n" +
"    !! El encabezado de la página que tendrá mi captcha\n" +
"    <C_HEAD>\n" +
"        <C_LINK\n" +
"            !! El link al que redirige mi captcha\n" +
"            [href= \"https://www.mclibre.org/consultar/htmlcss/html/html-etiquetas.html\"]> </C_LINK>\n" +
"            !! El título de mi página\n" +
"        <C_TITLE> Mi primer Captcha Matemático</C_TITLE>\n" +
"    </C_HEAD>\n" +
"    !! El cuerpo de la página\n" +
"<C_BODY [background= \"#e5e6ea\"] >\n" +
"    !! un título simple estilizado\n" +
"    <C_H1 [id= \"title_1\"] [text-align= \"center\"] [color= \"#7eff33\"] > Mi primer Captcha Matemático</C_H1>\n" +
"    !! Un salto normal\n" +
"    <c_br>\n" +
"    !! Información de la operación a resolver en el captcha\n" +
"    <C_SPAM [id= \"mostrar_1\"] [text-align= \"center\"] [color= \"#3366ff\"] > ¿ Qué resultado genera la operación siguiente: 5+5 ?</C_SPAM>\n" +
"    !! Input para la Respuesta del usuario generado con un scripting\n" +
"    <C_SCRIPTING>\n" +
"        ON_LOAD () [\n" +
"            !! Estas instrucciones se ejecutan media vez se entra al scripting\n" +
"            !! Insertamos el input con sus parámetros con la instrucción INSERT\n" +
"            INSERT('<C_INPUT [type= \"text\"] [text-align= \"center\"] [id= \"entrada_1\"] >');\n" +
"            INSERT('</C_INPUT>');\n" +
"        ]\n" +
"    </C_SCRIPTING>\n" +
"    !! Boton que llama a la funcionalidad calc\n" +
"    <C_BUTTON [id= \"boton_1\"] [onclick= \"FUNCTION_calc()\"] [background=\"green\"]> Procesar...</C_BUTTON>\n" +
"    !! Scripting para la función calc\n" +
"    <C_SCRIPTING>\n" +
"        FUNCTION_calc() [\n" +
"            !! Estas instrucciones no se ejecutan hasta llamar a FUNCTION_calc()\n" +
"            integer @global contador_fallas = 5;\n" +
"            string result_caja_texto = getElemenById('entrada_1');\n" +
"            string result = \"10\";\n" +
"            string mensaje_fallo = \"El captcha no fue validado intente otra vez\";\n" +
"            string mensaje_acierto = \"El captcha fue validado\";\n" +
"            string mensaje_final = \"El captcha no logró ser validado :( intente más tarde\";\n" +
"            !! Validación del número de oportunidades restantes\n" +
"            IF (contador_fallas == 0) THEN\n" +
"                INIT {: ALERT_INFO(mensaje_final); EXIT(); :} END\n" +
"            !! Validación de fallas y aciertos\n" +
"            IF (result_caja_texto == result) THEN\n" +
"                !! Si el resultado es correcto\n" +
"                INIT {: ALERT_INFO(mensaje_acierto); REDIRECT(); :} END\n" +
"            ELSE\n" +
"                !! Si el intento es incorrecto\n" +
"                INIT {: ALERT_INFO(mensaje_fallo); contador_fallas = contador_fallas - 1; :} END\n" +
"        ]\n" +
"    </C_SCRIPTING>\n" +
"</C_BODY>\n" +
"</C_CC>\n" +
"!! Fin de estructura CC";



        // Pasa la cadena al lexer
        StringReader reader = new StringReader(prueva);
      //  LexerCC lexer = new LexerCC(reader);

        // Procesa los tokens

        
        String input = "C_CC \"Hola Mundo\" true 123 3.14 C_TITLE";
     
        
        // Crear el lexer usando un StringReader
        Reader reader1 = new StringReader(prueva);

        LexerCC lexer = new LexerCC(reader1);
    
     


        try {
            // Leer cada token utilizando el método yylex()
            Symbol sym  ;
            while ((sym = lexer.next_token()  ) != null) {
                // Imprimir el tipo de token y el valor
               
         
           
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
