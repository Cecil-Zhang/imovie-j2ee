package com.imovie.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.imovie.model.Level;
import com.imovie.model.Recharge;
import com.imovie.model.Memberinfo;
import com.imovie.model.User;
import com.imovie.service.UserService;

@Controller
public class UserAction extends BaseAction{

	/**
	 * 
	 */
	private static final long serialVersionUID = -6137713217214786125L;

	@Autowired
	private UserService userService;
	
	private List<User> users;
	private List<Level> levels;
	private String mylevel;
	private Integer progress;
	private Integer gap;
	private String search;
	private String userid;
	private String password;
	private String role;
	private String username;
	private String age;
	private String residence;
	private String gender;
	private String bank;
	private String bankAccount;
	private File image;
	private String imageContentType;
	private String imageFileName;
	private User checkUser;
	private final String baseDir="D:\\eclipseEeWorkspace\\imovie\\WebContent\\common\\img\\";
	private String amount;
	
	public List<User> getUsers() {
		return users;
	}

	public void setUsers(List<User> users) {
		this.users = users;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getProgress() {
		return progress;
	}

	public void setProgress(Integer progress) {
		this.progress = progress;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public UserService getUserService() {
		return userService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getResidence() {
		return residence;
	}

	public void setResidence(String residence) {
		this.residence = residence;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	

	public File getImage() {
		return image;
	}

	public void setImage(File image) {
		this.image = image;
	}

	public String getImageContentType() {
		return imageContentType;
	}

	public void setImageContentType(String imageContentType) {
		this.imageContentType = imageContentType;
	}

	public String getImageFileName() {
		return imageFileName;
	}

	public void setImageFileName(String imageFileName) {
		this.imageFileName = imageFileName;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}

	public User getCheckUser() {
		return checkUser;
	}

	public void setCheckUser(User checkUser) {
		this.checkUser = checkUser;
	}

	public List<Level> getLevels() {
		return levels;
	}

	public void setLevels(List<Level> levels) {
		this.levels = levels;
	}

	public String getMylevel() {
		return mylevel;
	}

	public void setMylevel(String mylevel) {
		this.mylevel = mylevel;
	}

	public Integer getGap() {
		return gap;
	}

	public void setGap(Integer gap) {
		this.gap = gap;
	}

	//登录
	public String execute(){
		User user=userService.loginUser(userid, password, role);
		if(user!=null){
			session.put("user", user);
			switch(user.getRole()){
			case "worker":
				return "worker_index";
			case "manager":
				return "manager_index";
			default:
				return "member_index";
			}
			
		}else{
			return "signup";
		}
	}
	
	//注册
	public String Signup(){
		try {
			InputStream is=new FileInputStream(image);
			@SuppressWarnings("deprecation")
			File fileLocation=new File(baseDir);
			if(!fileLocation.exists()){
				//如果目录不存在则创建
				boolean isCreated=fileLocation.mkdir();
				if(!isCreated){
					return "failure";
				}
			}
			StringBuffer newFileName=new StringBuffer(this.getImageFileName());
			int index=newFileName.indexOf(".", newFileName.length()-6);
			//为文件生成随机文件名
			char[] numList=new char[6];
			for(int i=0;i<6;i++){
				int rand=(int) Math.floor((Math.random()*10));
				numList[i]=String.valueOf(rand).charAt(0);
			}
			newFileName.insert(index, numList);
			File uploadFile=new File(baseDir,newFileName.toString());
			OutputStream out = new FileOutputStream(uploadFile);   
            byte[] buffer = new byte[1024 * 1024];   
            int length;   
            while ((length = is.read(buffer)) > 0) {   
                out.write(buffer, 0, length);   
            }   
            is.close();   
            out.close();
			this.userid=String.valueOf(userService.signupUser(username, age, residence, newFileName.toString(), gender, bank, bankAccount, password));
			if(userid!=null){
				return "success";
			}else{
				return "failure";
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "failure";
		}
		
	}
	
	//更改个人信息
	public String EditInformation(){
		User user=(User) session.get("user");
		Memberinfo info=user.getInformation();
		if(image!=null){
			try {
				InputStream is=new FileInputStream(image);
				@SuppressWarnings("deprecation")
				File fileLocation=new File(baseDir);
				if(!fileLocation.exists()){
					//如果目录不存在则创建
					boolean isCreated=fileLocation.mkdir();
					if(!isCreated){
						return "failure";
					}
				}
				StringBuffer newFileName=new StringBuffer(this.getImageFileName());
				int index=newFileName.indexOf(".", newFileName.length()-6);
				//为文件生成随机文件名
				char[] numList=new char[6];
				for(int i=0;i<6;i++){
					int rand=(int) Math.floor((Math.random()*10));
					numList[i]=String.valueOf(rand).charAt(0);
				}
				newFileName.insert(index, numList);
				File uploadFile=new File(baseDir,newFileName.toString());
				OutputStream out = new FileOutputStream(uploadFile);   
	            byte[] buffer = new byte[1024 * 1024];   
	            int length;   
	            while ((length = is.read(buffer)) > 0) {   
	                out.write(buffer, 0, length);   
	            }   
	            is.close();   
	            out.close();
				info.setImage(newFileName.toString());
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				return "failure";
			}
		}
		if(username!=null){
			info.setUsername(username);
		}
		if(age!=null){
			info.setAge(Integer.parseInt(age));
		}
		info.setResidence(residence);
		info.setGender(gender);
		info.setBank(bank);
		if(bankAccount!=null){
			info.setBankAccout(bankAccount);
		}
		if(password!=null){
			user.setPassword(password);
		}
		user.setInformation(info);
		userService.updateUser(user);
		session.put("user", userService.loginUser(String.valueOf(user.getUserId()), password, "member"));
		return "member_myInformation";
	}
	
	//充值
	public String Recharge(){
		User user=(User) session.get("user");
		Memberinfo info=user.getInformation();
		if(password.equals(user.getPassword())&&bank.equals(info.getBank())&&bankAccount.equals(info.getBankAccout())){
			if(userService.rechargeMemberinfo(amount, user)){
				session.put("user", userService.loginUser(String.valueOf(user.getUserId()), password, "member"));
				return "member_rechargeComplete";
			}
		}
		
		return "failure";
	}
	
	//充值记录
	public String RechargeRecord(){
		if(userid==null){
			User user=(User) session.get("user");
			checkUser=userService.getRechargeRecordForUser(String.valueOf(user.getUserId()));
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
			for(Recharge r:checkUser.getRechargeList()){
				String time=sdf.format(r.getRechargeTime());
				r.setRechargeTimeInString(time);
			}
			return "member_rechargeRecord";
		}else{
			checkUser=userService.getRechargeRecordForUser(userid);
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy年MM月dd日 HH:mm");
			for(Recharge r:checkUser.getRechargeList()){
				String time=sdf.format(r.getRechargeTime());
				r.setRechargeTimeInString(time);
			}
			return "worker_rechargeRecord";
		}
	}
	
	//注销
	public String Logout(){
		session.remove("user");
		return "login";
	}
	
	//工作人员查看会员个人信息
	public String UserInformation(){
		checkUser=userService.getUserByUserId(userid);
		return "worker_userInformation";
	}
	
	
	//工作人员搜索会员
	public String Search(){
		try {
			search=new String(search.getBytes("ISO-8859-1"), "UTF-8");
			if(search!=null && search!=""){
				users=userService.searchUser(search);
				return "worker_search";
			}else{
				return "worker_index";
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "worker_index";
		}
	}
	
	//查看等级制度
	public String ShowLevel(){
		levels=userService.getAllLevel();
		User user=(User)session.get("user");
		int temp=userService.getMyRechargeAmount(String.valueOf(user.getUserId()));
		amount=String.valueOf(temp);
		for(Level l:levels){
			if(temp<l.getUpperLimit()&&temp>=l.getLowerLimit()){
				mylevel=l.getLevelName();
				gap=l.getUpperLimit()-temp;
				progress=(int)((temp*1.0)/l.getUpperLimit()*100);
				System.out.println(progress);
			}
		}
		return "member_credit";
	}
	
	
}
