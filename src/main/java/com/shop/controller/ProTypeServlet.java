package com.shop.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import com.shop.model.ProTypeService;
import com.shop.model.ProTypeVO;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ProTypeServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// 查詢單一類別資料
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			String str = req.getParameter("proTypeId");
			if (str == null || (str.trim()).length() == 0) {
				errorMsgs.add("請輸入商品類別編號");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/shop/select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			Integer proTypeId = null;
			try {
				proTypeId = Integer.valueOf(str);
			} catch (Exception e) {
				errorMsgs.add("商品類別編號格式不正確");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/shop/select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 2.開始查詢資料 *****************************************/
			ProTypeService proTypeSvc = new ProTypeService();
			ProTypeVO proTypeVO = proTypeSvc.getOneProType(proTypeId);
			if (proTypeVO == null) {
				errorMsgs.add("查無資料");
			}
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/shop/select_page.jsp");
				failureView.forward(req, res);
				return;// 程式中斷
			}

			/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
			req.setAttribute("proTypeVO", proTypeVO); // 資料庫取出的VO物件,存入req
			String url = "/back_end/shop/listOneShop.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
			successView.forward(req, res);
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ****************************************/
			Integer proTypeId = Integer.valueOf(req.getParameter("proTypeId"));

			/*************************** 2.開始查詢資料 ****************************************/
			ProTypeService proTypeSvc = new ProTypeService();
			ProTypeVO proTypeVO = proTypeSvc.getOneProType(proTypeId);

			/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
			req.setAttribute("proTypeVO", proTypeVO); // 資料庫取出的empVO物件,存入req
			String url = "/back_end/shop/update_shop_input.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
			successView.forward(req, res);
		}

		if ("update".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
			Integer proTypeId = Integer.valueOf(req.getParameter("proTypeId").trim());

			String proTypeName = req.getParameter("proTypeName");
			String proTypeNameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (proTypeName == null || proTypeName.trim().length() == 0) {
				errorMsgs.add("商品類別名稱: 請勿空白");
			} else if (!proTypeName.trim().matches(proTypeNameReg)) { // 以下練習正則(規)表示式(regular-expression)
				errorMsgs.add("商品類別名稱: 只能是中、英文字母 , 且長度必需在2到10之間");
			}
			ProTypeVO proTypeVO = new ProTypeVO();
			proTypeVO.setProTypeId(proTypeId);
			proTypeVO.setProTypeName(proTypeName);

			
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("proTypeVO", proTypeVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/shop/update_emp_input.jsp");
				failureView.forward(req, res);
				return; // 程式中斷
			}

			/*************************** 2.開始修改資料 *****************************************/
			ProTypeService proTypeSvc = new ProTypeService();
			proTypeVO = proTypeSvc.updateProType(proTypeId, proTypeName);

			/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
			req.setAttribute("proTypeVO", proTypeVO); 
			String url = "/back_end/shop/listOneShop.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}

		if ("insert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			String proTypeName = req.getParameter("proTypeName");
			if (proTypeName == null || proTypeName.trim().length() == 0) {
				errorMsgs.add("商品類別名稱: 請勿空白");
			}

			ProTypeVO proTypeVO = new ProTypeVO();
			proTypeVO.setProTypeName(proTypeName);

			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("proTypeVO", proTypeVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/back_end/shop/addShop.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始新增資料 ***************************************/
			ProTypeService proTypeSvc = new ProTypeService();
			proTypeVO = proTypeSvc.addProType(proTypeName);

			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/back_end/shop/listAllShop.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			/*************************** 1.接收請求參數 ***************************************/
			Integer proTypeId = Integer.valueOf(req.getParameter("proTypeId"));
			/*************************** 2.開始刪除資料 ***************************************/
			ProTypeService proTypeSvc = new ProTypeService();
			proTypeSvc.deleteProType(proTypeId);

			/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
			String url = "/back_end/shop/listAllShop.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
			successView.forward(req, res);
		}
	}
}
