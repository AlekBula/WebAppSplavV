<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Inventory.aspx.cs" Inherits="WebAppSplav.Admin.Inventory" %>

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

                                                    <div>


                                                        <div class="form-group">
                                                            <label>Номер</label>
                                                            <div>
                                                                <asp:TextBox ID="txtNumber" runat="server" CssClass="form-control"
                                                                    placeholder=" "></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                                                    ErrorMessage="Номер обязателен" ForeColor="Red" Display="Dynamic"
                                                                    SetFocusOnError="true" ControlToValidate="txtNumber"></asp:RequiredFieldValidator>
                                                                <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Наименование</label>
                                                            <div>
                                                                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
                                                                    placeholder=" "></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                                    ErrorMessage="Название обязательно" ForeColor="Red" Display="Dynamic"
                                                                    SetFocusOnError="true" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                                                            </div>
                                                        </div>


                                                        <div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Характеристики</label>
                                                            <div>
                                                                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control"
                                                                    placeholder=" " TextMode="MultiLine"></asp:TextBox>
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                                                                    ErrorMessage="Характеристики заполнить" ForeColor="Red" Display="Dynamic"
                                                                    SetFocusOnError="true" ControlToValidate="txtDescription">
                                                                </asp:RequiredFieldValidator>

                                                            </div>
                                                        </div>

                                                        <div class="form-group">
                                                            <label>Вид </label>
                                                            <div>
                                                                <asp:DropDownList ID="ddlCategories" runat="server" CssClass="form-control"
                                                                    DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="CategoryId"
                                                                    AppendDataBoundItems="true">
                                                                    <asp:ListItem Value="0">Выбрать категорию</asp:ListItem>
                                                                </asp:DropDownList>

                                                                <asp:RequiredFieldValidator ID="RequiredFielValidator5" runat="server"
                                                                    ErrorMessage="надо" ForeColor="Red" Display="Dynamic"
                                                                    SetFocusOnError="true" ControlToValidate="ddlCategories" InitialValue="0">
                                                                </asp:RequiredFieldValidator>

                                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cs %>"
                                                                    SelectCommand="SELECT [CategoryId], [Name] FROM [Categories]"></asp:SqlDataSource>

                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <%-- <label>Статус </label>--%>
                                                            <div class="form-check pl-4">
                                                                <asp:CheckBox ID="cbIsActiveStatus" runat="server" Text="&nbsp Занят"
                                                                    CssClass="form-check-input" />
                                                            </div>
                                                        </div>


                                                        <div class="form-group">
                                                            <%--  <label>Состояние </label>--%>
                                                            <div class="form-check pl-4">
                                                                <asp:CheckBox ID="cbIsActiveStatusSost" runat="server" Text="&nbsp Готов к работе "
                                                                    CssClass="form-check-input" />
                                                            </div>
                                                        </div>


                                                        <div class="pb-5">
                                                            <asp:Button ID="btnAddOrUpdate" runat="server" Text="Добавить" CssClass="btn btn-primary"
                                                                OnClick="btnAddOrUpdate_Click" />

                                                            &nbsp;
                                                    <asp:Button ID="btnClear" runat="server" Text="Очистить" CssClass="btn btn-primary"
                                                        CausesValidation="false" OnClick="btnClear_Click" />
                                                        </div>
                                                    </div>

                                                </div>

                                                <div class="col-sm-6 col-md-8 col-lg-8 mobile-inputs">
                                                    <h4 class="sub-title"></h4>
                                                    <div class="card-block table-border-style">
                                                        <div class="table-responsive">

                                                            <asp:Repeater ID="rProduct" runat="server" OnItemCommand="rProduct_ItemCommand"
                                                                OnItemDataBound="rProduct_ItemDataBound">
                                                                <HeaderTemplate>
                                                                    <table class="table data-table-export table-hover nowrap">
                                                                        <thead>
                                                                            <tr>
                                                                                <th class="table-plus">Номер </th>
                                                                                <th>Наименование</th>
                                                                                <th>Характеристики</th>
                                                                                <th>Вид</th>
                                                                                <th>Статус</th>
                                                                                <th>Состояние</th>
                                                                                <th>CreatedDate</th>
                                                                                <th class="datatable-nosort">Action</th>
                                                                            </tr>
                                                                        </thead>
                                                                        <tbody>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td class="table-plus"><%# Eval("Number") %></td>

                                                                        <td><%# Eval("Name") %></td>

                                                                        <td><%# Eval("Description") %></td>

                                                                        <td><%# Eval("CategoryName") %></td>
                                                                        <td>
                                                                            <asp:Label ID="lblIsActiveStatus" runat="server" Text=' <%# Eval("IsActiveStatusSost") %>'></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="lblIsActiveStatusSost" runat="server" Text=' <%# Eval("IsActiveStatus") %>'></asp:Label>
                                                                        </td>

                                                                        <td><%# Eval("CreatedDate") %></td>

                                                                        <td>
                                                                            <asp:LinkButton ID="lnkEdit" Text="Edit" runat="server" CssClass="badge badge-primary"
                                                                                CausesValidation="false"
                                                                                CommandArgument='<%# Eval("ProductId") %>' CommandName="edit">
                                                                               <i class="ti-pencil"></i>
                                                                            </asp:LinkButton>
                                                                            <asp:LinkButton ID="lnkDelete" Text="Delete" runat="server" CommandName="delete"
                                                                                CssClass="badge bg-danger" CommandArgument='<%# Eval("ProductId") %>'
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
