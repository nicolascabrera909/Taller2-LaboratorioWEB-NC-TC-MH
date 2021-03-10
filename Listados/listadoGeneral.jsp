<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id='listaViandas' scope='request' class='java.util.ArrayList' />


<html>
  <head>
    <title>
      Viandas Caseras
    </title>
  </head>
  <body >

<style>
      .button { background-color: #4CAF50; /* Green */ border: none; color: white; padding: 4px 15px; text-align:center;
      text-decoration: none; display: inline-block; font-size: 12px; margin: 2px 2px; transition-duration: 0.4s; cursor:
      pointer; } .button2 { background-color: white; color: black; border: 2px solid #008CBA; } .button2:hover
      {background-color: #008CBA; color: white; } table { width:100%; } table, th, td { border: 0px solid black;
      border-collapse: collapse; } th, td { padding: 10px; text-align: left; } #t01 tr:nth-child(even) {
      background-color: #eee; } #t01 tr:nth-child(odd) { background-color: #fff; } #t01 th { background-color: black;
      color: white; }
 </style>


 <style>
      body { background-image: url('imagenes/menu2.jpg'); background-repeat: no-repeat; background-attachment: fixed;
      background-size: 100% 100%; }
</style>

<style>
* {
  box-sizing: border-box;
}

body {
  font-family: Arial, Helvetica, sans-serif;
}

/* Style the header */
header {
 
  padding: 0px;
  text-align: center;
  font-size: 15px;
}

/* Create two columns/boxes that floats next to each other */
nav {
  float: left;
  width: 30%;
  height: 300px; /* only for demonstration, should be removed */
  padding: 20px;
}

/* Style the list inside the menu */
nav ul {
  list-style-type: none;
  padding: 0;
}

article {
  float: left;
  padding: 20px;
  width: 70%;
  height: 300px; /* only for demonstration, should be removed */
}

/* Clear floats after the columns */
section::after {
  content: "";
  display: table;
  clear: both;
}

/* Style the footer */
footer {
  padding: 0px;
  text-align: center;
  color: white;
}

/* Responsive layout - makes the two columns/boxes stack on top of each other instead of next to each other, on small screens */
@media (max-width: 600px) {
  nav, article {
    width: 100%;
    height: auto;
  }
}
</style>


<header>
		<h1  style="background-color:#306080;" align="center" style="font-size:3vw;"   >
          <a style="color:white; font-family: Segoe UI Light;" >Listado de viandas</a>
    	</h1>
</header>

<section>

  	<table style="width:20%" border-collapse: "collapse";>
     <tr>      </tr>
     <tr>        
        <td>
          <table id="t01">
            <tr>
              <th>
                Codigo
              </th>
              <th>
                Descripcion
              </th>
              <th>
                Precio Unitario
              </th>
              <th>
                Tipo
              </th>

              <tr>
              </tr>
              <c:forEach items="${listaViandas}" var="i" >
                <tr>
                  <td>
                    ${i.codigo}
                  </td>
                  <td>
                    ${i.descripcion}
                  </td>
                  <td>
                    ${i.precioUnitario}
                  </td>
                  <td>
                    ${i.tipo}
                  </td>
                </tr>
              </c:forEach>
            </table>
          </td>
        </tr>
      </table>
</section>

<footer>
	<div style="text-align: right">
  		<p>
  		 <A href='home.jsp'>
            <button class="button button2">Volver</button>
	     </A>
      	</p>
    </div>
</footer>




   

   


      


    </body>
  </html>
