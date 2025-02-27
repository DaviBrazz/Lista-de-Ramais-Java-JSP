<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
    
<%@page import="dao.RamalDao"%>
<jsp:useBean id="r" class="model.Ramal"></jsp:useBean>
<jsp:setProperty property="*" name="r"/>

<%
    String usuarioLogado = (String) request.getSession().getAttribute("username");
    RamalDao.deletarRamal(r, usuarioLogado);
    response.sendRedirect("home.jsp");

%>