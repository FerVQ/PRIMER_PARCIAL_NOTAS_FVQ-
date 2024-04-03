
<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.modelo.Notas"%>
<%
    ArrayList<Notas> lista = (ArrayList<Notas>) session.getAttribute("listaE");
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
        
        <div class="datos"">

            <h3>PRIMER PARCIAL TEM-742</h3>
            <h3>Nombre: Fernando Villca Quispe</h3>
            <h3>Carnet: 13993772 LP</h3>

        </div>
        <h1 style="text-align: center">REGISTRO DE CALIFICACIONES</h1>
        <table align="CENTER" border="1">
            <button align="CENTER"><a href="MainController?op=nuevo">NUEVO</a></button> 
            <tr>
                <th>Id</th>
                <th>NOMBRE</th>
                <th>P1(30)</th>
                <th>P2(30)</th>
                <th>EF(40)</th>
                <th>NOTA</th>
                
                
                <th></th>
            </tr>
            <%
                if(lista != null){
                    for(Notas item : lista){
            %>
            <tr>
                <td><%= item.getId()%></td>
                <td><%= item.getNombre()%></td>
                <td><%= item.getP1()%></td>
                <td><%= item.getP2()%></td>
                <td><%= item.getEf()%></td>
                <td><%= item.getNota()%></td>
                
             
                <td><a href="MainController?op=editar&id=<%= item.getId()%>">Editar</a> </td>
                <td><a href="MainController?op=eliminar&id=<%= item.getId()%>"
                       onclick = ' return confirm("Estas seguro de eliminar el registro ?");'>Eliminar</a></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </body>
</html>
