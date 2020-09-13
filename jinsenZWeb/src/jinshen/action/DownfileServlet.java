package jinshen.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DownfileServlet
 */
@WebServlet("/DownfileServlet")
public class DownfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DownfileServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action=request.getParameter("action");
		response.setContentType("text/html;charset=UTF-8");
		
		if(action.equals("comparePic")) {
		   String fileName = request.getParameter("filename"); // 23239283-92489-阿凡达.avi
		   fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
		System.out.println("fileName :" + fileName);
		// fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
		// System.out.println("FileName :" + fileName);
		// 上传的文件都是保存在/WEB-INF/upload目录下的子目录当中
		String fileSaveRootPath = this.getServletContext().getRealPath("/WEB-INF/comparePic");
		// 通过文件名找出文件的所在目录
		String path = fileSaveRootPath + "\\" + fileName;
		System.out.println("path: " + path);
		// 得到要下载的文件
		File file = new File(path);
		System.out.println("file: " + file);
		// 如果文件不存在
		if (!file.exists()) {
			request.setAttribute("message", "您要下载的资源已被删除！！");
			request.getRequestDispatcher("/message.jsp").forward(request, response);
			return;
		}
		// 处理文件名
		String realname = fileName;
		// 设置响应头，控制浏览器下载该文件
		response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
		// 读取要下载的文件，保存到文件输入流
		FileInputStream in = new FileInputStream(path);
		// 创建输出流
		OutputStream out = response.getOutputStream();
		// 创建缓冲区
		byte buffer[] = new byte[1024];
		int len = 0;
		// 循环将输入流中的内容读取到缓冲区当中
		while ((len = in.read(buffer)) > 0) {
			// 输出缓冲区的内容到浏览器，实现文件下载
			out.write(buffer, 0, len);
		}
		// 关闭文件输入流
		in.close();
		// 关闭输出流
		out.close();
		}
		else if(action.equals("cutnumfile")) {
			String fileName = request.getParameter("filename"); // 23239283-92489-阿凡达.avi
			   fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
			System.out.println("fileName :" + fileName);
			// fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
			// System.out.println("FileName :" + fileName);
			// 上传的文件都是保存在/WEB-INF/upload目录下的子目录当中
			String fileSaveRootPath = this.getServletContext().getRealPath("/WEB-INF/cutnumfile");
			// 通过文件名找出文件的所在目录
			String path = fileSaveRootPath + "\\" + fileName;
			System.out.println("path: " + path);
			// 得到要下载的文件
			File file = new File(path);
			System.out.println("file: " + file);
			// 如果文件不存在
			/*if (!file.exists()) {
				request.setAttribute("message", "您要下载的资源已被删除！！");
				request.getRequestDispatcher("/message.jsp").forward(request, response);
				return;
			}*/
			// 处理文件名
			String realname = fileName;
			// 设置响应头，控制浏览器下载该文件
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
			// 读取要下载的文件，保存到文件输入流
			FileInputStream in = new FileInputStream(path);
			// 创建输出流
			OutputStream out = response.getOutputStream();
			// 创建缓冲区
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
			}
			// 关闭文件输入流
			in.close();
			// 关闭输出流
			out.close();
		}
		else if(action.equals("applyfile")) {
			String fileName = request.getParameter("filename"); // 23239283-92489-阿凡达.avi
			   fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
			System.out.println("fileName :" + fileName);
			// fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
			// System.out.println("FileName :" + fileName);
			// 上传的文件都是保存在/WEB-INF/upload目录下的子目录当中
			String fileSaveRootPath = this.getServletContext().getRealPath("/WEB-INF/applyfile");
			// 通过文件名找出文件的所在目录
			String path = fileSaveRootPath + "\\" + fileName;
			System.out.println("path: " + path);
			// 得到要下载的文件
			File file = new File(path);
			System.out.println("file: " + file);
			// 如果文件不存在
			/*if (!file.exists()) {
				request.setAttribute("message", "您要下载的资源已被删除！！");
				request.getRequestDispatcher("/message.jsp").forward(request, response);
				return;
			}*/
			// 处理文件名
			String realname = fileName;
			// 设置响应头，控制浏览器下载该文件
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
			// 读取要下载的文件，保存到文件输入流
			FileInputStream in = new FileInputStream(path);
			// 创建输出流
			OutputStream out = response.getOutputStream();
			// 创建缓冲区
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
			}
			// 关闭文件输入流
			in.close();
			// 关闭输出流
			out.close();
		}
		else if(action.equals("applyfile1")) {
			String fileName = request.getParameter("filename"); // 23239283-92489-阿凡达.avi
			   fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
			System.out.println("fileName :" + fileName);
			// fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
			// System.out.println("FileName :" + fileName);
			// 上传的文件都是保存在/WEB-INF/upload目录下的子目录当中
			String fileSaveRootPath = this.getServletContext().getRealPath("/WEB-INF/applyfile");
			// 通过文件名找出文件的所在目录
			String path = fileSaveRootPath + "\\" + fileName;
			System.out.println("path: " + path);
			// 得到要下载的文件
			File file = new File(path);
			System.out.println("file: " + file);
			// 如果文件不存在
			/*if (!file.exists()) {
				request.setAttribute("message", "您要下载的资源已被删除！！");
				request.getRequestDispatcher("/message.jsp").forward(request, response);
				return;
			}*/
			// 处理文件名
			String realname = fileName;
			// 设置响应头，控制浏览器下载该文件
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
			// 读取要下载的文件，保存到文件输入流
			FileInputStream in = new FileInputStream(path);
			// 创建输出流
			OutputStream out = response.getOutputStream();
			// 创建缓冲区
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
			}
			// 关闭文件输入流
			in.close();
			// 关闭输出流
			out.close();
		}
		else if(action.equals("contractfile")) {
			String fileName = request.getParameter("filename"); // 23239283-92489-阿凡达.avi
			   fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
			System.out.println("fileName :" + fileName);
			// fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
			// System.out.println("FileName :" + fileName);
			// 上传的文件都是保存在/WEB-INF/upload目录下的子目录当中
			String fileSaveRootPath = this.getServletContext().getRealPath("/WEB-INF/saleContractfile");
			// 通过文件名找出文件的所在目录
			String path = fileSaveRootPath + "\\" + fileName;
			System.out.println("path: " + path);
			// 得到要下载的文件
			File file = new File(path);
			System.out.println("file: " + file);
			// 如果文件不存在
			/*if (!file.exists()) {
				request.setAttribute("message", "您要下载的资源已被删除！！");
				request.getRequestDispatcher("/message.jsp").forward(request, response);
				return;
			}*/
			// 处理文件名
			String realname = fileName;
			// 设置响应头，控制浏览器下载该文件
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
			// 读取要下载的文件，保存到文件输入流
			FileInputStream in = new FileInputStream(path);
			// 创建输出流
			OutputStream out = response.getOutputStream();
			// 创建缓冲区
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
			}
			// 关闭文件输入流
			in.close();
			// 关闭输出流
			out.close();
		}
		//下载工程包合同
		else if(action.equals("projectfile")) {
			String fileName = request.getParameter("filename"); // 23239283-92489-阿凡达.avi
			   fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
			System.out.println("fileName :" + fileName);
			// fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
			// System.out.println("FileName :" + fileName);
			// 上传的文件都是保存在/WEB-INF/upload目录下的子目录当中
			String fileSaveRootPath = this.getServletContext().getRealPath("/WEB-INF/projectpackfile");
			// 通过文件名找出文件的所在目录
			String path = fileSaveRootPath + "\\" + fileName;
			System.out.println("path: " + path);
			// 得到要下载的文件
			File file = new File(path);
			System.out.println("file: " + file);
			// 如果文件不存在
			/*if (!file.exists()) {
				request.setAttribute("message", "您要下载的资源已被删除！！");
				request.getRequestDispatcher("/message.jsp").forward(request, response);
				return;
			}*/
			// 处理文件名
			String realname = fileName;
			// 设置响应头，控制浏览器下载该文件
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
			// 读取要下载的文件，保存到文件输入流
			FileInputStream in = new FileInputStream(path);
			// 创建输出流
			OutputStream out = response.getOutputStream();
			// 创建缓冲区
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
			}
			// 关闭文件输入流
			in.close();
			// 关闭输出流
			out.close();
		}
		//工程包台账下载合同
		else if(action.equals("projectfile12")) {
			String fileName = request.getParameter("filename"); // 23239283-92489-阿凡达.avi
			fileName=fileName.replace("'", "");
			   fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
			System.out.println("fileName :" + fileName);
			// fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
			// System.out.println("FileName :" + fileName);
			// 上传的文件都是保存在/WEB-INF/upload目录下的子目录当中
			String fileSaveRootPath = this.getServletContext().getRealPath("/WEB-INF/projectpackfile");
			// 通过文件名找出文件的所在目录
			String path = fileSaveRootPath + "\\" + fileName;
			System.out.println("path: " + path);
			// 得到要下载的文件
			File file = new File(path);
			System.out.println("file: " + file);
			// 如果文件不存在
			/*if (!file.exists()) {
				request.setAttribute("message", "您要下载的资源已被删除！！");
				request.getRequestDispatcher("/message.jsp").forward(request, response);
				return;
			}*/
			// 处理文件名
			String realname = fileName;
			// 设置响应头，控制浏览器下载该文件
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
			// 读取要下载的文件，保存到文件输入流
			FileInputStream in = new FileInputStream(path);
			// 创建输出流
			OutputStream out = response.getOutputStream();
			// 创建缓冲区
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
			}
			// 关闭文件输入流
			in.close();
			// 关闭输出流
			out.close();
		}
		
		else if(action.equals("managecartPic")) {
			String fileName = request.getParameter("filename"); // 23239283-92489-阿凡达.avi
			   fileName = fileName.substring(fileName.lastIndexOf("/") + 1);
			System.out.println("fileName :" + fileName);
			// fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
			// System.out.println("FileName :" + fileName);
			// 上传的文件都是保存在/WEB-INF/upload目录下的子目录当中
			String fileSaveRootPath = this.getServletContext().getRealPath("/WEB-INF/managesCardfile");
			// 通过文件名找出文件的所在目录
			String path = fileSaveRootPath + "\\" + fileName;
			System.out.println("path: " + path);
			// 得到要下载的文件
			File file = new File(path);
			System.out.println("file: " + file);
			// 如果文件不存在
			/*if (!file.exists()) {
				request.setAttribute("message", "您要下载的资源已被删除！！");
				request.getRequestDispatcher("/message.jsp").forward(request, response);
				return;
			}*/
			// 处理文件名
			String realname = fileName;
			// 设置响应头，控制浏览器下载该文件
			response.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(realname, "UTF-8"));
			// 读取要下载的文件，保存到文件输入流
			FileInputStream in = new FileInputStream(path);
			// 创建输出流
			OutputStream out = response.getOutputStream();
			// 创建缓冲区
			byte buffer[] = new byte[1024];
			int len = 0;
			// 循环将输入流中的内容读取到缓冲区当中
			while ((len = in.read(buffer)) > 0) {
				// 输出缓冲区的内容到浏览器，实现文件下载
				out.write(buffer, 0, len);
			}
			// 关闭文件输入流
			in.close();
			// 关闭输出流
			out.close();
		}
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
