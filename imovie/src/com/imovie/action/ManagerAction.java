package com.imovie.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.imovie.model.Movie;
import com.imovie.service.ManagerService;
import com.imovie.service.MovieService;

public class ManagerAction extends BaseAction {

	/**
	 * 
	 */
	private final Log logger = LogFactory.getLog(getClass());
	private static final long serialVersionUID = -4650560595832267673L;
	@Autowired
	private MovieService movieService;
	@Autowired
	private ManagerService managerService;
	private List<Movie> movieList;
	private ArrayList<BigDecimal> percentages;
	private HashMap<String, Integer> map;
	private ArrayList<String> head;
	private ArrayList<Integer> body;
	private ArrayList<Integer> body2;
	private BigDecimal[][] data;
	private String dataInString;
	private String movieId;
	private String name;
	private String type;
	private String duration;
	private String description;
	private File poster;
	private String posterFileName;
	private String posterContentType;
	private final String baseDir = "D:\\eclipseEeWorkspace\\imovie\\WebContent\\common\\img\\";
	private final String[] months = { "January", "February", "March", "April",
			"May", "June", "July", "August", "September", "October",
			"Noverbmer", "December" };

	// 显示所有上映电影
	public String execute() {
		movieList = movieService.getAllValidMovie();
		return "manager_allValidMovie";
	}
	
	//显示所有电影
	public String AllMovie(){
		movieList = movieService.getAllMovie();
		return "manager_allMovie";
	}

	// 电影上线
	public String MovieOn() {
		try {
			InputStream is = new FileInputStream(poster);
			@SuppressWarnings("deprecation")
			File fileLocation = new File(baseDir);
			if (!fileLocation.exists()) {
				// 如果目录不存在则创建
				boolean isCreated = fileLocation.mkdir();
				if (!isCreated) {
					return "failure";
				}
			}
			StringBuffer newFileName = new StringBuffer(posterFileName);
			int index = newFileName.indexOf(".", newFileName.length() - 6);
			// 为文件生成随机文件名
			char[] numList = new char[6];
			for (int i = 0; i < 6; i++) {
				int rand = (int) Math.floor((Math.random() * 10));
				numList[i] = String.valueOf(rand).charAt(0);
			}
			newFileName.insert(index, numList);
			File uploadFile = new File(baseDir, newFileName.toString());
			OutputStream out = new FileOutputStream(uploadFile);
			byte[] buffer = new byte[1024 * 1024];
			int length;
			while ((length = is.read(buffer)) > 0) {
				out.write(buffer, 0, length);
			}
			is.close();
			out.close();
			movieService.saveMovie(name, newFileName.toString(), type,
					duration, description);
			return execute();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "failure";
		}
	}

	// 电影下线
	public String MovieOff() {
		boolean flag = movieService.offMovie(movieId);
		if (flag) {
			return execute();
		} else {
			return "failure";
		}
	}

	// 会员年龄统计
	public String AgeStatic() {
		map = managerService.ageStatic();
		Collection<Integer> val = map.values();
		percentages = getPercentage(val);
		return "manager_ageStatic";
	}

	// 会员性别统计
	public String GenderStatic() {
		map = managerService.genderStatic();
		Collection<Integer> val = map.values();
		percentages = getPercentage(val);
		return "manager_genderStatic";
	}

	// 会员居住地统计
	public String ResidenceStatic() {
		map = managerService.residenceStatic();
		Collection<Integer> val = map.values();
		percentages = getPercentage(val);
		return "manager_residenceStatic";
	}

	// 会员消费统计
	public String ConsumptionStatic() {
		body = new ArrayList<Integer>();
		head = new ArrayList<String>();
		map = managerService.consumptionStatic();
		Set<String> keys = map.keySet();
		for (String mon : months) {
			head.add(mon);
			if (keys.contains(mon)) {
				Integer dd = map.get(mon);
				body.add(dd);
			} else {
				map.put(mon, 0);
				body.add(0);
			}
		}
		percentages = getPercentage(body);
		return "manager_consumptionStatic";
	}

	// 会员充值统计
	public String RechargeStatic() {
		body = new ArrayList<Integer>();
		head = new ArrayList<String>();
		map = managerService.rechargeStatic();
		Set<String> keys = map.keySet();
		for (String mon : months) {
			head.add(mon);
			if (keys.contains(mon)) {
				Integer dd = map.get(mon);
				body.add(dd);
			} else {
				map.put(mon, 0);
				body.add(0);
			}
		}
		percentages = getPercentage(body);
		return "manager_rechargeStatic";
	}

	// 活动统计
	public String ActivityStatic() {
		body = new ArrayList<Integer>();
		body2 = new ArrayList<Integer>();
		head = new ArrayList<String>();
		map = managerService.activityStatic();
		Set<String> keys = map.keySet();
		for (String mon : months) {
			head.add(mon);
			if (keys.contains(mon)) {
				Integer dd = map.get(mon);
				body.add(dd);
			} else {
				map.put(mon, 0);
				body.add(0);
			}
		}
		HashMap<String, Integer> personMap = managerService
				.activityJoinStatic();
		Set<String> personkeys = personMap.keySet();
		for (String mon : months) {
			if (personkeys.contains(mon)) {
				Integer dd = personMap.get(mon);
				body2.add(dd);
			} else {
				personMap.put(mon, 0);
				body2.add(0);
			}
		}
		percentages = new ArrayList<BigDecimal>();
		for (int i = 0; i < months.length; i++) {
			double activity = body.get(i) + 0.0;
			double person = body2.get(i) + 0.0;
			if (activity == 0) {
				BigDecimal de = new BigDecimal(0);
				percentages.add(de.setScale(0, BigDecimal.ROUND_HALF_UP));
				continue;
			}
			double result = person / activity;
			BigDecimal de = new BigDecimal(result);
			percentages.add(de.setScale(2, BigDecimal.ROUND_HALF_UP));
		}
		return "manager_activityStatic";
	}

	// 影院月总人数统计
	public String MonthCountStatic() {
		body = new ArrayList<Integer>();
		head = new ArrayList<String>();
		map = managerService.monthCountStatic();
		Set<String> keys = map.keySet();
		for (String mon : months) {
			head.add(mon);
			if (keys.contains(mon)) {
				Integer dd = map.get(mon);
				body.add(dd);
			} else {
				map.put(mon, 0);
				body.add(0);
			}
		}
		percentages = getPercentage(body);
		return "manager_monthCountStatic";
	}

	// 影院日总人数统计
	public String DayCountStatic() {
		body = new ArrayList<Integer>();
		head = new ArrayList<String>();
		map = managerService.dayCountStatic();
		Set<String> keys = map.keySet();
		Iterator<String> it = keys.iterator();
		name = "";
		while (it.hasNext()) {
			String day = it.next();
			head.add(day);
			body.add(map.get(day));
			name = name + day + ",";
		}
		percentages = getPercentage(body);
		return "manager_dayCountStatic";
	}

	// 影院各放映厅上座率统计
	public String VideoHallStatic() {
		String[] halls={"1号厅","2号厅","3号厅"};
		head=new ArrayList<String>();
		data=new BigDecimal[halls.length][months.length];
		dataInString="";
		for (int j=0;j<months.length;j++) {
			head.add(months[j]);
		}
		for(int i=0;i<halls.length;i++){
			String hall=halls[i];
			HashMap<String,Double> map=managerService.videoHallStatic(hall);
			Set<String> keys = map.keySet();
			for (int j=0;j<months.length;j++) {
				String mon=months[j];
				if (keys.contains(mon)) {
					Double rate=map.get(mon);
					BigDecimal per = new BigDecimal(rate);
					data[i][j]=per.setScale(2, BigDecimal.ROUND_HALF_UP);
					dataInString=dataInString+String.valueOf(per.setScale(2, BigDecimal.ROUND_HALF_UP))+",";
				} else {
					BigDecimal per = new BigDecimal(0);
					data[i][j]=per.setScale(2, BigDecimal.ROUND_HALF_UP);
					dataInString=dataInString+String.valueOf(per.setScale(2, BigDecimal.ROUND_HALF_UP))+",";
				}
				
			}
			dataInString=dataInString+";";
		}
		return "manager_videoHallStatic";
	}
	
	//购票方式统计
	public String PurchaseStatic(){
		HashMap<String,Integer> cash=managerService.purchaseWithCashStatic();
		head=new ArrayList<String>();
		body=new ArrayList<Integer>();
		body2=new ArrayList<Integer>();
		Set<String> keys = cash.keySet();
		for(String mon:months){
			head.add(mon);
			if(keys.contains(mon)){
				body.add(cash.get(mon));
			}else{
				body.add(new Integer(0));
			}
		}
		
		HashMap<String,Integer> card=managerService.purchaseWithCardStatic();
		Set<String> keys2=card.keySet();
		for(String mon:months){
			if(keys2.contains(mon)){
				body2.add(card.get(mon));
			}else{
				body2.add(new Integer(0));
			}
		}
		return "manager_purchaseStatic";
	}
	
	//电影上座率统计
	public String MovieStatic(){
		try {
			name=new String(name.getBytes("ISO-8859-1"), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(movieId!=null){
			head = new ArrayList<String>();
			HashMap<String,Double> map = managerService.movieStatic(movieId);
			dataInString="";
			percentages=new ArrayList<BigDecimal>();
			BigDecimal zero=new BigDecimal(0);
			Set<String> keys = map.keySet();
			for (String mon : months) {
				head.add(mon);
				if (keys.contains(mon)) {
					Double dd = map.get(mon);
					BigDecimal bd=new BigDecimal(dd);
					percentages.add(bd.setScale(2, BigDecimal.ROUND_HALF_UP));
					dataInString=dataInString+dd+",";
				} else {
					dataInString=dataInString+0.0+",";
					percentages.add(zero.setScale(0, BigDecimal.ROUND_HALF_UP));
				}
			}
			return "manager_movieStatic";
		}else{
			return "failure";
		}
	}

	//会员资格统计
	public String UserStateStatic(){
		map = managerService.userStateStatic();
		Collection<Integer> val = map.values();
		percentages = getPercentage(val);
		return "manager_userStateStatic";
	}
	
	// 计算列表各元素所占总数的百分比
	private ArrayList<BigDecimal> getPercentage(Collection<Integer> val) {
		double amount = 0;
		Iterator<Integer> it = val.iterator();
		while (it.hasNext()) {
			Integer x = it.next();
			amount = amount + x;
		}
		ArrayList<BigDecimal> list = new ArrayList<BigDecimal>();
		for (Integer x : val) {
			double temp = (x * 100) / amount;
			BigDecimal per = new BigDecimal(temp);
			list.add(per.setScale(2, BigDecimal.ROUND_HALF_UP));
		}
		return list;
	}

	public List<String> getHead() {
		return head;
	}

	public void setHead(ArrayList<String> head) {
		this.head = head;
	}

	public List<Integer> getBody() {
		return body;
	}

	public void setBody(ArrayList<Integer> body) {
		this.body = body;
	}

	public ArrayList<Integer> getBody2() {
		return body2;
	}

	public void setBody2(ArrayList<Integer> body2) {
		this.body2 = body2;
	}

	public ArrayList<BigDecimal> getPercentages() {
		return percentages;
	}

	public void setPercentages(ArrayList<BigDecimal> percentages) {
		this.percentages = percentages;
	}

	public HashMap<String, Integer> getMap() {
		return map;
	}

	public void setMap(HashMap<String, Integer> map) {
		this.map = map;
	}

	public List<Movie> getMovieList() {
		return movieList;
	}

	public void setMovieList(List<Movie> movieList) {
		this.movieList = movieList;
	}

	public BigDecimal[][] getData() {
		return data;
	}

	public void setData(BigDecimal[][] data) {
		this.data = data;
	}

	public String getDataInString() {
		return dataInString;
	}

	public void setDataInString(String dataInString) {
		this.dataInString = dataInString;
	}

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public File getPoster() {
		return poster;
	}

	public void setPoster(File poster) {
		this.poster = poster;
	}

	public String getPosterFileName() {
		return posterFileName;
	}

	public void setPosterFileName(String posterFileName) {
		this.posterFileName = posterFileName;
	}

	public String getPosterContentType() {
		return posterContentType;
	}

	public void setPosterContentType(String posterContentType) {
		this.posterContentType = posterContentType;
	}
}
