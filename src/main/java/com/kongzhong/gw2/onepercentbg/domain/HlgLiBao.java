package com.kongzhong.gw2.onepercentbg.domain;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * 惠乐购礼包
 * @author yangcan
 *
 */
public class HlgLiBao {
	
	private Integer id;
	
	private String name;//礼包名称
	
	private String startTime;//开始时间
	
	private String endTime;//结束时间
	
	private Integer prize;//点劵数量
	
	private Integer giftId;//礼包ID
	
	private Integer sortOrder;//排序
	
	private Integer type;//是否为限时礼包
	
	private Integer status;
	
	private Integer isUp;//是否上架

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrize() {
		return prize;
	}

	public void setPrize(Integer prize) {
		this.prize = prize;
	}

	public Integer getGiftId() {
		return giftId;
	}

	public void setGiftId(Integer giftId) {
		this.giftId = giftId;
	}

	public Integer getSortOrder() {
		return sortOrder;
	}

	public void setSortOrder(Integer sortOrder) {
		this.sortOrder = sortOrder;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public Integer getIsUp() throws ParseException {
		 long currentTime=System.currentTimeMillis();//当前系统时间的毫秒数
			
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		long start=sdf.parse(startTime).getTime();//开始时间
		long end=sdf.parse(endTime).getTime();//结束时间
		
		
		if(currentTime<end && currentTime>start){
			return 1;
		}
		return 0;
	}

	public void setIsUp(Integer isUp) {
		this.isUp = isUp;
	}

	@Override
	public String toString() {
		return id+"|"+name+"|"+startTime+"|"+endTime+"|"+prize+"|"+giftId+"|"+sortOrder+"|"+type+"|"+status;
	}
	
}
