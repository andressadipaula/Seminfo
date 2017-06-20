using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

//Usa Referencia do MySql
//using MySql.Data;
//using MySql.Data.MySqlClient;
using MySql.Data;
using MySql.Data.MySqlClient;
using System.Data;

namespace SEMINFO
{
    public class connection
    {
        static string conexao = @"SERVER= localhost; port=3303; DATABASE=seminfo_bd; UID=root; PASSWORD=123456;";
        MySqlConnection con = new MySqlConnection(conexao);

        #region Executa Comando (Query)
        public String executeQuery(String comando)
        {
            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand(comando, con);
                cmd.ExecuteNonQuery();
                return "OK";
            }
            catch (Exception erro)
            {
                return erro.Message;
            }

            finally
            {
                con.Close();
            }
        }
        #endregion

        #region Retorna Valor (Scalar)
        public int returnScalar(String comando)
        {
            try
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand(comando, con);
                int valor = Convert.ToInt32(cmd.ExecuteScalar());
                return valor;
            }
            catch (Exception erro)
            {
                Console.WriteLine(erro.Message);
                throw;
            }

            finally
            {
                con.Close();
            }
        }
        #endregion

        #region Retorna Tabela (Table)
        public DataTable returnTable(String comando)
        {
            try
            {
                con.Open();
                DataTable tabela = new DataTable();
                MySqlDataAdapter adaptador = new MySqlDataAdapter(comando, con);
                adaptador.Fill(tabela);
                return tabela;
            }
            catch (Exception erro)
            {
                Console.WriteLine(erro.Message);
                throw;
            }
            finally
            {
                con.Close();
            }
        }
        #endregion
    }
}