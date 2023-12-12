Imports System
Imports DevExpress.Web

Namespace DisplayUnderlyingRecords

    Public Partial Class _Default
        Inherits Web.UI.Page

        Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
            Dim columnIndexValue As String = ColumnIndex.Value, rowIndexValue As String = RowIndex.Value
            If ASPxGridView1.IsCallback AndAlso Not String.IsNullOrEmpty(columnIndexValue) AndAlso Not String.IsNullOrEmpty(rowIndexValue) Then
                BindGridView(columnIndexValue, rowIndexValue)
                ASPxGridView1.JSProperties.Add("cpShowDrillDownWindow", False)
            End If
        End Sub

        Protected Sub ASPxGridView1_CustomCallback(ByVal sender As Object, ByVal e As ASPxGridViewCustomCallbackEventArgs)
            If Equals(e.Parameters, "D") Then
                ASPxGridView1.PageIndex = 0
                ASPxGridView1.JSProperties("cpShowDrillDownWindow") = True
            End If
        End Sub

        Protected Sub BindGridView(ByVal columnIndex As String, ByVal rowIndex As String)
            ASPxGridView1.DataSource = ASPxPivotGrid1.CreateDrillDownDataSource(Integer.Parse(columnIndex), Integer.Parse(rowIndex))
            ASPxGridView1.DataBind()
        End Sub
    End Class
End Namespace
