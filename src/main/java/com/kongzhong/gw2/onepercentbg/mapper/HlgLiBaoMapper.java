package com.kongzhong.gw2.onepercentbg.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.kongzhong.gw2.onepercentbg.domain.HlgLiBao;
import com.kongzhong.gw2.onepercentbg.domain.LiBaoItems;
import com.kongzhong.gw2.onepercentbg.domain.Page;

public interface HlgLiBaoMapper {
	
	
	@Select("select id,name,start_time startTime,end_time endTime,prize,giftid giftId,sort_order sortOrder,type,status"
			+ " from sxg_libao order by sort_order desc limit #{page.limitIndex},#{page.pageSize}")
	List<HlgLiBao> findAll(@Param("page") Page page);
	
	
	@Select("select count(*) from sxg_libao")
	Integer getHlgLiBaoCount();
	
	
	@Select("select max(sort_order) from sxg_libao")
	Integer getHlgSortMax();
	
	
	@Insert("insert into sxg_libao (name,start_time,end_time,prize,giftid,sort_order,type,status) values "
			+ " (#{hlgLiBao.name},#{hlgLiBao.startTime},#{hlgLiBao.endTime},#{hlgLiBao.prize},#{hlgLiBao.giftId},#{hlgLiBao.sortOrder},#{hlgLiBao.type},1)")
	void insertLibao(@Param("hlgLiBao") HlgLiBao hlgLiBao);
	
	
	@Select("select id,name,start_time startTime,end_time endTime,prize,giftid giftId,type from sxg_libao where id=#{id}")
	HlgLiBao getHlgLiBaoById(Integer id);
	

	void updateLiBao(HlgLiBao hlgLiBao);
	
	List<LiBaoItems> getLiBaoItems(Map<String, Object> map);
	
	Integer getLiBaoItemsCount(Integer giftType);
	
	void insertLiBaoItems(LiBaoItems liBaoItems);
	
	LiBaoItems getBaoItemsById(Integer id);
	
	void updateLiBaoItems(LiBaoItems liBaoItems);
	
	
}
