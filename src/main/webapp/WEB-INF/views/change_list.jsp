<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<div class="row" id="list">
	<c:forEach var="dto" items="${list }" varStatus="status">
		<div
			class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 aos-init aos-animate"
			data-aos="zoom-in" data-aos-delay="100">
			<a href="/meeting/detail?meeting_number=${dto.meeting_number }">
				<div class="icon-box">

					<div class="studyItem_schedule">
						<p class="startedate">시작 예정일 | ${dto.meeting_startdate }</p>
					</div>
					<h4 class="studyItem_title">${dto.meeting_title }</h4>
					<div style="margin-bottom: 50px; margin-top: 50px;">
									<c:if test = "${fn:contains(dto.meeting_skill, 'java')}">
									<span><img src="https://holaworld.io/images/languages/java.svg" alt="" style="width: 50px; height: 50px;"/></span>
									</c:if>							
									<c:if test = "${fn:contains(dto.meeting_skill, 'Spring')}">
									<span><img src="https://holaworld.io/images/languages/spring.svg" alt="" style="width: 50px; height: 50px;"/></span>
									</c:if>
									<c:if test = "${fn:contains(dto.meeting_skill, 'Nodejs')}">
									<span><img src="https://holaworld.io/images/languages/nodejs.svg" alt="" style="width: 50px; height: 50px;"/></span>
									</c:if>
									<c:if test = "${fn:contains(dto.meeting_skill, 'Kotlin')}">
									<span><img src="https://holaworld.io/images/languages/kotlin.svg" alt="" style="width: 50px; height: 50px;"/></span>
									</c:if>
									<c:if test = "${fn:contains(dto.meeting_skill, 'TypeScript')}">
									<span><img src="https://holaworld.io/images/languages/typescript.svg" alt="" style="width: 50px; height: 50px;"/></span>
									</c:if>
									<c:if test = "${fn:contains(dto.meeting_skill, 'React')}">
									<span><img src="https://holaworld.io/images/languages/react.svg" alt="" style="width: 50px; height: 50px;"/></span>
									</c:if>
									<c:if test = "${fn:contains(dto.meeting_skill, 'Vue')}">
									<span><img src="https://holaworld.io/images/languages/vue.svg" alt="" style="width: 50px; height: 50px;"/></span>
									</c:if>
									<c:if test = "${fn:contains(dto.meeting_skill, 'MySQL')}">
									<span><img src="https://holaworld.io/images/languages/mysql.svg" alt="" style="width: 50px; height: 50px;"/></span>
									</c:if>
									<c:if test = "${fn:contains(dto.meeting_skill, 'Python')}">
									<span><img src="https://holaworld.io/images/languages/python.svg" alt="" style="width: 50px; height: 50px;"/></span>
									</c:if>
									<c:if test = "${fn:contains(dto.meeting_skill, 'php')}">
									<span><img src="https://holaworld.io/images/languages/php.svg" alt="" style="width: 50px; height: 50px;"/></span>
									</c:if>
									</div>

					<div class="studyItem_info">
						<p class="">
							<img src="" alt="" />작성자 : ${dto.users_id }
						</p>
					</div>
				</div>
			</a>
		</div>
	</c:forEach>
</div>