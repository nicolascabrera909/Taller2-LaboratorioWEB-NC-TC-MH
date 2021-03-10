<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id='listaViandas' scope='request' class='java.util.ArrayList' />
<jsp:useBean id='listaViandasDesc' scope='request' class='java.util.ArrayList' />
<jsp:useBean id='laVianda' scope='request' class='valueObjects.VOVianda' />

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

    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <h1  style="background-color:powderblue;" align="center" style="font-size:3vw;"   >
      Listado de viandas
    </h1>

    <style>
      body { background-image: url('imagenes/menu2.jpg'); background-repeat: no-repeat; background-attachment: fixed;
      background-size: 100% 100%; }
    </style>


    <table style="width:20%" border-collapse: "collapse";>

      <tr>
      </tr>
      <tr>
        <td>

        </td>

        <td>
        </td>
        <td>
        </td>
        <td>
        </td>
        <td>
        </td>

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



      <div style="text-align: right">
        <br>
        <br>
        <p>
          <button class="button button2" href='home.jsp'>
            Volver
          </button>
        </p>
      </div>


    </body>
  </html>
