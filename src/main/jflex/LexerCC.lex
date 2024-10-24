
import java_cup.runtime.Symbol;

%%

%public 
%class LexerCC
%cup
%unicode


TEXTS = [a-zA-ZáéíóúÁÉÍÓÚüÜñÑ0-9\?\¿\+\-\*\(\)\.,;: \t]+
division = ["/"]

%init{ 
    yyline = 1; 
    yychar = 1; 
    
%init} 
 

/* Definición de los símbolos del CUP */
%{
     int longitudToken=0;

  /* Declaración de tokens que serán reconocidos por el analizador sintáctico */
  private Symbol symbol(int type) {
    return new Symbol(type);
  }
  
%}


%eofval{

  return new Symbol(symbol.EOF, null);

%eofval}


%%
/* Definición de patrones y tokens */


[" "]+                  {longitudToken = yytext().length();   yychar+=longitudToken  ;  }
/*   
+++++++++++++++++++++++++++++++++++++++
++++++++++++ ETIQUETAS CC +++++++++++++
+++++++++++++++++++++++++++++++++++++++
*/    

("\'")[^]("\'")      {longitudToken = yytext().length();   yychar+=longitudToken  ; System.out.println(yytext());  return new Symbol(symbol.CHARS           ,  yyline , (int)yychar, yytext() ); }
("\'")               {yychar+=1  ; System.out.println(yytext());  return new Symbol(symbol.COMILLA_SIMPLE ,  yyline , (int)yychar, yytext() ); }
("\"")               {yychar+=1  ; System.out.println(yytext());  return new Symbol(symbol.COMILLAS       ,  yyline , (int)yychar, yytext() ); }
";"                  {yychar+=1  ; System.out.println(yytext());  return new Symbol(symbol.PUNTO_COMA     ,  yyline , (int)yychar, yytext() ); }
"{"                  {yychar+=1  ; System.out.println(yytext());  return new Symbol(symbol.LLAVE_IZQ      ,  yyline , (int)yychar, yytext() ); }     
"}"                  {yychar+=1  ; System.out.println(yytext());  return new Symbol(symbol.LLAVE_DER      ,  yyline , (int)yychar, yytext() ); }     
"["                  {yychar+=1  ; System.out.println(yytext());  return new Symbol(symbol.CORCHETE_IZQ   ,  yyline , (int)yychar, yytext() ); }     
"]"                  {yychar+=1  ; System.out.println(yytext());  return new Symbol(symbol.CORCHETE_DER   ,  yyline , (int)yychar, yytext() ); }     
"("                  {yychar+=1  ; System.out.println(yytext());  return new Symbol(symbol.PAR_IZQ ,  yyline , (int)yychar, yytext() ); }     
")"                  {yychar+=1  ; System.out.println(yytext());  return new Symbol(symbol.PAR_DER ,  yyline , (int)yychar, yytext() ); }     
":"                  {yychar+=1  ; System.out.println(yytext());  return new Symbol(symbol.DOS_PUNTOS     ,  yyline , (int)yychar, yytext() ); }
"C_CC"               {yychar+=4  ; System.out.println(yytext());  return new Symbol(symbol.HTML           ,  yyline , (int)yychar, yytext() ); }
"/C_CC"              {yychar+=5  ; System.out.println(yytext());  return new Symbol(symbol.HTML_C         ,  yyline , (int)yychar, yytext() ); }
"C_HEAD"             {yychar+=6  ; System.out.println(yytext());  return new Symbol(symbol.HEAD           ,  yyline , (int)yychar, yytext() ); }    
"/C_HEAD"            {yychar+=7  ; System.out.println(yytext());  return new Symbol(symbol.HEAD_C         ,  yyline , (int)yychar, yytext() ); }
"C_BODY"             {yychar+=6  ; System.out.println(yytext());  return new Symbol(symbol.BODY           ,  yyline , (int)yychar, yytext() ); }
"/C_BODY"            {yychar+=7  ; System.out.println(yytext());  return new Symbol(symbol.BODY_C         ,  yyline , (int)yychar, yytext() ); }  
"C_TITLE"            {yychar+=7  ; System.out.println(yytext());  return new Symbol(symbol.TITLE          ,  yyline , (int)yychar, yytext() ); }
"/C_TITLE"           {yychar+=8  ; System.out.println(yytext());  return new Symbol(symbol.TITLE_C        ,  yyline , (int)yychar, yytext() ); }
"C_LINK"             {yychar+=6  ; System.out.println("link " + yytext());  return new Symbol(symbol.LINK           ,  yyline , (int)yychar, yytext() ); }
"/C_LINK"            {yychar+=7  ; System.out.println(yytext());  return new Symbol(symbol.LINK_C         ,  yyline , (int)yychar, yytext() ); }
"C_BODY"             {yychar+=6  ; System.out.println(yytext());  return new Symbol(symbol.BODY           ,  yyline , (int)yychar, yytext() ); }
"/C_BODY"            {yychar+=7  ; System.out.println(yytext());  return new Symbol(symbol.BODY_C         ,  yyline , (int)yychar, yytext() ); }
"C_SPAM"             {yychar+=6  ; System.out.println(yytext());  return new Symbol(symbol.SPAM           ,  yyline , (int)yychar, yytext() ); }
"/C_SPAM"            {yychar+=7  ; System.out.println(yytext());  return new Symbol(symbol.SPAN_C         ,  yyline , (int)yychar, yytext() ); }
"C_INPUT"            {yychar+=7  ; System.out.println(yytext());  return new Symbol(symbol.INPUT          ,  yyline , (int)yychar, yytext() ); }
"/C_INPUT"           {yychar+=8  ; System.out.println(yytext());  return new Symbol(symbol.INPUT_C        ,  yyline , (int)yychar, yytext() ); }
"C_TEXTAREA"         {yychar+=10 ; System.out.println(yytext());  return new Symbol(symbol.TEXTOAREA      ,  yyline , (int)yychar, yytext() ); }
"/C_TEXTAREA"        {yychar+=11 ; System.out.println(yytext());  return new Symbol(symbol.TEXTOAREA_C    ,  yyline , (int)yychar, yytext() ); } 
"C_SELECT"           {yychar+=8  ; System.out.println(yytext());  return new Symbol(symbol.SELECTED       ,  yyline , (int)yychar, yytext() ); }
"/C_SELECT"          {yychar+=9  ; System.out.println(yytext());  return new Symbol(symbol.SELECTED_C     ,  yyline , (int)yychar, yytext() ); }
"C_OPTION"           {yychar+=8  ; System.out.println(yytext());  return new Symbol(symbol.OPTION         ,  yyline , (int)yychar, yytext() ); }
"/C_OPTION"          {yychar+=9  ; System.out.println(yytext());  return new Symbol(symbol.OPTION_C       ,  yyline , (int)yychar, yytext() ); }
"C_DIV"              {yychar+=5  ; System.out.println(yytext());  return new Symbol(symbol.DIV            ,  yyline , (int)yychar, yytext() ); }
"/C_DIV"             {yychar+=6  ; System.out.println(yytext());  return new Symbol(symbol.DIV_C          ,  yyline , (int)yychar, yytext() ); }
"C_IMG"              {yychar+=5  ; System.out.println(yytext());  return new Symbol(symbol.IMG            ,  yyline , (int)yychar, yytext() ); }
"/C_IMG"             {yychar+=6  ; System.out.println(yytext());  return new Symbol(symbol.IMG_C          ,  yyline , (int)yychar, yytext() ); }
"C_BR"               {yychar+=4  ; System.out.println(yytext());  return new Symbol(symbol.BR             ,  yyline , (int)yychar, yytext() ); }
"/C_BR"              {yychar+=5  ; System.out.println(yytext());  return new Symbol(symbol.BR_C           ,  yyline , (int)yychar, yytext() ); } 
"C_BUTTON"           {yychar+=8  ; System.out.println(yytext());  return new Symbol(symbol.BUTTON         ,  yyline , (int)yychar, yytext() ); }      
"/C_BUTTON"          {yychar+=9  ; System.out.println(yytext());  return new Symbol(symbol.BUTTON_C       ,  yyline , (int)yychar, yytext() ); }        
"C_H1"               {yychar+=4  ; System.out.println(yytext());  return new Symbol(symbol.H1             ,  yyline , (int)yychar, yytext() ); } 
"/C_H1"              {yychar+=5  ; System.out.println(yytext());  return new Symbol(symbol.H1_C           ,  yyline , (int)yychar, yytext() ); }
"C_P"                {yychar+=3  ; System.out.println(yytext());  return new Symbol(symbol.P              ,  yyline , (int)yychar, yytext() ); }
"/C_P"               {yychar+=4  ; System.out.println(yytext());  return new Symbol(symbol.P_C            ,  yyline , (int)yychar, yytext() ); }  
 

// parametros                         

"href"               {yychar+=4  ;  System.out.println(yytext()); return new Symbol(symbol.HREF           ,  yyline , (int)yychar, yytext() ); }        
"background"         {yychar+=10 ;  System.out.println(yytext()); return new Symbol(symbol.BACKGROUND     ,  yyline , (int)yychar, yytext() ); }              
//color          
"black"              {yychar+=5  ;  System.out.println(yytext()); return new Symbol(symbol.BLACK          ,  yyline , (int)yychar, yytext() ); } 
"olive"              {yychar+=5  ;  System.out.println(yytext()); return new Symbol(symbol.OLIVE          ,  yyline , (int)yychar, yytext() ); } 
"teal"               {yychar+=5  ;  System.out.println(yytext()); return new Symbol(symbol.TEAL           ,  yyline , (int)yychar, yytext() ); }
"red"                {yychar+=3  ;  System.out.println(yytext()); return new Symbol(symbol.RED            ,  yyline , (int)yychar, yytext() ); }
"blue"               {yychar+=4  ;  System.out.println(yytext()); return new Symbol(symbol.BLUE           ,  yyline , (int)yychar, yytext() ); }
"marron"             {yychar+=6  ;  System.out.println(yytext()); return new Symbol(symbol.MARRON         ,  yyline , (int)yychar, yytext() ); }  
"navy"               {yychar+=4  ;  System.out.println(yytext()); return new Symbol(symbol.NAVY           ,  yyline , (int)yychar, yytext() ); }
"gray"               {yychar+=4  ;  System.out.println(yytext()); return new Symbol(symbol.GRAY           ,  yyline , (int)yychar, yytext() ); }
"lime"               {yychar+=4  ;  System.out.println(yytext()); return new Symbol(symbol.LIME           ,  yyline , (int)yychar, yytext() ); }
"fuchsia"            {yychar+=7  ;  System.out.println(yytext()); return new Symbol(symbol.FUCHSIA        ,  yyline , (int)yychar, yytext() ); }   
"green"              {yychar+=5  ;  System.out.println(yytext()); return new Symbol(symbol.GREEN          ,  yyline , (int)yychar, yytext() ); } 
"white"              {yychar+=5  ;  System.out.println(yytext()); return new Symbol(symbol.WHITE          ,  yyline , (int)yychar, yytext() ); } 
"purple"             {yychar+=6  ;  System.out.println(yytext()); return new Symbol(symbol.PURPLE         ,  yyline , (int)yychar, yytext() ); }  
"silver"             {yychar+=6  ;  System.out.println(yytext()); return new Symbol(symbol.SILVER         ,  yyline , (int)yychar, yytext() ); }  
"yellow"             {yychar+=6  ;  System.out.println(yytext()); return new Symbol(symbol.YELLOW         ,  yyline , (int)yychar, yytext() ); }  
"aqua"               {yychar+=4  ;  System.out.println(yytext()); return new Symbol(symbol.AQUA           ,  yyline , (int)yychar, yytext() ); }

/* colores                         hexadecimal*/
"#"([A-Fa-f0-9]{3}|[A-Fa-f0-9]{6}|[A-Fa-f0-9]{8})      {longitudToken = yytext().length();  yychar+=longitudToken   ;  System.out.println(yytext()); return new Symbol(symbol.HEXADECIMAL  ,  yyline , (int)yychar, yytext() ); }

"color"              {yychar+=5   ;  System.out.println(yytext()); return new Symbol(symbol.COLOR         ,  yyline , (int)yychar, yytext() ); }           
"font-size"          {yychar+=9   ;  System.out.println(yytext()); return new Symbol(symbol.FONT_SIZE     ,  yyline , (int)yychar, yytext() ); }
//pixeles
[0-9]+"px"           {yychar+=5   ;  System.out.println(yytext()); return new Symbol(symbol.PIXEL         ,  yyline , (int)yychar, yytext() ); } 

"font-family"        {yychar+=11  ;  System.out.println(yytext()); return new Symbol(symbol.FONT_FAMI     ,  yyline , (int)yychar, yytext() ); }    
/*tipo de letras*/                                                                                        
"Courier"            {yychar+=7   ;  System.out.println(yytext()); return new Symbol(symbol.COURIER       ,  yyline , (int)yychar, yytext() ); }              
"Verdana"            {yychar+=7   ;  System.out.println(yytext()); return new Symbol(symbol.VERDANA       ,  yyline , (int)yychar, yytext() ); }                   
"Arial"              {yychar+=5   ;  System.out.println(yytext()); return new Symbol(symbol.ARIAL         ,  yyline , (int)yychar, yytext() ); }              
"Geneva"             {yychar+=6   ;  System.out.println(yytext()); return new Symbol(symbol.GENEVA        ,  yyline , (int)yychar, yytext() ); }                
"sans-serif"         {yychar+=10  ;  System.out.println(yytext()); return new Symbol(symbol.SANS_SERIF    ,  yyline , (int)yychar, yytext() ); }     

"text-align"         {yychar+=10  ;  System.out.println(yytext()); return new Symbol(symbol.TEXT_ALIGN    ,  yyline , (int)yychar, yytext() ); }     
// tipode justificacion de letra
"left"               {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.LEFT          ,  yyline , (int)yychar, yytext() ); }              
"right"              {yychar+=5   ;  System.out.println(yytext()); return new Symbol(symbol.RIGHT         ,  yyline , (int)yychar, yytext() ); }              
"center"             {yychar+=6   ;  System.out.println(yytext()); return new Symbol(symbol.CENTER        ,  yyline , (int)yychar, yytext() ); }                
"justify"            {yychar+=7   ;  System.out.println(yytext()); return new Symbol(symbol.JUSTIFY       ,  yyline , (int)yychar, yytext() ); }                 
                   
"type"               {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.TYPE          ,  yyline , (int)yychar, yytext() ); }              
// solo se usa en el input  
"text"               {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.TEXT          ,  yyline , (int)yychar, yytext() ); }              
"number"             {yychar+=6   ;  System.out.println(yytext()); return new Symbol(symbol.NUMBER        ,  yyline , (int)yychar, yytext() ); }     
"radio"              {yychar+=5   ;  System.out.println(yytext()); return new Symbol(symbol.RADIO         ,  yyline , (int)yychar, yytext() ); }               
"checkbox"           {yychar+=8   ;  System.out.println(yytext()); return new Symbol(symbol.CHECKBOX      ,  yyline , (int)yychar, yytext() ); }                  
                  
"id"                 {yychar+=2   ;  System.out.println(yytext()); return new Symbol(symbol.ID            ,  yyline , (int)yychar, yytext() ); }           
                      
"name"               {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.NAME          ,  yyline , (int)yychar, yytext() ); }             
"column"             {yychar+=3   ;  System.out.println(yytext()); return new Symbol(symbol.COLUMN        ,  yyline , (int)yychar, yytext() ); } 
"row"                {yychar+=3   ;  System.out.println(yytext()); return new Symbol(symbol.ROW           ,  yyline , (int)yychar, yytext() ); } 
"cols"               {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.COLS          ,  yyline , (int)yychar, yytext() ); }             
"rows"               {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.ROWS          ,  yyline , (int)yychar, yytext() ); }             
"class"              {yychar+=5   ;  System.out.println(yytext()); return new Symbol(symbol.CLASS         ,  yyline , (int)yychar, yytext() ); }              
"src"                {yychar+=3   ;  System.out.println(yytext()); return new Symbol(symbol.SRC           ,  yyline , (int)yychar, yytext() ); }            
"width"              {yychar+=5   ;  System.out.println(yytext()); return new Symbol(symbol.WIDTH         ,  yyline , (int)yychar, yytext() ); }              
"height"             {yychar+=6   ;  System.out.println(yytext()); return new Symbol(symbol.HEIGHT        ,  yyline , (int)yychar, yytext() ); }               
"alt"                {yychar+=3   ;  System.out.println(yytext()); return new Symbol(symbol.ALT           ,  yyline , (int)yychar, yytext() ); }            
"onclick"            {yychar+=7   ;  System.out.println(yytext()); return new Symbol(symbol.ONCLICK       ,  yyline , (int)yychar, yytext() ); }     


/*   
+++++++++++++++++++++++++++++++++++++++
++++++++++++ SCRIPTING CC +++++++++++++
+++++++++++++++++++++++++++++++++++++++
*/                                                                                                   
                                                                                                               
"C_SCRIPTING"        {yychar+=11  ;  System.out.println(yytext()); return new Symbol(symbol.SCRIPTING     ,  yyline , (int)yychar, yytext() ); }      
"/C_SCRIPTING"       {yychar+=12  ;  System.out.println(yytext()); return new Symbol(symbol.SCRIPTING_C   ,  yyline , (int)yychar, yytext() ); }
"ON_LOAD()"          {yychar+= 9  ;  System.out.println(yytext()); return new Symbol(symbol.ON_LOAD       ,  yyline , (int)yychar, yytext() ); }

/*   
+++++++++++++++++++++++++++++++++++++++
++++++++++++ TIPO DE VARIABLE +++++++++
+++++++++++++++++++++++++++++++++++++++
*/                                                                                                   

"integer"            {yychar+=8   ;  System.out.println(yytext()); return new Symbol(symbol.INTEGER       ,  yyline , (int)yychar, yytext() ); }
"decimal"            {yychar+=7   ;  System.out.println(yytext()); return new Symbol(symbol.DECIMAL       ,  yyline , (int)yychar, yytext() ); }
"boolean"            {yychar+=7   ;  System.out.println(yytext()); return new Symbol(symbol.BOOLEAN       ,  yyline , (int)yychar, yytext() ); }
"char"               {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.CHAR          ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"string"             {yychar+=6   ;  System.out.println(yytext()); return new Symbol(symbol.STRING        ,  yyline , (int)yychar, yytext() ); }    
"@global"            {yychar+=7   ;  System.out.println(yytext()); return new Symbol(symbol.GLOBAL        ,  yyline , (int)yychar, yytext() ); }
/*   
+++++++++++++++++++++++++++++++++++++++
+++++ TIPO DE OPERADOR LOGICO +++++++++
+++++++++++++++++++++++++++++++++++++++
*/  

"=="                 {yychar+=2   ;  System.out.println(yytext()); return new Symbol(symbol.COMPARACION   ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"!="                 {yychar+=2   ;  System.out.println(yytext()); return new Symbol(symbol.DESIGUALDAD   ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"<"                  {yychar+=1   ;  System.out.println(yytext()); return new Symbol(symbol.MENOR         ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"<="                 {yychar+=2   ;  System.out.println(yytext()); return new Symbol(symbol.MENOR_IGUAL   ,  yyline , (int)yychar, yytext() ); }                                                                                                               
">"                  {yychar+=1   ;  System.out.println(yytext()); return new Symbol(symbol.MAYOR         ,  yyline , (int)yychar, yytext() ); }                                                                                                               
">="                 {yychar+=2   ;  System.out.println(yytext()); return new Symbol(symbol.MAYOR_IGUAL   ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"||"                 {yychar+=2   ;  System.out.println(yytext()); return new Symbol(symbol.OR            ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"&&"                 {yychar+=2   ;  System.out.println(yytext()); return new Symbol(symbol.AND           ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"!"                  {yychar+=1   ;  System.out.println(yytext()); return new Symbol(symbol.NOT           ,  yyline , (int)yychar, yytext() ); }  
"="                  {yychar+=1   ;  System.out.println(yytext()); return new Symbol(symbol.IGUAL         ,  yyline , (int)yychar, yytext() ); }                                                                                                               

/*   
+++++++++++++++++++++++++++++++++++++++
++++++++++++ TIPO DE OPERACION ++++++++
+++++++++++++++++++++++++++++++++++++++
*/  

"+"                  {yychar+=1   ;  System.out.println(yytext()); return new Symbol(symbol.SUMA          ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"-"                  {yychar+=1   ;  System.out.println(yytext()); return new Symbol(symbol.RESTA         ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"*"                  {yychar+=1   ;  System.out.println(yytext()); return new Symbol(symbol.PLUS          ,  yyline , (int)yychar, yytext() ); }                                                                                                               
{division}           {yychar+=1   ;  System.out.println(yytext()); return new Symbol(symbol.DIVISION      ,  yyline , (int)yychar, yytext() ); }   

/*   
+++++++++++++++++++++++++++++++++++++++
+++++++++++ TIPO DE FUNCIONES +++++++++
+++++++++++++++++++++++++++++++++++++++
*/  

"ASC"                {yychar+=3   ;  System.out.println(yytext()); return new Symbol(symbol.ASC           ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"DESC"               {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.DESC          ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"LETPAR_NUM"         {yychar+=10  ;  System.out.println(yytext()); return new Symbol(symbol.LETIMPAR_NUM  ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"LETIMPAR_NUM"       {yychar+=12  ;  System.out.println(yytext()); return new Symbol(symbol.LETIMPAR_NUM  ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"REVERSE"            {yychar+=7   ;  System.out.println(yytext()); return new Symbol(symbol.REVERSE       ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"CARACTER_ALEATORIO" {yychar+=18  ;  System.out.println(yytext()); return new Symbol(symbol.CARACTER_RAMD ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"NUM_ALEATORIO"      {yychar+=13  ;  System.out.println(yytext()); return new Symbol(symbol.NUM_ALEATORIO ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"ALERT_INFO"         {yychar+=10  ;  System.out.println(yytext()); return new Symbol(symbol.ALERT_INFO    ,  yyline , (int)yychar, yytext() ); }                                                                                                               
"EXIT"               {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.EXIT          ,  yyline , (int)yychar, yytext() ); }                                                                                                  
"REDIRECT"           {yychar+=9   ;  System.out.println(yytext()); return new Symbol(symbol.REDIRECT      ,  yyline , (int)yychar, yytext() ); }


/*   
+++++++++++++++++++++++++++++++++++++++
+++++++++ TIPO DE SENTENCIA  ++++++++++
+++++++++++++++++++++++++++++++++++++++
*/  

"INIT"               {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.INIT          ,  yyline , (int)yychar, yytext() ); }                                                                                                
"IF"                 {yychar+=2   ;  System.out.println(yytext()); return new Symbol(symbol.IF            ,  yyline , (int)yychar, yytext() ); }                                                                                              
"THEN"               {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.THEN          ,  yyline , (int)yychar, yytext() ); }                                                                                                
"END"                {yychar+=3   ;  System.out.println(yytext()); return new Symbol(symbol.END           ,  yyline , (int)yychar, yytext() ); }                                                                                               
"ELSE"               {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.ELSE          ,  yyline , (int)yychar, yytext() ); }                                                                                                
"REPEAT"             {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.REPEAT        ,  yyline , (int)yychar, yytext() ); }                                                                                                  
"HUNTIL"             {yychar+=6   ;  System.out.println(yytext()); return new Symbol(symbol.HUNTIL        ,  yyline , (int)yychar, yytext() ); }                                                                                                  
"INSERT"             {yychar+=6   ;  System.out.println(yytext()); return new Symbol(symbol.INSERT        ,  yyline , (int)yychar, yytext() ); }                                                                                                  
"WHILE"              {yychar+=5   ;  System.out.println(yytext()); return new Symbol(symbol.WHILE         ,  yyline , (int)yychar, yytext() ); }                                                                                                 
"THENWHILE"          {yychar+=9   ;  System.out.println(yytext()); return new Symbol(symbol.THENWHILE     ,  yyline , (int)yychar, yytext() ); }                                                                                                                                                                                                                  
                                                                                                               
/*   
+++++++++++++++++++++++++++++++++++++++
+++++++++ extras  ++++++++++
+++++++++++++++++++++++++++++++++++++++
*/  
"true"               {yychar+=4   ;  System.out.println(yytext()); return new Symbol(symbol.TRUE          ,  yyline , (int)yychar, yytext() ); }
"false"              {yychar+=5   ;  System.out.println(yytext()); return new Symbol(symbol.FALSE         ,  yyline , (int)yychar, yytext() ); }

"FUNTION_"[a-zA-Z0-9]*"()"         {longitudToken = yytext().length();   yychar+=longitudToken;  System.out.println(yytext());       return new Symbol(symbol.FUNTION      , yyline  ,  (int)yychar, yytext() ); }
["\n"]               {yychar=0; yyline=+1;}
"!!"[^\n]*           {longitudToken = yytext().length(); yychar+=longitudToken; }
"<!--"([^])*"-->"    {longitudToken = yytext().length(); yychar+=longitudToken; }

{TEXTS}{division}{division}{TEXTS}({TEXTS}{division}{TEXTS})*               {longitudToken = yytext().length(); yychar+=longitudToken; System.out.println(" url "+yytext()); return new Symbol(symbol.URL, yyline, (int)yychar, yytext() ); }


[1-9][0-9]*                        {longitudToken = yytext().length();   yychar+=longitudToken;  System.out.println(yytext());       return new Symbol(symbol.NUMERO       , yyline  ,  (int)yychar, yytext() ); }
^[-+]?[0-9]{1,4}                   {longitudToken = yytext().length();   yychar+=longitudToken;  System.out.println(yytext());       return new Symbol(symbol.ENTERO       , yyline  ,  (int)yychar, yytext() ); }
^[-+]?(0|[1-9][0-9]*)\.[0-9]{1,4}  {longitudToken = yytext().length();   yychar+=longitudToken;  System.out.println(yytext());       return new Symbol(symbol.DECIMAL      , yyline  ,  (int)yychar, yytext() ); }

{TEXTS}                      {longitudToken = yytext().length(); yychar+=longitudToken; System.out.println(" txt "+yytext()); return new Symbol(symbol.TEXT, yyline, (int)yychar, yytext() ); }

[a-zA-Z][a-zA-Z0-9_]*              {longitudToken = yytext().length();   yychar+=longitudToken;  System.out.println("id " +yytext());       return new Symbol(symbol.IDENTIFICADOR, yyline  ,  (int)yychar, yytext() ); }



[^]   {
 longitudToken = yytext().length(); yychar+=longitudToken; 
 System.out.println("Error de carácter: "+ yytext());
//ReporteError.agregarError(new Error("Lexico", yytext(), "Caracter no reconocido"+ yytext(), yyline, (int)yychar));

 } 

                                                                                             
                                                                                                               
                                                                                                               
                                                                                                                   