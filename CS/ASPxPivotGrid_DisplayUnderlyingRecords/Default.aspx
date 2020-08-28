<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs"
           Inherits="DisplayUnderlyingRecords._Default" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0,
           Culture=neutral, PublicKeyToken=b88d1754d700e49a"
           Namespace="DevExpress.Web.ASPxGridView"
           TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0,
         Culture=neutral, PublicKeyToken=b88d1754d700e49a"
         Namespace="DevExpress.Web.ASPxPopupControl"
         TagPrefix="dxpc" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v13.1, Version=13.1.14.0,
         Culture=neutral, PublicKeyToken=b88d1754d700e49a"
         namespace="DevExpress.Web.ASPxPivotGrid"
         tagprefix="dxwpg" %>

<%@ Register assembly="DevExpress.Web.v13.1, Version=13.1.14.0,
         Culture=neutral, PublicKeyToken=b88d1754d700e49a"
         namespace="DevExpress.Web.ASPxEditors"
         tagprefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
        "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <input runat="server" id="ColumnIndex" type="hidden" enableviewstate="true" />
    <input runat="server" id="RowIndex" type="hidden" enableviewstate="true" />
    <div>
        <dxwpg:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server"
            DataSourceID="AccessDataSource1"            
            ClientInstanceName="PivotGrid" ClientIDMode="AutoID">
            <Styles>
                <CellStyle Cursor="pointer">
                </CellStyle>
            </Styles>
            <Fields>
                <dxwpg:PivotGridField Area="RowArea" AreaIndex="0"
                    Caption="Customer" FieldName="CompanyName"
                    ID="fieldCompanyName">
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField Area="ColumnArea" AreaIndex="0"
                    Caption="Year" FieldName="OrderDate"
                    UnboundFieldName="Year"
                    GroupInterval="DateYear"
                    ID="fieldOrderDate">
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField Area="DataArea" AreaIndex="0"
                    FieldName="ProductAmount"
                    Caption="Product Amount"
                    ID="fieldProductAmount">
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField Area="RowArea" AreaIndex="1"
                    Caption="Products" FieldName="ProductName"
                    ID="fieldProductName">
                </dxwpg:PivotGridField>
            </Fields>
            <ClientSideEvents CellClick="function(s, e) {
	            var columnIndex = document.getElementById('ColumnIndex'),
		            rowIndex = document.getElementById('RowIndex');
	            columnIndex.value = e.ColumnIndex;
	            rowIndex.value = e.RowIndex;
	            GridView.PerformCallback('D'); 
            }" />
            <OptionsView ShowFilterHeaders="False" />
        </dxwpg:ASPxPivotGrid>
        <dxpc:ASPxPopupControl ID="ASPxPopupControl1" runat="server"
              Left="200" Top="200" CloseAction="CloseButton"
              ClientInstanceName="DrillDownWindow"
              HeaderText="Drill Down Window"
              Width="153px"  Height="1px"
              AllowDragging="True">
            <ContentCollection>
                <dxpc:PopupControlContentControl runat="server">
                    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server"
                          OnCustomCallback="ASPxGridView1_CustomCallback"
                          ClientInstanceName="GridView"
                          AutoGenerateColumns="True">
                        <ClientSideEvents EndCallback="function(s, e) {
                        if( s.cpShowDrillDownWindow )                            
	                        DrillDownWindow.ShowAtPos ( PivotGrid.GetMainElement().clientLeft, 
                            PivotGrid.GetMainElement().clientTop );
                          }" />                        
                        <SettingsLoadingPanel Mode="ShowOnStatusBar" />                        
                    </dxwgv:ASPxGridView>
                </dxpc:PopupControlContentControl>
            </ContentCollection>
        </dxpc:ASPxPopupControl>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server"
            DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [CustomerReports]"
            DataSourceMode="DataReader" />  
    </div>
    </form>
</body>
</html>
