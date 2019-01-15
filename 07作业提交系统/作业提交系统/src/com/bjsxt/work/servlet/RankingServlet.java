package com.bjsxt.work.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bjsxt.work.entity.Group;
import com.bjsxt.work.entity.Student;
import com.bjsxt.work.entity.Work;
import com.bjsxt.work.service.RankingService;
import com.bjsxt.work.service.impl.RankingServiceImpl;
import com.bjsxt.work.util.PageBean;

public class RankingServlet extends BaseServlet {
	private static final long serialVersionUID = -726834119174839520L;

	/**
	 * 班级预排名，先到达这个页面，选择作业类型再出结果
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void toClazzRanking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RankingService rankingService = new RankingServiceImpl();
		List<Work> workList = rankingService.findWork();
		request.setAttribute("workList", workList);
		//
		request.getRequestDispatcher("/admin/clazzRanking.jsp").forward(request, response);
	}


	/**
	 * 查询班级排名，转发到admin/clazzRanking.jsp
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void clazzRanking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 分页
		String sindex = request.getParameter("index");
		int index = 1;
		if (sindex != null) {
			index = Integer.parseInt(sindex);
		}

		String ssize = request.getParameter("size");
		int size = 5;
		if (ssize != null) {
			size = Integer.parseInt(ssize);
		}

		//
		// String workName = request.getParameter("workName");
		// 调用RankingService
		String shid = request.getParameter("hid");
		int hid = 1;
		if (shid != null) {
			hid = Integer.parseInt(shid);
		}
		// int hid = Integer.parseInt(request.getParameter("hid"));
		RankingService rankingService = new RankingServiceImpl();

		// 分页
		PageBean<Student> pageBean = new PageBean<Student>();
		pageBean.setIndex(index);
		pageBean.setSize(size);
		rankingService.rankingForClazz(pageBean, hid);
		request.setAttribute("pageBean", pageBean);

		// List<Student> stuList = rankingService.rankingForClazz(hid);

		// request.setAttribute("stuList", stuList);
		request.setAttribute("selectedid", hid);
		//

		request.getRequestDispatcher("/servlet/RankingServlet?method=toClazzRanking").forward(request, response);
	}

	 /**
	  * 小组预排名，先到打这个页面，选择作业类型再出结果
	  * @param request
	  * @param response
	  * @throws ServletException
	  * @throws IOException
	  */
		public void toGroupRanking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			RankingService rankingService = new RankingServiceImpl();
			List<Work> workList = rankingService.findWork();
		//	request.setAttribute("workList", workList);
			request.getSession().setAttribute("workList", workList);
			//
			request.getRequestDispatcher("/admin/groupRanking.jsp").forward(request, response);
		}
		
		/**
		 * 查询小组排名，转发到admin/groupRanking.jsp
		 * @param request
		 * @param response
		 * @throws ServletException
		 * @throws IOException
		 */
		public void groupRanking(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			/*//分页
			String sindex = request.getParameter("index");
			int index = 1;
			try{
				index = Integer.parseInt(sindex);
			}catch(NumberFormatException e){
				e.printStackTrace();
			}
			
			String ssize = request.getParameter("size");
			int size = 5;
			try{
				size = Integer.parseInt(ssize);
			}catch(NumberFormatException e){
				e.printStackTrace();
			}
			*/
			
			String shid = request.getParameter("hid");
			int hid = 1;
			try{
				hid = Integer.parseInt(shid);
			}catch(NumberFormatException e){
				e.printStackTrace();
			}
			RankingService rankingService = new RankingServiceImpl();
			
			//分页
			// PageBean<Student> pageBean = new PageBean<Student>(); 
//			 pageBean.setIndex(index);
//			 pageBean.setSize(size);
			List<Group>groupList = rankingService.findName12();
			List<Student>stuList = rankingService.rankingForGroup(hid);
			 request.setAttribute("stuList", stuList);
			 request.setAttribute("groupList", groupList);
			 request.setAttribute("selectedid", hid);
			//跳转
			
			 request.getRequestDispatcher("/admin/groupRanking.jsp").forward(request, response);
		}
	
}
