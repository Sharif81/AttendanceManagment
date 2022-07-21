<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="attendance.aspx.cs" Inherits="AttendanceManagment.attendance" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #btn-submit {
            margin-top: 29px;
        }

        #attendance-table {
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
               <div class="col-md-2">
                    <div class="form-group">
                        <label for="date">Date</label>
                        <input type="text" class="form-control form-control-sm" id="date"/>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label for="name">Employee Name</label>
                        <asp:DropDownList runat="server" CssClass="form-control form-control-sm" ClientIDMode="Static" ID="empname"></asp:DropDownList>
                    </div>
                </div>


                <div class="col-md-2">
                    <div class="form-group">
                        <label>In Time</label>
                        <div class="input-group date" data-target-input="nearest">
                            <input type="text" class="form-control form-control-sm" id="intime">
                            <div class="input-group-text"><i class="far fa-clock"></i></div>                           
                        </div>
                    </div>
                </div>
                <div class="col-md-2">
                  <div class="form-group">
                        <label>Out Time</label>
                        <div class="input-group date" data-target-input="nearest">
                            <input type="text" class="form-control form-control-sm" id="outtime">
                            <div class="input-group-text"><i class="far fa-clock"></i></div>                           
                        </div>
                    </div>
                </div>

                 <div class="col-md-2">
                    <button type="button" data-id="0" class="btn btn-sm btn-success" id="btn-submit"><i class="fa fa-save"></i> Submit</button>
                </div>

               <%-- <div class="col-md-4">
                    <div class="form-group">
                        <label for="codeno">Code No</label>
                        <asp:DropDownList runat="server" CssClass="form-control form-control-sm" ClientIDMode="Static" ID="empcode"></asp:DropDownList>
                    </div>
                </div>  --%>  
            </div>

      <%--      <div class="row">
               
                <div class="col-md-2">
                    <div class="form-group">
                        <label for="ot">OT</label>
                        <input type="text" class="form-control form-control-sm" id="ot" placeholder="Enter Employee OT">
                    </div>
                </div> 
                 <div class="col-md-2">
                    <div class="form-group">
                        <label for="status"> Status</label>
                        <input type="text" class="form-control form-control-sm" id="attStatus" placeholder="Enter Status">
                    </div>
                </div> 
               
            </div> --%>        

        </div>
    </section>

     <section id="attendance-table">
        <div class="container-fluid">
            <div class="col-md-12">
                <table class="table table-bordered table-hover text-center" id="show-attendance-table">
                    <thead class="bg-info">
                        <tr>
                            <th class="text-center">SL#</th>
                             <th class="text-center">Date</th>
                            <th class="text-center">Employee Name</th>
                            <th class="text-center">Card NO</th>
                            <th class="text-center">In-Time</th>
                            <th class="text-center">Out-Time</th>
                            <th class="text-center">OT</th>
                            <th class="text-center">Status</th>              
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

             get_all_attendanceInfo();

             $("#btn-submit").on("click", function () {

                 var obj = {

                     AttID: parseInt($(this).attr("data-id")),
                     AttDate: $("#date").val(),
                     EmpName: parseInt($("#empname>option:selected").val()),
                     CodeNo: parseInt($("#empcode>option:selected").val()),
                     Intime: $("#intime").val(),
                     Outtime: $("#outtime").val(),
                     OT: $("#ot").val(),
                     AttStatus: $("#attStatus").val()
                    

                 }
                 if (obj.AttDate == '' || obj.EmpName == 0 || obj.CodeNo == 0 || obj.Intime == '' || obj.Outtime == '' || obj.OT == '' || obj.AttStatus == '') {

                     swal("Hi!", "Something Wrong!", "warning");
                     return false;
                 }
                 else {
                     save_attendance_info(obj);
                     
                 }

             });





            $('#date').daterangepicker({
                singleDatePicker: true,
                autoApply: true,
                locale: {
                    format: 'DD-MMM-YYYY'
                }
            });  

             $('#intime').daterangepicker({
                 timePicker: true,                 
                 singleDatePicker: true,
                 autoApply: true,
                locale: {
                    format: 'hh:mm A'
                }
            });  

             $('#outtime').daterangepicker({
                timePicker: true,
                 singleDatePicker: true,
                 autoApply: true,
                locale: {
                    format: 'hh:mm A'
                }
            });     
         });


         function save_attendance_info(obj) {
             $.post('<%=Page.ResolveUrl("~/attendance_services.asmx/Insert_Update_AttendanceInfo")%>', { insertObject: JSON.stringify(obj) }, function (data, status, xhr) {

                 if (status == "success") {

                     swal("Hi", "Attendance Status Save Successfully", "success");
                     get_all_attendanceInfo();
                 }
                 else {
                     swal("Hi", "Something Wrong", "warning");
                 }

             });
         }


         function get_all_attendanceInfo() {
             $.getJSON('<%=Page.ResolveUrl("~/attendance_services.asmx/Get_All_AttendanceInfo")%>', function (data, status, xhr) {

                 if (status == "success") {

                     var tbody_tr = '';
                     $.each(data, function (i, r) {
                         tbody_tr += '<tr><td>' + (i + 1) + '</td><td>' + r.AttDate + '</td><td>' + r.EmpName + '</td><td>' + r.CardNo + '</td><td>' + r.Intime + '</td><td>' + r.Outtime + '</td><td>' + r.OT + '</td><td>' + r.Status + '</td><td> <button type="button" class="btn btn-sm btn-info"><i class="fa fa-edit"></i></button> <button type="button" class="btn btn-sm btn-danger"><i class="fa fa-trash"></i></button> </td></tr>'

                     });
                     $("#show-attendance-table>tbody").empty().append(tbody_tr);
                     $("#show-attendance-table").DataTable();
                 }
             });
         }

     </script>
</asp:Content>
