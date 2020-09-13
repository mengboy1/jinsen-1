<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<title>工单录入界面</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Custom CSS -->
<link rel="stylesheet" href="css/registe.css"/>
<link rel="stylesheet" href="css/bootstrap.min.css" />
<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="css/fullcalendar.css" />
<link rel="stylesheet" href="css/matrix-style.css" />
<link rel="stylesheet" href="css/matrix-media.css" />
<link href="font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" href="css/jquery.gritter.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
<link type="text/css" rel="stylesheet" href="css/PrintArea.css" />
<script src="js/jquery.js" type="text/javascript"></script>
<style type="text/css">
.table_p{line-height: 28px;border-bottom: 1px #d0e6ec solid;position: relative;margin-bottom: 10px; 
            margin-top: 35px; margin-left:10px}
.table_p span{border-bottom: 3px #42cdec solid;display: inline-block;position: absolute;bottom: -1px;font-weight: bold;font-size: 20px}
.but_p button{width: 80px}
#h li{float: left; }
#h a{font-size:15px;width: 230px; height: 30px;padding: 10px 0;text-align: center;  background: #3c763d; display: block; text-decoration:none; color:white}
#h a:hover{color:white;background: green}
         
input{margin-top:5px;margin-bottom:-2px;}
         
.table1{width:80%; height:auto;margin-left:auto; margin-right:auto;padding:10px;border-collapse:collapse}
td,th{text-align:center;vertical-align:middle}
tr{text-align:center}
	.btn{ 	
	font-family: "'微软雅黑','Helvetica Neue',Helvetica,Arial,sans-serif"; 	
	font-size: 13px!important; 	height: 30px; 	
	line-height: 18px!important; 	
	padding: 3px 18px; 	
	display: inline-block; 	vertical-align: middle; 	
	font-weight: normal; 	border-radius: 3px; 	
	margin: 0 8px 0 3px; 	
	border: 1px solid #3383da; 	
	color: #ffffff; 	
	background-color: #3383da; 	
	cursor: pointer; 
	}
</style>

<script type="text/javascript">
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
</script>
<script type="text/javascript">
    function funworkid(){
    	var _name=document.getElementById('cccutnum').value;
    	 var workid = document.getElementById('wworkid');
         var name=_name.substring(5,9);
    	    var date = new Date();
    	    var year = date.getFullYear();
    	    var month = date.getMonth() + 1;
    	    var strDate = date.getDate();
            var day=date.getDate();
            var hour=date.getHours();
            var mini=date.getMinutes();
            var second=date.getSeconds();
    	    var seperator = "/";
    	    if (month >= 1 && month <= 9) {
    	        month = "0" + month;
    	    }
    	    if (strDate >= 0 && strDate <= 9) {
    	        strDate = "0" + strDate;
    	    }
    	     var currentDate = name + month + strDate + hour + mini + second; //当前日期
    	     workid.value = currentDate; //赋值给input.value
    	     //workid.setAttribute('disabled', 'disabled'); //不可编辑
    }
    </script>
    <script type="text/javascript">

function mycreate()
{
	//var length=$("#codetable tr").length;
	var cutnum=document.getElementById("cccutnum").value;
	length=(length-1)*2;
	var group=[];
	$.ajax({
        url:"workpageSevrlet",
        data:{
            "action":"searchWorkpageCut",
            "cutnum":cutnum
        },
        type: "POST",
        dataType:"json",
        success: function (data) {
        	if(data==null)
        		{
        		alert("您所需要输入的采伐证信息有误，请重新核对");
        		}
        	else{
        	var cutnum=data["cutnum"];
        	//var Cutarea=data["Cutarea"];
        	//alert(cutnum)
        	var projectpackage=data["projectpackage"];
        	alert(projectpackage)
        	var company=null;
        	var cutSite=null;
        	for(var i=0;i<cutnum.length;i++)
    		{
        		var j=cutnum[i];
        		company=j.company;
        		cutaddress=j.cutaddress;
        		cutvillage=j.cutvillage;
        		quartel=j.quartel;
        		largeblock=j.largeblock;
        		smallblock=j.smallblock;
        		
    		}
        	for(var i=0;i<projectpackage.length;i++)
    		{
        		var j1=projectpackage[i];
        		contractNum=j1.contractNum;
        		projectPackageid=j1.projectPackageid;
        		contractionSide=j1.contractionSide;
        		//quartel=j.quartel;
        		//largeblock=j.largeblock;
        		//smallblock=j.smallblock;
        		
    		}
        	document.getElementById("company").value=company;
        	document.getElementById("cutaddress").value=cutaddress;
        	document.getElementById("cutvillage").value=company;
        	document.getElementById("quartel").value=cutaddress;
        	document.getElementById("largeblock").value=company;
        	document.getElementById("smallblock").value=cutaddress;
        	document.getElementById("contractNum").value=contractNum;
        	document.getElementById("projectPackageid").value=projectPackageid;
        	document.getElementById("contractionSide").value=contractionSide;
        	
        }}
    })
}
window.onload = function () {
    locationInput = function () {
    };
}
</script>
</head>
<body>
<% Date d = new Date();

SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

String now = df.format(d); %>
<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">产销部门平台</a></h1>
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

<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> 仪表盘</a>
  <ul>
  <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>施工方管理</span> <span class="label label-important">2</span></a>
     <ul>
        <li><a href="managesdatecard.jsp">录入施工方资料</a></li>
        <li><a href="managersdatecardSee.jsp">施工方台账</a></li>
      </ul>
     </li>
     <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>工程包管理</span> <span class="label label-important">3</span></a>
     <ul>
        <li><a href="CutnumProjectpackage.jsp">创建工程包</a></li>
        <li><a href="cutareaAllot.jsp">伐区拨交</a></li>
      </ul>
     </li>
     <li><a href="treeinYezhang.jsp"><i class="icon icon-inbox"></i> <span>打印检尺野帐</span></a> </li>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>工单管理</span> <span class="label label-important">2</span></a>
       <ul>
        <li><a href="workpageAdd.jsp">输入工单</a></li>
        <li><a href="workpageShenheFaqu.jsp">审核工单</a></li>
      </ul>
     </li>
    <li> <a href="manageCutnumCheck.jsp"><i class="icon icon-inbox"></i> <span>生产管理</span></a> </li>
    <li><a href="productPrice.jsp"><i class="icon icon-th"></i> <span>生产结算</span></a></li>   
  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content">
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="forestP.jsp" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a></div>
  </div>
<!--End-breadcrumbs-->
<article>
        <div>
    <form  onSubmit="return inputNull(this)" action="workpageSevrlet?action=addWorkpage1" method="POST" >
                <div class="top" id="divprint">

                <div class="top_out">
                   <table class="table1"  border="1">
                  <caption class="book_h01">木材检验野账</caption>
                  <tr>
                  <td style="width:200px">工单号</td>
                  <td colspan="7" style="text-align:left;vertical-align:left">
                       <input style="width:200px;border:0px;" type="text" name="workid" id="wworkid" onclick="funworkid()" >
                  </td>
                  </tr>
                    <tr>
                     <td style="width:400px">发货单位：</td>
    	            <td><input type='text' style="border:0px;background-color: transparent;width:20%" id='company' readonly="readonly" ></td>
        			<td style="width:200px">合同号：</td>
        	        <td><input type='text' style="border:0px;background-color: transparent;" id='contractNum'  readonly="readonly"></td>
        	        <td style="width:50px">工程包：</td>
                    <td><input type='text' style="border:0px;background-color: transparent;" id='projectPackageid'  readonly="readonly"></td>
                    <td style="width:200px">施工方：</td>
                    <td><input type='text' id='contractionSide' style="border:0px;background-color: transparent;" readonly="readonly"></td></tr>
                    <tr>
                    <td style="width:200px">收货单位：</td>
    	            <td><input type='text' style="border:0px;background-color: transparent;width:200px;" value='将乐县金森贸易有限公司' readonly="readonly"></td>
        			<td style="width:200px">检验地点（货场）：</td>
        	        <td><input type='text' id='yard' name='yard' value=''></td>
        	        <td style="width:100px">分区：</td>
                    <td><input type='text' id='section' style="border:0px;background-color: transparent;" readonly="readonly"></td>
                    <td class='top-table-label'>运输起讫：</td>
                    <td><input type='text' id='cutSite' style="border:0px;background-color: transparent;" readonly="readonly"></td></tr>
                    <tr>
					<td colspan="1">有效时间</td>
					<td colspan="2"><input style="border:0px;background-color: transparent;font-size:20px;text-align:center" readonly="readonly" type="text" name="cutdate" id="ccutdate" value="<%=now%>"/></td>
					<td>车号</td>
					<td><input style="font-size:20px;text-align:center; width:100px;" type="text" id="carnumber" name="carnumber "  value="" /></td>
					<td>调令通知单</td>
					<td colspan="2"><input style="border:0px;background-color: transparent;font-size:20px;text-align:center" type="text" id="" name="" value="" /></td>
				  </tr>
				  <tr>
					<td>采伐证号</td>
					<td><input style="width:80%;border:0px;" type="text" name="cutnum" id="cccutnum" oninput='mycreate()' onclick='locationInput'/></td>
					<td colspan="6">乡镇:<input style="border:0px;background-color: transparent;font-size:20px;text-align:center" type="text" id="cutaddress" name="cutaddress" />
					村:<input type="text" style="border:0px;background-color: transparent;font-size:20px;text-align:center" name="cutvillage" id="cutvillage" />
					林班:<input type="text" style="border:0px;background-color: transparent;font-size:20px;text-align:center" name="quartel" id="quartel"/>
					大班:<input type="text" style="border:0px;background-color: transparent;font-size:20px;text-align:center" name="largeblock" id="largeblock"/>
					小班:<input type="text" style="border:0px;background-color: transparent;font-size:20px;text-align:center" readonly="readonly" name="smallblock" id="smallblock"  /></td>
					
				</tr>
                     <%--  <tr>
                           <th colspan="2">采伐证号</th>
                           <th colspan="2">工单号</th>
                          <th colspan="2">时间</th>
                           </tr>
                           <tr>
                           <td colspan="2">
                             <input style="width:80%;border:0px;" type="text" name="cutnum" id="cccutnum" oninput='mycreate()' onclick='locationInput'>
                           </td>
                           <td colspan="2">
                              <input style="width:80%;border:0px;" type="text" name="workid" id="wworkid" onclick="funworkid()" >
                           </td>
                           <td colspan="2">
                              <input  type="text" name="cutdate" id="ccutdate" value="<%=now%>">
                           </td>
                           </tr>
                           <tr>
                            <th colspan="2">采伐地点</th>
                            <th colspan="2">货场地点</th>
                            <th colspan="2">车牌号</th>                          
                           </tr>
                           <tr>
                           <td colspan="2">
                              <input style="width:80%;border:0px;" type="text" name="cutsite" id="ccutsite ">
                           </td>
                           <td colspan="2">
                              <input style="width:80%;border:0px;" type="text" name="checksite" id="ccchecksite" >
                           </td>
                           <td colspan="2">
                              <input style="width:80%;border:0px;" type="text" name="carnumber" id="ccarnumber" >
                           </td>
                           </tr>--%>
                              <tr>
                                 <th scope="col">序号</th>
                                 <th scope="col" colspan="2">树材种</th>
                                  <th scope="col">检  尺  长</th>
                                  <th scope="col">检  尺  径</th>
                                  <th scope="col">根  数</th>
                                  <th scope="col" colspan="2">材  积</th>
                              </tr>
                              <tr>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 <td colspan="2">&nbsp; </td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp; </td>
                                 <td colspan="2">&nbsp;</td>
                              </tr>
                              <tr>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 <td colspan="2">&nbsp; </td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp; </td>
                                 <td colspan="2">&nbsp;</td>
                              </tr>
                                <tr>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 <td colspan="2">&nbsp; </td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp; </td>
                                 <td colspan="2">&nbsp;</td>
                              </tr>
                                <tr>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 <td colspan="2">&nbsp; </td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp; </td>
                                 <td colspan="2">&nbsp;</td>
                              </tr>
                                 <tr>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 <td colspan="2">&nbsp; </td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp; </td>
                                 <td colspan="2">&nbsp;</td>
                              </tr>
                               <tr>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;6&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 <td colspan="2">&nbsp; </td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp; </td>
                                 <td colspan="2">&nbsp;</td>
                              </tr>
                               <tr>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                <td colspan="2">&nbsp; </td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp; </td>
                                 <td colspan="2">&nbsp;</td>
                              </tr>
                               <tr>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 <td colspan="2">&nbsp; </td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp; </td>
                                 <td colspan="2">&nbsp;</td>
                              </tr>
                               <tr>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;9&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 <td colspan="2">&nbsp; </td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp; </td>
                                 <td colspan="2">&nbsp;</td>
                              </tr>
                               <tr>
                                 <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                 <td colspan="2">&nbsp; </td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp;</td>
                                 <td>&nbsp; </td>
                                 <td colspan="2">&nbsp;</td>
                              </tr>
                               <tr>
                                 <td rowspan="2">合计(大写)</td>
      <td colspan="4"><input style="border:0px;background-color: transparent;font-size:20px;text-align:center" name="toltree1" id="toltree1" value="">根（块、件）</td>
      
      <td rowspan="2">合计(小写)</td>
      <td colspan="4"><input style="border:0px;background-color: transparent;font-size:20px;text-align:center" name="toltree" id="toltree" value="">根（块、件）</td>
                              </tr>
                              <tr>
      <td colspan="4"><input style="border:0px;background-color: transparent;font-size:20px;text-align:center" name="tolstere1" id="tolstere1">立方米吨、根</td> 
      <td colspan="4"><input style="border:0px;background-color: transparent;font-size:20px;text-align:center" name="tolstere" id="tolstere" value="">立方米吨、根</td> 
      </tr>
                             <tr>
                                <td colspan="2">货场管理员：</td>
                                <td colspan="2">检尺员：</td>
                                <td colspan="4">伐区监管员：</td>
                             </tr>
                             
                             <tr>
                                <td colspan="2"></td>
                                <td colspan="2"></td>
                                <td colspan="4"><input style="width:80%;border:0px;" type="text" name="forester" id="fforester" ></td>
                             </tr>
                            </table>
                        </div>

                </div>
             <div class="1"  style="text-align:center">

		    <span  style="text-align: center;"><button class="btn" type="submit" id="mybutton" value="保存申请书">保存</button></span>
		     <span  ><button class="btn" type="button" id="btnPrint" value="打印">打印</button></span> 
		   </div>
                  <div style="clear: both;padding-bottom: 40px"></div>
                
            </form>
          </div>
          </article>



</div>
<!--end-Footer-part-->
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
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
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

// resets the menu selection upon entry to this page:
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}
  
$(function(){
    $("#btnPrint").click(function(){ $("#divprint").printArea(); });
});
</script> 
</body>
</html>