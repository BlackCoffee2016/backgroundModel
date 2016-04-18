package com.kongzhong.gw2.onepercentbg.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kongzhong.gw2.onepercentbg.domain.HlgLiBao;
import com.kongzhong.gw2.onepercentbg.domain.Page;
import com.kongzhong.gw2.onepercentbg.mapper.HlgLiBaoMapper;

@Service
public class HlgService {
	
	@Autowired
	private HlgLiBaoMapper mapper;
	
	/**
	 * 分页查询出礼包信息
	 * @param page
	 * @return
	 */
	public List<HlgLiBao> findAll(Page page){
		return mapper.findAll(page);
	}
	
	
	/**
	 * 获取惠乐购总记录数
	 * @return
	 */
	public Integer getHlgLiBaoCount(){
		return mapper.getHlgLiBaoCount();
	}
}
