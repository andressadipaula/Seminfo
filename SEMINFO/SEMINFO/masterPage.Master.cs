using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SEMINFO
{
    public partial class masterPage : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["SessionUsuario"] == "Comum")
            {
                ocultaBotoes();
            }
        }

        public void ocultaBotoes()
        {
            btnPalestrante.Visible = false;
            btnEvento.Visible = false;
        }

        protected void ibHome_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("home.aspx");
        }

        protected void btnPalestrante_Click(object sender, EventArgs e)
        {
            Response.Redirect("palestrante.aspx");
        }

        protected void btnEvento_Click(object sender, EventArgs e)
        {
            Response.Redirect("evento.aspx");
        }

        protected void btnConsulta_Click(object sender, EventArgs e)
        {
            Response.Redirect("consultaEvento.aspx");
        }

        protected void btnInscricao_Click(object sender, EventArgs e)
        {
            Response.Redirect("inscricao.aspx");
        }

        protected void btnSair_Click(object sender, EventArgs e)
        {
            Session.Remove("SessionUsuario");
            Response.Redirect("~/login.aspx");
        }
    }
}