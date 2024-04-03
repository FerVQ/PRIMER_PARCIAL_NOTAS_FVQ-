package com.emergentes.controlador;

import com.emergentes.modelo.Notas;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession ses = request.getSession();
        
        if(ses.getAttribute("listaE") == null){
            ArrayList<Notas> listaux = new ArrayList<Notas>();
            ses.setAttribute("listaE", listaux);
        }
        
        ArrayList<Notas> lista = (ArrayList<Notas>)ses.getAttribute("listaE");
        
        String op = request.getParameter("op");
        String opcion = (op != null) ? request.getParameter("op"): "view";
        
        Notas obj1 = new Notas();
        
        int id,pos;
        
        switch (opcion){
            case "nuevo": //Insertar nuevo 
                request.setAttribute("nuevanota", obj1);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            
            case "editar"://Editar 
                id = Integer.parseInt(request.getParameter("id"));
                pos = buscarIndice(request, id);
                obj1 = lista.get(pos);
                request.setAttribute("nuevanota", obj1);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
                
            case "eliminar"://Eliminar 
                pos = buscarIndice(request, Integer.parseInt(request.getParameter("id")));
                lista.remove(pos);
                ses.setAttribute("listaE", lista);
                response.sendRedirect("index.jsp");
                break;
                
            case "view":
                response.sendRedirect("index.jsp");    
        }
        
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession ses = request.getSession();
        ArrayList<Notas> lista = (ArrayList<Notas>)ses.getAttribute("listaE");
        
        Notas obj1 = new Notas();
        
        obj1.setId(Integer.parseInt(request.getParameter("id")));
        obj1.setNombre(request.getParameter("nombre"));
        obj1.setP1(Integer.parseInt( request.getParameter("p1")));
        obj1.setP2(Integer.parseInt( request.getParameter("p2")));
        obj1.setEf(Integer.parseInt( request.getParameter("ef")));
        int idt = obj1.getId();
        
        if(idt == 0){
            int ultID;
            ultID = ultimoId(request);
            obj1.setId(ultID);
            lista.add(obj1);
        }
        else{
            lista.set(buscarIndice(request,idt),obj1);
        }
        ses.setAttribute("listaE", lista);
        response.sendRedirect("index.jsp");
        
    }
    private int ultimoId(HttpServletRequest request){
            
            HttpSession ses = request.getSession();
            ArrayList<Notas> lista = (ArrayList<Notas>)ses.getAttribute("listaE");
            
            int idaux=0;
            for(Notas item : lista){
                idaux = item.getId();   
            }
            return idaux+1;
    }
    
    private int buscarIndice(HttpServletRequest request,int id){
            
            HttpSession ses = request.getSession();
            ArrayList<Notas> lista = (ArrayList<Notas>)ses.getAttribute("listaE");
            
            int i=0;
            if(lista.size()>0){
                while(i<lista.size()){
                    if(lista.get(i).getId() == id){
                        break;
                    }
                    else{
                        i++;
                    }
                }
            }
            return i;
    }
    
}
