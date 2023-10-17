<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Empleados ABM.aspx.cs" Inherits="EmpleadosParcial.Empleados_ABM" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/EmpleadosSectores.aspx">Empleado Sector</asp:HyperLink>
            <br />
           <h3>Altas Empleados</h3> Nombre: <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Apellido:
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="DropDownLisr" DataTextField="nombre" DataValueField="id">
            </asp:DropDownList>
&nbsp;<asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Alta Empleado" />
            <br />
            <br />
            <asp:Label ID="Label1" runat="server"></asp:Label>
            <asp:SqlDataSource ID="DropDownLisr" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023 %>" DeleteCommand="DELETE FROM [EmpleadoSectores] WHERE [id] = @id" InsertCommand="INSERT INTO [EmpleadoSectores] ([nombre]) VALUES (@nombre)" SelectCommand="SELECT * FROM [EmpleadoSectores]" UpdateCommand="UPDATE [EmpleadoSectores] SET [nombre] = @nombre WHERE [id] = @id">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nombre" Type="String" />
                    <asp:Parameter Name="id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <h3>Actualizar Empleados</h3>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
&nbsp;<asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="Actualizar" OnClick="Button2_Click" />
            <br />
            Filtrar:<br />
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="DropDownLisr" DataTextField="nombre" DataValueField="id" Height="16px" Width="354px">
            </asp:DropDownList>
&nbsp;<asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Filtrar" />
<asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Desfiltrar" />
            <br />
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption="Empleados ABM" CellPadding="4" DataKeyNames="id" DataSourceID="SqlDataSource1" EmptyDataText="No hay registros de datos para mostrar." ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="id" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" SortExpression="nombre" />
                    <asp:BoundField DataField="apellido" HeaderText="Apellido" SortExpression="apellido" />
                    <asp:BoundField DataField="Expr1" HeaderText="Sector" SortExpression="Expr1" />
                    <asp:CommandField ButtonType="Button" DeleteText="Baja" EditText="Actualizar" ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="Lime" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:IssdTP42023ConnectionString1 %>" DeleteCommand="DELETE FROM [Empleados] WHERE [id] = @id" InsertCommand="INSERT INTO [Empleados] ([apellido], [nombre], [idSector]) VALUES (@apellido, @nombre, @idSector)" ProviderName="<%$ ConnectionStrings:IssdTP42023ConnectionString1.ProviderName %>" SelectCommand="SELECT Empleados.id, Empleados.apellido, Empleados.nombre, EmpleadoSectores.nombre AS Expr1 FROM Empleados INNER JOIN EmpleadoSectores ON Empleados.idSector = EmpleadoSectores.id INNER JOIN EmpleadoSectores AS EmpleadoSectores_1 ON Empleados.idSector = EmpleadoSectores_1.id" UpdateCommand="UPDATE Empleados SET apellido = @apellido, nombre = @nombre WHERE (id = @id)">
                <DeleteParameters>
                    <asp:Parameter Name="id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox2" Name="apellido" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox1" Name="nombre" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="idSector" PropertyName="SelectedValue" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox4" Name="apellido" PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox3" Name="nombre" PropertyName="Text" Type="String" />
                    <asp:Parameter Name="idSector" Type="Int32" />
                    <asp:ControlParameter ControlID="GridView1" Name="id" PropertyName="SelectedValue" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <asp:Label ID="Label2" runat="server"></asp:Label>
            <br />
            <br />
&nbsp;<asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Guardar Datos" />
&nbsp;<asp:Label ID="Label3" runat="server"></asp:Label>
            <br />
        </div>
    </form>
</body>
</html>
