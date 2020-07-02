package com.invem.board.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.invem.board.model.BoardService;
import com.invem.board.model.BoardVO;
import com.invem.controller.Controller;

public class BoardWriteOkController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String nonuserid = request.getParameter("nonuserid");
		String pwd = request.getParameter("pwd");
		String userid = request.getParameter("userid");
		String ipaddress = request.getParameter("ipaddress");
		String title = request.getParameter("title");
		String describe = request.getParameter("ir1");
		String cat_code = request.getParameter("code");
		
		
		
		BoardVO vo = new BoardVO();
		BoardService boardServ = new BoardService();
		
		String ip = getRemoteAddr(request);
		
		vo.setUserid(userid);
		vo.setNonuserid(nonuserid);
		vo.setPwd(pwd);
		vo.setIpaddress(ip);
		vo.setTitle(title);
		vo.setDescribe(describe);
		vo.setCat_code(cat_code);
		
		String msg = "글 등록 실패", url = "/board/boardWrite.gg?code="+cat_code;
		try{
			System.out.println("매개변수 vo="+vo);
			int cnt = boardServ.insertBoard(vo);
			System.out.println("글 등록여부 cnt="+cnt);
			if(cnt > 0){
				msg = "글 등록 성공";
				url = "/board/boardList.gg?code="+cat_code;
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}
	
	public static String getRemoteAddr(HttpServletRequest request) {
        String ip = null;
        ip = request.getHeader("X-Forwarded-For");
        if (ip == null || ip.isEmpty() || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("Proxy-Client-IP"); 
        } 
        if (ip == null || ip.isEmpty() || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("WL-Proxy-Client-IP"); 
        } 
        if (ip == null || ip.isEmpty() || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("HTTP_CLIENT_IP"); 
        } 
        if (ip == null || ip.isEmpty() || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
        }
        if (ip == null || ip.isEmpty() || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("X-Real-IP"); 
        }
        if (ip == null || ip.isEmpty() || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("X-RealIP"); 
        }
        if (ip == null || ip.isEmpty() || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getHeader("REMOTE_ADDR");
        }
        if (ip == null || ip.isEmpty() || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
            ip = request.getRemoteAddr(); 
        }
        return ip;
    }

}
