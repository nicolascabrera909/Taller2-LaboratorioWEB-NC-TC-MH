<html><head>
    <title>
      Viandas Caseras
    </title>
  </head><body>

    <style>



      .button { background-color: #4CAF50; /* Green */ border: none; color: white; padding: 4px 15px; text-align:center;
      text-decoration: none; display: inline-block; font-size: 12px; margin: 2px 2px; transition-duration: 0.4s; cursor:
      pointer; } .button2 { background-color: white; color: black; border: 2px solid #008CBA; } .button2:hover
      {background-color: #008CBA; color: white; }
    </style>

    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


    <h1 style="background-color:powderblue;" align="center">
      Listado de viandas
    </h1>



    <style>
      body { background-image: url('imagenes/menu2.jpg'); background-repeat: no-repeat; background-attachment: fixed;
      background-size: 100% 100%; }
    </style>


    <form action="ExDestino" method="POST">
      <h4>
        Mostrar todas las viandas
      </h4>
      <p>
        <button class="button button2" type="submit">
          Consulta
        </button>
      </p>
    </form>



    <form action="ExDestino" method="POST">
      <h4>
        Buscar por codigo
      </h4>
      <p>
        <input type='text' name='destino'/>
      </p>
      <p>
        <button class="button button2" type="submit">
          Consulta
        </button>
      </p>
    </form>




    <form action="ExDestino" method="POST">
      <h4>
        Buscar por descipcion
      </h4>
      <p>

        <input type='text' name='destino'/>
      </p>
      <p>
        <button class="button button2" type="submit">
          Consulta
        </button>
      </p>
    </form>





    <div style="text-align: right">
      <br/>
      <br/>
      <br/>
      <p>
        <button class="button button2" href="home.jsp">
          Volver
        </button>
      </p>
    </div>


  </body></html>