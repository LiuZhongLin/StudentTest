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

public class ProductAction extends ActionSupport {
	private String title;
	private String content;
	private String price;
	private File upload;
	private String uploadFileName;
	private String savePath;
	private String message = "error";
	
	
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getSavePath() {
		return ServletActionContext.getServletContext().getRealPath(savePath);
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	//校验器
	public void validate() {
		HttpServletRequest request =ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String user =(String)session.getAttribute("username");
		if(user == null){
			addFieldError("title", "你还没有登录账号,不能进行回帖！！ ");
		}else if(getTitle()==null||getTitle().length()==0){
			addFieldError("title", "商品名称不允许为空");
		}
		else if(getPrice()==null||getPrice().length()==0){
			addFieldError("price", "价格不允许为空");
		}
		else if(getContent()==null||getContent().length()==0){
			addFieldError("content", "内容不允许为空");
		}
		}
	
	public ProductPO product() throws IOException{
		FileOutputStream fos = new FileOutputStream(getSavePath()+"\\"+
				getUploadFileName());
					FileInputStream fis = new FileInputStream(getUpload());
					byte[] buffer = new byte[1024];
					int len = 0;
					while((len=fis.read(buffer))>0){
						fos.write(buffer,0,len);
					}
					fos.close();
//		String photopath = "save_pic/"+getUploadFileName();
		
		HttpServletRequest request =ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String user =(String)session.getAttribute("username");//返回登录用户名
		StudentBBS_Dao bbs= new StudentBBS_Dao();
		List list = bbs.queryInfo("username", user);
		UserPO ui = new UserPO();
		for(int i=0;i<list.size();i++){
			ui = (UserPO) list.get(i);
		}
		int userId = ui.getId(); //返回用户ID
		
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String pb_time =time.format(new Date());
		ProductPO info = new ProductPO();
		info.setProductTitle(getTitle());
		info.setProductContent(getContent());
		info.setPhotoPath(getUploadFileName());
		info.setPrice(getPrice());
		info.setPulishTime(pb_time);
		info.setUid(userId);
		return info;
	}
	
	public String execute() throws Exception{
		StudentBBS_Dao lr = new StudentBBS_Dao();
		String ri = lr.saveProduct(product());
		if(ri.equals("success")){
			message="success";
		}
		return message;
	}
}
