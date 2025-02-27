# Sobre o projeto

Este é um projeto desenvolvido utilizando Java e JSP (JavaServer Pages) para a construção de páginas dinâmicas em um servidor web.
O projeto foi empacotado em um arquivo WAR (Web Application Archive), que pode ser facilmente implantado em servidores compatíveis com Servlet e JSP, como o **Apache Tomcat**.
Para o banco de dados, foi feita a utilização do Docker contendo a imagem do mysql e um cliente para acesso sendo o phpMyAdmin.

## Descrição

Tem como funcionalidade o recurso de gerenciar uma lista de ramais online no modelo empresarial, contendo informações de setor, número de ramal e localização, podendo também realizar operações CRUD e impressão de relatório em PDF com base nos ramais cadastrados no banco de dados.

## Tecnologias

- **Java**: Linguagem de programação para backend.
- **JSP (JavaServer Pages)**: Tecnologia para criação de páginas dinâmicas.
- **Servlets**: Usado para manipular requisições HTTP e gerar respostas dinâmicas.
- **Apache Tomcat**: Servidor de aplicação para execução da aplicação.
- **MYSQL**: Banco de dados.
- **PhpMyAdmin**: Interface cliente do banco de dados
- **Docker**: Fornecendo a imagem do banco de dados Mysql e PhpMyAdmin
  

## Pré-requisitos

Antes de executar o projeto, você precisa ter instalado em sua máquina:

- **Apache Tomcat**: Para hospedar e executar a aplicação web.
- **JDK 8 ou superior** (se for necessário para realizar modificações ou depurações).
- **IDE** (opcional): Como Eclipse, IntelliJ IDEA ou qualquer outra IDE Java que suporte JSP.

## Como executar

### 1. Baixar o arquivo lista-de-ramais.war localizado no diretório do projeto

### 2. Implantar no Apache Tomcat

1. Copie o arquivo lista-de-ramais.war para o diretório `webapps` do Apache Tomcat.
2. O Tomcat automaticamente descompactará o WAR e o colocará em execução.

### 3. Acessar a aplicação:



Após o Tomcat iniciar, abra seu navegador e acesse o seguinte endereço:

1. Para acessar a lista de ramais: http://localhost:8080/lista-de-ramais/lista.jsp

2. Para acessar a página de gerenciamento:  http://localhost:8080/lista-de-ramais/login.jsp
3. Acesse com os dados login: `admin` | senha: `admin123`.
    

