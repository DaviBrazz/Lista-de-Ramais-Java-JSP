package filter;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import conexao.SingleConnectionBanco;

@WebFilter(urlPatterns = {"/pages/*"})/*Interceptas todas as requisiçoes que vierem do projeto ou mapeamento*/
public class FilterAutenticacao implements Filter {
    
	private static Connection connection;
	
	
    public FilterAutenticacao() {
    }

    /*Encerra os processo quando o servidor é parado*/
    /*Mataria os processo de conexão com banco*/
	public void destroy() {
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/*Intercepta as requisicoes e a as respostas no sistema*/
	/*Tudo que fizer no sistema vai fazer por aqui*/
	/*Validação de autenticao*/
	/*Dar commit e rolback de transaçoes do banco*/
	/*Validar e fazer redirecionamento de paginas*/
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
	     
	try {	
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		
		String usuarioLogado = (String) session.getAttribute("username");
		
		String urlParaAutenticar = req.getServletPath();/*Url que está sendo acessada*/
		
		/*Validar se está logado senão redireciona para a tela de login*/
		if (usuarioLogado == null  && 
				!urlParaAutenticar.equalsIgnoreCase("/pages/ServletLogin")) {/*Não está logado*/
			
			RequestDispatcher redireciona = request.getRequestDispatcher("/login.jsp?url=" + urlParaAutenticar);
			request.setAttribute("MensagemErroAcesso", "<div class='alert alert-danger alert-dismissible fade show' role='alert' id='-44'><strong>Acesso negado:</strong>  Realize o login para acessar o painel de controle <a href='../login.jsp'> <button type='button' class='close'  aria-label='Close'><span aria-hidden='true'>&times;</span></button></a></div>");
			redireciona.forward(request, response);
			return; /*Para a execução e redireciona para o login*/
			
		}else {
			chain.doFilter(request, response);
		}
		
		connection.commit();
		
	} catch (Exception e) {
		System.out.println(e);
		try {
			connection.rollback();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
	
	}

	/*Inicia os processo ou recursos quando o servidor sobre o projeto*/
	// inicar a conexão com o banco
	public void init(FilterConfig fConfig) throws ServletException {
		connection = SingleConnectionBanco.getConnection();
	}



}