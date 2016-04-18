package com.kongzhong.gw2.onepercentbg.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kongzhong.gw2.onepercentbg.domain.Items;
import com.kongzhong.gw2.onepercentbg.domain.ItemsExample;
import com.kongzhong.gw2.onepercentbg.domain.Page;
import com.kongzhong.gw2.onepercentbg.domain.Time;
import com.kongzhong.gw2.onepercentbg.mapper.ItemsMapper;
import com.kongzhong.gw2.onepercentbg.mapper.TimeMapper;

@Service
public class MainService {
	
	@Autowired
	private ItemsMapper itemsMapper;
	
	@Autowired
	private TimeMapper timeMapper;
	
	/**
	 * 分页查询
	 * @param page
	 * @return
	 */
	public List<Items> findAll(Page page){
		return itemsMapper.findAll(page);
	}
	
	/**
	 * 获取总的记录数
	 * @return
	 */
	public Integer getCount(){
		return itemsMapper.countByExample(new ItemsExample());
	}
	
	/**
	 * 增加道具
	 * @param items
	 */
	public void insert(Items items){
		items.setPoint6(items.getPoint5());
		items.setPoint7(items.getPoint5());
		items.setCreatetime(new Date());
		itemsMapper.insertSelective(items);
	}
	
	/**
	 * 查询出某一个道具
	 * @param id
	 * @return
	 */
	public Items selectItemsById(Integer id){
		return itemsMapper.selectByPrimaryKey(id);
	}
	
	/**
	 * 修改道具
	 * @param items
	 */
	public void updateItems(Items items){
		itemsMapper.updateByPrimaryKey(items);
	}
	
	public Time get(){
		return timeMapper.getTime();
	}
	
	public void updateTime(Time time){
		timeMapper.updateTime(time);
	}
	
}
