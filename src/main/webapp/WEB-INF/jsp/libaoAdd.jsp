<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>
<div class="row">
     <div class="col-xs-12">
          <div class="box">
               <div class="box-header">
	               <h3 class="box-title">
		              <c:if test="${create == '1'}">新增道具</c:if>
		              <c:if test="${create == '0'}">编辑道具</c:if>
	               </h3>
	            </div>
	            <div class="box-body">
	                 <form method="post" name="itemForm" <c:if test="${create == '1'}">action="${pageContext.request.contextPath}/hlg/insertLibao"</c:if><c:if test="${create == '0'}">action="${pageContext.request.contextPath}/hlg/updateLibao"</c:if>>
	                       <input type="hidden" value="${libao.id}" id="id" name="id"/>
	                       <div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>礼包名称：</label>
										<input type="text" class="form-control" id="name" name="name" value="${libao.name}">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>开始时间：</label>
										<input type="text" class="form-control" id="startTime" name="startTime" placeholder="时间格式为:yyyy-mm-dd hh:mm:ss" value="${libao.startTime}"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>结束时间：</label>
										<input type="text" class="form-control" id="endTime" name="endTime" placeholder="时间格式为:yyyy-mm-dd hh:mm:ss" value="${libao.endTime}"/>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>点劵数量：</label>
										<input type="number" class="form-control" id="prize" name="prize" value="${libao.prize}">
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>礼包ID：</label>
										<input type="number" class="form-control" id="giftId" name="giftId" value="${libao.giftId}">
									</div>
								</div>
								<div class="form-group">
								     <label>礼包类型：</label>
								     <label>
										<input type="radio" name="type" value="0" <c:if test="${libao.type==0}">checked</c:if> >普通礼包
									 </label>
									 <label>
										<input type="radio" name="type" value="1" <c:if test="${libao.type==1}">checked</c:if> >限时礼包
									 </label>
								</div>
							</div>
							<div>
								<button type="button" class="btn btn-success btn-lg" id="save">保存</button>
							</div>
	                 </form>
	            </div>
          </div>
     </div>
</div>
<script>
$(document).ready(function() {
	  $("#save").click(function(){
		  var startTime=$.trim($("#startTime").val());
		  var endTime=$.trim($("#endTime").val());
		  
		  var timeReg=/^(\d{4})\-(\d{2})\-(\d{2}) (\d{2}):(\d{2}):(\d{2})$/ ;
		  if(!timeReg.test(startTime)){
			  alert("开始时间格式不正确");
			  return;
		  }
		  if(!timeReg.test(endTime)){
			  alert("结束时间格式不正确");
			  return;
		  }
		  startTime = startTime.replace(/-/g,"/");
		  var start = new Date(startTime).getTime();
		  
		  endTime = endTime.replace(/-/g,"/");
		  var end=new Date(endTime).getTime();
		  
		  if(start>end){
			  alert("开始时间一定要小于结束时间");
			  return;
		  }
		  
		  
		  document.itemForm.submit();
		  
	  })
});
</script>
<%@include file="include/footer.jsp" %>