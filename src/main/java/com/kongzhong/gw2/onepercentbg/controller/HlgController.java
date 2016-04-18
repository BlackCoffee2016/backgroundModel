package com.kongzhong.gw2.onepercentbg.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.druid.stat.TableStat.Mode;
import com.kongzhong.gw2.onepercentbg.domain.HlgLiBao;
import com.kongzhong.gw2.onepercentbg.domain.LiBaoItems;
import com.kongzhong.gw2.onepercentbg.domain.Page;
import com.kongzhong.gw2.onepercentbg.mapper.HlgLiBaoMapper;
import com.kongzhong.gw2.onepercentbg.service.HlgService;
import com.kongzhong.gw2.onepercentbg.util.PageUtil;

/**
 * 惠乐购
 * @author yangcan
 *
 */
@Controller
@RequestMapping("/hlg")
public class HlgController {
	
	
	@Autowired
	private HlgService hlgService;
	
	@Autowired
	private HlgLiBaoMapper mapper;
	
	/**
	 * 惠乐购首页
	 * @param page
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String index(Page page,Model model){
		
		
		List<HlgLiBao> hlgLiBaos=hlgService.findAll(page);
		
		for(HlgLiBao hlgLiBao:hlgLiBaos){
			String startTime=hlgLiBao.getStartTime();
			String endTime=hlgLiBao.getEndTime();
			startTime=startTime.substring(0, startTime.lastIndexOf("."));
			endTime=endTime.substring(0, endTime.lastIndexOf("."));
			hlgLiBao.setEndTime(endTime);
			hlgLiBao.setStartTime(startTime);
		}
		
		model.addAttribute("items", hlgLiBaos);	
		model.addAttribute("page", page);
		 
		page.setTotalCount(hlgService.getHlgLiBaoCount());
		 
		int totalPage=page.getTotalPage(); //总页数
		 
		List<Integer> pageList=PageUtil.generatePageList(page.getPageIndex(), totalPage);
	        
        model.addAttribute("pageList", pageList);
		return "hlg";
		
	}
	
	/**
	 * 增加惠乐购礼包
	 * @return
	 */
	@RequestMapping(value="/libaoInsert",method=RequestMethod.GET)
	public String libaoInsert(String flag,Model model){
		model.addAttribute("create", flag);
		return "libaoAdd";
	}
	
	/**
	 * 插入礼包
	 * @param hlgLiBao
	 * @return
	 * @throws ParseException 
	 */
	@RequestMapping(value="/insertLibao",method=RequestMethod.POST)
	public String insertLibao(HttpServletRequest request,HlgLiBao hlgLiBao) throws ParseException{
		
		hlgLiBao.setSortOrder(mapper.getHlgSortMax()+1);
		mapper.insertLibao(hlgLiBao);
		return "redirect:/hlg/";

	}
	
	/**
	 * 修改页面
	 * @param flag
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/toUpdateLibao",method=RequestMethod.GET)
	public String toUpdateLibao(String flag,Integer id,Model model){
		
		model.addAttribute("create", flag);
		
		HlgLiBao hlgLiBao=mapper.getHlgLiBaoById(id);
		
		String startTime=hlgLiBao.getStartTime();
		String endTime=hlgLiBao.getEndTime();
		startTime=startTime.substring(0, startTime.lastIndexOf("."));
		endTime=endTime.substring(0, endTime.lastIndexOf("."));
		hlgLiBao.setEndTime(endTime);
		hlgLiBao.setStartTime(startTime);
		
		model.addAttribute("libao", hlgLiBao);
		
		
		return "libaoAdd";
	}
	
	
	/**
	 * 修改礼包
	 * @param hlgLiBao
	 * @return
	 */
	@RequestMapping(value="/updateLibao",method=RequestMethod.POST)
	public String updateLibao(HlgLiBao hlgLiBao){
		
		mapper.updateLiBao(hlgLiBao);
		
		return "redirect:/hlg/";
	}
	
	/**
	 * 礼包内的道具
	 * @param giftType
	 * @param model
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/liBaoItems",method=RequestMethod.GET)
	public String liBaoItems(Integer giftType,Model model,Page page){
		Map<String, Object> map=new HashMap<String, Object>();
		
		map.put("giftType", giftType);
		map.put("page", page);
		List<LiBaoItems> liBaoItems=mapper.getLiBaoItems(map);
		
		model.addAttribute("items", liBaoItems);	
		model.addAttribute("page", page);
		
		
		page.setTotalCount(mapper.getLiBaoItemsCount(giftType));
		 
		int totalPage=page.getTotalPage(); //总页数
		 
		List<Integer> pageList=PageUtil.generatePageList(page.getPageIndex(), totalPage);
	        
        model.addAttribute("pageList", pageList);
        
        model.addAttribute("giftType", giftType);
        
		return "libaoItems";
		
	}
	
	/**
	 * 礼包内道具增加页面
	 * @param giftType
	 * @param model
	 * @param flag
	 * @return
	 */
	@RequestMapping(value="/toInsertLiBaoItem",method=RequestMethod.GET)
	public String toInsertLiBaoItem(Integer giftType,Model model,String flag){
		model.addAttribute("giftType", giftType);
		model.addAttribute("create", flag);
		return "addLiBaoItems";
	}
	
	/**
	 * 礼包内道具增加
	 * @param liBaoItems
	 * @return
	 */
	@RequestMapping(value="/insertLiBaoItem",method=RequestMethod.POST)
	public String insertLiBaoItem(LiBaoItems liBaoItems){
		
		mapper.insertLiBaoItems(liBaoItems);
		
		return "redirect:/hlg/liBaoItems?giftType="+liBaoItems.getGiftType();
		
	}
	
	/**
	 * 礼包内道具修改页面
	 * @param id
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/toLiBaoItemDetails",method=RequestMethod.GET)
	public String toLiBaoItemDetails(Integer id,Model model,Integer giftType){
		
		LiBaoItems liBaoItems=mapper.getBaoItemsById(id);
		
		model.addAttribute("items", liBaoItems);
		model.addAttribute("create", '0');
		model.addAttribute("giftType", giftType);
		return "addLiBaoItems";
			
	}
	
	/**
	 * 更新礼包内道具
	 * @param liBaoItems
	 * @return
	 */
	@RequestMapping(value="/updateLiBaoItems",method=RequestMethod.POST)
	public String updateLiBaoItems(LiBaoItems liBaoItems){
		
		mapper.updateLiBaoItems(liBaoItems);
		
		return "redirect:/hlg/liBaoItems?giftType="+liBaoItems.getGiftType();
		
	}
	
	
	
}
