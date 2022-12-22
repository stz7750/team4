<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<style>
button{
width: 50px;
height: 20px;
font-size : 10px;
}
</style>
<title>Insert title here</title>
</head>
<body>
<form action="/tae/Rcpinfowrite1" method="post" enctype="multipart/form-data">
<table border="1" style = "text-align : center; width : 70%;" >
	<tr><td>제목</td><td><input name = "rtitle"></td>
	<tr><td>작성자</td><td><sec:authentication property = "principal.user.userid"></sec:authentication></td> 
	<tr><td>내용</td><td><input name = "rinfo" placeholder = "귀찮거나 그럴때 입맛돋우는 간단한 김무침으로 반찬 만들어보세요"></td>
	<tr><td>요리 난이도</td><td>
	<select name = "rlevel">
    <option value="아무나">아무나</option>
    <option value="초급">초급</option>
    <option value="중급">중급</option>
    <option value="고급">고급</option>
	</select>
	</td></tr>
	<tr><td>요리 시간</td><td>
	<select name = "rtime">
    <option value="5분이내">5분이내</option>
    <option value="10분이내">10분이내</option>
    <option value="15분이내">15분이내</option>
    <option value="20분이내">20분이내</option>
    <option value="25분이내">25분이내</option>
    <option value="30분이내">30분이내</option>
    <option value="60분이내">60분이내</option>
	</select>
	</td></tr>
	<tr><td>요리 팁</td><td><input name = "rtip" placeholder = "모든 재료 한꺼번에 넣어도 괜찮아요.겁내지 말고 도전하세요."></td></tr>
	<tr><td>재료</td><td>	
	<select name = "rprep">
    <option value="23">육류</option>
    <option value="24">해물류</option>
    <option value="25">건어물류</option>
    <option value="26">곡류</option>
    <option value="27">콩/견과류</option>
    <option value="28">채소류</option>
    <option value="31">버섯류</option>
    <option value="32">밀가루</option>
    <option value="33">가공식품류</option>
    <option value="34">기타</option>
    <option value="47">쌀</option>
    <option value="48">과일류</option>
    <option value="50">달걀/유제품</option>
    <option value="70">소고기</option>
    <option value="71">돼지고기</option>
    <option value="72">닭고기</option>
	</select>
	</td></tr>
	<tr><td>완성 요리사진</td><td><input type = "file" name = "img"></td></tr>
	<tr><td>요리 방법</td><td><textarea name="rlogic" id="editorTxt" 
                  rows="20" cols="10"                                   
                  placeholder="내용을 입력해주세요"
                  style="width: 700px">"내용을 입력해주세요"</textarea></td></tr>

	</table>
	<a href="/chan/bestRcp">커뮤니티로 이동</a>  <button type ="submit">글 쓰기</button>
</form>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="/smarteditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>
     let oEditors = []

    smartEditor = function() {
      console.log("Naver SmartEditor")
      nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "editorTxt",
        sSkinURI: "/smarteditor/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
      })
    } 

    $(document).ready(function() {
  
      smartEditor() 
      
      $("#save").click(function(){
    	  oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    	  $("#writeform").submit();
      });
      
    })
  </script>
</body>
</html>