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

"    !! Boton que llama a la funcionalidad calc\n" +
"    <C_BUTTON [id= \"boton_1\"] [onclick= \"FUNCTION_calc()\"] [background=\"green\"]> Procesar...</C_BUTTON>\n" +
"    !! Scripting para la función calc\n" +

"</C_BODY>\n" +
"</C_CC>\n" +
"!! Fin de estructura CC";



        // Pasa la cadena al lexer
        StringReader reader = new StringReader(prueva);
       LexerCC lexer = new LexerCC(reader);
        parser parser = new parser(lexer);
        parser.parse();


        // Procesa los tokens
        parser.getCaptcha().toString();
        
  
      
      //  LexerCC lexer = new LexerCC(reader1);
    
     




    }
}
