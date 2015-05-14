package com.imovie.model;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.apache.struts2.json.annotations.JSON;

@Entity
@Table(name="tb_screeningPlan")
public class ScreeningPlan extends BaseBean {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer planId;
	@Transient
	private String screeningTimeInString;
	private Timestamp screeningTime;
	private String screeningHall;
	private Integer seatPrice;
	private String language;
	private String planState;
	private Integer seatSaled;
	private Boolean seat01;
	private Boolean seat02;
	private Boolean seat03;
	private Boolean seat04;
	private Boolean seat05;
	private Boolean seat06;
	private Boolean seat07;
	private Boolean seat08;
	private Boolean seat09;
	private Boolean seat11;
	private Boolean seat12;
	private Boolean seat13;
	private Boolean seat14;
	private Boolean seat15;
	private Boolean seat16;
	private Boolean seat17;
	private Boolean seat18;
	private Boolean seat19;
	private Boolean seat21;
	private Boolean seat22;
	private Boolean seat23;
	private Boolean seat24;
	private Boolean seat25;
	private Boolean seat26;
	private Boolean seat27;
	private Boolean seat28;
	private Boolean seat29;
	private Boolean seat31;
	private Boolean seat32;
	private Boolean seat33;
	private Boolean seat34;
	private Boolean seat35;
	private Boolean seat36;
	private Boolean seat37;
	private Boolean seat38;
	private Boolean seat39;
	private Boolean seat41;
	private Boolean seat42;
	private Boolean seat43;
	private Boolean seat44;
	private Boolean seat45;
	private Boolean seat46;
	private Boolean seat47;
	private Boolean seat48;
	private Boolean seat49;
	private Boolean seat51;
	private Boolean seat52;
	private Boolean seat53;
	private Boolean seat54;
	private Boolean seat55;
	private Boolean seat56;
	private Boolean seat57;
	private Boolean seat58;
	private Boolean seat59;
	private Boolean seat61;
	private Boolean seat62;
	private Boolean seat63;
	private Boolean seat64;
	private Boolean seat65;
	private Boolean seat66;
	private Boolean seat67;
	private Boolean seat68;
	private Boolean seat69;
	private Boolean seat71;
	private Boolean seat72;
	private Boolean seat73;
	private Boolean seat74;
	private Boolean seat75;
	private Boolean seat76;
	private Boolean seat77;
	private Boolean seat78;
	private Boolean seat79;
	
	@ManyToOne(fetch=FetchType.LAZY,cascade={CascadeType.MERGE})
	@JoinColumn(name="movieId")
	private Movie movie;
	
	@ManyToOne(cascade={CascadeType.MERGE})
	@JoinColumn(name="activityId")
	private Activity activity;
	
	@OneToMany(mappedBy="purchaseMovie")
	private List<Order> orderList=new ArrayList<Order>();
	
	@Transient
	private Integer orderId;
	
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}
	@JSON(serialize=false)
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	public Movie getMovie() {
		return movie;
	}
	public void setMovie(Movie movie) {
		this.movie = movie;
	}
	@JSON(serialize=false)
	public Activity getActivity() {
		return activity;
	}
	public void setActivity(Activity activity) {
		this.activity = activity;
	}
	public Integer getPlanId() {
		return planId;
	}
	public void setPlanId(Integer planId) {
		this.planId = planId;
	}
	public String getScreeningTimeInString() {
		return screeningTimeInString;
	}
	public void setScreeningTimeInString(String screeningTimeInString) {
		this.screeningTimeInString = screeningTimeInString;
	}
	@JSON(format="yyyy年MM月dd HH:mm")
	public Timestamp getScreeningTime() {
		return screeningTime;
	}
	public void setScreeningTime(Timestamp screeningTime) {
		this.screeningTime = screeningTime;
	}
	public String getScreeningHall() {
		return screeningHall;
	}
	public void setScreeningHall(String screeningHall) {
		this.screeningHall = screeningHall;
	}
	public Integer getSeatPrice() {
		return seatPrice;
	}
	public void setSeatPrice(Integer seatPrice) {
		this.seatPrice = seatPrice;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getPlanState() {
		return planState;
	}
	public void setPlanState(String planState) {
		this.planState = planState;
	}
	public Integer getSeatSaled() {
		return seatSaled;
	}
	public void setSeatSaled(Integer seatSaled) {
		this.seatSaled = seatSaled;
	}
	public Boolean getSeat01() {
		return seat01;
	}
	public void setSeat01(Boolean seat01) {
		this.seat01 = seat01;
	}
	public Boolean getSeat02() {
		return seat02;
	}
	public void setSeat02(Boolean seat02) {
		this.seat02 = seat02;
	}
	public Boolean getSeat03() {
		return seat03;
	}
	public void setSeat03(Boolean seat03) {
		this.seat03 = seat03;
	}
	public Boolean getSeat04() {
		return seat04;
	}
	public void setSeat04(Boolean seat04) {
		this.seat04 = seat04;
	}
	public Boolean getSeat05() {
		return seat05;
	}
	public void setSeat05(Boolean seat05) {
		this.seat05 = seat05;
	}
	public Boolean getSeat06() {
		return seat06;
	}
	public void setSeat06(Boolean seat06) {
		this.seat06 = seat06;
	}
	public Boolean getSeat07() {
		return seat07;
	}
	public void setSeat07(Boolean seat07) {
		this.seat07 = seat07;
	}
	public Boolean getSeat08() {
		return seat08;
	}
	public void setSeat08(Boolean seat08) {
		this.seat08 = seat08;
	}
	public Boolean getSeat09() {
		return seat09;
	}
	public void setSeat09(Boolean seat09) {
		this.seat09 = seat09;
	}
	public Boolean getSeat11() {
		return seat11;
	}
	public void setSeat11(Boolean seat11) {
		this.seat11 = seat11;
	}
	public Boolean getSeat12() {
		return seat12;
	}
	public void setSeat12(Boolean seat12) {
		this.seat12 = seat12;
	}
	public Boolean getSeat13() {
		return seat13;
	}
	public void setSeat13(Boolean seat13) {
		this.seat13 = seat13;
	}
	public Boolean getSeat14() {
		return seat14;
	}
	public void setSeat14(Boolean seat14) {
		this.seat14 = seat14;
	}
	public Boolean getSeat15() {
		return seat15;
	}
	public void setSeat15(Boolean seat15) {
		this.seat15 = seat15;
	}
	public Boolean getSeat16() {
		return seat16;
	}
	public void setSeat16(Boolean seat16) {
		this.seat16 = seat16;
	}
	public Boolean getSeat17() {
		return seat17;
	}
	public void setSeat17(Boolean seat17) {
		this.seat17 = seat17;
	}
	public Boolean getSeat18() {
		return seat18;
	}
	public void setSeat18(Boolean seat18) {
		this.seat18 = seat18;
	}
	public Boolean getSeat19() {
		return seat19;
	}
	public void setSeat19(Boolean seat19) {
		this.seat19 = seat19;
	}
	public Boolean getSeat21() {
		return seat21;
	}
	public void setSeat21(Boolean seat21) {
		this.seat21 = seat21;
	}
	public Boolean getSeat22() {
		return seat22;
	}
	public void setSeat22(Boolean seat22) {
		this.seat22 = seat22;
	}
	public Boolean getSeat23() {
		return seat23;
	}
	public void setSeat23(Boolean seat23) {
		this.seat23 = seat23;
	}
	public Boolean getSeat24() {
		return seat24;
	}
	public void setSeat24(Boolean seat24) {
		this.seat24 = seat24;
	}
	public Boolean getSeat25() {
		return seat25;
	}
	public void setSeat25(Boolean seat25) {
		this.seat25 = seat25;
	}
	public Boolean getSeat26() {
		return seat26;
	}
	public void setSeat26(Boolean seat26) {
		this.seat26 = seat26;
	}
	public Boolean getSeat27() {
		return seat27;
	}
	public void setSeat27(Boolean seat27) {
		this.seat27 = seat27;
	}
	public Boolean getSeat28() {
		return seat28;
	}
	public void setSeat28(Boolean seat28) {
		this.seat28 = seat28;
	}
	public Boolean getSeat29() {
		return seat29;
	}
	public void setSeat29(Boolean seat29) {
		this.seat29 = seat29;
	}
	public Boolean getSeat31() {
		return seat31;
	}
	public void setSeat31(Boolean seat31) {
		this.seat31 = seat31;
	}
	public Boolean getSeat32() {
		return seat32;
	}
	public void setSeat32(Boolean seat32) {
		this.seat32 = seat32;
	}
	public Boolean getSeat33() {
		return seat33;
	}
	public void setSeat33(Boolean seat33) {
		this.seat33 = seat33;
	}
	public Boolean getSeat34() {
		return seat34;
	}
	public void setSeat34(Boolean seat34) {
		this.seat34 = seat34;
	}
	public Boolean getSeat35() {
		return seat35;
	}
	public void setSeat35(Boolean seat35) {
		this.seat35 = seat35;
	}
	public Boolean getSeat36() {
		return seat36;
	}
	public void setSeat36(Boolean seat36) {
		this.seat36 = seat36;
	}
	public Boolean getSeat37() {
		return seat37;
	}
	public void setSeat37(Boolean seat37) {
		this.seat37 = seat37;
	}
	public Boolean getSeat38() {
		return seat38;
	}
	public void setSeat38(Boolean seat38) {
		this.seat38 = seat38;
	}
	public Boolean getSeat39() {
		return seat39;
	}
	public void setSeat39(Boolean seat39) {
		this.seat39 = seat39;
	}
	public Boolean getSeat41() {
		return seat41;
	}
	public void setSeat41(Boolean seat41) {
		this.seat41 = seat41;
	}
	public Boolean getSeat42() {
		return seat42;
	}
	public void setSeat42(Boolean seat42) {
		this.seat42 = seat42;
	}
	public Boolean getSeat43() {
		return seat43;
	}
	public void setSeat43(Boolean seat43) {
		this.seat43 = seat43;
	}
	public Boolean getSeat44() {
		return seat44;
	}
	public void setSeat44(Boolean seat44) {
		this.seat44 = seat44;
	}
	public Boolean getSeat45() {
		return seat45;
	}
	public void setSeat45(Boolean seat45) {
		this.seat45 = seat45;
	}
	public Boolean getSeat46() {
		return seat46;
	}
	public void setSeat46(Boolean seat46) {
		this.seat46 = seat46;
	}
	public Boolean getSeat47() {
		return seat47;
	}
	public void setSeat47(Boolean seat47) {
		this.seat47 = seat47;
	}
	public Boolean getSeat48() {
		return seat48;
	}
	public void setSeat48(Boolean seat48) {
		this.seat48 = seat48;
	}
	public Boolean getSeat49() {
		return seat49;
	}
	public void setSeat49(Boolean seat49) {
		this.seat49 = seat49;
	}
	public Boolean getSeat51() {
		return seat51;
	}
	public void setSeat51(Boolean seat51) {
		this.seat51 = seat51;
	}
	public Boolean getSeat52() {
		return seat52;
	}
	public void setSeat52(Boolean seat52) {
		this.seat52 = seat52;
	}
	public Boolean getSeat53() {
		return seat53;
	}
	public void setSeat53(Boolean seat53) {
		this.seat53 = seat53;
	}
	public Boolean getSeat54() {
		return seat54;
	}
	public void setSeat54(Boolean seat54) {
		this.seat54 = seat54;
	}
	public Boolean getSeat55() {
		return seat55;
	}
	public void setSeat55(Boolean seat55) {
		this.seat55 = seat55;
	}
	public Boolean getSeat56() {
		return seat56;
	}
	public void setSeat56(Boolean seat56) {
		this.seat56 = seat56;
	}
	public Boolean getSeat57() {
		return seat57;
	}
	public void setSeat57(Boolean seat57) {
		this.seat57 = seat57;
	}
	public Boolean getSeat58() {
		return seat58;
	}
	public void setSeat58(Boolean seat58) {
		this.seat58 = seat58;
	}
	public Boolean getSeat59() {
		return seat59;
	}
	public void setSeat59(Boolean seat59) {
		this.seat59 = seat59;
	}
	public Boolean getSeat61() {
		return seat61;
	}
	public void setSeat61(Boolean seat61) {
		this.seat61 = seat61;
	}
	public Boolean getSeat62() {
		return seat62;
	}
	public void setSeat62(Boolean seat62) {
		this.seat62 = seat62;
	}
	public Boolean getSeat63() {
		return seat63;
	}
	public void setSeat63(Boolean seat63) {
		this.seat63 = seat63;
	}
	public Boolean getSeat64() {
		return seat64;
	}
	public void setSeat64(Boolean seat64) {
		this.seat64 = seat64;
	}
	public Boolean getSeat65() {
		return seat65;
	}
	public void setSeat65(Boolean seat65) {
		this.seat65 = seat65;
	}
	public Boolean getSeat66() {
		return seat66;
	}
	public void setSeat66(Boolean seat66) {
		this.seat66 = seat66;
	}
	public Boolean getSeat67() {
		return seat67;
	}
	public void setSeat67(Boolean seat67) {
		this.seat67 = seat67;
	}
	public Boolean getSeat68() {
		return seat68;
	}
	public void setSeat68(Boolean seat68) {
		this.seat68 = seat68;
	}
	public Boolean getSeat69() {
		return seat69;
	}
	public void setSeat69(Boolean seat69) {
		this.seat69 = seat69;
	}
	public Boolean getSeat71() {
		return seat71;
	}
	public void setSeat71(Boolean seat71) {
		this.seat71 = seat71;
	}
	public Boolean getSeat72() {
		return seat72;
	}
	public void setSeat72(Boolean seat72) {
		this.seat72 = seat72;
	}
	public Boolean getSeat73() {
		return seat73;
	}
	public void setSeat73(Boolean seat73) {
		this.seat73 = seat73;
	}
	public Boolean getSeat74() {
		return seat74;
	}
	public void setSeat74(Boolean seat74) {
		this.seat74 = seat74;
	}
	public Boolean getSeat75() {
		return seat75;
	}
	public void setSeat75(Boolean seat75) {
		this.seat75 = seat75;
	}
	public Boolean getSeat76() {
		return seat76;
	}
	public void setSeat76(Boolean seat76) {
		this.seat76 = seat76;
	}
	public Boolean getSeat77() {
		return seat77;
	}
	public void setSeat77(Boolean seat77) {
		this.seat77 = seat77;
	}
	public Boolean getSeat78() {
		return seat78;
	}
	public void setSeat78(Boolean seat78) {
		this.seat78 = seat78;
	}
	public Boolean getSeat79() {
		return seat79;
	}
	public void setSeat79(Boolean seat79) {
		this.seat79 = seat79;
	}
	
}
