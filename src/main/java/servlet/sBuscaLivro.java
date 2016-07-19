/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;

import classes.ConexaoBanco;
import java.sql.Connection;
import java.sql.ResultSet;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Fernando
 */
public class sBuscaLivro extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            //Salva em uma variável o valor passado pela JSP com o nome do usuário a ser pesquisado no banco
            String usuario = request.getParameter("usuario");
            //SELECT no banco de dados buscando informações de um determinado usuário ou letra
            String query = "SELECT codigo, titulo, disciplina, editora, link FROM Livro WHERE titulo like '%" + usuario + "%' ";
            //Abre a conexão com o banco de dados
            Connection conn = ConexaoBanco.AbreConexao();
            //Salva o retorno da Classe criada para executar os SELECT's em uma variavel do tipo ResultSet
            ResultSet rs =  ConexaoBanco.executeQuery(conn, query);

            out.println("<tr>");
            out.println("<th>Código</th>");
            out.println("<th>Título</th>");
            out.println("<th>Disciplina</th>");
            out.println("<th>Editora</th>");
            out.println("<th>Link</th>");
            out.println("</tr>");
            //Verifica se há resultado no ResultSet e se houver retorna os dados abaixo
            while(rs.next()){
                //Retorna os valores de cada coluna encontrada no SELECT
                out.println("<tr>");
                out.println("<td>"+ rs.getString("codigo") + "</td>");
                out.println("<td>"+ rs.getString("titulo") + "</td>");
                out.println("<td>"+ rs.getString("disciplina") + "</td>");
                out.println("<td>"+ rs.getString("editora") + "</td>");
                out.println("<td>"+"<a href="+"https://www.google.com.br/"+">"+ rs.getString("link") + "</a>"+"</td>");
                out.println("</tr>");

            }
        }catch(Exception ex){
            out.println(ex.getMessage());
        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
