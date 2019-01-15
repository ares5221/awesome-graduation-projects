package com.hd.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hd.entity.CustomerSource;
import com.hd.service.CustomerSourceService;
import com.hd.service.impl.CustomerSourceServiceImpl;
import com.hd.util.PageBean;

/**
 * 客户来源Servlet
 * 
 * @author wmy
 * @day 2017年8月11日
 * @time 下午4:49:26
 * 
 */
@SuppressWarnings("serial")
public class CustomerSourceServlet extends BaseServlet {
	/**
	 * 创建一个客户来源业务层操作对象
	 */
	private CustomerSourceService cusSouService = new CustomerSourceServiceImpl();

	/**
	 * 根据来源名称分页查询所有
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void showBySourceName(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// 接收页面的数据
		String sourceName = request.getParameter("sourceName");
		if (sourceName == null) {
			sourceName = "";
		}

		// 获取查询的index
		String sIndex = request.getParameter("index");
		int index = 1;
		try {
			index = Integer.parseInt(sIndex);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		PageBean<CustomerSource> pageBean = new PageBean<CustomerSource>();
		pageBean.setIndex(index);
		pageBean.setSize(10);

		// 调用业务层完成客户来源查询操作并得到结果
		cusSouService.showByName(sourceName, pageBean);
		// 将查询的来源名称传到表单
		request.setAttribute("sourceName", sourceName);
		// 将来源列表及分页信息传到表单
		request.setAttribute("pageBean", pageBean);
		// 页面跳转
		request.getRequestDispatcher("/view/customer/customer_source_list.jsp")
				.forward(request, response);
	}

	/**
	 * 根据客户来源id删除客户来源
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收页面的数据
		String sourceId = request.getParameter("sourceId");
		// 创建客户来源id默认值
		int source_id = -1;
		try {
			source_id = Integer.parseInt(sourceId);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		// 调用业务层完成客户来源删除操作
		if (cusSouService.deleteById(source_id)) {
			// 删除成功,跳转到查询所有并回到当前页面
			response.sendRedirect("CustomerSourceServlet?method=showBySourceName");
		} else {
			// 删除失败,显示弹窗
			// 解决中文乱码
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('删除客户来源失败!!!')");
			out.println("location.href='CustomerSourceServlet?method=showBySourceName'");
			out.println("</script>");
		}
	}

	/**
	 * 添加客户来源
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 接收页面的数据
		String sourceName = request.getParameter("sourceName");
		CustomerSource cusSou = new CustomerSource();
		cusSou.setSource_name(sourceName);

		// 调用业务层完成客户来源添加操作
		if (cusSouService.add(cusSou)) {
			request.removeAttribute("sourceName");
			// 添加成功,跳转到查询所有并回到当前页面
			response.sendRedirect("CustomerSourceServlet?method=showBySourceName");
		} else {
			// 添加失败,显示弹窗
			// 解决中文乱码
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>");
			out.println("alert('添加客户来源失败!!!')");
			out.println("location.href='/view/customer/customer_source_add.jsp'");
			out.println("</script>");
		}
	}
}
