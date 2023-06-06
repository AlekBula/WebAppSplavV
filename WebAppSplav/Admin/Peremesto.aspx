<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Peremesto.aspx.cs" Inherits="WebAppSplav.Admin.Peremesto" %>
<%@ Import Namespace="WebAppSplav" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script>
        /*For disappearing alert message*/
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>")/*.style.display = "none"*/;
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
                                    
                                    <div class="card-header-left "></div>
                                    <div>
                                    <div class="card-block">
                                        <div class="row">
                                            <div class="col-sm-6 col-md-4 col-lg-4">
                                           
                                                     <div class="form-group">
                                                        <label>Местонахождение</label>
                                                        <div>
                                                            <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"
                                                                placeholder=" " TextMode="MultiLine"></asp:TextBox>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                                ErrorMessage="Характеристики заполнить" ForeColor="Red" Display="Dynamic"
                                                                SetFocusOnError="true" ControlToValidate="txtDescription" >
                                                            </asp:RequiredFieldValidator>
                                                              <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                         
                                                        </div>
                                                    </div>

                                                       <div class="form-group">
                                                        <label>Номер оборудования </label>
                                                        <div>
                                                            <asp:DropDownList ID="ddlProducts" runat="server" CssClass="form-control"
                                                                DataSourceID="SqlDataSource3" DataTextField="Number" DataValueField="ProductId" 
                                                                AppendDataBoundItems="True"    >
                                                                <asp:ListItem Value="0">Выбрать</asp:ListItem>
                                                        </asp:DropDownList>

                                                            <asp:RequiredFieldValidator ID="RequiredFielValidator10" runat="server"
                                                                ErrorMessage="надо" ForeColor="Red" Display="Dynamic"
                                                                SetFocusOnError="true" ControlToValidate="ddlProducts" InitialValue="0">
                                                            </asp:RequiredFieldValidator>
                                                            
                                                         <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>" SelectCommand="SELECT [ProductId], [Number] FROM [Products]"></asp:SqlDataSource>

                                                        </div>
                                                    </div>
                                                    
                                                    
                                                    <div class="pb-5">
                                                        <asp:Button ID="btnAddOrUpdate" runat="server" Text="Добавить" CssClass="btn btn-primary" 
                                                           OnClick="btnAddOrUpdate_Click"/>
                                                
                                                        &nbsp;
                                                    <asp:Button ID="btnClear" runat="server" Text="Удалить" CssClass="btn btn-primary"
                                                        CausesValidation="false"   OnClick="btnClear_Click"/>
                                                    </div>
                                            </div>
                                       
                                              <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                                <h4 class="sub-title"></h4>
                                                <div class="card-block table-border-style">
                                                    <div class="table-responsive">

                                                        <asp:Repeater ID="rMesto" runat="server"
                                                         >
                                                            <HeaderTemplate>
                                                                <table class="table data-table-export table-hover nowrap">
                                                                    <thead>
                                                                    <tr>
                                                                        <th class="table-plus">Местонахождение </th>
                                                                        <th>Номер</th>
                                                                       <th>Дата</th>
                                                                        <th class="datatable-nosort">Action</th>
                                                                    </tr>
                                                                        </tr>
                                                                        </thead>
                                                                    <tbody>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <tr>
                                                                    <td class="table-plus"> <%# Eval("Description") %></td>
                                                                       <td><%# Eval("ProductNumber") %></td>
                                                                     
                                                                     
                                                                       <td> <%# Eval("CreatedDate") %></td>
                                                                   
                                                                       <td>
                                                                           <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary"
                                                                               CausesValidation="false"
                                                                               CommandArgument='<%# Eval("MestoId") %>' CommandName="edit">
                                                                               <i class="ti-pencil"></i>
                                                                               </asp:LinkButton>
                                                                           <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete"
                                                                               CssClass="badge bg-danger" CommandArgument='<%# Eval("MestoId") %>'
                                                                               OnClientClick="return confirm('Do you want to delete this Product?')"
                                                                                CausesValidation="false">
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
    </div>
        </div>

 


</asp:Content>
