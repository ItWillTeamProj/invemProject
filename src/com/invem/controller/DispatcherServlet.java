package com.invem.controller;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


//@WebServlet("/DispatcherServlet")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private Properties prop;

	@Override
	public void init(ServletConfig config) throws ServletException {
		//최초 요청시 한 번만 실행
		//매핑파일을 읽어서 Properties에 저장

		//1. 매핑파일 읽어오기
		String configFile = config.getInitParameter("configFile");
		//=> web.xml의 init-param를 읽어 올 수 있다.
		System.out.println("configFile=" + configFile);
		//=> /config/CommandPro.properties

		String realConfigFile = config.getServletContext().getRealPath(configFile);
		System.out.println("실제 물리적 경로 : " + realConfigFile);

		FileInputStream inStream = null;

		try {
			//2. Properties 컬렉션에 저장하기
			inStream = new FileInputStream(realConfigFile);

			prop = new Properties();
			prop.load(inStream);
			System.out.println("컬렉션에 저장됨!");

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				if(inStream != null) inStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestProcess(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		requestProcess(request, response);
	}

	private void requestProcess(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException{
		// 사용자의 요청이 들어올때마다 호출됨
		// 매핑파일이 들어있는 Properties 컬렉션을 참조해서 사용자에 해당하는 담당 Controller를 구해서 작업을 시킨다.
		// 결과를 리턴받아서 해당 뷰 페이지로 포워딩한다.

		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");

		//1. 요청 uri로부터 명령어 추출
		String uri = request.getRequestURI();
		System.out.println("uri=" + uri);
		//=> /mymvc/tips/book.do

		String contextPath = request.getContextPath();
		System.out.println("contextPath=" + contextPath);

		String cmd = uri;
		if(uri.indexOf(contextPath) != -1) {
			cmd = uri.substring(contextPath.length());
		}
		System.out.println("cmd=" + cmd);

		//2. 명령어에 해당하는 명령어 처리 클래스 구하기
		String cmdVal = prop.getProperty(cmd);

		try {
			// 문자열을 클래스로 변환
			Class<?> cmdClass = Class.forName(cmdVal);

			//클래스를 인스턴스로
			Controller controller = (Controller) cmdClass.newInstance();


			//3. 메서드 호출
			String viewPage = controller.requestPro(request, response);
			System.out.println("viewPage=" + viewPage );

			if(controller.isRedirect()) {
				//해당 페이지로 redirect
				System.out.println("redirect!\n");

				response.sendRedirect(contextPath + viewPage);
			}else {
				//4. 해당 뷰페이지로 포워딩
				System.out.println("forward!\n");

				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (Throwable e) {
			e.printStackTrace();
		}


	}

}
