package servlets;

import java.io.IOException;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Logica.IFachada;
import Logica.exceptions.NoExisteLaViandaException;
import Logica.valueobjects.VOVegetariana;
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
			msgError="Error: Debe ingresar un codigo de vianda.";
		}
		
		//Guardo los datos en la sesión
		if (!error)
		{		
			String ip = super.getInitParameter("ipServidor");
			String ruta = "";
			String puerto= super.getInitParameter("puertoServidor");
			VOVegetariana miVOVianda;
			try 
			{
				ruta = "//"+ip+":"+puerto+"/fachada";
				IFachada miFachada = (IFachada) Naming.lookup(ruta);
				VOVianda pVOVianda= miFachada.listadoDetalladoDeVianda(codigoVianda);
				
				if (pVOVianda instanceof VOVianda && !(pVOVianda instanceof VOVegetariana))
				{
					miVOVianda = new VOVegetariana(pVOVianda.getCodigoAlfanumerico(), pVOVianda.getDescripcion(), pVOVianda.getPrecioUnitario(),false,false,"");
				}
				else 
				{
					VOVegetariana miVege =(VOVegetariana)pVOVianda;
					miVOVianda = new VOVegetariana (miVege.getCodigoAlfanumerico(), miVege.getDescripcion(), miVege.getPrecioUnitario(), miVege.getEsVegetariana(),miVege.getOvolactea(),miVege.getDescripcionAdicional() );
				}	
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
			catch (NoExisteLaViandaException e) {
				error = true;
				msgError=e.getMessage();
			} 
		}

			

		// Forwardeo a la página apropiada
		RequestDispatcher rd;
		if (!error)
		{
			rd = req.getRequestDispatcher("ViandaDetallada.jsp");
		}
		else
		{
			req.setAttribute("msgError", msgError);
			rd = req.getRequestDispatcher("Error.jsp");
		}
		rd.forward(req, resp);
	}
}
