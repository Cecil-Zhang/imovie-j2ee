package com.imovie.service.Impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.imovie.dao.MemberinfoDAO;
import com.imovie.dao.MovieDAO;
import com.imovie.dao.OrderDAO;
import com.imovie.dao.RechargeDAO;
import com.imovie.dao.ScreeningPlanDAO;
import com.imovie.model.Memberinfo;
import com.imovie.service.ManagerService;

@Service("managerService")
public class ManagerServiceImpl implements ManagerService{
	@Autowired
	private MemberinfoDAO memberinfoDao;
	@Autowired
	private OrderDAO orderDao;
	@Autowired
	private RechargeDAO rechargeDao;
	@Autowired
	private ScreeningPlanDAO screeningPlanDao;
	
	@Override
	public HashMap<String, Integer> ageStatic() {
		// TODO Auto-generated method stub
		List<Memberinfo> list=memberinfoDao.getAllMemberinfo();
		String group1="0岁~18岁";
		String group2="19岁~30岁";
		String group3="31岁~40岁";
		String group4="41岁及以上";
		int count1=0;
		int count2=0;
		int count3=0;
		int count4=0;
		for(Memberinfo info:list){
			int age=info.getAge();
			if(age>=0 && age<=18){
				count1++;
			}else if(age>18 && age<=30){
				count2++;
			}else if(age>30 && age<=40){
				count3++;
			}else{
				count4++;
			}
		}
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		map.put(group1, count1);
		map.put(group2, count2);
		map.put(group3, count3);
		map.put(group4, count4);
		return map;
	}

	@Override
	public HashMap<String, Integer> genderStatic() {
		// TODO Auto-generated method stub
		List<Memberinfo> list=memberinfoDao.getAllMemberinfo();
		String group1="男";
		String group2="女";
		int count1=0;
		int count2=0;
		for(Memberinfo info:list){
			if(info.getGender().equals("male")){
				count1++;
			}else{
				count2++;
			}
		}
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		map.put(group1, count1);
		map.put(group2, count2);
		return map;
	}

	@Override
	public HashMap<String, Integer> residenceStatic() {
		// TODO Auto-generated method stub
		List<Memberinfo> list=memberinfoDao.getAllMemberinfo();
		String group1="鼓楼区";
		String group2="栖霞区";
		String group3="浦口区";
		String group4="玄武区";
		String group5="秦淮区";
		String group6="雨花台区";
		int count1=0;
		int count2=0;
		int count3=0;
		int count4=0;
		int count5=0;
		int count6=0;
		for(Memberinfo info:list){
			if(info.getResidence().equals("鼓楼区")){
				count1++;
			}else if(info.getResidence().equals("栖霞区")){
				count2++;
			}else if(info.getResidence().equals("浦口区")){
				count3++;
			}else if(info.getResidence().equals("玄武区")){
				count4++;
			}else if(info.getResidence().equals("秦淮区")){
				count5++;
			}else{
				count6++;
			}
		}
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		map.put(group1, count1);
		map.put(group2, count2);
		map.put(group3, count3);
		map.put(group4, count4);
		map.put(group5, count5);
		map.put(group6, count6);
		return map;
	}

	@Override
	public HashMap<String, Integer> consumptionStatic() {
		// TODO Auto-generated method stub
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		List<Object[]> list=orderDao.orderStaticByMonth();
		for(Object[] os:list){
			String group=String.valueOf(os[0]);
			Double cot=(Double) os[1];
			Integer count=Integer.valueOf(cot.intValue());
			map.put(group, count);
		}
		return map;
	}

	@Override
	public HashMap<String, Integer> rechargeStatic() {
		// TODO Auto-generated method stub
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		List<Object[]> list=rechargeDao.rechargeStaticByMonth();
		for(Object[] os:list){
			String group=String.valueOf(os[0]);
			Integer count=((Long) os[1]).intValue();
			map.put(group, count);
		}
		return map;
	}

	@Override
	public HashMap<String, Integer> activityStatic() {
		// TODO Auto-generated method stub
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		List<Object[]> list=screeningPlanDao.activityStaticByMonth();
		for(Object[] os:list){
			String group=String.valueOf(os[0]);
			Integer count=((Long) os[1]).intValue();
			map.put(group, count);
		}
		return map;
	}

	@Override
	public HashMap<String, Integer> cardStatic() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HashMap<String, Integer> activityJoinStatic() {
		// TODO Auto-generated method stub
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		List<Object[]> list=orderDao.activityJoinStaticByMonth();
		for(Object[] os:list){
			String group=String.valueOf(os[0]);
			Integer count=((Long) os[1]).intValue();
			map.put(group, count);
		}
		return map;
	}

	@Override
	public HashMap<String, Integer> monthCountStatic() {
		// TODO Auto-generated method stub
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		List<Object[]> list=screeningPlanDao.monthCountStatic();
		for(Object[] os:list){
			String group=String.valueOf(os[0]);
			Integer count=((Long) os[1]).intValue();
			map.put(group, count);
		}
		return map;
	}

	@Override
	public HashMap<String, Integer> dayCountStatic() {
		// TODO Auto-generated method stub
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		List<Object[]> list=screeningPlanDao.dayCountStatic();
		for(Object[] os:list){
			String group=String.valueOf(os[0]);
			Integer count=((Long) os[1]).intValue();
			map.put(group, count);
		}
		return map;
	}

	@Override
	public HashMap<String, Double> videoHallStatic(String videoHall) {
		// TODO Auto-generated method stub
		HashMap<String,Double> map=new HashMap<String,Double>();
		List<Object[]> list=screeningPlanDao.videoHallStatic(videoHall);
		for(Object[] os:list){
			String month=String.valueOf(os[0]);
			Double rate=(Double) os[1];
			map.put(month, rate);
		}
		return map;
	}

	@Override
	public HashMap<String, Double> movieStatic(String movieId) {
		// TODO Auto-generated method stub
		HashMap<String,Double> map=new HashMap<String,Double>();
		List<Object[]> list=screeningPlanDao.movieStatic(Integer.parseInt(movieId));
		for(Object[] os:list){
			String month=String.valueOf(os[0]);
			Double rate=(Double) os[1];
			map.put(month, rate);
		}
		return map;
	}

	@Override
	public HashMap<String, Integer> purchaseWithCardStatic() {
		// TODO Auto-generated method stub
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		List<Object[]> list=orderDao.purchaseWithCardStatic();
		for(Object[] os:list){
			String month=String.valueOf(os[0]);
			double rate=((Double) os[1]).doubleValue();
			Long temp1=Math.round(rate);
			Integer temp2=new Integer(temp1.intValue());
			map.put(month, temp2);
		}
		return map;
	}

	@Override
	public HashMap<String, Integer> purchaseWithCashStatic() {
		// TODO Auto-generated method stub
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		List<Object[]> list=orderDao.purchaseWithCashStatic();
		for(Object[] os:list){
			String month=String.valueOf(os[0]);
			double rate=((Double) os[1]).doubleValue();
			Long temp1=Math.round(rate);
			Integer temp2=new Integer(temp1.intValue());
			map.put(month, temp2);
		}
		return map;
	}

	@Override
	public HashMap<String, Integer> userStateStatic() {
		// TODO Auto-generated method stub
		HashMap<String,Integer> map=new HashMap<String,Integer>();
		int notActivated=0;  
		int activated=0;
		int canceled=0;
		int stoped=0;
		List<Memberinfo> list=memberinfoDao.getAllMemberinfo();
		for(Memberinfo info:list){
			if(info.getState().equals("未激活")){
				notActivated++;
			}else if(info.getState().equals("已激活")){
				activated++;
			}else if(info.getState().equals("已暂停")){
				canceled++;
			}else if(info.getState().equals("已停止")){
				stoped++;
			}
		}
		map.put("未激活", notActivated);
		map.put("已激活", activated);
		map.put("已暂停", canceled);
		map.put("已停止", stoped);
		return map;
	}

}
