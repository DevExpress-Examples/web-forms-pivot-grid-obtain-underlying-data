using System;
using DevExpress.Web;

namespace DisplayUnderlyingRecords {
    public partial class _Default : System.Web.UI.Page {
        protected void Page_Load(object sender, EventArgs e) {
            string columnIndexValue = ColumnIndex.Value,
                      rowIndexValue = RowIndex.Value;            
            if (ASPxGridView1.IsCallback && 
                !string.IsNullOrEmpty(columnIndexValue) && !string.IsNullOrEmpty(rowIndexValue))
            {
                BindGridView(columnIndexValue, rowIndexValue);                
                ASPxGridView1.JSProperties.Add("cpShowDrillDownWindow", false);
            }
        }
        protected void ASPxGridView1_CustomCallback(object sender, 
            ASPxGridViewCustomCallbackEventArgs e) {
            if (e.Parameters == "D")
            {
                ASPxGridView1.PageIndex = 0;
                ASPxGridView1.JSProperties["cpShowDrillDownWindow"] = true;
            }
        }
        protected void BindGridView(string columnIndex, string rowIndex) {
            ASPxGridView1.DataSource = 
                ASPxPivotGrid1.CreateDrillDownDataSource(Int32.Parse(columnIndex), 
                                                         Int32.Parse(rowIndex));
            ASPxGridView1.DataBind();
        }
       
    }
}
