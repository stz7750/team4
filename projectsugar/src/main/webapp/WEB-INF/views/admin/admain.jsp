<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<style>
.prdiv{
 border :1px solid; 
 padding:10px;
}
</style>
<link rel="stylesheet" href="/css/admin.css"/>
<title>Insert title here</title>
</head>
<body>
<div class="background">
	<div class="outerbox">
		<div class="wrapper">
			<div class="wrapper_left">
				<div class="wrapper_left_header">
					<div class="hello">
					   <a href="/chan/main"><span>요</span>리초보를 위한 <span>요</span>리비책</a>
					</div>
				</div>
				<div class="wrapper_left_body">
					<div class="header">
						<div class="profile">
							  <img src="/profile/<sec:authentication property = "principal.user.profile"/>">
							</div>
						<div class="line"></div>
						<div class="prnbtn">
							<div class="pr">
							<sec:authentication property = "principal.user.pr"></sec:authentication>
							</div>
						</div>
					</div>
					<div class="footer">
						<button onclick = "location.href ='/admin/admain' ">회원 관리</button>
						<button onclick = "location.href ='/admin/asklist' ">문의 리스트</button>
						<button onclick = "location.href ='/admin/reportlist' ">신고 리스트</button>
						<button onclick = "admin/adtotal">사이트 통계 보기</button>
					</div>
				</div>
			</div>
			<div class="wrapper_right">
				<div class="wrapper_right_header">
					<div class="wrapper_right_title">
						<sec:authentication property = "principal.user.nickname"></sec:authentication>의 마이페이지
					</div>
					<div class="wrapper_right_setting">
						<a href="/tae/userupdate">개인정보 변경</a>
					</div>
				</div>
				  <div class="wrapper_right_body">
                    <div class="wrapper2">
        				<div class="wrapper_body">
            				<div class="header2">
            	    			<div class="header__title">
                    				<span class="title">회원 정보</span>
                				</div>
                				<div class="line2"></div>
									<table>
										<tr>
											<th>아이디</th><th>닉네임</th><th>이메일</th><th>레벨</th>
										</tr>
										<c:forEach items="${infotable}" var="dto">	
										<tr><td>${dto.userid}</td><td>${dto.nickname}</td><td>${dto.email}</td><td>${dto.level}</td>
										</tr>
										</c:forEach>
									</table>
      								<div class="paging" align="center">
        							 <c:if test="${begin > pageNum}">
           							 	<a href="postlist?p=${begin-1}&sort=${sort}">[이전]</a>
        							 </c:if>
        							 <c:forEach begin="${begin}" end = "${end}" var='i'>
           								 <a href="postlist?p=${i}&sort=${sort}" class="page">${i}</a>
         							</c:forEach>
         							<c:if test="${end < totalPages}">
            							<a href="postlist?p=${end+1}&sort=${sort}">[다음]</a>
        							</c:if>
      								</div>
      							<button onclick = "location.href = '/mem/info'">회원 명단 다운로드</button>
            				</div>
        				</div>
   					 </div>     
                  </div>
			</div>
		</div>
	</div>
</div>
<!--
<table>
<tr>
<th>아이디</th><th>프로필</th><th>닉네임</th><th>이메일</th><th>주소</th><th>레벨</th></tr>
<c:forEach items="${infotable}" var="dto">	

	<tr><td>${dto.userid}</td><td>${dto.profile}</td><td>${dto.nickname}</td><td>${dto.email}</td><td>${dto.address}</td><td>${dto.level}</td></tr>

</c:forEach>
</table>
      <div id="paging" align="center">
         <c:if test="${begin > pageNum}">
            <a href="postlist?p=${begin-1}&sort=${sort}">[이전]</a>
         </c:if>
         <c:forEach begin="${begin}" end = "${end}" var='i'>
            <a href="postlist?p=${i}&sort=${sort}" class="page">${i}</a>
         </c:forEach>
         <c:if test="${end < totalPages}">
            <a href="postlist?p=${end+1}&sort=${sort}">[다음]</a>
         </c:if>
      </div>

<div class = prdiv>
<sec:authentication property = "principal.user.userid"></sec:authentication> 님 안녕하세요!
</div>
<div class = "prdiv">
<sec:authentication property = "principal.user.pr"></sec:authentication>
</div>
<img src="/profile/<sec:authentication property = "principal.user.profile"/>">
<button onclick = "location.href = '/mem/info'">회원 명단 다운로드</button>
<button onclick = "location.href = '/admin/adstyle'">스타일 주기</button>
<button onclick = "admin/adtotal">사이트 통계 보기</button>
 -->
</body>
</html>