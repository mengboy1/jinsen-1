<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jinshen.bean.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.sql.Statement"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.Connection"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>输入采伐证材料</title>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt" %>
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
.table1 {
	width: 80%;
	height: 400px;
	margin-left: auto;
	margin-right: auto;
	padding: 10px;
	border-collapse: collapse
}

td, th {
	text-align: center;
	vertical-align: middle
}

tr {
	text-align: center
}

.p-tail {
	padding: 10px;
	font-size: 16px;
	color: #8a6d3b;
}

.i-tail {
	width: 14px;
	height: 11px;
	position: relative;
	display: inline-block;
	background-image: url(../img/listicon.jpg);
	top: 1px;
}

	#a{
	text-align: right;
	}
	.biao{
	margin:auto;
	}
	#b{
	text-align:left;
	}
</style>
<script type="text/javascript">
	function inputNull(form) {
		for (i = 0; i < form.length; i++) {
			//form属性的elements的首字母e要小写
			if (form.elements[i].value == "") {
				alert("" + form.elements[i].placeholder + "不能为空");
				form.elements[i].focus();
				return false;
			}
		}
	}
</script>
</head>
<body>
<%cutnum c = (cutnum) request.getAttribute("cutnum");%>
<%
   String cutnumfile = request.getParameter("cutnumfile");
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
    <li ><a href="cutnumApplyseeAassis.jsp"><i class="icon icon-home"></i> <span>审核采伐证申请</span></a> </li>
    <li> <a href="manageCutnumAssis.jsp"><i class="icon icon-inbox"></i> <span>录入采伐证材料</span></a></li>
    <li> <a href="manageCutnumseeAssis.jsp"><i class="icon icon-th"></i> <span>查看采伐证材料</span></a></li>
    <li> <a href="cutnumTableAssis.jsp"><i class="icon icon-th-list"></i> <span>采伐证报表</span></a></li>
    <li> <a href="manageCutnumshenhe.jsp"><i class="icon icon-th-list"></i> <span>审核采伐证材料</span></a></li>
  </ul>
</div>
<!--sidebar-menu-->

<div id="content">
<div id="content-header">
    <div id="breadcrumb"> <a href="managerP.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->
	
	<main>

		<div class="home-tab">
			<i class="tab-i"></i> 所在位置：<span>采伐证材料</span>
		</div>
		<div class="find-top">
			<p class="p-tail">
				<i class="i-tail"></i> 该页面主要是管理部门查看采伐证材料
			</p>
		</div>
		<div class="find-top1">
			<form onSubmit="return inputNull(this)"
				action="cutnumServlet?action=cutnumUpdate" method="POST">
				<div class="top" id="divprint">
					<table class="biao">
						<caption class="book_h01">采伐证材料</caption>
						<tr>
							<td id="a">采伐证号</td>
							<td id="b"><input type="text" name="cutnum" id="cutnum"
								value="<%=c.getCutnum()%>"></td>
							<td id="a">采伐证编号</td>
							<td id="b"><input type=text name="certificatenum"
								id="certificatenum" value="<%=c.getCertificatenum()%>"></td>
						</tr>
						<tr>
							<td id="a">编号</td>
							<td id="b"><input name="numbern" type="text" maxlength="32" id="numbern" readonly value="<fmt:formatNumber value="<%=c.getNumber()%>" pattern="#0.##"/>" /></td>
							<td id="a">采伐公司</td>
							<td id="b"><input type="text" name="company" id="company"
								value="<%=c.getCompany()%>"></td>
						</tr>
						<tr>
							<td id="a">采伐地点</td>
							<td id="b"><input type="text" name="cutsite" id="cutsite"
								value="<%=c.getcutsite()%>"></td>
							<td id="a">采伐四至</td>
							<td id="b"><input type="text" name="sizhi" id="sizhi"
								value="<%=c.getSizhi()%>"></td>
						</tr>

						<tr>
						<td id="a">GPS定位:</td>
						<td id="b"><input style="width:204%;" type="text" name="gpsinfo" id="gpsinfo" value="<%=c.getGpsinfo()%>">


						<tr>
							<td id="a">林分起源</td>
							<td id="b"><input type="text" name="treeorigin" id="treeorigin"
								value="<%=c.getTreeorigin()%>"></td>
							<td id="a">林种</td>
							<td id="b"><input type="text" name="foresttype" id="foresttype"
								value="<%=c.getforesttype()%>"></td>
						</tr>

						<tr>
							<td id="a">树种</td>
							<td id="b"><input type="text" name="treetype" id="treetype"
								value="<%=c.getTreetype()%>"></td>
							<td id="a">权属</td>
							<td id="b"><input type="text" name="ownership" id="ownership"
								value="<%=c.getOwnership()%>"></td>
						</tr>

						<tr>
							<td id="a">林权证号</td>
							<td id="b"><input type="text" name="forestid" id="forestid"
								value="<%=c.getForestid()%>"></td>
							<td id="a">采伐类型</td>
							<td id="b"><input type="text" name="cuttype" id="cuttype"
								value="<%=c.getcuttype()%>"></td>
						</tr>

						<tr>
							<td id="a">采伐方式</td>
							<td id="b"><input type="text" name="cutmethod" id="cutmethod"
								value="<%=c.getcutmethod()%>"></td>
							<td id="a">采伐强度</td>
							<td id="b"><input type="text" name="cutqiang" id="cutqiang"
								value="<%=c.getcutqiang()%>"></td>
						</tr>

						<tr>
							<td id="a">采伐面积</td>
							<td id="b"><input type="text" name="cutarea" id="cutarea"
								value="<%=c.getcutarea()%>"></td>
							<td id="a">株数</td>
							<td id="b"><input type="text" name="treenum" id="treenum"
								value="<%=c.gettreenum()%>"></td>
						</tr>

						<tr>
							<td id="a">采伐蓄积</td>
							<td id="b"><input type="text" name="cutstore" id="cutstore"
								value="<%=c.getcutstore()%>"></td>
							<td id="a">出材量</td>
							<td id="b"><input type="text" name="volume" id="volume"
								value="<%=c.getvolume()%>"></td>
						</tr>
						<tr>
							<td id="a">采伐开始时间</td>
							<td id="b"><input type="date" name="starttime" id="starttime"
								value="<%=c.getStarttime()%>"></td>
							<td id="a">采伐截止时间</td>
							<td id="b"><input type="date" name="endtime" id="endtime"
								value="<%=c.getEndtime()%>"></td>
						</tr>
						<tr>
							<td id="a">领证人</td>
							<td id="b"><input type="text" name="certifier" id="certifier"
								value="<%=c.getCertifier()%>"></td>
							<td id="a">更新期限</td>
							<td id="b"><input type="date" name="updatedate" id="updatedate"
								value="<%=c.getUpdatedate()%>"></td>
						</tr>
						<tr>
							<td id="a">更新面积</td>
							<td id="b"><input type="text" name="updatevolume" id="updatevolume"
								value="<%=c.getUpdatevolume()%>"></td>
							<td id="a">株树</td>
							<td id="b"><input type="text" name="updatenum" id="updatenum"
								value="<%=c.getUpdatenum()%>"></td>
						</tr>
						<tr>
							<td id="a">上传文件</td>
							<td>${cutnumfile}<a href="DownfileServlet?action=cutnumfile&filename=<%=c.getCutnumfile() %>">下载</a></td>
						</tr>
					</table>
				</div>
				<div class=" but_p" style="float: center;">
					<button class="but_save" type="button" id="btnPrint" value="打印">打印</button>
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
		$(function() {
			$("#btnPrint").click(function() {
				$("#divprint").printArea();
			});
		});
	</script>
</body>
</html>