<%@ Page Title="" Language="C#" MasterPageFile="~/masterPage.Master" AutoEventWireup="true" CodeBehind="evento.aspx.cs" Inherits="SEMINFO.evento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <link href="Estilos/evento.css" rel="stylesheet" />
    <div>
        <div class="container">
            <div class="col-md-offset-1 col-md-10">

                <%--Titulo--%>
                <div id="titulo" class="row">
                    <div class="jumbotron">
                        <h2>
                            <center><asp:Label ID="Label1" runat="server" Text="CADASTRO DE EVENTOS" Font-Bold="True" ForeColor="#0066FF"></asp:Label></center>
                        </h2>
                    </div>
                </div>

                <%--Mensagem--%>
                <div id="mensagem" class="row">
                    <h3>Preencha os dados para cadastrar um Evento:
                    </h3>
                </div>
                <hr />

                <%--Informações--%>
                <div id="informacoes">

                    <%--Linha 1 (DESCRIÇÃO, DATA, HORÁRIO e PALESTRANTE)--%>
                    <div class="row">
                        <div class="form-group col-md-3">
                            <label for="descricao">Descrição:</label>
                            <asp:TextBox ID="txtDescricao" runat="server" CssClass="form-control"></asp:TextBox>

                        </div>
                        <div class="form-group col-md-3">
                            <label for="data">Data:</label>
                            <asp:TextBox ID="txtData" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>

                        </div>
                        <div class="form-group col-md-3">
                            <label for="horario">Horário:</label>
                            <asp:TextBox ID="txtHorário" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                        </div>
                        <div class="form-group col-md-3">
                            <label for="palestrante">Palestrante:</label>
                            <asp:DropDownList ID="ddlPalestrante" runat="server" CssClass="form-control" ></asp:DropDownList>  
                        </div>
                    </div>

                    <%--Linha 2 (TIPO, LOCAL e OBSERVAÇÕES)--%>
                    <div class="row">
                        <div class="form-group col-md-4">
                            <label for="tipo">Tipo:</label>                            
                            <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-control" >
                                <asp:ListItem Value="miniCurso">Mini-Curso</asp:ListItem>
                                <asp:ListItem Value="palestra">Palestra</asp:ListItem>
                                <asp:ListItem Value="outros">Outros</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="form-group col-md-4">
                            <label for="local">Local:</label>
                            <asp:TextBox ID="txtLocal" runat="server" CssClass="form-control" ></asp:TextBox>
                        </div>
                        <div class="form-group col-md-4">
                            <label for="observacoes">Observações:</label>
                            <asp:TextBox ID="txtObservacoes" runat="server" CssClass="form-control" ></asp:TextBox>
                        </div>
                    </div>

                </div>
                <hr />

                <%--Botões--%>
                <div id="botao" class="form-group col-md-8">
                    <asp:Button ID="btnCadastrar" runat="server" Text="Cadastrar" CssClass="btn btn-primary" ToolTip="Cadastrar Evento" OnClick="btnCadastrar_Click"/>
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-default" ToolTip="Cancelar" OnClick="btnCancelar_Click"/>
                </div>

            </div>
        </div>
    </div>

</asp:Content>
