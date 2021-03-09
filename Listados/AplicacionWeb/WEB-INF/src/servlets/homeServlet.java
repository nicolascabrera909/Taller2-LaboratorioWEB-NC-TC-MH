package servlets;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.MalformedURLException;
import java.rmi.Naming;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import Logica.IFachada;





public class homeServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{

		boolean error = false;
		String msgError = new String();

		//Guardo los datos en la sesión
		if (!error)
		{		   

			IFachada miFachada= null;
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
				msgError=e.getMessage();			}
		}


		// Forwardeo a la página apropiada
		req.setAttribute("msgError", msgError);
		RequestDispatcher rd;
		if (!error)
			rd = req.getRequestDispatcher("Index.jsp");
		else
			rd = req.getRequestDispatcher("Error.jsp");
		rd.forward(req, resp);
	}
}
