<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.coffeelog.board.Board2Bean"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.coffeelog.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		String path = request.getRealPath("/upload");

		System.out.println("파일저장되는 실제 경로 : " + path);

		int maxSize = 10 * 1024 * 1024;

		MultipartRequest multi = new MultipartRequest(request, path, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		System.out.println(" 파일 업로드 완료! ");

		String beans_type = multi.getParameter("beans_type");
		String sour_taste = multi.getParameter("sour_taste");
		String bitter_taste = multi.getParameter("bitter_taste");
		String sweet_taste = multi.getParameter("sweet_taste");
		String body_taste = multi.getParameter("body_taste");
		String place = multi.getParameter("place");
		String content = multi.getParameter("content");
		String filename = multi.getFilesystemName("filename");
		String id = (String) session.getAttribute("id");
		int num = Integer.parseInt(multi.getParameter("num"));
	%>

	<%
		Board2Bean bb2 = new Board2Bean();

		bb2.setBeans_type(beans_type);
		bb2.setBitter_taste(bitter_taste);
		bb2.setBody_taste(body_taste);
		bb2.setContent(content);
		bb2.setSweet_taste(sweet_taste);
		bb2.setSour_taste(sour_taste);
		bb2.setFile(filename);
		bb2.setPlace(place);
		bb2.setId(id);
		bb2.setNum(num);
		//bb2.setDate(new Date());

		BoardDAO bdao = new BoardDAO();

		bdao.updateWriteLog(bb2);

		response.sendRedirect("list2.jsp");
	%>

</body>
</html>