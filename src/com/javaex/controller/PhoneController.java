package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.PhoneDao;
import com.javaex.vo.PersonVo;


@WebServlet("/pbc")
public class PhoneController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러");
		
		//파라미터 action 값을 읽어온다
		String action = request.getParameter("action");
		System.out.println(action);
		
		if("list".equals(action)) {
			
			//리스트
			PhoneDao phoneDao = new PhoneDao();
			List<PersonVo> personList = phoneDao.getPersonList();
			
			System.out.println("Controller===============");
			System.out.println(personList);
			
			//데이터 넣기 -- request 어티르뷰트에 데이터를 넣어준다.
			request.setAttribute("pList", personList);
			
			
			//html 작업 --> jsp에게 시킨다 ==> Forward 한다 
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/list.jsp");
			rd.forward(request, response);
		} else if("wform".equals(action)) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/writeForm.jsp");
			rd.forward(request, response);
		} else if("insert".equals(action)) {
			System.out.println("[저장]");
			
			//dao 저장
			//파라미터를 꺼낸다 name, hp, company
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String company = request.getParameter("company");
			
			//vo로 묶기
			PersonVo personVo = new PersonVo(name, hp, company);
			System.out.println(personVo);
			
			//dao personInsert
			PhoneDao phoneDao = new PhoneDao();
			phoneDao.personInsert(personVo);
			
			//Redirect
			response.sendRedirect("/phonebook2/pbc?action=list");
		}
		
		//dao --> 저장
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
