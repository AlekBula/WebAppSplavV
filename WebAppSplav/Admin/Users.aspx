<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="WebAppSplav.Admin.Users" %>
<%@ Import Namespace="WebAppSplav" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script>
        /*For disappearing alert message*/
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">



    

    <div class="pcoded-inner-content pt-0">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>

        <div class="main-body">
            <div class="page-wrapper">
                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                    </div>
                                    <div class="card-block">
                                        <div class="row">                                         
                                        
                                         <div class="col-12 mobile-inputs">
                                                <h4 class="sub-title">Сотрудники</h4>
                                                <div class="card-block table-border-style">
                                                    <div class="table-responsive">

                                                        <asp:Repeater ID="rUsers" runat="server" OnItemCommand="rUsers_ItemCommand">
                                                            <HeaderTemplate>
                                                                <table class="table data-table-export table-hover nowrap">
                                                                    <thead>
                                                                    <tr>
                                                                       <th class="table-plus">Имя</th>
                                                                                <th>Фамилия</th>
                                                                                <th>Отчество</th>
                                                                                <th>Логин</th>
                                                                                
                                                                                <th>Дата Регистрации</th>
                                                                                <th class="datatable-nosort">Удалить</th>
                                                                    </tr>
                                                                        </thead>
                                                                    <tbody>
                                                                
                                                            </HeaderTemplate>
                                                          
 <ItemTemplate>
                                                                    <tr>
                                                                        <td class="table-plus"><%# Eval("Name") %></td>
                                                                        <td><%# Eval("Surname") %>  </td>
                                                                        <td><%# Eval("Patronymic") %>  </td>

                                                                        <td><%# Eval("Username") %>  </td>
                                                                        <%--  <td>  <%# Eval("Password") %>  </td>--%>
                                                                        <td><%# Eval("CreatedDate") %></td>
                                                                        <td>

                                                                            <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete"
                                                                                CssClass="badge bg-danger" CommandArgument='<%# Eval("UserId") %>'
                                                                                OnClientClick="return confirm('Do you want to delete this User?')">
                                                                               <i class="ti-trash"></i>
                                                                            </asp:LinkButton>

                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                            <FooterTemplate>
                                                                </tbody>
                                                                </table>
                                                            </FooterTemplate>
                                                        </asp:Repeater>

                                                    </div>
                                                </div>
                                             </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
   
   
</asp:Content>

