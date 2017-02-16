package Student_bbs_Action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


import Student_bbs_Dao.StudentBBS_Dao;
import Student_bbs_PO.PostPO;
import Student_bbs_PO.ProductPO;
import Student_bbs_PO.ReplyPO;
import Student_bbs_PO.UserPO;

import com.opensymphony.xwork2.ActionSupport;

public class FindAction extends ActionSupport {
	private String productTitle;
	private HttpServletRequest request;
	
	public String getProductTitle() {
		return productTitle;
	}
	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}
	
	public String execute() throws Exception{
		request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("title", getProductTitle());
		return SUCCESS;
	}
}
