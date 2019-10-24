<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script>
	document.addEventListener('DOMContentLoaded', function() {
		var elems = document.querySelectorAll('.autocomplete');

		var options = {
			data : {
				"강혜수" : null,
				"김민형" : null,
				"김병진" : null,
				"김하나" : null,
				"김현진" : null,
				"손안우" : null,
				"송영원" : null,
				"신서영" : null,
				"오상섭" : null,
				"오현영" : null,
				"원유민" : null,
				"윤서호" : null,
				"이병화" : null,
				"이준우" : null,
				"한준성" : null,
				"현창훈" : null
			}
		};

		var instances = M.Autocomplete.init(elems, options);

		<c:if test="${not empty message}">
		M.toast({
			html : '${message }'
		});
		</c:if>

	});
</script>
<style>
.file-field .file-path-wrapper {
    padding-left: 0px;
}

</style>

<title>프로젝트 파일 업로드</title>
</head>
<body>
	<div class="row">
		<div class="col s6 offset-s3">
			<h1>내 프로젝트 전송</h1>
			<form action="<c:url value="/upload"/>" method="post"
				enctype="multipart/form-data">
				<div class="row">
					<div class="col s12">
						<div class="row">
							<div class="input-field col s12">
								<i class="material-icons prefix">person</i> <input type="text"
									id="autocomplete-input" class="autocomplete" name="name"
									value="${name }" required> <label
									for="autocomplete-input">이름</label>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col s12">
						<div class="row">
							<div class="file-field input-field col s12">
								<div class="file-path-wrapper">
									<i class="material-icons prefix">attach_file</i> <input
										type="file" multiple name="files"> <input
										id="file-input" class="file-path validate" type="text"
										placeholder="여러 파일을 올릴 수 있습니다.">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col s6">
						<button class="btn waves-effect waves-light btn-large"
							type="submit">
							Submit <i class="material-icons right">send</i>
						</button>
					</div>
				</div>


			</form>
			<c:if test="${not empty files }">
				<h2>전송한 파일 목록</h2>
				<ul class="collection">
					<c:forEach items="${files }" var="file">
						<li class="collection-item">${file.name }</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>
	</div>

	<c:remove var="message" scope="session" />

</body>
</html>