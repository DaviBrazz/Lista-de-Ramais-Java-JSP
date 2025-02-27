package model;

public class Ramal {
  
  
  private int id;
  private String setor;
  private String ramal;
  private String localizacao;
  
  public Ramal() {
	  
  }
  
public Ramal(int id, String setor, String ramal, String localizacao) {
	
	
	this.id = id;
	this.setor = setor;
	this.ramal = ramal;
	this.localizacao = localizacao;
}


public int getId() {
	return id;
}

public void setId(int id) {
	this.id = id;
}

public String getSetor() {
	return setor;
}

public void setSetor(String setor) {
	this.setor = setor;
}

public String getRamal() {
	return ramal;
}

public void setRamal(String ramal) {
	this.ramal = ramal;
}

public String getLocalizacao() {
	return localizacao;
}

public void setLocalizacao(String localizacao) {
	this.localizacao = localizacao;
}
  


}
