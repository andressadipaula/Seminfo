using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEMINFO
{
    public partial class palestrante : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUsuario"] == null)
            {
                Response.Redirect("login.aspx");
            }

            if (Session["SessionUsuario"] == "Comum")
            {
                Response.Redirect("home.aspx");
            }
        }

        #region Método Cadastra
        public void cadastra()
        {
            connection _connection = new connection();
            _connection.executeQuery(@"INSERT INTO palestrante(nome, telefone, email, resumo)
                                VALUES('" + txtNome.Text + "', '" + txtTelefone.Text + "', '" + txtEmail.Text + "', '" + txtCurriculo.Text + "')");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "Alerta", "alert('Cadastro realizado com sucesso!'); window.location='" + Request.ApplicationPath + "home.aspx';", true);
        }
        #endregion

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void btnCadastrar_Click(object sender, EventArgs e)
        {
            cadastra();
        }
    }
}