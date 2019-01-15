package com.hd.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hd.entity.CustomerCondition;
import com.hd.service.CustomerConditionService;
import com.hd.service.impl.CustomerConditionServiceImpl;
import com.hd.util.PageBean;

/**
 * 客户状态相关操作Servlet
 * 
 * @author wmy
 * @day 2017年8月10日
 * @time 下午7:46:21
 * 
 */
@SuppressWarnings("serial")
public class CustomerConditionServlet extends BaseServlet {
	/**
	 * 创建一个客户状态业务层操作对象
	 */
	private CustomerConditionService cusConService = new CustomerConditionServiceImpl();

	/**
	 * 带条件的分页查询所有
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showByConditionName(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接收页面的数据
		String conditionName = request.getParameter("conditionName");
		if (conditionName == null) {
			conditionName = "";
		}

		// 获取查询的index
		String sIndex = request.getParameter("index");
		int index = 1;
		try {
			index = Integer.parseInt(sIndex);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		PageBean<CustomerCondition> pageBean = new PageBean<CustomerCondition>();
		pageBean.setIndex(index);
		pageBean.setSize(10);

		// 调用业务层完成客户状态查询操作并得到结果
		cusConService.showByName(conditionName, pageBean);
		// 将查询的状态名称传到表单
		request.setAttribute("conditionName", conditionName);
		// 将状态列表及分页信息传到表单
		request.setAttribute("pageBean", pageBean);
		// 页面跳转
		request.getRequestDispatcher("/view/customer/customer_state_list.jsp")
				.forward(request, response);
	}

	/**
	 * 根据客户状态id删除客户状态
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收页面的数据
		String conditionId = request.getParameter("conditionId");
		// 创建客户状态id默认值
		int condition_id = -1;
		try {
			condition_id = Integer.parseInt(conditionId);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		// 调用业务层完成客户状态删除操作
		if (cusConService.deleteById(condition_id)) {
			// 删除成功,跳转到查询所有并回到当前页面
			response.sendRedirect("CustomerConditionServlet?method=showByConditionName");
		} else {
			// 删除失败,显示弹窗
			// 解决中文乱码
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('删除客户状态失败!!!')");
			out.println("location.href='CustomerConditionServlet?method=showByConditionName'");
			out.println("</script>");
		}
	}

	/**
	 * 添加客户状态
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收页面的数据
		String conditionExplain = request.getParameter("conditionExplain");
		String conditionName = request.getParameter("conditionName");
		CustomerCondition cusCon = new CustomerCondition();
		cusCon.setCondition_name(conditionName);
		cusCon.setCondition_explain(conditionExplain);

		// 调用业务层完成客户状态添加操作
		if (cusConService.add(cusCon)) {
			// 添加成功,跳转到查询所有并回到当前页面
			response.sendRedirect("CustomerConditionServlet?method=showByConditionName");
		} else {
			// 添加失败,显示弹窗
			// 解决中文乱码
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('添加客户状态失败!!!')");
			out.println("location.href='/view/customer/customer_state_add.jsp'");
			out.println("</script>");
		}
	}
}
