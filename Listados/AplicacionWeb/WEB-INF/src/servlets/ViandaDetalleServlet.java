package servlets;

import java.io.IOException;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;

import Logica.IFachada;
import Logica.exceptions.NoExisteLaViandaException;
import Logica.exceptions.NoExistenViandasException;
import Logica.valueobjects.VOVianda;

public class ViandaDetalleServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{



		//Valido los datos ingresados
		boolean error = false;
		String msgError = new String();

		String codigoVianda=req.getParameter("codigo").trim();
		if(codigoVianda.equals("") || codigoVianda==null)	
		{
			error=true;
			msgError="Debe ingresar un codigo de vianda";
		}
		

		//Guardo los datos en la sesión
		if (!error)
		{		

			String ip = "127.0.0.1";
			String ruta = "";
			String puerto= "1099";
			//IFachada fac= null;
			try 
			{
				ruta = "//"+ip+":"+puerto+"/fachada";
				IFachada miFachada = (IFachada) Naming.lookup(ruta);
				VOVianda miVOVianda= miFachada.listadoDetalladoDeVianda(codigoVianda);
				req.setAttribute("laVianda", miVOVianda);
			} catch (MalformedURLException e) {
				error = true;
				msgError = "URL mal Formada";
			} catch (NotBoundException e) {
				error = true;
				msgError = "Error en conexion con el servidor";
			}catch (RemoteException e) {
				error = true;
				msgError = "Error en conexion con el servidor";
			}
			catch (NoExistenViandasException e) {
				error = true;
				msgError=e.getMessage();
			} catch (NoExisteLaViandaException e) {
				error = true;
				msgError=e.getMessage();
			}

		}


		/*IFachada miFachada= null;
			Properties p = new Properties();
			String nomArch = "config/config.properties";
			try {
				p.load(new FileInputStream(nomArch));
			} catch (FileNotFoundException e) {
				msgError= "Error: Archivo no existe.";
			} catch (IOException e) {
				msgError= "Error: Archivo no existe o no esta accesible.";
			}
			try {
				String ip = p.getProperty("ipServidor");
				int puerto = Integer.parseInt(p.getProperty("puertoServidor"));
				// Pongo a correr el rmiregistry
				String ruta = "//" + ip + ":" + puerto + "/fachada";
				// Instancio mi Objeto Remoto y lo publico
				miFachada = (IFachada) Naming.lookup(ruta);
			} catch (MalformedURLException | NotBoundException e) {
				msgError=e.getMessage();			}*/



		// Forwardeo a la página apropiada
		RequestDispatcher rd;
		if (!error)
		{
			rd = req.getRequestDispatcher("listadoViandas.jsp");
		}
		else
		{
			req.setAttribute("msgError", msgError);
			rd = req.getRequestDispatcher("Error.jsp");
		}
		rd.forward(req, resp);
	}
}
