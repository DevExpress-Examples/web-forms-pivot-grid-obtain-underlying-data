<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128577401/21.2.3%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E1873)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
# Pivot Grid for Web Forms - How to Display Underlying Records
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/128577401/)**
<!-- run online end -->

The ASPxPivotGrid includes the drill-down capability, which enables you to retrieve a list of records that were used to calculate a particular summary. To obtain drill-down data, use the pivot grid's [CreateDrillDownDataSource](https://docs.devexpress.com/AspNet/DevExpress.Web.ASPxPivotGrid.ASPxPivotGrid.CreateDrillDownDataSource.overloads?p=netframework) method. Its parameters completely identify a summary cell. In this example, an end-user can view records from the control's underlying data source, associated with a summary cell, by clicking on it. The obtained data is displayed by the ASPxGridView within a popup window.

## Files to Review

* [Default.aspx](./CS/ASPxPivotGrid_DisplayUnderlyingRecords/Default.aspx) (VB: [Default.aspx](./VB/ASPxPivotGrid_DisplayUnderlyingRecords/Default.aspx))
* [Default.aspx.cs](./CS/ASPxPivotGrid_DisplayUnderlyingRecords/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/ASPxPivotGrid_DisplayUnderlyingRecords/Default.aspx.vb))

