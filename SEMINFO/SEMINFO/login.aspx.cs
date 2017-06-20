using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;

/// <summary>
/// Desenvolvido para a Disciplina de Técnicas de Programação 3
/// Autores: Anderson Veloso dos Santos / Maria Andressa de Paula Silva/Júnior César da Silva
/// Este sistema Web é responsável pelo cadastro em eventos que acontecem na Semana da Informática do Curso de Sistemas de Informação
/// </summary>

namespace SEMINFO
{
    public partial class login : System.Web.UI.Page
    {
        public static string permissao;
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Focus();
        }

        #region Método Login
        /// <summary>
        /// Login e Autenticação de Usuário
        /// </summary>
        public void autenticacao()
        {
            connection _connection = new connection();
            int getId = _connection.returnScalar("SELECT * FROM participante WHERE email = '" + txtEmail.Text + "' AND senha = '" + txtSenha.Text + "'");
            int getPermissao = _connection.returnScalar("SELECT permissao FROM participante WHERE id = '" + getId + "'");
            if (getId.Equals(0))//não tem este usuario
            {
                lblErro.Text = "Login inválido";
            }
            else //retorna algum id pois existe um usuario
            {
                if (getPermissao == 0) //usuario comum
                {
                    Session["SessionUsuario"] = "Comum";
                    Session.Timeout = 1440; // tempo da sessao (1 dia)
                }
                if (getPermissao == 1)// usuario administrador
                {
                    Session["SessionUsuario"] = "Administrador";
                    Session.Timeout = 1440; // tempo da sessao (1 dia)
                }
                Response.Redirect("home.aspx");
            }
        }
        #endregion

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            autenticacao();
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            txtEmail.Text = "";
            txtSenha.Text = "";
            txtEmail.Focus();
        }
    }
}