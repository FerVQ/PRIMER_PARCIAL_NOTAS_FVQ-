<%@page import="com.emergentes.modelo.Notas"%>
<%
    Notas item = (Notas) request.getAttribute("nuevanota");
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="estilo.css">
    </head>
    <body>
        <div class="datos">

            <h3>PRIMER PARCIAL TEM-742</h3>
            <h3>Nombre: Fernando Villca Quispe</h3>
            <h3>Carnet: 13993772 LP</h3>

        </div>
        <h1 style=" text-align:  center"><%= (item.getId() == 0)? "REGISTRO DE CALIFICACIONES" : "Editar" %></h1>
      
        <table border="1 px" style="margin: 0 auto;"><tr><td>
        <form action="MainController" method="post">
            <input type="hidden" name="id" value="<%= item.getId()%>"/>
            <table>
                <tr>
                    <td>NOMBRE DEL ESTUDIANTE:</td>
                    <td><input type="text" name="nombre" value="<%= item.getNombre()%>"/></td>
                </tr>
                <tr>
                    <td>PRIMER PARCIAL(SOBRE 30 PTS):</td>
                    <td><input type="number" name="p1"  value="<%= item.getP1()%>"/></td>
                </tr>
                <tr>
                    <td>SEGUNDO PARCIAL(SOBRE 30 PTS):</td>
                    <td><input type="number" name="p2"  value="<%= item.getP2()%>"/></td>
                </tr>
                <tr>
                    <td>EXAMEN FINAL(SOBRE 40 PTS):</td>
                    <td><input type="text" name="ef"  value="<%= item.getEf()%>"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="Enviar"/></td>
                </tr>
            </table>
        </form>
         </td></tr></table>
    </body>
</html>
