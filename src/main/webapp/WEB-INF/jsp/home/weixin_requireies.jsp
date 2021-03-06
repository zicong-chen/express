<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
        
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="微信端查询单号">
	<meta charset="UTF-8">
	<title>查询单件</title>
	<meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=0"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="format-detection" content="telephone=no">
		<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/insdep/easyui.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/insdep/icon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/weui.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main/jquery-weui.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/logIconFont/iconfont.css">
	<style type="text/css">
		.tabbarContent{
			font-size: 15px;
			margin: 6px 0;
		}
		.header{
			height:60px;
			width: 100%;
			background-color: #2ECC71;
			color: white;
			font-size: 25px;
			padding-left: 10px;
			box-sizing: border-box;
			font-weight: normal;
			letter-spacing: 2px;
			line-height: 60px;
			position: fixed;
			top: 0;
			left: 0;

		}
		.headerIcon{
			font-size: 30px;
			line-height: 60px;
			position: relative;
			top: -2px;
		}
		.requireDiv{
			width: 80%;
			margin: 200px 10%;
			height: 105px;
			position: absolute;
			box-sizing: border-box;
		}
		.requireInputDiv{
			width: 100%;
			height: 55px;
			position: absolute;
			border: 1px solid #2ECC71;
			box-sizing: border-box;
			border-radius: 5px;
		}
		.inputIcon{
			height: 100%;
			width: 18%;
			position: absolute;
			box-sizing: border-box;
		}
		.requireInput{
			height: 100%;
			width: 82%;
			border-left: 1px solid #2ECC71;
			border-right: 0;
			border-top: 0;
			border-bottom: 0;
			position: absolute;
			left: 18%;
			font-size: 22px;
			padding-left: 10px;
			box-sizing: border-box;
		}
		.requireSumbit{
			position: absolute;
			top:70px;
			width:150px;
			height: 45px;
			font-size: 18px;
			left: 0;
			right: 0;
			margin: 5px auto;
		}
	</style>
  </head>
  
  <body>
   	<header class="header">
	 	<h2><b><i class="icon iconfont icon-xiazai4 headerIcon"></i>单件查询</b></h2>
	</header>
	
	<div class="requireDiv">
	 <div class="requireInputDiv">
	 	<i class="inputIcon" ><i class="icon iconfont icon-chaxun" style="font-size: 40px;position: absolute;top:-5px;left:10px;color:#2ECC71; "></i></i>
	 	<input type="text" name="goodOrderNumber" class="requireInput" placeholder="输入查询单号">
	 </div>
	 <a href="javascript:;" class="weui-btn weui-btn_mini weui-btn_primary requireSumbit" id="requireSumbit" onclick="requireies.submit()">点击查询</a>
	 </div>



	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/main/fastclick.js"></script>
	<script src="${pageContext.request.contextPath}/js/main/jquery-weui.js"></script>
	<script src="${pageContext.request.contextPath}/js/validations/validateDialog.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.easyui.min.js"></script>
	<script type="text/javascript">
		
		$(function() {
		    FastClick.attach(document.body);
		 });
		
		var requireies={
			submit:function(){
				if($(".requireInput").val()==''){
					validateDialog.fadeDialog("请输入查询单号!");
					return;
				}else{
					var goodOrderNumber = $(".requireInput").val();
                    console.log(goodOrderNumber);
					localStorage.setItem("goodOrderNumber",goodOrderNumber);
					$.ajax({
                        type: "POST",
                        url:"/express/good/checkOrderNumberBywechat",
                        data:{
                            orderNumber:goodOrderNumber
                        },
                        success:function (data) {
                            if (data["status"] == 1) {
                                alert("操作成功");
                                console.log(goodOrderNumber);
                                window.location.href = "/express/Base/goURL/home/LogisticsInformation?identify=wechat";
                            } else {
                                validateDialog.fadeDialog("请输入正确的单号!");
                                return;
                            }
                        }

                    })




				}
			}
		}
	</script>
  </body>
</html>
