<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="include/header.jsp" %>
<div class="row">
     <div class="col-xs-12">
         <div style="height: 50px;">
			<a href="${pageContext.request.contextPath}/hlg/libaoInsert?flag=1" type="button" class="btn btn-primary">新增惠乐购礼包</a>
			<span style="color:red;">灰色背景代表已经上架,是根据开始时间和结束时间来判断是否上架。请联系数据库开发人员配置其他相关的内容</span>
		</div>
		
		<div class="box">
		     <div class="box-body" style="min-height: 400px;">
		          <table class="table table-striped">
		                 <thead>
							<tr>
								<th>ID</th>
								<th>礼包名称</th>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>点劵数量</th>
								<th>礼包ID</th>
								<th>排序</th>
								<th>礼包类型</th>
								<th>是否上架</th>
								<th>操作一</th>
								<th>操作二</th>
							</tr>
						 </thead>
						 <tbody>
						   <c:forEach items="${items}" var="item">
							    <tr <c:if test="${item.isUp==1}">style="background:#DDDDDD;"</c:if>>
								       <td>${item.id}</td>
								       <td>${item.name}</td>
								       <td>${item.startTime}</td>
								       <td>${item.endTime}</td>
								       <td>${item.prize}</td>
								       <td>${item.giftId}</td>
								       <td>${item.sortOrder}</td>
								       <td style="color:black;">
								           <c:if test="${item.type==0}">普通礼包</c:if>
								           <c:if test="${item.type==1}">限时礼包</c:if>
	                                   </td>
								       <td>
								          <c:if test="${item.isUp==1}">已经上架</c:if>
								          <c:if test="${item.isUp==0}">已经下架</c:if>
								       </td>
								       <td>
								          <a href="${pageContext.request.contextPath}/hlg/toUpdateLibao?flag=0&id=${item.id}" class="btn btn-primary btn-sm">编辑</a>
								       </td>
								       <td>
								          <a href="${pageContext.request.contextPath}/hlg/liBaoItems?giftType=${item.id}" class="btn btn-primary btn-sm">查看礼包内道具</a>
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
		                        <a href="${pageContext.request.contextPath}/hlg/?pageIndex=${page.pageIndex-1}"><span>&laquo;</span></a>
		                     </li>
		                  </c:if>
		                  <c:forEach items="${pageList}" var="pageList">
		                     <li <c:if test="${pageList == page.pageIndex}">class="active"</c:if>><a href="${pageContext.request.contextPath}/hlg/?pageIndex=${pageList}">${pageList}</a></li>
		                  </c:forEach>
		                  <c:if test="${page.pageIndex < page.totalPage}">
		                     <li>
		                        <a href="${pageContext.request.contextPath}/hlg/?pageIndex=${page.pageIndex+1}"><span>&raquo;</span></a>
		                     </li>
		                  </c:if>
		              </ul>
		          </nav>
		     </div>
		</div>
     </div>
</div>
<%@include file="include/footer.jsp" %>