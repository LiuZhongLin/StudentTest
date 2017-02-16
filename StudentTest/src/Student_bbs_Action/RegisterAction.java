package Student_bbs_Action;

import java.util.List;


import Student_bbs_Dao.StudentBBS_Dao;
import Student_bbs_PO.UserPO;

import com.opensymphony.xwork2.ActionSupport;

public class RegisterAction extends ActionSupport {
	private String username;
	private String password1;
	private String password2;
	private String mess="error";
	private List list;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword1() {
		return password1;
	}
	public void setPassword1(String password1) {
		this.password1 = password1;
	}
	public String getPassword2() {
		return password2;
	}
	public void setPassword2(String password2) {
		this.password2 = password2;
	}
	
	@Override
	public void validate() {
		if(getUsername()==null||getUsername().length()==0){
			addFieldError("error", "用户名不能为空");
		}else if(getUsername().length()<3||getUsername().length()>10){
			addFieldError("error", "用户名必须在3~10个字符之间");
		}else if(getPassword1()==null||getPassword1().length()==0){
			addFieldError("error", "密码不能为空");
		}else if(getPassword2()==null||getPassword2().length()==0){
			addFieldError("error", "第二次输入的密码不能为空");
		}else if(!getPassword1().equals(getPassword2())){
			addFieldError("error","两次密码不一致");
		}else{
			StudentBBS_Dao info = new StudentBBS_Dao();
			list = info.queryInfo("username", getUsername());
			UserPO ui = new UserPO();
			for(int i=0;i<list.size();i++){
				ui = (UserPO) list.get(i);
				if(ui.getUsername().equals(getUsername())){
					addFieldError("error", "用户名已经存在");
				}
			}
		}
	}
	
	public UserPO userinfo(){
		UserPO info = new UserPO();
		info.setUsername(getUsername());
		info.setPassword(getPassword1());
		return info;
	}
	
	public String execute() throws Exception{
		StudentBBS_Dao lr = new StudentBBS_Dao();
		String ri = lr.saveInfo(userinfo());
		if(ri.equals("success")){
			mess="success";
		}
		return mess;
	}
}
