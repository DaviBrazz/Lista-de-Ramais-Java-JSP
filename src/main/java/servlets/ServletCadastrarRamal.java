package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.RamalDao;
import model.Ramal;

@WebServlet("/ServletCadastrarRamal")
public class ServletCadastrarRamal extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public ServletCadastrarRamal() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String usuarioLogado = (String) request.getSession().getAttribute("username");
		String setor = request.getParameter("setor");
		String ramal = request.getParameter("ramal");
		String localizacao = request.getParameter("localizacao");
	
		Ramal r = new Ramal();
		String u = (String) request.getSession().getAttribute("username");
		
		r.setSetor(setor);
		r.setRamal(ramal);
		r.setLocalizacao(localizacao);
	    RamalDao.cadastrarRamal(r, usuarioLogado);
		
		request.getRequestDispatcher("pages/home.jsp").forward(request, response);
		
	}

}
