package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import conexao.SingleConnectionBanco;
import model.Ramal;

public class RamalDao {

	private Connection connection;

	public static int cadastrarRamal(Ramal ramal, String usuarioLogado) {
		int status = 0;
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = SingleConnectionBanco.getConnection();
			String sql = "INSERT INTO ramais (setor, ramal, localizacao) VALUES (?,?,?)";
			ps = con.prepareStatement(sql);

			ps.setString(1, ramal.getSetor());
			ps.setString(2, ramal.getRamal());
			ps.setString(3, ramal.getLocalizacao());

			status = ps.executeUpdate();

			LocalDateTime dataSistema = LocalDateTime.now();
			DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
			String dataFormatada = dataSistema.format(fmt);

			System.out.println("--------------- // -------------------");
			System.out.println("CADASTRO DE RAMAL");
			System.out.println("RAMAL: " + ramal.getRamal());
			System.out.println("SETOR: " + ramal.getSetor());
			System.out.println("LOCALIZACAO: " + ramal.getLocalizacao());
			System.out.println("Cadastrado em " + dataFormatada + " por " + usuarioLogado);
			System.out.println("--------------- // -------------------");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	public static int updateRamal(Ramal r, String usuarioLogado) {
		int status = 0;
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = SingleConnectionBanco.getConnection();
			String sql = "UPDATE ramais SET setor=?, ramal=?, localizacao=? WHERE id=?";
			ps = con.prepareStatement(sql);

			ps.setString(1, r.getSetor());
			ps.setString(2, r.getRamal());
			ps.setString(3, r.getLocalizacao());
			ps.setInt(4, r.getId());

			status = ps.executeUpdate();

			LocalDateTime dataSistema = LocalDateTime.now();
			DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
			String dataFormatada = dataSistema.format(fmt);

			System.out.println("--------------- // -------------------");
			System.out.println("ATUALIZADO COM SUCESSO!");
			System.out.println("RAMAL: " + r.getRamal());
			System.out.println("SETOR: " + r.getSetor());
			System.out.println("LOCALIZACAO: " + r.getLocalizacao());
			System.out.println("Atualizado em " + dataFormatada + " por " + usuarioLogado);
			System.out.println("--------------- // -------------------");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	public static int deletarRamal(Ramal r, String usuarioLogado) {
		int status = 0;
		Connection con = null;
		PreparedStatement ps = null;

		try {
			con = SingleConnectionBanco.getConnection();
			String sql = "DELETE FROM ramais WHERE id=?";
			ps = con.prepareStatement(sql);
			ps.setInt(1, r.getId());
			status = ps.executeUpdate();

			LocalDateTime dateSystem = LocalDateTime.now();
			DateTimeFormatter fmt = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");
			String dataFormatada = dateSystem.format(fmt);

			System.out.println("--------------- // -------------------");
			System.out.println("EXCLUSAO DE RAMAL");
			System.out.println("ID: " + r.getId());
			System.out.println("RAMAL: " + r.getRamal());
			System.out.println("SETOR: " + r.getSetor());
			System.out.println("LOCALIZACAO: " + r.getLocalizacao());
			System.out.println("Excluido em " + dataFormatada + " por " + usuarioLogado);
			System.out.println("--------------- // -------------------");

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return status;
	}

	public static List<Ramal> getAllRamal() {
		List<Ramal> list = new ArrayList<>();

		try {
			Connection con = SingleConnectionBanco.getConnection();
			PreparedStatement ps = (PreparedStatement) con.prepareStatement("SELECT * FROM ramais ORDER BY setor ASC");
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				Ramal ramal = new Ramal();
				ramal.setId(rs.getInt("id"));
				ramal.setSetor(rs.getString("setor"));
				ramal.setRamal(rs.getString("ramal"));
				ramal.setLocalizacao(rs.getString("localizacao"));

				list.add(ramal);
				
			}

		} catch (Exception e) {
			e.printStackTrace();
			;
		}
		return list;
	}

}