<%@ Page Language="vb" AutoEventWireup="true" CodeBehind="Default.aspx.vb"
           Inherits="DisplayUnderlyingRecords._Default" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.11.0,
           Culture=neutral, PublicKeyToken=b88d1754d700e49a"
           Namespace="DevExpress.Web"
           TagPrefix="dxwgv" %>

<%@ Register Assembly="DevExpress.Web.v21.2, Version=21.2.11.0,
         Culture=neutral, PublicKeyToken=b88d1754d700e49a"
         Namespace="DevExpress.Web"
         TagPrefix="dxpc" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v21.2, Version=21.2.11.0,
         Culture=neutral, PublicKeyToken=b88d1754d700e49a"
         namespace="DevExpress.Web.ASPxPivotGrid"
         tagprefix="dxwpg" %>

<%@ Register assembly="DevExpress.Web.v21.2, Version=21.2.11.0,
         Culture=neutral, PublicKeyToken=b88d1754d700e49a"
         namespace="DevExpress.Web"
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
            DataSourceID="SqlDataSource1"            
            ClientInstanceName="PivotGrid" ClientIDMode="AutoID" IsMaterialDesign="False">
            <OptionsData DataProcessingEngine="Optimized" />
            <Styles>
                <CellStyle Cursor="pointer">
                </CellStyle>
            </Styles>
            <Fields>
                <dxwpg:PivotGridField Area="RowArea" AreaIndex="0"
                    Caption="Customer"
                    ID="fieldCompanyName">
                    <DataBindingSerializable>
                        <dxwpg:DataSourceColumnBinding ColumnName="CompanyName" />
                    </DataBindingSerializable>
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField Area="ColumnArea" AreaIndex="0"
                    Caption="Year"
                    UnboundFieldName="Year"
                    ID="fieldOrderDate">
                    <DataBindingSerializable>
                        <dxwpg:DataSourceColumnBinding ColumnName="OrderDate" GroupInterval="DateYear" />
                    </DataBindingSerializable>
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField Area="DataArea" AreaIndex="0"
                    Caption="Product Amount"
                    ID="fieldProductAmount">
                    <DataBindingSerializable>
                        <dxwpg:DataSourceColumnBinding ColumnName="ProductAmount" />
                    </DataBindingSerializable>
                </dxwpg:PivotGridField>
                <dxwpg:PivotGridField Area="RowArea" AreaIndex="1"
                    Caption="Products"
                    ID="fieldProductName">
                    <DataBindingSerializable>
                        <dxwpg:DataSourceColumnBinding ColumnName="ProductName" />
                    </DataBindingSerializable>
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
	    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:ConnectionString.ProviderName %>" 
            SelectCommand="SELECT * FROM [CustomerReports]"></asp:SqlDataSource> 
    </div>
    </form>
</body>
</html>