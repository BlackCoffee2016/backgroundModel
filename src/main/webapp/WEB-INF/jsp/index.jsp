<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>
<div class="row">
     <div class="col-xs-12">
         <div style="height: 50px;">
			<a href="${pageContext.request.contextPath}/toInsert?flag=1" type="button" class="btn btn-primary">新增道具</a>
			<a href="${pageContext.request.contextPath}/getTime" type="button" class="btn btn-primary">活动配置</a>
		</div>
		
		<div class="box">
		     <div class="box-body" style="min-height: 400px;">
		          <table class="table table-striped">
		                 <thead>
							<tr>
								<th>ID</th>
								<th>productid</th>
								<th>道具名称</th>
								<th>一折价</th>
								<th>原价</th>
								<th>道具ID</th>
								<th>创建时间</th>
								<th>是否上架</th>
								<th>gaapid</th>
								<th>操作</th>
							</tr>
						 </thead>
						 <tbody>
						   <c:forEach items="${items}" var="item">
							    <tr>
							       <td>${item.id}</td>
							       <td>${item.productid}</td>
							       <td>${item.giftname}</td>
							       <td>${item.point5}</td>
							       <td>${item.point}</td>
							       <td>${item.itemids}</td>
							       <td><fmt:formatDate value="${item.createtime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
							       <td style="color:red;">
							          <c:if test="${item.status==0}">已经上架</c:if>
							          <c:if test="${item.status==1}">已经下架</c:if>
							       </td>
							       <td>${item.gaapid}</td>
							       <td>
							          <a href="${pageContext.request.contextPath}/toInsert?id=${item.id}&flag=2" class="btn btn-primary btn-sm">编辑</a>
							       </td>
							    </tr>
						    </c:forEach>
						 </tbody>
		          </table>
		     </div>
		     <div class="box-footer">
		          <nav>
		              <ul class="pagination">
		                  <c:if test="${page.pageIndex > 1}">
		                     <li>
		                        <a href="${pageContext.request.contextPath}/?pageIndex=${page.pageIndex-1}"><span>&laquo;</span></a>
		                     </li>
		                  </c:if>
		                  <c:forEach items="${pageList}" var="pageList">
		                     <li <c:if test="${pageList == page.pageIndex}">class="active"</c:if>><a href="${pageContext.request.contextPath}/?pageIndex=${pageList}">${pageList}</a></li>
		                  </c:forEach>
		                  <c:if test="${page.pageIndex < page.totalPage}">
		                     <li>
		                        <a href="${pageContext.request.contextPath}/?pageIndex=${page.pageIndex+1}"><span>&raquo;</span></a>
		                     </li>
		                  </c:if>
		              </ul>
		          </nav>
		     </div>
		</div>
     </div>
</div>
<%@include file="include/footer.jsp" %>