﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefaultGridView5.aspx.cs" Inherits="Day48ASP.Pages.Departments.DefaultGridView5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
   <body>
    <form id="form1" runat="server">
        <div>
            <h1>Show all departments in GridView 5</h1>

            <hr />
            
            <a href="#" onclick="tableNewRecord.style.display = 'block'">Add new Department</a><br />
            <asp:GridView ID="GridView1" runat="server" 
                          AllowPaging="True" 
                          AllowSorting="True" 
                          AutoGenerateColumns="False" 
                          DataKeyNames="Id" 
                          DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Department Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:HyperLinkField DataTextField="Name" 
                                        DataNavigateUrlFormatString="~/Pages/Users/Default.aspx?Id={0}" 
                                        DataNavigateUrlFields="Id" 
                                        HeaderText="Department" 
                                        SortExpression="Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                    <asp:ButtonField Text="Button" />
                </Columns>
            </asp:GridView>
            
            <hr />
            
            <a href="#" onclick="tableNewRecord.style.display = 'block'">Add new Department</a>
            
            <table id="tableNewRecord" class="form-block" style="display: none;">
                <tr>
                    <td>
                        <asp:Label runat="server" ID="LabelName">Name</asp:Label>
                    </td>
                    <td>
                        <asp:Label runat="server" ID="LabelDescription">Description</asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox runat="server" ID="TextBoxName" placeholder="Enter Department Name" 
                                     MaxLength="50"></asp:TextBox>
                    </td>
                    <td>
                        <asp:TextBox runat="server" ID="TextBoxDescription" placeholder="Department Description" 
                                     TextMode="MultiLine" MaxLength="500"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Button runat="server" ID="ButtonCreate" Text="Create" OnClick="ButtonCreate_Click" />
                        <input type="reset" />
                    </td>
                </tr>
            </table>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                               ConnectionString="<%$ ConnectionStrings:UserManagement %>"
                               SelectCommand="SELECT * FROM [Department]"
                               UpdateCommand="Update Department set Name = @Name, Description = @Description where Id = @Id"
                               DeleteCommand="Delete Department where Id = @Id"
                               InsertCommand="Insert into Department (Name, Description) values(@Name, @Description)">
                <UpdateParameters>
                    <asp:Parameter name="Id" Type="Int32" />
                    <asp:Parameter name="Name" Type="String" />
                    <asp:Parameter name="Description" Type="String" />
                </UpdateParameters>
                <DeleteParameters>
                    <asp:Parameter name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter name="Name" ControlID="TextBoxName" Type="String" />
                    <asp:ControlParameter name="Description" ControlID="TextBoxDescription" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>

</html>
