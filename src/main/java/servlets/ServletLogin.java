package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UsuarioDaoRepository;
import model.Usuario;


/*O chamando Controller são as servlets ou ServletLoginController*/
@WebServlet(urlPatterns = {"/pages/ServletLogin", "/ServletLogin"}) /*Mapeamento de URL que vem da tela*/
public class ServletLogin extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	private UsuarioDaoRepository usuarioDao = new UsuarioDaoRepository();

  
    public ServletLogin() {
    }


    /*Recebe os dados pela url em parametros*/
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

 String acao = request.getParameter("acao");
 String usuarioLogado = request.getParameter("usuario");
		 
		 if (acao != null && !acao.isEmpty() && acao.equalsIgnoreCase("logout")) {
			 request.getSession().invalidate();// invalida a sessão

				
				System.out.println("USUARIO DESLOGADO: " + usuarioLogado);
				
			 RequestDispatcher redirecionar = request.getRequestDispatcher("login.jsp");
			 redirecionar.forward(request, response);
		 }else {
		  doPost(request, response);
		 }
		
	}

	
	/*recebe os dados enviados por um formulario*/
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String url = request.getParameter("url");
		
		try {
		
				if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) {
					
					Usuario usuario = new Usuario();
					usuario.setUsername(username);
					usuario.setPassword(password);
					
					if (usuarioDao.validarAutenticacao(usuario)) { /*Simulando login*/
					
						
						String usuarioNome = usuarioDao.retornarUsuario(usuario).getNome();
						String usuarioUsername = usuarioDao.retornarUsuario(usuario).getUsername();
						String usuarioPassword = usuarioDao.retornarUsuario(usuario).getPassword();
				
						
						request.getSession().setAttribute("nome",usuarioNome);
						request.getSession().setAttribute("username",usuarioUsername);
						request.getSession().setAttribute("password",usuarioPassword);
						
						
						
						String usuarioLogado = (String) request.getSession().getAttribute("nome");
						
						System.out.println("USUARIO LOGADO: " + usuarioLogado);
						
						if (url == null || url.equals("null")) {
							url = "pages/home.jsp";
						}
						
						RequestDispatcher redirecionar = request.getRequestDispatcher(url);
						redirecionar.forward(request, response);
						
					}else {
						RequestDispatcher redirecionar = request.getRequestDispatcher("/login.jsp");
						request.setAttribute("MensagemErroLogin", "<br><div class='alert alert-danger' role='alert'>Login ou senha incorreto</div>");
						redirecionar.forward(request, response);
					}
					
				}else {
					RequestDispatcher redirecionar = request.getRequestDispatcher("/login.jsp");
					request.setAttribute("MensagemErroLogin", "<div class='alert alert-danger' role='alert'>Login ou senha incorreto</div>");
					redirecionar.forward(request, response);
				}
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}