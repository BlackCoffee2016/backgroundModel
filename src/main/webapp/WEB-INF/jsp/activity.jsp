<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>
<div class="row">
     <div class="col-xs-12">
          <div class="box">
               <div class="box-header">
	               <h3 class="box-title">活动时间配置</h3>
	            </div>
	            <div class="box-body">
	                 <form method="post" name="timeForm" action="${pageContext.request.contextPath}/updateTime">
	                       <div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>活动时间配置：</label>
										<input type="text" class="form-control" id="activeTime" name="activeTime" value='${abc.activeTime}'>
									</div>
								</div>
							</div>
							 <div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>活动结束时间：</label>
										<input type="text" class="form-control"  id="finishTime" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  name="finishTime" value='${abc.finishTime}'>
									</div>
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
		  
		  document.timeForm.submit();
		  
	  })
});
</script>
<%@include file="include/footer.jsp" %>