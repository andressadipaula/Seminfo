<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="consultaEvento.aspx.cs" Inherits="SEMINFO.consultaEvento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Estilos/consultaEvento.css" rel="stylesheet" />
    <div>
        <div class="container">
            <div class="col-md-offset-1 col-md-10">

                <%--Titulo--%>
                <div id="titulo" class="row">
                    <div class="jumbotron">
                        <h2>
                            <center><asp:Label ID="Label1" runat="server" Text="CONSULTA DE EVENTOS" Font-Bold="True" ForeColor="#0066FF"></asp:Label></center>
                        </h2>
                    </div>
                </div>

                <%--Mensagem--%>
                <div id="mensagem" class="row">
                    <h3>Eventos:
                    </h3>
                </div>
                <hr />

                <%--Table--%>
                <center><asp:GridView ID="gvEvento" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDataBound="gvEvento_RowDataBound">
                    <AlternatingRowStyle BackColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EFF3FB" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />
                </asp:GridView></center>
                <br />
                <br />
                <br />
                <br />
                <%--Botões--%>
                <div id="botao" class="form-group col-md-8">
                    <asp:Button ID="btnVoltar" runat="server" Text="Voltar" CssClass="btn btn-default" ToolTip="Voltar para página Inicial" OnClick="btnVoltar_Click" />
                </div>

            </div>
        </div>
    </div>
</asp:Content>
