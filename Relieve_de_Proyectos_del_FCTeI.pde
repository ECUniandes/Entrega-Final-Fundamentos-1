//proyecto final para la materia de Fundamentos 1- Maestria en DIseno / Segundo semestre de 2015
//Elaborado por Ernesto Cuellar Urbano Codigo 199911852

//El proyecto busca visualizar mediante el concepto de relieve los proyectos por departamento financiados por el FCTeI del Sistema Nacional de Regalias

// El presente ejercicio esta basado en los datos del Mapa 1.2. Distribución de recursos del Fondo CTeI del SGR aprobados por departamento, vigencia 2012, bienios 2013 - 2014 y 2015 - 2016, con corte a 31 de diciembre de 2014*
// tomado del informe anual de indicadores de ciencia y tecnologia 2014. pagina 44 del informe pagina 42 del PDF. 

// El primer paso es hacer una representacion grafica del mapa de Colombia que sirva como base para construir el relieve.
import processing.opengl.*; //se importa la libreria de OPENGL para facilitar el procesamiento en 3D

//Definición de variables generales
PImage mapa;// el mapa de colombia que se usara como guia
float escalado=0.985; //la relación que se usará para reducir el relieve a medida que sube el alto
float capa=0.15;// la distancia entre cada capa de relieve
float ajuste=10000;//ajuste de las cifras para que encajen en la escala del mapa
Table  tabla;  
PFont letra;
int ojoX=435; //variable para mover el ojo de la camara en X
int ojoY=670; //variable para mover el ojo de la camara en Y
int ojoZ=1250; //variable para mover el ojo de la camara en Z
int centroX=385; // variable para mover el centro de la camara en X
int centroY=490; // variable para mover el centro de la camara en Y
int centroZ=95; // variable para mover el centro de la camara en Z


//Variables para cada departamento
//San Andres y providencia no tienen datos en la tabla por lo que se usaran para propositos de prueba
PShape SanAndres;  // La isla
float altoSanA=2; //Variable para la altura en relieve del departamento
float XSanA; //Posición del departamento en X
float YSanA; //Posición del departamento en Y

PShape Providencia; //la otra isla
float altoProv=2; //Variable para la altura en relieve del departamento
float XProv; //Posición del departamento en X
float YProv; //Posición del departamento en Y

//Los departamentos que incluye la tabla
PShape ATL; //1.atlantico
float altoATL=2; //Variable para la altura en relieve del departamento
float XATL; //Posición del departamento en X
float YATL; //Posición del departamento en Y

PShape BOL; //2.Bolivar
float altoBOL=4; //Variable para la altura en relieve del departamento
float XBOL; //Posición del departamento en X
float YBOL; //Posición del departamento en Y

PShape CES; //3.Cesar
float altoCES=6; //Variable para la altura en relieve del departamento
float XCES; //Posición del departamento en X
float YCES; //Posición del departamento en Y

PShape COR; //4.CORDOBA
float altoCOR=8; //Variable para la altura en relieve del departamento
float XCOR; //Posición del departamento en X
float YCOR; //Posición del departamento en Y

PShape LAG; //5. LA GUAJIRA
float altoLAG=10; //Variable para la altura en relieve del departamento
float XLAG; //Posición del departamento en X
float YLAG; //Posición del departamento en Y

PShape MAG; //6. Magdalena
float altoMAG=12; //Variable para la altura en relieve del departamento
float XMAG; //Posición del departamento en X
float YMAG; //Posición del departamento en Y

PShape SUC; //7. Sucre
float altoSUC=14; //Variable para la altura en relieve del departamento
float XSUC; //Posición del departamento en X
float YSUC; //Posición del departamento en Y

PShape BOY; //8. Boyaca
float altoBOY=16; //Variable para la altura en relieve del departamento
float XBOY; //Posición del departamento en X
float YBOY; //Posición del departamento en Y

PShape BOG; //9. Bogota
float altoBOG=20; //Variable para la altura en relieve del departamento
float XBOG; //Posición del departamento en X
float YBOG; //Posición del departamento en Y

PShape CUN; //10. Cundinamarca
float altoCUN=22; //Variable para la altura en relieve del departamento
float XCUN; //Posición del departamento en X
float YCUN; //Posición del departamento en Y

PShape NSA; //11. Norte de Santander
float altoNSA=24; //Variable para la altura en relieve del departamento
float XNSA; //Posición del departamento en X
float YNSA; //Posición del departamento en Y

PShape SAN; //12. Santander
float altoSAN=26; //Variable para la altura en relieve del departamento
float XSAN; //Posición del departamento en X
float YSAN; //Posición del departamento en Y

PShape AMA; //13. Amazonas
float altoAMA=28; //Variable para la altura en relieve del departamento
float XAMA; //Posición del departamento en X
float YAMA; //Posición del departamento en Y

PShape CAQ; //14. Caqueta
float altoCAQ=30; //Variable para la altura en relieve del departamento
float XCAQ; //Posición del departamento en X
float YCAQ; //Posición del departamento en Y

PShape HUI; //15. Huila
float altoHUI=32; //Variable para la altura en relieve del departamento
float XHUI; //Posición del departamento en X
float YHUI; //Posición del departamento en Y

PShape PUT; //16. Putumayo
float altoPUT=34; //Variable para la altura en relieve del departamento
float XPUT; //Posición del departamento en X
float YPUT; //Posición del departamento en Y

PShape TOL; //17. Tolima
float altoTOL=36; //Variable para la altura en relieve del departamento
float XTOL; //Posición del departamento en X
float YTOL; //Posición del departamento en Y

PShape ANT; //18. Antioquia
float altoANT=38; //Variable para la altura en relieve del departamento
float XANT; //Posición del departamento en X
float YANT; //Posición del departamento en Y

PShape CAL; //19. Caldas
float altoCAL=40; //Variable para la altura en relieve del departamento
float XCAL; //Posición del departamento en X
float YCAL; //Posición del departamento en Y

PShape QUI; //20. Quindio
float altoQUI=42; //Variable para la altura en relieve del departamento
float XQUI; //Posición del departamento en X
float YQUI; //Posición del departamento en Y

PShape RIS; //21. Risaralda
float altoRIS=44; //Variable para la altura en relieve del departamento
float XRIS; //Posición del departamento en X
float YRIS; //Posición del departamento en Y

PShape ARA; //22. Arauca
float altoARA=46; //Variable para la altura en relieve del departamento
float XARA; //Posición del departamento en X
float YARA; //Posición del departamento en Y

PShape CAS; //23. Casanare
float altoCAS=48; //Variable para la altura en relieve del departamento
float XCAS; //Posición del departamento en X
float YCAS; //Posición del departamento en Y

PShape GUI; //24. Guainia
float altoGUI=50; //Variable para la altura en relieve del departamento
float XGUI; //Posición del departamento en X
float YGUI; //Posición del departamento en Y

PShape GUE; //25. Guaviare
float altoGUE=52; //Variable para la altura en relieve del departamento
float XGUE; //Posición del departamento en X
float YGUE; //Posición del departamento en Y


PShape MET; //26. Meta
float altoMET=54; //Variable para la altura en relieve del departamento
float XMET; //Posición del departamento en X
float YMET; //Posición del departamento en Y


PShape VAU; //27. Vaupes
float altoVAU=56; //Variable para la altura en relieve del departamento
float XVAU; //Posición del departamento en X
float YVAU; //Posición del departamento en Y

PShape VIC; //28. Vichada
float altoVIC=58; //Variable para la altura en relieve del departamento
float XVIC; //Posición del departamento en X
float YVIC; //Posición del departamento en Y

PShape CAU; //29. Cauca
float altoCAU=60; //Variable para la altura en relieve del departamento
float XCAU; //Posición del departamento en X
float YCAU; //Posición del departamento en Y

PShape CHO; //30. Choco
float altoCHO=62; //Variable para la altura en relieve del departamento
float XCHO; //Posición del departamento en X
float YCHO; //Posición del departamento en Y

PShape NAR; //31. Narino
float altoNAR=64; //Variable para la altura en relieve del departamento
float XNAR; //Posición del departamento en X
float YNAR; //Posición del departamento en Y

PShape VAL; //32. Valle del Cauca
float altoVAL=66; //Variable para la altura en relieve del departamento
float XVAL; //Posición del departamento en X
float YVAL; //Posición del departamento en Y



     

void setup() {

  //Cuando es en 3D
  size(1920, 1080,OPENGL); // idealmenten en OPENGL por lo que son muchos shapes FHD 1920x1080
  
  //Cuando es en 2D
  //size(1000, 1080);
  
  //Cargado de la tabla
  tabla  =  loadTable("datos.csv",  "header");  
  
  
  // se carga una imagen que se utilizara como base para la creacion de la visualizacion
  mapa = loadImage("MAPA.jpg");// el mapa se deshabilita una vez esten cargados los departamentos como shape

  //se carga la letra
  letra = loadFont("AdobeDevanagari-Bold-62.vlw");
  // se define el tamano de la letra
  textFont(letra,20);
  // se define el suavizado de la letra.
  smooth(5);


//Se dibujan por vertices cada uno de los departamentos.
  //San Andres
  XSanA=60;
  YSanA=32;
  SanAndres = createShape();
  SanAndres.beginShape();
  SanAndres.fill(200);
  SanAndres.stroke(120);
  SanAndres.vertex(0, 0);
  SanAndres.vertex(-20, 15);
  SanAndres.vertex(-20, 30);
  SanAndres.vertex(-30, 35);
  SanAndres.vertex(-35, 60);
  SanAndres.vertex(-25, 70);
  SanAndres.vertex(-25, 85);
  SanAndres.vertex(-32, 90);
  SanAndres.vertex(-32, 100);
  SanAndres.vertex(-28, 110);
  SanAndres.vertex(-20, 100);
  SanAndres.vertex(0, 30);
  SanAndres.endShape(CLOSE);

  //Providencia
  XProv=125;
  YProv=20;
  Providencia = createShape();
  Providencia.beginShape();
  Providencia.fill(200);
  Providencia.stroke(120);
  Providencia.vertex(0, 0);
  Providencia.vertex(-20, 15);
  Providencia.vertex(-20, 55);
  Providencia.vertex(10, 40);
  Providencia.vertex(15, 30);
  Providencia.endShape(CLOSE);

  //Departamento 1 ATLANTICO
  XATL=274;
  YATL=93;
  ATL = createShape();
  ATL.beginShape();
  ATL.fill(200);
  ATL.stroke(120);
  ATL.vertex(0, 0);
  ATL.vertex(-25, 23);
  ATL.vertex(-25, 34);
  ATL.vertex(-5, 50);
  ATL.vertex(7, 33);
  ATL.endShape(CLOSE);

  //Departamento 2 BOLIVAR
  XBOL=247;
  YBOL=116;
  BOL = createShape();
  BOL.beginShape();
  BOL.fill(200);
  BOL.stroke(120);
  BOL.vertex(0, 0);
  BOL.vertex(-13, 11);
  BOL.vertex(-16, 34);
  BOL.vertex(22, 83);
  BOL.vertex(47, 122);
  BOL.vertex(47, 144);
  BOL.vertex(31, 157);
  BOL.vertex(47, 175);
  BOL.vertex(59, 233);
  BOL.vertex(83, 218);
  BOL.vertex(87, 171);
  BOL.vertex(89, 116);
  BOL.vertex(29, 83);
  BOL.vertex(27, 46);
  BOL.vertex(22, 26);
  BOL.endShape(CLOSE);

  //Departamento 3 CESAR
  XCES=375;
  YCES=109;
  CES = createShape();
  CES.beginShape();
  CES.fill(200);
  CES.stroke(120);
  CES.vertex(0, 0);
  CES.vertex(-21, 1);
  CES.vertex(-20, 23);
  CES.vertex(-52, 48);
  CES.vertex(-35, 76);
  CES.vertex(-55, 83);
  CES.vertex(-36, 115);
  CES.vertex(-40, 122);
  CES.vertex(-40, 170);
  CES.vertex(-20, 199);
  CES.vertex(-4, 181);
  CES.vertex(-17, 139);
  CES.vertex(-9, 101);
  CES.vertex(23, 29);
  CES.endShape(CLOSE);

  //Departamento 4 CORDOBA
  XCOR=212;
  YCOR=197;
  COR = createShape();
  COR.beginShape();
  COR.fill(200);
  COR.stroke(120);
  COR.vertex(0, 0);
  COR.vertex(-36, 38);
  COR.vertex(-22, 64);
  COR.vertex(-36, 95);
  COR.vertex(-35, 130);
  COR.vertex(-2, 130);
  COR.vertex(38, 88);
  COR.vertex(65, 75);
  COR.vertex(53, 62);
  COR.vertex(37, 62);
  COR.vertex(32, 38);
  COR.vertex(39, 33);  
  COR.endShape(CLOSE);


  //Departamento 5 LA GUAJIRA
  XLAG=474;
  YLAG=7;
  LAG = createShape();
  LAG.beginShape();
  LAG.fill(200);
  LAG.stroke(120);
  LAG.vertex(0, 0);
  LAG.vertex(-31, 11);
  LAG.vertex(-38, 36);
  LAG.vertex(-96, 72);
  LAG.vertex(-120, 73);
  LAG.vertex(-120, 103);
  LAG.vertex(-98, 103);
  LAG.vertex(-76, 131);
  LAG.vertex(-16, 51);
  LAG.vertex(36, 26);
  LAG.vertex(30, 6);
  LAG.endShape(CLOSE);

  //Departamento 6 MAGDALENA
  XMAG=353;
  YMAG=79;
  MAG = createShape();
  MAG.beginShape();
  MAG.fill(200);
  MAG.stroke(120);
  MAG.vertex(0, 0);
  MAG.vertex(-35, 2);
  MAG.vertex(-42, 18);
  MAG.vertex(-77, 12);
  MAG.vertex(-73, 49);
  MAG.vertex(-83, 64);
  MAG.vertex(-77, 119);
  MAG.vertex(-20, 151);
  MAG.vertex(-15, 145);
  MAG.vertex(-29, 115);
  MAG.vertex(-13, 106);
  MAG.vertex(-31, 78);
  MAG.vertex(2, 50);
  MAG.endShape(CLOSE);

  //Departamento 7 SUCRE
  XSUC=231;
  YSUC=152;
  SUC = createShape();
  SUC.beginShape();
  SUC.fill(200);
  SUC.stroke(120);
  SUC.vertex(0, 0);
  SUC.vertex(-8, 26);
  SUC.vertex(-3, 33);
  SUC.vertex(-16, 45);
  SUC.vertex(21, 78);
  SUC.vertex(12, 83);
  SUC.vertex(20, 109);
  SUC.vertex(35, 106);
  SUC.vertex(46, 118);
  SUC.vertex(62, 107);
  SUC.vertex(62, 87);
  SUC.vertex(39, 48);
  SUC.endShape(CLOSE);

  //Departamento 8 BOYACA
  XBOY=451;
  YBOY=343;
  BOY = createShape();
  BOY.beginShape();
  BOY.fill(200);
  BOY.stroke(120);
  BOY.vertex(0, 0);
  BOY.vertex(-23, 17);
  BOY.vertex(-73, 76);
  BOY.vertex(-104, 94);
  BOY.vertex(-161, 57);
  BOY.vertex(-165, 88);
  BOY.vertex(-146, 87);
  BOY.vertex(-142, 102);
  BOY.vertex(-123, 110);
  BOY.vertex(-110, 101);
  BOY.vertex(-91, 130);
  BOY.vertex(-95, 146);
  BOY.vertex(-66, 157);
  BOY.vertex(-51, 113);
  BOY.vertex(-20, 104);
  BOY.vertex(-21, 57);
  BOY.vertex(2, 10);
  BOY.endShape(CLOSE);

  //Departamento 9 BOGOTA
  XBOG=323;
  YBOG=491;
  BOG = createShape();
  BOG.beginShape();
  BOG.fill(200);
  BOG.stroke(120);
  BOG.vertex(0, 0);
  BOG.vertex(-9, 10);
  BOG.vertex(-10, 44);
  BOG.vertex(-18, 46);
  BOG.vertex(-24, 66);
  BOG.vertex(-4, 50);
  BOG.vertex(4, 15);
  BOG.endShape(CLOSE);

  //Departamento 10 CUNDINAMARCA
  XCUN=286;
  YCUN=431;
  CUN = createShape();
  CUN.beginShape();
  CUN.fill(200);
  CUN.stroke(120);
  CUN.vertex(0, 0);
  CUN.vertex(-17, 93);
  CUN.vertex(10, 96);
  CUN.vertex(6, 122);
  CUN.vertex(12, 128);
  CUN.vertex(26, 103);
  CUN.vertex(27, 70);
  CUN.vertex(37, 57);
  CUN.vertex(42, 74);
  CUN.vertex(34, 110);
  CUN.vertex(58, 99);
  CUN.vertex(54, 86);
  CUN.vertex(69, 80);
  CUN.vertex(71, 92);
  CUN.vertex(95, 96);
  CUN.vertex(99, 70);
  CUN.vertex(69, 55);
  CUN.vertex(73, 42);
  CUN.vertex(55, 14);
  CUN.vertex(43, 21);
  CUN.vertex(22, 13);
  CUN.vertex(18, 1);
  CUN.endShape(CLOSE);

  //Departamento 11 NORTE DE SANTANDER
  XNSA=390;
  YNSA=205;
  NSA = createShape();
  NSA.beginShape();
  NSA.fill(200);
  NSA.stroke(120);
  NSA.vertex(0, 0);
  NSA.vertex(-23, 5);
  NSA.vertex(-32, 40);
  NSA.vertex(-18, 84);
  NSA.vertex(-35, 103);
  NSA.vertex(-18, 112);
  NSA.vertex(4, 107);
  NSA.vertex(10, 143);
  NSA.vertex(35, 155);
  NSA.vertex(60, 138);
  NSA.vertex(51, 138);
  NSA.vertex(54, 122);
  NSA.vertex(37, 118);
  NSA.vertex(43, 59);
  NSA.endShape(CLOSE);

  //Departamento 12 SANTANDER
  XSAN=335;
  YSAN=282;
  SAN = createShape();
  SAN.beginShape();
  SAN.fill(200);
  SAN.stroke(120);
  SAN.vertex(0, 0);
  SAN.vertex(-3, 51);
  SAN.vertex(1, 70);
  SAN.vertex(-44, 118);
  SAN.vertex(12, 155);
  SAN.vertex(43, 137);
  SAN.vertex(94, 80);
  SAN.vertex(64, 67);
  SAN.vertex(58, 30);
  SAN.vertex(33, 36);
  SAN.endShape(CLOSE);

  //Departamento 13 AMAZONAS
  XAMA=501;
  YAMA=790;
  AMA = createShape();
  AMA.beginShape();
  AMA.fill(200);
  AMA.stroke(120);
  AMA.vertex(0, 0);
  AMA.vertex(-75, 44);
  AMA.vertex(-163, 34);
  AMA.vertex(-197, 43);
  AMA.vertex(-104, 164);
  AMA.vertex(20, 145);
  AMA.vertex(79, 180);
  AMA.vertex(36, 247);
  AMA.vertex(62, 248);
  AMA.vertex(84, 274);
  AMA.vertex(115, 86);
  AMA.endShape(CLOSE);

  //Departamento 14 CAQUETA
  XCAQ=269;
  YCAQ=609;
  CAQ = createShape();
  CAQ.beginShape();
  CAQ.fill(200);
  CAQ.stroke(120);
  CAQ.vertex(0, 0);
  CAQ.vertex(-77, 89);
  CAQ.vertex(-88, 112);
  CAQ.vertex(69, 215);
  CAQ.vertex(155, 227);
  CAQ.vertex(231, 181);
  CAQ.vertex(132, 112);
  CAQ.vertex(118, 129);
  CAQ.vertex(80, 85);
  CAQ.vertex(19, 67);
  CAQ.vertex(14, 41);
  CAQ.vertex(26, 16);
  CAQ.endShape(CLOSE);

  //Departamento 15 HUILA
  XHUI=291;
  YHUI=555;
  HUI = createShape();
  HUI.beginShape();
  HUI.fill(200);
  HUI.stroke(120);
  HUI.vertex(0, 0);
  HUI.vertex(-22, 32);
  HUI.vertex(-32, 32);
  HUI.vertex(-31, 23);
  HUI.vertex(-64, 30);
  HUI.vertex(-67, 46);
  HUI.vertex(-82, 57);
  HUI.vertex(-99, 56);
  HUI.vertex(-83, 68);
  HUI.vertex(-85, 88);
  HUI.vertex(-115, 91);
  HUI.vertex(-127, 107);
  HUI.vertex(-128, 121);
  HUI.vertex(-100, 143);
  HUI.vertex(-22, 53);
  HUI.vertex(-3, 38);
  HUI.vertex(8, 5);
  HUI.endShape(CLOSE);

  //Departamento 16 PUTUMAYO
  XPUT=144;
  YPUT=710;
  PUT = createShape();
  PUT.beginShape();
  PUT.fill(200);
  PUT.stroke(120);
  PUT.vertex(0, 0);
  PUT.vertex(-17, 41);
  PUT.vertex(-20, 55);
  PUT.vertex(-10, 63);
  PUT.vertex(34, 70);
  PUT.vertex(39, 56);
  PUT.vertex(100, 92);
  PUT.vertex(113, 86);
  PUT.vertex(161, 123);
  PUT.vertex(191, 113);
  PUT.vertex(52, 21);
  PUT.vertex(23, 18);
  PUT.vertex(23, 1);
  PUT.vertex(16, -6);
  PUT.endShape(CLOSE);

  //Departamento 17 TOLIMA
  XTOL=278;
  YTOL=462;
  TOL = createShape();
  TOL.beginShape();
  TOL.fill(200);
  TOL.stroke(120);
  TOL.vertex(0, 0);
  TOL.vertex(-39, 12);
  TOL.vertex(-44, 39);
  TOL.vertex(-85, 105);
  TOL.vertex(-91, 136);
  TOL.vertex(-86, 150);
  TOL.vertex(-69, 150);
  TOL.vertex(-54, 138);
  TOL.vertex(-51, 124);
  TOL.vertex(-19, 116);
  TOL.vertex(-19, 124);
  TOL.vertex(-8, 124);
  TOL.vertex(15, 92);
  TOL.vertex(17, 65);
  TOL.vertex(-8, 60);
  TOL.endShape(CLOSE);

  //Departamento 18 ANTIOQUIA
  XANT=174;
  YANT=234;
  ANT = createShape();
  ANT.beginShape();
  ANT.fill(200);
  ANT.stroke(120);
  ANT.vertex(0, 0);
  ANT.vertex(-31, 21);
  ANT.vertex(-18, 53);
  ANT.vertex(-30, 61);
  ANT.vertex(-36, 41);
  ANT.vertex(-43, 67);
  ANT.vertex(-8, 116);
  ANT.vertex(-34, 129);
  ANT.vertex(-17, 172);
  ANT.vertex(10, 171);
  ANT.vertex(22, 208);
  ANT.vertex(34, 215);
  ANT.vertex(53, 211);
  ANT.vertex(51, 198);
  ANT.vertex(64, 201);
  ANT.vertex(71, 216);
  ANT.vertex(112, 197);
  ANT.vertex(116, 166);
  ANT.vertex(161, 117);
  ANT.vertex(157, 100);
  ANT.vertex(133, 114);
  ANT.vertex(120, 59);
  ANT.vertex(102, 38);
  ANT.vertex(77, 50);
  ANT.vertex(36, 93);
  ANT.vertex(2, 91);
  ANT.vertex(2, 58);
  ANT.vertex(15, 28);
  ANT.endShape(CLOSE);

  //Departamento 19 CALDAS
  XCAL=286;
  YCAL=432;
  CAL = createShape();
  CAL.beginShape();
  CAL.fill(200);
  CAL.stroke(120);
  CAL.vertex(0, 0);
  CAL.vertex(-43,17);
  CAL.vertex(-46,4);
  CAL.vertex(-60,0);
  CAL.vertex(-59,13);
  CAL.vertex(-77,19);
  CAL.vertex(-73,45);
  CAL.vertex(-53,61);
  CAL.vertex(-47,44);
  CAL.vertex(-9,34);
  CAL.endShape(CLOSE);

  //Departamento 20 QUINDIO
  XQUI=233;
  YQUI=500;
  QUI = createShape();
  QUI.beginShape();
  QUI.fill(200);
  QUI.stroke(120);
  QUI.vertex(0, 0);
  QUI.vertex(-24, -4);
  QUI.vertex(-26, 38);
  QUI.endShape(CLOSE);

  //Departamento 21 RISARALDA
  XRIS=196;
  YRIS=443;
  RIS = createShape();
  RIS.beginShape();
  RIS.fill(200);
  RIS.stroke(120);
  RIS.vertex(0, 0);
  RIS.vertex(-8,11);
  RIS.vertex(-1,33);
  RIS.vertex(14,54);
  RIS.vertex(35,57);
  RIS.vertex(39,52);
  RIS.vertex(18,34);
  RIS.vertex(12,8);
  RIS.endShape(CLOSE);

  //Departamento 22 ARAUCA
  XARA=453;
  YARA=351;
  ARA = createShape();
  ARA.beginShape();
  ARA.fill(200);
  ARA.stroke(120);
  ARA.vertex(0, 0);
  ARA.vertex(-23,49);
  ARA.vertex(-7,60);
  ARA.vertex(116,47);
  ARA.vertex(136,64);
  ARA.vertex(163,58);
  ARA.vertex(123,1);
  ARA.vertex(89,-17);
  ARA.endShape(CLOSE);

  //Departamento 23 CASANARE
  XCAS=431;
  YCAS=401;
  CAS = createShape();
  CAS.beginShape();
  CAS.fill(200);
  CAS.stroke(120);
  CAS.vertex(0, 0);
  CAS.vertex(1, 44);
  CAS.vertex(-30, 56);
  CAS.vertex(-44, 99);
  CAS.vertex(-22,125);
  CAS.vertex(81,87);
  CAS.vertex(139,41);
  CAS.vertex(157,14);
  CAS.vertex(139,-11);
  CAS.vertex(16, 10);
  CAS.endShape(CLOSE);

  //Departamento 24 GUAINIA
  XGUI=727;
  YGUI=545;
  GUI = createShape();
  GUI.beginShape();
  GUI.fill(200);
  GUI.stroke(120);
  GUI.vertex(0, 0);
  GUI.vertex(-38,3);
  GUI.vertex(-116,21);
  GUI.vertex(-153,41);
  GUI.vertex(-168,72);
  GUI.vertex(-199,91);
  GUI.vertex(-180,110);
  GUI.vertex(-147,113);
  GUI.vertex(-155,125);
  GUI.vertex(-134,144);
  GUI.vertex(-31,142);
  GUI.vertex(22,109);
  GUI.vertex(40,177);
  GUI.vertex(53,173);
  GUI.vertex(33,98);
  GUI.vertex(-8,70);
  GUI.vertex(26,34);
  GUI.endShape(CLOSE);

  //Departamento 25 GUAVIARE
  XGUE=511;
  YGUE=615;
  GUE = createShape();
  GUE.beginShape();
  GUE.fill(200);
  GUE.stroke(120);
  GUE.vertex(0, 0);
  GUE.vertex(-65,2);
  GUE.vertex(-159,32);
  GUE.vertex(-160,79);
  GUE.vertex(-124,121);
  GUE.vertex(-108,106);
  GUE.vertex(-61,140);
  GUE.vertex(-31,115);
  GUE.vertex(-16,72);
  GUE.vertex(59,53);
  GUE.vertex(69,41);
  GUE.vertex(35,40);
  GUE.vertex(16,20);
  GUE.vertex(37,7);
  GUE.endShape(CLOSE);

  //Departamento 26 META
  XMET=511;
  YMET=490;
  MET = createShape();
  MET.beginShape();
  MET.fill(200);
  MET.stroke(120);
  MET.vertex(0, 0);
  MET.vertex(-102,36);
  MET.vertex(-125,11);
  MET.vertex(-130,37);
  MET.vertex(-154,34);
  MET.vertex(-156,21);
  MET.vertex(-169,28);  
  MET.vertex(-167,39);
  MET.vertex(-190,50);
  MET.vertex(-211,71);
  MET.vertex(-223,102);
  MET.vertex(-243,118);
  MET.vertex(-215,137);
  MET.vertex(-227,161);
  MET.vertex(-223,184);
  MET.vertex(-161,204);
  MET.vertex(-160,157);
  MET.vertex(-112,143);
  MET.vertex(-66,127);
  MET.vertex(0,125);
  MET.endShape(CLOSE);

  //Departamento 27 VAUPES
  XVAU=570;
  YVAU=668;
  VAU = createShape();
  VAU.beginShape();
  VAU.fill(200);
  VAU.stroke(120);
  VAU.vertex(0, 0);
  VAU.vertex(-75,19);
  VAU.vertex(-87,60);
  VAU.vertex(-119,87);
  VAU.vertex(47,209);
  VAU.vertex(49,202);
  VAU.vertex(36,174);
  VAU.vertex(36,161);
  VAU.vertex(10, 139);
  VAU.vertex(10,91);
  VAU.vertex(64,87);
  VAU.vertex(52,58);
  VAU.vertex(22,57);
  VAU.vertex(22,21);
  VAU.endShape(CLOSE);

  //Departamento 28 VICHADA
  XVIC=616;
  YVIC=410;
  VIC = createShape();
  VIC.beginShape();
  VIC.fill(200);
  VIC.stroke(120);
  VIC.vertex(0, 0);
  VIC.vertex(-29,4);
  VIC.vertex(-54,31);
  VIC.vertex(-104,78);
  VIC.vertex(-105,203);
  VIC.vertex(-69,213);
  VIC.vertex(-57,207);
  VIC.vertex(-42,176);
  VIC.vertex(-7,155);
  VIC.vertex(72,138);
  VIC.vertex(113,136);
  VIC.vertex(100,99);
  VIC.vertex(103,46);
  VIC.vertex(129,5);
  VIC.vertex(126,-7);
  VIC.vertex(101,-13);
  VIC.endShape(CLOSE);

  //Departamento 29 CAUCA
  XCAU=165;
  YCAU=586;
  CAU = createShape();
  CAU.beginShape();
  CAU.fill(200);
  CAU.stroke(120);
  CAU.vertex(0, 0);
  CAU.vertex(-5,14);
  CAU.vertex(-44,14);
  CAU.vertex(-58,7);
  CAU.vertex(-72,20);
  CAU.vertex(-69,29);
  CAU.vertex(-85,40);
  CAU.vertex(-84,53);
  CAU.vertex(-66,71);
  CAU.vertex(-43,75);
  CAU.vertex(-37,87);
  CAU.vertex(-44,104);
  CAU.vertex(-20,102);
  CAU.vertex(-20,123);
  CAU.vertex(-4,118);
  CAU.vertex(3,126);
  CAU.vertex(0,142);
  CAU.vertex(27,144);
  CAU.vertex(15,135);
  CAU.vertex(25,112);
  CAU.vertex(-1,92);
  CAU.vertex(-2,76);
  CAU.vertex(11,60);
  CAU.vertex(40,56);
  CAU.vertex(42,38);
  CAU.vertex(26,26);
  CAU.vertex(21,8);
  CAU.endShape(CLOSE);

  //Departamento 30 CHOCO
  XCHO=117;
  YCHO=246;
  CHO = createShape();
  CHO.beginShape();
  CHO.fill(200);
  CHO.stroke(120);
  CHO.vertex(0, 0);
  CHO.vertex(-7, 10);
  CHO.vertex(10,47);
  CHO.vertex(-17,74);
  CHO.vertex(-25,60);
  CHO.vertex(-34,93); 
  CHO.vertex(-2,138);
  CHO.vertex(-11,156);
  CHO.vertex(4,187);
  CHO.vertex(-12,189);
  CHO.vertex(-2,268);
  CHO.vertex(-13,277);
  CHO.vertex(-9,288);
  CHO.vertex(5,281);
  CHO.vertex(32,295);
  CHO.vertex(52,285);
  CHO.vertex(47,274);
  CHO.vertex(78,229);
  CHO.vertex(70,210);
  CHO.vertex(78,198);
  CHO.vertex(67,160);
  CHO.vertex(39,158);
  CHO.vertex(24,120);
  CHO.vertex(48,104);
  CHO.vertex(16,55);
  CHO.vertex(21, 28); 
  CHO.endShape(CLOSE);

  //Departamento 31 NARINO
  XNAR=79;
  YNAR=628;
  NAR = createShape();
  NAR.beginShape();
  NAR.fill(200);
  NAR.stroke(120);
  NAR.vertex(0, 0);
  NAR.vertex(-30,1);
  NAR.vertex(-46,28);
  NAR.vertex(-39,55);
  NAR.vertex(-56,52);
  NAR.vertex(-68,65);
  NAR.vertex(3,117);
  NAR.vertex(16,115);
  NAR.vertex(26,128);
  NAR.vertex(29,142);
  NAR.vertex(46,138);
  NAR.vertex(66,80);
  NAR.vertex(65,61);
  NAR.vertex(40,62);
  NAR.vertex(47,45);
  NAR.vertex(42,32);
  NAR.vertex(19,30);
  NAR.vertex(0, 11);
  NAR.endShape(CLOSE);


  //Departamento 32 VALLE DEL CAUCA
  XVAL=195;
  YVAL=478;
  VAL = createShape();
  VAL.beginShape();
  VAL.fill(200);
  VAL.stroke(120);
  VAL.vertex(0, 0);
  VAL.vertex(-30,43);
  VAL.vertex(-26,52);
  VAL.vertex(-47, 64);
  VAL.vertex(-73,50);
  VAL.vertex(-86,58);
  VAL.vertex(-63,69);
  VAL.vertex(-76,83);
  VAL.vertex(-94,108);
  VAL.vertex(-75,119);
  VAL.vertex(-36,121);
  VAL.vertex(-31,106);
  VAL.vertex(-8,115);
  VAL.vertex(-3,88);
  VAL.vertex(12,62);
  VAL.vertex(13,20);
  VAL.endShape(CLOSE);



//// se verifica que se esten trabajando con todas las columnas de la tabla
//println(tabla.getRowCount()  +  "  Columnas totales en la tabla"); 

//// se leen de la tabla las cifras de inversion de cada departamento

altoATL=tabla.getFloat(0, "Total");
altoBOL=tabla.getFloat(1, "Total");
altoCES=tabla.getFloat(2, "Total");
altoCOR=tabla.getFloat(3, "Total");
altoLAG=tabla.getFloat(4, "Total");
altoMAG=tabla.getFloat(5, "Total");
altoSUC=tabla.getFloat(6, "Total");
altoBOY=tabla.getFloat(7, "Total");
altoBOG=tabla.getFloat(8, "Total");
altoCUN=tabla.getFloat(9, "Total");
altoNSA=tabla.getFloat(10, "Total");
altoSAN=tabla.getFloat(11, "Total");
altoAMA=tabla.getFloat(12, "Total");
altoCAQ=tabla.getFloat(13, "Total");
altoHUI=tabla.getFloat(14, "Total");
altoPUT=tabla.getFloat(15, "Total");
altoTOL=tabla.getFloat(16, "Total");
altoANT=tabla.getFloat(17, "Total");
altoCAL=tabla.getFloat(18, "Total");
altoQUI=tabla.getFloat(19, "Total");
altoRIS=tabla.getFloat(20, "Total");
altoARA=tabla.getFloat(21, "Total");
altoCAS=tabla.getFloat(22, "Total");
altoGUI=tabla.getFloat(23, "Total");
altoGUE=tabla.getFloat(24, "Total");
altoMET=tabla.getFloat(25, "Total");
altoVAU=tabla.getFloat(26, "Total");
altoVIC=tabla.getFloat(27, "Total");
altoCAU=tabla.getFloat(28, "Total");
altoCHO=tabla.getFloat(29, "Total");
altoNAR=tabla.getFloat(30, "Total");
altoVAL=tabla.getFloat(31, "Total");

}

void draw() {

  
//3D EL MAPA

  //Fijando el fondo blanco
  background(255);
  //cargando el mapa para guiarse... una vez se termine la visualizacion el mapa se oculta y se programa para aparecer al presionar M



//TITULO
// se pone el texto del titulo
//fill(200);
//rect(0,0, 2100, 95);
//fill(255);
//text("Distribución de recursos del Fondo CTeI del Sistema General de Regalias (SGR) aprobados por departamento",10,25);


  //Graficando los ejes de coordenadas para guiarse
  //Cuadricula de guia a desabilitar cuando la grafica este terminada
  //for (int eje= 10; eje < 1000; eje = eje+10)
  //{
  //stroke(0, 255, 0);//Eje Y en VERDE
  //line (0, eje, 0, 1000, eje, 0);
  //stroke(255, 0, 0);//Eje X en ROJO
  //line(eje, 0, 0, eje, 1000, 0);
    
  
  //stroke(0, 0, 250); //EJE z en AZUL
  //line (0, 0, eje, 0, 5000, eje);
  //line (0, 0, eje, 5000, 0, eje);
  //println(eje);
  //}

//Opcion 1 para mover el MAPA con el MOUSE

   // camera(mouseX*2, 600, mouseY*2, 350, 350, 0, 0, 0, -1);
    
   // println("X"+mouseX+"  Y"+mouseY);
   
// Opcion 2 para mover el mapa con el teclado   

    //camera(ojoX,ojoY,ojoZ,centroX,centroY,centroZ, 0, 0, -1);
    
//Opcion 3 combinado teclado y mouse

    camera(mouseX*2+ojoX,ojoY,mouseY*2+ojoZ,centroX,centroY,centroZ, 0, 0, -1);



//EL MAPA

shape(ATL, 274, 93);
shape(BOL, 247,116);
shape(CES,375,109);
shape(COR, 212, 197);
shape(LAG, 474, 7);
shape(MAG, 353, 79);
shape(SUC, 231, 152);
shape(BOY, 451, 343);
shape(BOG, 323, 491);
shape(CUN, 286, 431);
shape(NSA, 390, 205);
shape(SAN, 335, 282);
shape(AMA, 501, 790);
shape(CAQ, 269, 609);
shape(HUI, 291, 555);
shape(PUT, 144, 710);
shape(TOL, 278, 462);
shape(ANT, 174, 234);
shape(CAL, 286, 432);
shape(QUI, 233, 500);
shape(RIS, 196, 443);
shape(ARA, 453, 351);
shape(CAS, 431, 401);
shape(GUI, 727, 545);
shape(GUE, 511, 615);
shape(MET, 511, 490);
shape(VAU, 570, 668);
shape(VIC, 616, 410);
shape(CAU, 165, 586); 
shape(CHO, 117, 246);
shape(NAR,  79, 628); 
shape(VAL, 195, 478);



// LAS PRIMERAS PRUEBAS DE RELIEVE QUE ME PERMITIERON COSTRUIR UNA FUNCION
//Relieve de SAN ANDRES 
    //pushMatrix();
    //for (float relieve=0; relieve<altoSanA; relieve = relieve+1)
    //{
    //translate(0,0,relieve);
    //shape(SanAndres, 60, 32);
    //translate((60-(60*0.95)),(32-(32*0.95)),0);
    //scale(escalado);
    //}
    //popMatrix();

//Relieve de Providencia
    //pushMatrix();  
    //for (float relieve=0; relieve<altoProv; relieve = relieve+1)
    //{
    // translate((125-(125*0.95)), (20-(20*0.95)), (relieve));
    // scale(escalado);
    // shape(Providencia, 125, 20);
    //}
    //popMatrix();
    
    
    
// EL RELIEVE 
coordillera(ATL,XATL,YATL,altoATL);  
coordillera(BOL,XBOL,YBOL,altoBOL);  
coordillera(CES,XCES,YCES,altoCES);  
coordillera(COR,XCOR,YCOR,altoCOR);        
coordillera(LAG,XLAG,YLAG,altoLAG);    
coordillera(MAG,XMAG,YMAG,altoMAG);      
coordillera(SUC,XSUC,YSUC,altoSUC);     
coordillera(BOY,XBOY,YBOY,altoBOY);  
coordillera(BOG,XBOG,YBOG,altoBOG);  
coordillera(CUN,XCUN,YCUN,altoCUN);  
coordillera(NSA,XNSA,YNSA,altoNSA);  
coordillera(SAN,XSAN,YSAN,altoSAN);  
coordillera(AMA,XAMA,YAMA,altoAMA);  
coordillera(CAQ,XCAQ,YCAQ,altoCAQ);  
coordillera(HUI,XHUI,YHUI,altoHUI);  
coordillera(PUT,XPUT,YPUT,altoPUT);  
coordillera(TOL,XTOL,YTOL,altoTOL);  
coordillera(ANT,XANT,YANT,altoANT);  
coordillera(CAL,XCAL,YCAL,altoCAL);  
coordillera(QUI,XQUI,YQUI,altoQUI);
coordillera(RIS,XRIS,YRIS,altoRIS);
coordillera(ARA,XARA,YARA,altoARA);
coordillera(CAS,XCAS,YCAS,altoCAS);
coordillera(GUI,XGUI,YGUI,altoGUI);
coordillera(GUE,XGUE,YGUE,altoGUE);
coordillera(MET,XMET,YMET,altoMET);
coordillera(VAU,XVAU,YVAU,altoVAU);
coordillera(VIC,XVIC,YVIC,altoVIC);
coordillera(CAU,XCAU,YCAU,altoCAU);
coordillera(CHO,XCHO,YCHO,altoCHO);
coordillera(NAR,XNAR,YNAR,altoNAR);
coordillera(VAL,XVAL,YVAL,altoVAL);



// 2D HUD  lo ideal es tener siempre el texto que muestra las convenciones del mapa
camera(); // se llama la funcion de la camara
hint(DISABLE_DEPTH_TEST); //Se le da la instruccion de que se deshabilite la profundidad para dibujar el HUD
textMode(MODEL); // Escoger que el texto se grafique como textura, el render no fuciono en vectorial
//textMode(SHAPE); // Escoger que el texto se grafique vectorial
fill(255, 255,255,20);
noStroke();
rect(0,0, 1920, 115);

fill(0);
textSize(19);
text("Relieve de Recursos Aprobados por Departamento del Fondo de Ciencia Tecnología e Innovación (CTeI) Sistema General de Regalías (SGR) 2013-2016",140,25,1600,95);

// cuadro de proyectos por departamento
fill(255, 255,255,20);
rect(20,135,520, 920);
textFont(letra,14);
fill(0);
textAlign(CENTER);
text("Proyectos Aprobados por Departamento",30,160,500,95);
stroke(0);
line(50,200,510,200);

//println(tabla.getRowCount()  +  "  Columnas totales en la tabla"); 

// se utiliza un for para leer la tabla y asignar las variables
    for  (TableRow  fila  :  tabla.rows())  {  
    // se definen las variables que se traen de la tabla
    // se define id como entero para facilitar asignar posiciones    
        int id = fila.getInt(0);
        String  Departamento =  fila.getString("Departamento");  
        int  Proyectos =  fila.getInt("Proyectos");
        int Totales = fila.getInt("Total");
        
        // Se grafican los nombres de los departamentos
        textFont(letra,11);
        fill(0,0,0);
        textAlign(RIGHT);
        text(Departamento, 215, 218+(id*25));
        
        // se grafican los valores de los proyectos para cada departamento
        textFont(letra,10);
        textAlign(CENTER);
        text(Proyectos,235, 218+(id*25));
        
        // Se grafican barras para representar cada proyecto
        for(int barras=0;barras<Proyectos; barras=barras+1){
          noStroke();
          
          if(Totales<20800){
             //inversión baja en rojo 
                 fill(232,71,16);
                  stroke(156,53,21);
               } 
            else
                   {
                    if (Totales<75600)
                              { //naranja bajo
                             fill(242,137,53);
                                stroke(184,95,23);
                              }
                              else{
                              if(Totales<130300)
                                        {//amarillo para arriba del promedio
                                        fill(255,239,78);
                                        stroke(214,194,0);
                                        }
                                    else //verde para superior a una desviacion estandar
                                    {   fill(78,167,51);
                                           stroke(0,132,76);}
                              
                                        }
                                   }
                                   
                                   rect(260+(barras*10),206+(id*25), 5,10); 
                           
                   }
                         
    } // fin del graficado de los proyectos por departamento       

// grafica de altimetria
noStroke();
fill(255, 255,255,20);
rect(1490,135,400,255);
textFont(letra,14);
fill(0);
textAlign(CENTER);
text("Altimetría de los Recursos",1690,180);
textFont(letra,10);
text("Cifras en Miles de Millones de Pesos de 2013",1690,210);
textAlign(LEFT);
textFont(letra,11);
text("> a $130.3",1700,260);
text("de $75.6 a $130.3",1700,290);
text("de $20.8 a 75.6",1700,320);
text("< a $20.8",1700,350);

// cuadro verde
fill(78,167,51);
stroke(0,132,76);
rect(1570,240,100,30);

//cuadro amarillo
fill(255,239,78);
stroke(214,194,0);
rect(1570,270,100,30);

//cuadro naranja
fill(242,137,53);
stroke(184,95,23);
rect(1570,300,100,30);

//cuadro rojo
 fill(232,71,16);
 stroke(156,53,21);
rect(1570,330,100,30);

// Cuadro para mostrar los promedios y los mejores y peores departamentos
textFont(letra,12);
fill(0);
textAlign(CENTER);
text("Recursos",1650,450);
text("Departamento",1800,450);

//cuadro maximo
noStroke();
fill(78,167,51,50);
rect(1445,475,450,45);
textFont(letra,12);
fill(0);
textAlign(LEFT);
text("Máximo",1460,505);
textAlign(CENTER);
text("$279.2",1650,505);
text("Antioquia",1800,505);

//cuadro mínimo
fill(232,71,16,50);
rect(1445,540,450,45);
textFont(letra,12);
fill(0);
textAlign(LEFT);
text("Mínimo",1460,570);
textAlign(CENTER);
text("$4.2",1650,570);
text("Guainía",1800,570);

//cuadro promedio
fill(25,200);
rect(1445,605,265,45);
textFont(letra,12);
fill(255);
textAlign(LEFT);
text("Promedio",1460,635);
textAlign(CENTER);
text("$75.6",1650,635);

//Cuadro de explicacion y cierre
noStroke();
fill(255, 255,255,20);
rect(1300,690,595,245);
textFont(letra,12);
fill(0);
textAlign(LEFT);
text("En el año 2011 se reestructuró el Sistema General de Regalías, y se creó el Fondo de Ciencia, Tecnología e Innovación (FCTeI) para que el 10% de las regalías se destine al financiamiento de la ciencia, la tecnología y la innovación en las distintas regiones del país.",1230,710,650,210);      

text("La visualización representa el aprovechameinto que hace cada departamento de estos recursos.",1230,830,650,210); 

text("El relieve muestra la inversión en pesos y a la izquierda se presenta el número de proyectos aprobados de cada Departamento en la vigencia 2013 - 2016", 1230,900,650,210);

textFont(letra,8);
text("Fuente: Informe Anual de Indicadores de Ciencia y Tecnología 2014                Observatorio Colombiano de Ciencia y Tecnología  - ISSN 2323-072X",1230,1000,570,130);
textAlign(RIGHT);
text("ERNESTO CUELLAR URBANO - UNIVERSIDAD DE LOS ANDES - MAESTRIA EN DISEÑO - FUNDAMENTOS 1",1890,110);
textAlign(LEFT);

hint(ENABLE_DEPTH_TEST);// se vuelve a habilitar la profundidad para que funcione el 3D

// EL mapa con el teclado no funciona despues de poner el HUD
  //if (keyPressed) {
  //  if (key == 'm' || key == 'M') {
  //    pushMatrix();
  //    image(mapa, 0, 0, 792,1080);
  //    popMatrix();
  //  }
  //} 

//Opción 2 para mover la cámara
// se alteran las variables de la cámara mediante teclas del teclado
if (keyPressed) {
  
  // primero las teclas para modificar las coordenadas del ojo 
    if (key == 'd' || key == 'D') {ojoX=ojoX+5;} //aumenta el ojo en x
    if (key == 'a' || key == 'A') {ojoX=ojoX-5;} //disminuye el ojo en x
    if (key == 'w' || key == 'W') {ojoY=ojoY+5;} //aumenta el ojo en y
    if (key == 's' || key == 'S') {ojoY=ojoY-5;} //disminuye el ojo en y
    if (key == 'x' || key == 'X') {ojoZ=ojoZ+5;} //aumenta el ojo en z
    if (key == 'z' || key == 'Z') {ojoZ=ojoZ-5;} //disminuye el ojo en z
  
  // ahora las coordenadas del centro de la camara  
    if (key == 'k' || key == 'K') {centroX=centroX+25;} //aumenta el centro en x
    if (key == 'h' || key == 'H') {centroX=centroX-25;} //disminuye el centro en x
    if (key == 'u' || key == 'U') {centroY=centroY+25;} //aumenta el centro en y
    if (key == 'j' || key == 'J') {centroY=centroY-25;} //disminuye el centro en y
    if (key == 'n' || key == 'N') {centroZ=centroZ+25;} //aumenta el centro en z
    if (key == 'm' || key == 'M') {centroZ=centroZ-25;} //disminuye el centro en z




} 

//impresion en la consola de los valores del ojo en x, y, z
 println("ojoX "+ojoX+"  ojoY"+ojoY+"   ojoZ"+ojoZ);
 println("centroX "+centroX+"  centroY "+centroY+"   centroZ"+centroZ);




}



void coordillera(PShape aforma, float bx, float cy, float dalto)
  {
  pushMatrix();  
   aforma.disableStyle();
    for (float rel=0; rel<(dalto/ajuste); rel= rel+capa)
     {
       translate((bx*(1-escalado)), (cy*(1-escalado)), (rel));
       scale(escalado);
       shape(aforma, bx, cy);
     
     if(rel<2.08){
                 //inversión baja en rojo 
                 fill(232,71,16);
                  stroke(156,53,21);
                } 
            else
                   {
                    if (rel<7.56)
                              { //naranja bajo
                                fill(242,137,53);
                                stroke(184,95,23);
                              }
                              else{
                              if(rel<13.03)
                                        {
                                        //amarillo arriba del promedi6o
                                        fill(255,239,78);
                                        stroke(214,194,0);
                                        }
                                    else
                                    {  fill(78,167,51);
                                           stroke(0,132,76);
                                         //Verde}
                              
                                        }
                                   }
                           
                   }
     }
     aforma.enableStyle();
  popMatrix();
  }
