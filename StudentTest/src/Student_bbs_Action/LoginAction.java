package Student_bbs_Action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import Student_bbs_Dao.StudentBBS_Dao;
import Student_bbs_PO.UserPO;

import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport{
	private String username;
	private String password;
	private String message="error";
	private List list;
	private HttpServletRequest request;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	
	@Override
	public void validate() {
		if(getUsername()==null||getUsername().length()==0){
			addFieldError("error", "用户名不能为空");
		}else{
			StudentBBS_Dao info = new StudentBBS_Dao();
			list = info.queryInfo("username", getUsername());
			if(list.size()==0){
				addFieldError("error", "该用户尚未注册");
			}else if(getPassword()==null||getPassword().length()==0){
				addFieldError("error", "请输入密码");
			}else{
				UserPO ui = new UserPO();
				int count = 0;
				for(int i=0;i<list.size();i++){
					count++;
					ui = (UserPO) list.get(i);
					if(getUsername().equals(ui.getUsername())){
						if(ui.getPassword().equals(getPassword())){
							message = SUCCESS;
						}else{
							addFieldError("error", "登录密码不正确");
						}
					}
				}
			}
		}
	}
	
	@Override
	public String execute() throws Exception {
		request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		session.setAttribute("username", getUsername());
		return message;
	}
	
	
	
	
}
