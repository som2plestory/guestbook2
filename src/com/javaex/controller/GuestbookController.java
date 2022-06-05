package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.GuestbookDao;
import com.javaex.util.GuestbookUtil;
import com.javaex.vo.GuestbookVo;

@WebServlet("/gbc")
public class GuestbookController extends HttpServlet{
	
	//필드 
	private static final long serialVersionUID = 1L;
	
	//get방식으로 요청시 호출 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//포스트 방식일때 한글깨짐 방지
		request.setCharacterEncoding("UTF-8");
		
		//action파라미터 꺼내기
		String action = request.getParameter("action");
		System.out.println(action);
		
		if ("add".equals(action)) {
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String content = request.getParameter("content");

			GuestbookDao guestDao = new GuestbookDao();
			GuestbookVo guestVo = new GuestbookVo(name, password, content);
				
			System.out.println("방명록 작성 성공");
			guestDao.insert(guestVo);
			System.out.println(guestVo.toString());

			GuestbookUtil.redirect(request, response, "/guestbook2/gbc");
			
		} else if ("deleteform".equals(action)) {
			GuestbookUtil.forward(request, response, "/WEB-INF/deleteForm.jsp");

		} else if ("delete".equals(action)) {
			int no = Integer.parseInt(request.getParameter("no"));
			String password = request.getParameter("password");

			GuestbookVo guestVo = new GuestbookVo();
			guestVo.setNo(no);
			guestVo.setPassword(password);
			
			GuestbookDao guestDao = new GuestbookDao();
			guestDao.delete(guestVo);

			GuestbookUtil.redirect(request, response, "/guestbook2/gbc");
			
		} else {//리스트
			GuestbookDao dao = new GuestbookDao();
			List<GuestbookVo> guestList = dao.getGuestList();

			request.setAttribute("guestList", guestList);
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/addList.jsp");
			rd.forward(request, response);
		}

	}

	
	//post방식으로 요청시 호출 메소드
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("여기는 post");
		
		doGet(request, response);
	}

}
