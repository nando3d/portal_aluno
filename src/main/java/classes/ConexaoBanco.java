/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package classes;
import java.sql.*;
/**
 *
 * @author Fernando
 */
public class ConexaoBanco {

     public static Connection AbreConexao() throws SQLException, Exception{
        
        //Dados para conexão com banco de dados SQL
        String banco = "portal";
        String usuario = "root";
        String senha = "123456";
        String driver = "com.mysql.jdbc.Driver";
        Connection conn = null;

        //Método estático para inicializar o driver JDBC (Arquivo inserido em Bibliotecas)
        Class.forName(driver);

        //Envia ao DriverManagr os dados para conectar ao banco de dados
        conn = DriverManager.getConnection("jdbc:mysql://localhost/" + banco, usuario, senha);

        //retorna a conexão para quem chamou o método
        return conn;
    }

    //Classe criada para executar todos os SELECT's no banco de dados
    public static ResultSet executeQuery(Connection conn, String query) throws SQLException {
        //Prepara uma variavel do tipo Statement que representa uma Query ou Comando
        Statement sta = conn.createStatement();

        //Cria variável do tipo ResultSet que irá receber a consulta do Statement
        ResultSet rs = null;
        try {
            //Variável ResultSet recebe os dados retornado do banco
            rs = sta.executeQuery(query);

        } catch (Exception err) {
            //Log.logar(err.getMessage(), Log.TYPE_INFORMATION);
        }
        return rs;
    }

    //Classe criada para executar todos os INSERT's no banco de dados
    public static int executeInsert(Connection conn, String query) throws SQLException {

        //Prepara uma variavel do tipo Statement que representa uma Query ou Comando
        Statement stm = conn.createStatement();

        //Executa o comando SQL INSERT no banco de dados
        return stm.executeUpdate(query);
    }

}
