<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="p1.poo.fatecpg.ads.noite.Disciplinas" %>

<%
    String exceptionMessage = null;
    if(request.getParameter ("Cancelar") != null){
        response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter ("formInsert") != null){
        String nome = request.getParameter("nome");
        String ementa = request.getParameter("ementa");
        int ciclo = Integer.parseInt(request.getParameter("ciclo"));
        double nota = Double.parseDouble(request.getParameter("nota"));
        try{
            Disciplinas.Insert(nome, ementa, ciclo, nota);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter ("formUpdate") != null){
        String nomeOld = request.getParameter("nomeOld");
        String nome = request.getParameter("nome");
        String ementa = request.getParameter("ementa");
        int ciclo = Integer.parseInt(request.getParameter("ciclo"));
        double nota = Double.parseDouble(request.getParameter("nota"));
        try{
            Disciplinas.Update(nomeOld, nome, ementa, ciclo, nota);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
    }
    if(request.getParameter ("formDelete") != null){
        String nome = request.getParameter("nome");
        try{
            Disciplinas.Delete(nome);
            response.sendRedirect(request.getRequestURI());
        }catch(Exception ex){
            exceptionMessage = ex.getLocalizedMessage();
        }
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
        <%if(request.getParameter("prepInsert") != null) {%>
        <h3>Inserir Disciplina</h3>
        <form method="post">
            Nome: <input type="text" name="nome">
            Ementa: <input type="text" name="ementa">
            Ciclo: <select name="ciclo">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                </select>
            Nota: <input type="text" name="nota">
            <input type="submit" name="formInsert" value="Inserir"/>
            <input type="submit" name="cancelar" value="Cancelar"/>
        </form>
        
        <%}else if(request.getParameter("prepUpdate") != null) {%>
        <%
            String nome = request.getParameter("nome");
            String ementa = request.getParameter("ementa");
            String ciclo = request.getParameter("ciclo");
            String nota = request.getParameter("nota");
        %>
        <h3>Atualizar Disciplina</h3>
        <form method="post">
            <input type="hidden" name="nomeOld" value="<%= nome%>">
            Nome: <input type="text" value="<%= nome%>">
            Ementa: <input type="text" name="ementa" value="<%= ementa%>">
            Ciclo: <select name="ciclo">
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
                </select>
            Nota: <input type="text" name="nota" value="<%= nota%>">
            <input type="submit" name="formUpdate" value="Atualizar"/>
            <input type="submit" name="cancelar" value="Cancelar"/>
        </form>
        
        <%}else if(request.getParameter("prepDelete") != null) {%>
        <%
            String nome = request.getParameter("nome");
        %>
        <h3>Deletar Disciplina</h3>
        <form method="post">
            <input type="hidden" name="nome" value="<%= nome%>">
            Deseja deletar a disciplina: <b><%= nome%></b>
            <input type="submit" name="formUpdate" value="Atualizar"/>
            <input type="submit" name="cancelar" value="Cancelar"/>
        </form>
        
        <%}else{%>
        <form method="post">
            <input type="submit" name="prepInsert" value="Inserir">
        </form>
        
        <%}%>
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
