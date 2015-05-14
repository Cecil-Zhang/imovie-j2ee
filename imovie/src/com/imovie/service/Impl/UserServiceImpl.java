package com.imovie.service.Impl;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.imovie.dao.LevelDAO;
import com.imovie.dao.MemberinfoDAO;
import com.imovie.dao.RechargeDAO;
import com.imovie.dao.UserDAO;
import com.imovie.model.Level;
import com.imovie.model.Memberinfo;
import com.imovie.model.Recharge;
import com.imovie.model.User;
import com.imovie.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDAO userDao;
	@Autowired
	private MemberinfoDAO memberinfoDao;
	@Autowired
	private RechargeDAO rechargeDao;
	@Autowired
	private LevelDAO levelDao;

	@Override
	public BigDecimal signupUser(String username, String age, String residence,
			String image, String gender, String bank, String account,
			String password) {
		// TODO Auto-generated method stub
		User user=new User();
		user.setPassword(password);
		user.setRole("member");
		Memberinfo info=new Memberinfo();
		info.setUsername(username);
		info.setAge(Integer.parseInt(age));
		info.setResidence(residence);
		info.setImage(image);
		info.setGender(gender);
		info.setBank(bank);
		info.setBankAccout(account);
		info.setBalance(new Float(0.0));
		info.setCredit(0);
		info.setState("未激活");
		Timestamp time=new Timestamp(System.currentTimeMillis());
		info.setLastRecharge(time);
		user.setInformation(info);
		return userDao.save(user);
	}

	@Override
	public User loginUser(String userid, String password, String role) {
		// TODO Auto-generated method stub
		BigDecimal userId=new BigDecimal(userid);
		return userDao.login(userId, password, role);
	}

	@Override
	public boolean rechargeMemberinfo(String amount, User user) {
		// TODO Auto-generated method stub
		if(memberinfoDao.increaseBalanceByMemberId(user.getInformation().getMemberId(), Float.parseFloat(amount))>0){
			Recharge re=new Recharge();
			re.setAmount(Integer.parseInt(amount));
			re.setUser(user);
			rechargeDao.save(re);
			return true;
		}else{
			return false;
		}
	}

	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userDao.update(user);
	}

	@Override
	public User getUserByUserId(String userid) {
		// TODO Auto-generated method stub
		BigDecimal userId=new BigDecimal(userid);
		return userDao.getUserByUserId(userId);
	}

	@Override
	public List<User> searchUser(String search) {
		// TODO Auto-generated method stub
		return userDao.searchByIdAndName(search);
	}

	@Override
	public User getRechargeRecordForUser(String userid) {
		// TODO Auto-generated method stub
		BigDecimal id=new BigDecimal(userid);
		return userDao.getUserRechargeListByUserId(id);
	}

	@Override
	public List<Level> getAllLevel() {
		// TODO Auto-generated method stub
		return levelDao.getAllLevel();
	}

	@Override
	public int getMyRechargeAmount(String userId) {
		// TODO Auto-generated method stub
		BigDecimal id=new BigDecimal(userId);
		User user=userDao.getUserRechargeListByUserId(id);
		int amount=0;
		for(Recharge re:user.getRechargeList()){
			amount+=re.getAmount();
		}
		return amount;
	}

	 //@Scheduled(cron="0/10 * *  * * ? ")  
	@Scheduled(cron="0 59 23 * * ?")
	@Override
	public void checkStateForMemberinfo() {
		// 定时器检查会员资格
		List<Memberinfo> list=memberinfoDao.getPastYearMember();
		for(Memberinfo info:list){
			if(info.getState().equals("已激活") && (info.getBalance()<=0)){
				info.setState("已暂停");
				Timestamp time=new Timestamp(System.currentTimeMillis());
				info.setLastRecharge(time);
			}else if(info.getState().equals("已暂停")){
				info.setState("已取消");
			}
			memberinfoDao.update(info);
		}
	}

	@Override
	public boolean stopQualifyForUser(User user) {
		// TODO Auto-generated method stub
		user.getInformation().setState("已暂停");
		memberinfoDao.update(user.getInformation());
		return true;
	}

	@Override
	public void creditExchangeForUser(User user, String credit) {
		// TODO Auto-generated method stub
		Float cre=Float.parseFloat(credit);
		float result=cre/100;
		Memberinfo info=user.getInformation();
		info.setCredit(info.getCredit()-Integer.parseInt(credit));
		info.setBalance(info.getBalance()+result);
		memberinfoDao.update(info);
	}


}
