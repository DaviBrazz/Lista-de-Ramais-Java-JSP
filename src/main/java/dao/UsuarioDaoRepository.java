package dao;

import java.sql.Connection;

import model.Ramal;
import model.Usuario;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import conexao.SingleConnectionBanco;

public class UsuarioDaoRepository {

	private Connection connection;

	public UsuarioDaoRepository() {
		connection = SingleConnectionBanco.getConnection();
	}

	public boolean validarAutenticacao(Usuario usuario) throws Exception {

		String sql = "SELECT * FROM usuarios WHERE username =? and password =?";

		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setString(1, usuario.getUsername());
		statement.setString(2, usuario.getPassword());

		ResultSet resultSet = statement.executeQuery();

		if (resultSet.next()) {
			return true;/* autenticado */
		}
		return false; /* nao autenticado */
	}

	public Usuario retornarUsuario(Usuario user) throws SQLException {

		Usuario usuario = new Usuario();
		
		String sql = "SELECT * FROM usuarios WHERE username =? and password =?";
		PreparedStatement statement = connection.prepareStatement(sql);

		statement.setString(1, user.getUsername());
		statement.setString(2, user.getPassword());

		ResultSet rs = statement.executeQuery();

		while (rs.next()) {

			usuario.setNome(rs.getString("nome"));
			usuario.setUsername(rs.getString("username"));
			usuario.setPassword(rs.getString("password"));
			
		}
		
		return usuario;
	}

	

}