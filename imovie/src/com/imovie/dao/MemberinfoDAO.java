package com.imovie.dao;

import java.util.List;

import com.imovie.model.Memberinfo;

public interface MemberinfoDAO {

	public Integer save(Memberinfo member);
	
	public void update(Memberinfo member);
	
	public Memberinfo getMemberinfoByMemberId(Integer memberId);
	
	public int decreaseCreditByMemberId(Integer memberId,Integer decreasement);
	
	public int increaseCreditByMemberId(Integer memberId,Integer increment);
	
	public int decreaseBalanceByMemberId(Integer memberId,Float decreasement);
	
	public int increaseBalanceByMemberId(Integer memberId,Float increment);
	
	public List<Memberinfo> getAllMemberinfo();
	
	public List<Memberinfo> getPastYearMember();
}
