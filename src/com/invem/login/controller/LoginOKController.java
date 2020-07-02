package com.invem.login.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.reflect.TypeToken;
import com.invem.common.LeagueInfo;
import com.invem.common.LeagueVO;
import com.invem.common.SummonerInfo;
import com.invem.common.SummonerVO;
import com.invem.controller.Controller;
import com.invem.login.model.LoginService;
import com.invem.member.model.MemberDTO;


public class LoginOKController implements Controller{

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String userid=request.getParameter("userid");
		String pwd=request.getParameter("pwd");
		String saveId=request.getParameter("saveId");
		String caution=request.getParameter("caution");
		
		LoginService serv = new LoginService();
		HttpSession session = request.getSession();
		
		String msg="로그인 처리 실패!", url="/login/login.gg";
		try{
			int result=serv.loginCheck(userid, pwd);
			if(result==LoginService.LOGIN_OK){ 
				MemberDTO vo=serv.selectMember(userid);
				
				Gson gson = new GsonBuilder().create();
				if(vo.getSum_name() != null && !vo.getSum_name().isEmpty()) {
					
					String sInfo = SummonerInfo.search(vo.getSum_name());
					
					SummonerVO smVo = null;
					LeagueVO lgVo = null;
					List<LeagueVO> list = null;
					if(sInfo.indexOf("message") == -1) {
						smVo = gson.fromJson(sInfo, SummonerVO.class);
						
						String lInfo = LeagueInfo.search(smVo.getId());
						System.out.println("결과 = " + lInfo);
						list = gson.fromJson(lInfo, new TypeToken<List<LeagueVO>>(){}.getType());
						lgVo = list.get(0);
					}
					session.setAttribute("smVo", smVo);
					session.setAttribute("lgVo", lgVo);
					session.setMaxInactiveInterval(60*60);
				}
				
				session.setAttribute("userid", userid);
				session.setAttribute("userName", vo.getName());

				if(saveId!=null){ 
					Cookie ck = new Cookie("ck_userid", userid);
					ck.setMaxAge(1000*24*60*60); 
					ck.setPath("/"); 
					response.addCookie(ck);
				}else{ 
					Cookie ck = new Cookie("ck_userid", userid);
					ck.setMaxAge(0); 
					ck.setPath("/"); 
					response.addCookie(ck);
				}
				msg=vo.getName()+ "님 로그인되었습니다.";
				url="/index.gg";
			}else if(result==LoginService.PWD_DISAGREE){
				msg="비밀번호가 일치하지 않습니다.";
			}else if(result==LoginService.ID_NONE){
				msg="해당 아이디가 존재하지 않거나 블록 처리 되었습니다.";			
			}else{
				msg="탈퇴한 회원입니다.";
			}
		}catch(SQLException e){
			e.printStackTrace();
		}catch (IOException e) {
			request.setAttribute("msg", "API 인증 기간 만료!!!");
			request.setAttribute("url", "/index.gg");
			
			return "/common/message.jsp";
		}
		
		//3
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return "/common/message.jsp";
	}

	@Override
	public boolean isRedirect() {
		return false;
	}

}
