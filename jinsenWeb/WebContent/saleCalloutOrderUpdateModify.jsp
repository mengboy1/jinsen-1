<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jinshen.bean.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
   <title>修改被退回的调令</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="css/jquery.gritter.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<link type="text/css" rel="stylesheet" href="css/PrintArea.css" />
   <style>
    body,td,th {font-family: Verdana, Arial, Helvetica, sans-serif;font-size: 18px;color: #1d1007; line-height:24px}
    </style>
    <link href="css/registe.css" rel="stylesheet" type="text/css">
    <style type="text/css">
        .table_p{line-height: 28px;border-bottom: 1px #d0e6ec solid;position: relative;margin-bottom: 10px; 
            margin-top: 35px; margin-left:10px}
        .table_p span{border-bottom: 3px #42cdec solid;display: inline-block;position: absolute;bottom: -1px;font-weight: bold;font-size: 20px}
        .but_p button{width: 80px}
        #h li{float: left; }
#h a{font-size:15px;width: 230px; height: 30px;padding: 10px 0;text-align: center;  background: #3c763d; display: block; text-decoration:none; color:white}
#h a:hover{color:white;background: green}
.table1{margin-left:auto; margin-right:auto;padding:10px;border-collapse:collapse}
.table2{margin-left:auto; margin-right:auto;padding:10px;border-collapse:collapse}
.p-tail {
    padding: 10px;
    font-size: 12px;
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
</style>
<script type="text/javascript">
var k=100;
$(function(){
	aaad();
})
function aaad()
{
 	var str="<tr id="+k+" display:block;><td style='font-size:20px;'><input type='checkbox' style='width:20px;height:20px;' value="+k+">树材种<span></span>"
          +"<select style='width: 180px' name='treetype' id='sss"+k+"'>"
           +"<option>--请选择--</option>"
          +"<option value='杉木'>--杉木--</option>"
          +"<option value='松木'>--松木--</option>"
          +"<option value='杂木'>--杂木--</option>"
          +"<option value='杉薪'>--杉薪--</option>"
          +"<option value='松薪'>--松薪--</option>"
          +"<option value='杂薪'>--杂薪--</option>"
          +"<option value='杉松杂混装'>--杉松杂混装--</option>"
          +"<option value='其他'>--其他--</option></select>"
        +"长度(米)<span></span><select style='width: 180px' name='tlong' id='tl"+k+"'>"
        +"<option>--请选择--</option>"
        +"<option value='1'>1</option>"
        +"<option value='2'>2</option>"
        +"<option value='3'>3</option>"
        +"<option value='2-4'>2-4</option></select>"
        +"口径(厘米)<span></span><select style='width: 180px' name='tradius' id='tr"+k+"'>"
        +"<option>--请选择--</option>"
        +"<option value='3-7'>3-7</option>"
        +"<option value='7以下'>7以下</option>"
        +"<option value='8-9'>8-9</option>"
        +"<option value='10-12'>10-12</option>"
        +"<option value='14-18'>14-18</option>"
        +"<option value='20以上'>20以上</option>"
        +"<option value='20-26'>20-26</option>"
        +"<option value='20-28'>20-28</option>"
        +"<option value='28以上'>28以上</option>"
        +"<option value='20-28'>30以上</option></select>"
          +"调运数量<span></span><input type='text' style='width: 180px' name='tnum' id='tn"+k+"'></td></tr>";
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
	function treeAdd()
	{
		var map={};
		var kk=Number(0),ki=Number(0);
		var saleCalloutOrder=$("#saleCalloutOrder").val();
		var contractnum=$("#contractnum").val();
		var yard=$("#yard").val();
		var demander=$("#demander").val();
		var Paymentnum=$("#Paymentnum").val();
		var Paymentamount=$("#Paymentamount").val();
		var totalnum=$("#totalnum").val();
		var Signer=$("#Signer").val();
		//var cutnum=document.getElementById("cutnum").value;
		if(contractnum=="")
			{
			alert("请先输入合同编号！");
			}
		else{
	    $("input[type='checkbox']:checked").each(function(i){
	    	var group=[];
	    	var id=$(this).val();
	    	alert(id);
	    	    group[0]=document.getElementById("sss"+id+"").value;
	    	    group[1]=document.getElementById("tl"+id+"").value;
	    	    group[2]=document.getElementById("tr"+id+"").value;
	    	    group[3]=document.getElementById("tn"+id+"").value;
	    	    //System.out.println("...." + group[4] + "...");
	    	    if(group[0]==""|| group[1]==""|| group[2]=="" || group[3]=="")
	    	    	{
	    	    	alert("请将信息填写完整！");
	    	    	}
	    	      else{
	               map[i]=group;
	               kk=Number(i)+Number(1);
	    	    }
	    });
	    $("input[type='checkbox']:not(:checked)").each(function(j){
	    	var group=[];
	    	var id=$(this).val();
	    	    group[0]=document.getElementById("sss"+id+"").value;
	    	    group[1]=document.getElementById("tl"+id+"").value;
	    	    group[2]=document.getElementById("tr"+id+"").value;
	    	    group[3]=document.getElementById("tn"+id+"").value;
	    	    if(group[0]=="" || group[1]=="" ||group[2]=="")
		    	{
		    	alert("请将信息填写完整！");
		    	}
		        else{ 
	        map[kk+j]=group;
	        ki=Number(j)+Number(1);
		    }
	    }); 
	    var mymap=JSON.stringify(map);
	    $.ajax({
	        url:"salaryServlet",
	        data:{
	            "action":"updatesaleCallout",
	            "newtree":mymap,
	            "id":ki+kk,
	            "contractnum":contractnum,
	            "saleCalloutOrder":saleCalloutOrder,
	            "demander":demander,
	            "yard":yard,
	            "Paymentnum":Paymentnum,
	            "Paymentamount":Paymentamount,
	            "Signer":Signer,
	            "totalnum":totalnum
	        },
	        type: "POST",
	        dataType:"html",
	        success: function (data) {
	        	//alert(data);
	        	if(data>0)
	        		{
	        	        alert("更新成功！");
	        		}
	        	else{
	        		 alert("更新失败");
	        	}
	        }
	    })
	    }
	}
	function dddelete()
	{
		var ck= $("input[type='checkbox']:checked");
		for (var i=0;i<ck.length;i++)
			{
			     var j=$(ck[i]).val();
			     alert(j);
			     $("#"+j+"").empty();
			}
	}
	function deleteAll()
	{
		var mk=$("input[type='checkbox']:checked");
		var index=$("input[type='checkbox']:not(:checked)");
		for (var i=0;i<mk.length;i++)
	    {
		    var h=$(mk[i]).val();
		    
		     $("#"+h+"").empty();
		}
	   for (var a=0;a<index.length;a++)
		{
		    var hh=$(index[a]).val();
		    $("#"+hh+"").empty();
		}
	}
	function makecount()
	{
		var mk=$("input[type='checkbox']:checked");
		var index=$("input[type='checkbox']:not(:checked)");
		var totalt=Number(0);
		var totalst=Number(0);
		var total=Number(0);
		var tot=Number(0);
		//System.out.println("...." + mk + "...");
		for (var i=0;i<mk.length;i++)
	    {
		     var h=$(mk[i]).val();
		     totalst+=Number(document.getElementById("tn"+h+"").value);
			 //totalt+=Number(document.getElementById("n"+h+"").value);
		}
	   for (var a=0;a<index.length;a++)
		{
		    var hk=$(index[a]).val();
		    total+=Number(document.getElementById("tn"+hk+"").value);
		    //tot+=Number(document.getElementById("n"+hk+"").value);
		}
	   //document.getElementById("toltree").value=Number(totalt+tot);
	   document.getElementById("totalnum").value=Number(totalst+total);
	}
</script>
</head>
<body>
<% saleCalloutOrder s=(saleCalloutOrder)request.getAttribute("saleCalloutOrder"); 
List<saleCalloutOrder> b=null;
b=(List<saleCalloutOrder>)request.getAttribute("saleOrdertree");
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
    <li><a href="saleCalloutOrder.jsp"><i class="icon icon-home"></i><span>录入销售调令</span></a>
    <li> <a href="saleCalloutOrdersee.jsp"><i class="icon icon-th-list"></i> <span>查看调令材料</span></a></li>
    <li> <a href="saleCalloutOrderShenheModer.jsp"><i class="icon icon-th-list"></i> <span>查看调令审核</span></a></li>
  </ul>
</div>
<!--sidebar-menu-->

<div id="content">
<div id="content-header">
    <div id="breadcrumb"> <a href="managerP.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a></div>
  </div>
<!--End-breadcrumbs-->
<main>
    <div class="find-top">
        <p class="p-tail"><i
         class="i-tail"></i> 该页面主要是销售部门修改销售调令页面</p>
    </div>
    <div class="find-top1">
    <div class="top" id="divprint">
    <table style="margin-left:auto; margin-right:auto">
    <caption class="book_h01">木材销售调令</caption>
    <tbody>
       <tr>
       <td>调令号</td><td><input type="text" name="saleCalloutOrder" id="saleCalloutOrder" value="<%=s.getSaleCalloutOrder() %>"></td>
       <td>合同编号</td><td><input type="text" name="contractnum" id="contractnum" value="<%=s.getContractnum() %>"></td>
       <td>货场地点</td><td><input type="text" name="yard" id="yard" value="<%=s.getYard() %>"></td>
       </tr>
       <tr>
       <td>终端购货人</td><td><input type="text" name="demander" id="demander" value="<%=s.getDemander() %>"></td>
        <td>货款票据号</td><td><input type="text" name="Paymentnum" id="Paymentnum" value="<%=s.getPaymentnum() %>"></td> 
        <td>货款金额</td><td><input type="text" name="Paymentamount" id="Paymentamount" value="<%=s.getPaymentamount() %>"></td> 
       </tr>
       </tbody>
    </table>
    <p class="table_p"><span>树材信息录入</span></p>
    <table id="table5" style="width:1500px;height:auto;margin-left:auto; margin-right:auto;padding:10px;border-collapse:collapse">
     <tbody id="ttt5">
      <% int i=1;%>
        <c:forEach items="${saleOrdertree}" var="b">      
     <tr id="<%=i%>" display:block;><td style='font-size:20px;'>
           <input type="checkbox" style='width:20px;height:20px;' value="<%=i%>">树材种<span></span>
           <select style="width: 180px" name="treetype" id="sss<%=i%>">
           <option value='杉木' <c:if test="${b.getTreetype()eq'杉木'}">selected='selected'</c:if> >--杉木--</option>
           <option value='松木' <c:if test="${b.getTreetype()eq'松木'}">selected='selected'</c:if> >--松木--</option>
           <option value='杂木' <c:if test="${b.getTreetype()eq'杂木'}">selected='selected'</c:if> >--杂木--</option>
           <option value='杉薪' <c:if test="${b.getTreetype()eq'杉薪'}">selected='selected'</c:if> >--杉薪--</option>
           <option value='松薪' <c:if test="${b.getTreetype()eq'松薪'}">selected='selected'</c:if> >--松薪--</option>
           <option value='杂薪' <c:if test="${b.getTreetype()eq'杂薪'}">selected='selected'</c:if> >--杂薪--</option>
           <option value='杉松杂混装' <c:if test="${b.getTreetype()eq'杉松杂混装'}">selected='selected'</c:if> >--杉松杂混装--</option>
           <option value='其他' <c:if test="${b.getTreetype()eq'其他'}">selected='selected'</c:if> >--其他--</option>
           </select>                     
                                  长度(米)<input type='text' style='width: 180px' name='tlong' id='tl<%=i%>' value="${b.getTlong()}">
                                  口径(厘米)<span></span><input type='text' style='width: 180px' name='tradius' id='tr<%=i%>' value="${b.getTradius()}">
                                调运数量<span></span><input type='text' style='width: 180px' name='tnum' id='tn<%=i%>' value="${b.getTnum()}"></td></tr>
          <%i++; %>
           </c:forEach>
            </tbody>
            </table> 
            <table class="table">
      <tbody>
           <tr>
           <div style="float:left;"><button class="btn btn-warning" type="button"  onclick="aaad()" value="添加">添加</button>
           <button class="btn btn-default" type="button"  onclick="dddelete()" value="删除">删除</button>
          <button class="btn btn-default" type="button"  onclick="deleteAll()" value="清空">清空</button>
          </div>
            </tr>
        </tbody>
      </table>
      <table style="margin-left:auto; margin-right:auto">
      <tr>
      <td>合计数量</td><td><input type="text" name="totalnum" id="totalnum" onclick="makecount()" value="<%=s.getTotalnum() %>"></td>
      <td>通知签发人</td><td><input type="text" name="Signer" id="Signer" value="<%=s.getSigner() %>"></td>
      </tr>
      </table>
    </div>
    <div class=" but_p" style="float:center;">
     <button style="width:150px;height:50px" class="but_save" type="button"  onclick="treeAdd()" value="更新调令">更新调令</button>
     <button style="width:150px;height:50px" class="but_save" type="button"  id="btnPrint" value="打印">打印</button></div>
    </div>

</main>
</div>
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
$(function(){
    $("#btnPrint").click(function(){ $("#divprint").printArea(); });
});
</script>
</body>
</html>