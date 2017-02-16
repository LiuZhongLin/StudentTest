package Student_bbs_Action;

import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


import Student_bbs_Dao.StudentBBS_Dao;
import Student_bbs_PO.PostPO;
import Student_bbs_PO.ReplyPO;
import Student_bbs_PO.UserPO;

import com.opensymphony.xwork2.ActionSupport;

public class PostAction extends ActionSupport {
	private String content;
	private String title;
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
	
	//校验器
	public void validate() {
		HttpServletRequest request =ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String user =(String)session.getAttribute("username");
		if(user == null){
			addFieldError("title", "你还没有登录账号,不能进行回帖！！ ");
		}else if(getTitle()==null||getTitle().length()==0){
			addFieldError("title", "主题不允许为空");
		}
		else if(getContent()==null||getContent().length()==0){
			addFieldError("content", "内容不允许为空");
			}
		}
	
	public PostPO post(){
		HttpServletRequest request =ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String user =(String)session.getAttribute("username");//返回登录用户名
		StudentBBS_Dao bbs= new StudentBBS_Dao();
		List list = bbs.queryInfo("username", user);
		UserPO ui = new UserPO();
		for(int i=0;i<list.size();i++){
			ui = (UserPO) list.get(i);
		}
		int userId = ui.getId();
		SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd hh:mm");
		String pb_time =time.format(new Date());
		PostPO info = new PostPO();
		info.setTitle(getTitle());
		info.setContent(getContent());
		info.setPublishTime(pb_time);
		info.setUid(userId);
		return info;
	}
	
	public String execute() throws Exception{
		StudentBBS_Dao lr = new StudentBBS_Dao();
		String ri = lr.savePost(post());
		if(ri.equals("success")){
			message="success";
		}
		return message;
	}
}
