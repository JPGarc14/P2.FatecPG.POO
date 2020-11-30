<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="p1.poo.fatecpg.ads.noite.Disciplinas" %>

<%
    Disciplinas listaDisciplinas = null;
    try{
        listaDisciplinas = (Disciplinas) application.getAttribute("listaDisciplinas");
    }catch (Exception e){
    }
    if(request.getParameter ("alterar") != null){
        int i = Integer.parseInt(request.getParameter ("i"));
        float nota = Float.parseFloat(request.getParameter ("nota"));
        listaDisciplinas.getList().get(i).setNota(nota);
        response.sendRedirect(request.getContextPath()+"/disciplinas.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Disciplinas</title>
    </head>
    <body>
        <%@include file="WEB-INF/jspf/menu.jspf"%>
        <h1>Disciplinas</h1>
        <table border ="i">
            <thead>
                <tr>
                    <th>Nome</th>
                    <th>Ementa</th>
                    <th>Ciclo</th>
                    <th>Nota</th>
                </tr>
            </thead>
            <tbody>
                <%for (int i = 0;i < listaDisciplinas.getList().size(); i++){%>
                <tr>
                    <td><%= listaDisciplinas.getList().get(i).getNome()%></td>
                    <td><%= listaDisciplinas.getList().get(i).getEmenta()%></td>
                    <td><%= listaDisciplinas.getList().get(i).getCiclo()%></td>
                    
                    <td>
                        <form method="post">
                            <%= listaDisciplinas.getList().get(i).getNota()%>
                            <input type="number" name="nota" value="0.0" step="0.1" max="10" min="0" required/>
                            <input type="submit" name="alterar" value="Alterar Nota"/>
                            <input type="hidden" name="i" value ="<%=i%>"/>
                        </form>
                    </td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
