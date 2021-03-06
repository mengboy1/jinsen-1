<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ page import="jinshen.bean.*" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
   <title>查看木材收购单</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="js/bstable/css/bootstrap-table.css">
    <link rel="stylesheet" href="css/tableall.css">
    <link rel="stylesheet" href="css/registe.css"/>
    <link rel="stylesheet" href="js/jQueryCalendar/calendar.css">
    <link href="css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!-- font-awesome icons CSS -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!-- //font-awesome icons CSS-->

    <!-- side nav css file -->
    <link href='css/SidebarNav.min.css' media='all' rel='stylesheet' type='text/css'/>
    <!-- js-->
    <script src="js/jquery-1.11.1.min.js"></script>
    <script src="js/modernizr.custom.js"></script>
    <!-- jQuery.print -->
	<script src="js/jQuery.print.js"></script>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="css/jquery.gritter.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<style>
 .table_p{line-height: 28px;border-bottom: 1px #d0e6ec solid;position: relative;margin-bottom: 10px; 
            margin-top: 35px; margin-left:10px}
.table_p span{border-bottom: 3px #42cdec solid;display: inline-block;position: absolute;bottom: -1px;font-weight: bold;font-size: 20px}
            

.table1{width:60%; height:200px;margin-left:auto; margin-right:auto;padding:10px;border-collapse:collapse}
.table2{width:60%;margin-left:auto; margin-right:auto;padding:10px;border-collapse:collapse}
td,th{text-align:center;vertical-align:middle}
tr{text-align:center}
         


</style>
<script type="text/javascript">
var k=100;

function aaad()
{
 	var str="<tr id="+k+" display:block;><td style='font-size:20px;'><input type='checkbox' style='width:20px;height:20px;' value="+k+">树材种<span></span>"
          +"<select style='width: 180px' name='treetype' id='sss"+k+"'>"
           +"<option>--请选择--</option>"
           +"<option value='杉原木'>--杉原木--</option>"
           +"<option value='杉小径'>--杉小径--</option>"
           +"<option value='松原木'>--松原木--</option>"
           +"<option value='松小径'>--松小径--</option>"
           +"<option value='杂原木'>--杂原木--</option>"
           +"<option value='杂小径'>--杂小径--</option></select>"
        +"检尺长(m)<span></span><input type='text' style='width: 180px' name='tdouble' id='td"+k+"'>检尺径<span></span>"
          +"<input type='text' style='width: 180px' name='tradius' id='tr"+k+"'>根数<span></span><input type='text' style='width: 180px' name='num' id='n"+k+"'>"
             +"材积(m^3、T、根)<span></span><input type='text' style='width: 180px' name='tvolume' id='tv"+k+"' onclick='vvvolume("+k+")'></td></tr>";
             k=Number(k)+Number(1);
            $("#ttt5").append(str);             
}

function inputNull(form){
	for(i=0;i<form.length;i++){
            //form属性的elements的首字母e要小写
		if(form.elements[i].value == ""){ 
			alert("" + form.elements[i].placeholder + "不能为空");
			form.elements[i].focus();	
			return false;
		}
	}
	}
function vvvolume(id)
{
	var td=$("#td"+id+"").val();
	var tr=$("#tr"+id+"").val();
	var num=$("#n"+id+"").val();
	if(num!="" && td!="" && tr!="")
	{
	$.ajax({
        url:"treeServlet",
        data:{
            "action":"volume",
            "td":td,
            "tr":tr 
        },
        type: "POST",
        dataType:"html",
        success: function (data) {
        	document.getElementById("tv"+id+"").value=Number(data*num);
        }
    })}
	}

</script>
</head>
<body>
<main>
<!-- 下拉框代码 -->
				


</main>
<script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
<script src="js/bstable/js/bootstrap.min.js"></script>
<script src="js/bstable/js/bootstrap-table.js"></script>
<script src="js/bstable/js/bootstrap-table-zh-CN.min.js"></script>
</head>

<body>
<%workpage c=(workpage)request.getAttribute("workid");
List<tree> t=null;
t=(List<tree>)request.getAttribute("tree");
%>


<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">管理部门平台导航</a></h1>
</div>
<!--close-Header-part--> 
<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">欢迎使用者</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i> 我的个人资料 </a></li>
        <li class="divider"></li>
        <li><a href="#"><i class="icon-check"></i> 我的任务</a></li>
        <li class="divider"></li>
        <li><a href="login.jsp"><i class="icon-key"></i> 注销</a></li>
      </ul>
    </li>
    <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">消息</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> 系的消息</a></li>
        <li class="divider"></li>
        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> 收件箱</a></li>
        <li class="divider"></li>
        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> 发件箱</a></li>
        <li class="divider"></li>
        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> 垃圾箱</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">设置</span></a></li>
    <li class=""><a title="" href="login.jsp"><i class="icon icon-share-alt"></i> <span class="text">注销</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->
<!--start-top-serch-->
<div id="search">
  <input type="text" placeholder="Search here..."/>
  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-serch-->
<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> 仪表盘</a>
  <ul>
  </ul>
</div>


<!--sidebar-menu-->
<div id="content">
<div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> 首页</a></div>
  </div>
<!--End-breadcrumbs-->

<main>
    <div class="home-tab"><i class="tab-i"></i> 所在位置：<span>木材收购单</span></div>
    <div class="find-top">
        <p class="p-tail"><i
         class="i-tail"></i> 该页面主要是木材收购单</p>
    </div>
    <div class="find-top1">
    <form onSubmit="return inputNull(this)" action="1" method="POST">
    <div class="top" id="divprint">
    
    <table class="table1"  >
    <caption class="book_h01">木材收购单</caption>
				<tr>
				    <td  >发货单位</td>
					<td><input type="text" name="fahuodanwei" id="fahuodanwei" ></td>
					<td  >工单号</td>
					<td><input  type="text" name="workid" id="workid" maxlength="32" readonly value="<fmt:formatNumber value="<%=c.getWorkid()%>" pattern="#0.##"/>"></td>
					<td >采伐证号</td>
					<td><input type="text" name="cutNum" id="cutNum" value="<%=c.getCutNum()%>"></td>

					  </tr>
					  <tr>
					<td>收货单位</td>
					<td><input type="text" name="shouhuodanwei" id="shouhuodanwei" ></td>
			
				   <td >时间</td>
		    		<td><input type="text" name="cutdate" id="cutdate" value="<%=c.getCutdate()%>"></td>
				   <td >采伐地点</td>
				   <td><input type="text" name="cutsite" id="cutsite" value="<%=c.getCutSite()%>"></td>
			   </tr>
			   </table>
				
			<p class="table_p"><span>树材信息</span></p>
			<table  border="1" class="table2" id="table5" style="width:1500px;height:auto">
                           <tbody id="ttt5">
                                <% int i=1;%>
                                <c:forEach items="${tree}" var="b">      
                            <tr id="<%=i%>" display:block>
                            <td style='font-size:20px;'>
                           <input type="checkbox" style='width:20px;height:20px;' value="<%=i%>">树材种<span></span>
                           <select style="width: 180px" name="treetype" id="sss<%=i%>">
                           <option value='杉原木' <c:if test="${b.getTreetype()eq'杉原木'}">selected='selected'</c:if> >--杉原木--</option>
                           <option value='杉小径' <c:if test="${b.getTreetype()eq'杉小径'}">selected='selected'</c:if> >--杉小径--</option>
                           <option value='松原木' <c:if test="${b.getTreetype()eq'松原木'}">selected='selected'</c:if> >--松原木--</option>
                           <option value='松小径' <c:if test="${b.getTreetype()eq'松小径'}">selected='selected'</c:if> >--松小径--</option>
                           <option value='杂原木' <c:if test="${b.getTreetype()eq'杂原木'}">selected='selected'</c:if> >--杂原木--</option>
                           <option value='杂小径' <c:if test="${b.getTreetype()eq'杂小径'}">selected='selected'</c:if> >--杂小径--</option>
                            </select>                     
                                                                                            检尺长(m)<input type='text' style='width: 180px' name='tdouble' id='td<%=i%>' value="${b.getTlong()}">
                                                                                            检尺径<span></span><input type='text' style='width: 180px' name='tradius' id='tr<%=i%>' value="${b.getTradius()}">
                                                                                            根数<span></span><input type='text' style='width: 180px' name='num' id='n<%=i%>' value="${b.getNum()}">
                                                                                            材积(m^3、T、根)<span></span><input type='text' style='width: 180px' name='tvolume' id='tv<%=i%>' value="${b.getTvolume()}"></td></tr>
                         <%i++; %>
                         </c:forEach>
                        
          </tbody>
       </table>
    <br>
    <br>
    </div>
          <div style=text-align:center; >
               
                 <span class="but_p" >
                <button style="width:150px;height:50px" class="but_save"  type="button" id="btnPrint" value="打印">打印</button>
                  </span>
                  <div style="clear: both;padding-bottom: 40px"></div>
                </div>
                
                
    </form> 

    </div>
<!-- 显示最近添加的员工 -->
    <div class="table-con">
        <table id="table1" class="table-style"></table>
    </div>

</main>
</div>
<script src="js/jquery.js"></script>
<script src="js/bstable/js/bootstrap.min.js"></script>
<script src="js/bstable/js/bootstrap-table.js"></script>
<script src="js/bstable/js/bootstrap-table-zh-CN.min.js"></script>
<script src="js/excanvas.min.js"></script> 
<script src="js/jquery.min.js"></script> 
<script src="js/jquery.ui.custom.js"></script> 
<script src="js/bootstrap.min.js"></script> 
<script src="js/jquery.flot.min.js"></script> 
<script src="js/jquery.flot.resize.min.js"></script> 
<script src="js/jquery.peity.min.js"></script> 
<script src="js/fullcalendar.min.js"></script> 
<script src="js/matrix.js"></script> 
<script src="js/matrix.dashboard.js"></script> 
<script src="js/jquery.gritter.min.js"></script> 
<script src="js/matrix.interface.js"></script> 
<script src="js/matrix.chat.js"></script> 
<script src="js/jquery.validate.js"></script> 
<script src="js/matrix.form_validation.js"></script> 
<script src="js/jquery.wizard.js"></script> 
<script src="js/jquery.uniform.js"></script> 
<script src="js/select2.min.js"></script> 
<script src="js/matrix.popover.js"></script> 
<script src="js/jquery.dataTables.min.js"></script> 
<script src="js/matrix.tables.js"></script> 
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/jQuery.print.js"></script>
<script src="js/jquery.PrintArea.js" type="text/JavaScript"></script>
<script type="text/javascript">
function goPage (newURL) {

    // if url is empty, skip the menu dividers and reset the menu selection to default
    if (newURL != "") {
    
        // if url is "-", it is this page -- reset the menu:
        if (newURL == "-" ) {
            resetMenu();            
        } 
        // else, send page to designated URL            
        else {  
          document.location.href = newURL;
        }
    }
}

$(function(){
    $("#btnPrint").click(function(){ $("#divprint").printArea(); });
});
</script>
</body>
</html>