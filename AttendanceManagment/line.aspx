<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="line.aspx.cs" Inherits="AttendanceManagment.line" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #btn-submit {
            margin-top: 29px;
        }

        #line-table {
            margin-top: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <!-- Content Header (Page header) -->
    <section class="content-header">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h4><%:Page.Title %></h4>

                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item active"><%:Page.Title %></li>
                    </ol>
                </div>
            </div>
        </div>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="container">
            <div class="row">
                  <div class="col-md-4">
                    <div class="form-group">
                        <label for="floorname">Floor Name</label>
                        <asp:DropDownList runat="server" CssClass="form-control form-control-sm" ClientIDMode="Static" ID="floorname"></asp:DropDownList>
                       
                    </div>
                </div>

                <div class="col-md-4">
                    <div class="form-group">
                        <label for="linename">Line Name</label>
                        <input type="text" class="form-control form-control-sm" id="linename" placeholder="Enter Your Line Name">
                    </div>
                </div>
              
                <div class="col-md-4">
                    <button type="button" data-id="0" class="btn btn-sm btn-success" id="btn-submit"><i class="fa fa-save"></i> Submit</button>
                </div>
            </div>                            
        </div>
    </section>


      <section id="line-table">
        <div class="container-fluid">
            <div class="col-md-12">
                <table class="table table-bordered table-hover text-center" id="show-line-table">
                    <thead class="bg-info">
                        <tr>
                            <th class="text-center">SL#</th>
                            <th class="text-center">Floor Name</th>
                            <th class="text-center">Line Name</th>               
                            <th class="text-center">Action</th>    
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
            </div>
        </div>
    </section>


    <script>
        $(document).ready(function () {
            $("#btn-submit").on("click", function () {
                var obj = {
                    LineID: parseInt($(this).attr("data-id")),
                    FloorID: ($("#floorname").val()),
                    LineName: ($("#linename").val())
                }

                if (obj.FloorID == '' || obj.LineName == '') {

                    swal("Hi..", "Something Wrong", "warning");
                }
                else {

                    save_line_info(obj);
                }
            });
        });

        function save_line_info(obj) {
            $.post('<%=Page.ResolveUrl("~/attendance_services.asmx/InsertUpdate_LineInfo")%>', { insertObject: JSON.stringify(obj) }, function (data, status, xhr) {

                if (status == 'success') {
                 swal("Hi", "Floor Name Save Successfully", "success");
                    ResetDepartmentInfo();
                }
                else {
                    swal("Hi", "Something Wrong", "warning");
                }
            });
        }

         function reDrawTable() {
            lineTable.page('first').draw();
        }

        var designationTable = $("#show-line-table").DataTable({
            "oLanguage": {
                "sEmptyTable": "No Information available"
            },
            "bProcessing": true,
            "bServerSide": true,
            "sAjaxSource": '<%= Page.ResolveUrl("~/attendance_services.asmx/Get_LineTableInfo")%>',
            "sServerMethod": 'post',
            "order": [[0, "desc"]],
            "aaSorting": [],
            "lengthMenu": [[10, 50, 100, -1], [10, 50, 100, "All"]], //value:item pair
            "columnDefs": [
                { "targets": [0, 1, 2,3], "bSortable": false }
            ],
            "columns": [
                { 'data': 'Rownum', class: 'text-center' },
                { 'data': 'FloorName', class: 'text-center' },
                { 'data': 'LineName', class: 'text-center' },
                
                {
                    'data': null, //its null here because history column will contain the mRender
                    "mRender": function (data) {
                        return '<button data-toggle="modal" class="btn btn-edit btn-info p-0 px-2" type="button" data-deptid="' + data.Id + '" ><i class="fa fa-edit"></i></button> <button class="btn btn-danger p-0 px-2" type="button" data-id"' + data.Id + '" ><i class="fas fa-trash"></i></button>';
                    }
                }
            ]
        });

    </script>
</asp:Content>
