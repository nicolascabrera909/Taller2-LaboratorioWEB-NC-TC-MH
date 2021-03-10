<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id='listaViandas' scope='request' class='java.util.ArrayList' />  
<jsp:useBean id='listaViandasDesc' scope='request' class='java.util.ArrayList' />  
<jsp:useBean id='laVianda' scope='request' class='valueObjects.VOVianda' />  

<html>
  <head>
    <title>
      Viandas
    </title>
  </head>
  <body >

    <style>

      .button { background-color: #4CAF50; /* Green */ border: none; color: white; padding: 4px 15px; text-align:center;
      text-decoration: none; display: inline-block; font-size: 12px; margin: 2px 2px; transition-duration: 0.4s; cursor:
      pointer; } .button2 { background-color: white; color: black; border: 2px solid #008CBA; } 
      .button2:hover
      {background-color: #008CBA; color: white; } 
     	
     	
      	table { width:100%; } table, th, td { border: 0px solid black; border-collapse: collapse; } th, td { padding: 10px;
     	text-align: left; } #t01 tr:nth-child(even) { background-color: #eee; } #t01 tr:nth-child(odd) { background-color: #fff;
     	} #t01 th { background-color: black; color: white; }
     	
     
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
          <form action='ListadoGeneralViandasServlet' method='POST'>
            <h4>
              Mostrar todas las viandas
            </h4>
            <p>
              <button class="button button2" type='submit'  name='general'>
                Consulta
              </button>
            </p>
          </form>

          <form action='ViandaDetalleServlet' method='POST'>
            <h4>
              Buscar por código
            </h4>
            <p>
              <input type='text' name='codigo' size=20>
            </p>
            <p>
              <button class="button button2" type='submit'>
                Consulta
              </button>
            </p>
          </form>

          <form action='ListadoViandasDetalleServlet' method='POST'>
            <h4>
              Buscar por descipción
            </h4>
            <p>

              <input type='text' name='descripcion' size=20>
            </p>
            <p>
              <button class="button button2" type='submit'>
                Consulta
              </button>
            </p>
          </form>
        </td>

        <td>        </td>
		<td>        </td>
		<td>        </td>
		<td>        </td>
	
        <td>
            <table id="t01">
              <tr>
                <th>Código</th>
                <th>Descripción</th>
                <th>Es vegetariana</th>
                <th>Es vegetariana</th>
                <th>Es ovolactea</th>
                <th>Descripción adicional</th>
                <th>Cantidad</th>
              <tr> 
              </tr>
			<c:forEach items="${listaViandas}" var="i" >
				<tr>
					<td> ${i.codigoAlfanumerico} </td>
					<td> ${i.descripcion} </td>
					<td> ${i.precioUnitario} </td>
					<td> ${i.esVege} </td>
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
