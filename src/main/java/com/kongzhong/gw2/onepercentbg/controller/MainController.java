package com.kongzhong.gw2.onepercentbg.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kongzhong.gw2.onepercentbg.domain.Items;
import com.kongzhong.gw2.onepercentbg.domain.Page;
import com.kongzhong.gw2.onepercentbg.domain.Time;
import com.kongzhong.gw2.onepercentbg.service.MainService;
import com.kongzhong.gw2.onepercentbg.util.PageUtil;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value="/",method=RequestMethod.GET)
	public String toIndex(Model model,Page page){
		
		
        model.addAttribute("items", mainService.findAll(page));	
        model.addAttribute("page", page);
        
        page.setTotalCount(mainService.getCount());
        int totalPage=page.getTotalPage(); //总页数
        
        List<Integer> pageList=PageUtil.generatePageList(page.getPageIndex(), totalPage);
        
        model.addAttribute("pageList", pageList);
		return "index";
	}
	
	@RequestMapping(value="/toInsert",method=RequestMethod.GET)
	public String toInsert(Model model,Integer flag,Integer id){
		if(flag==1){
			model.addAttribute("create", true);
		}else{
			model.addAttribute("item", mainService.selectItemsById(id));
		}
		return "insert";
	}
	
	@RequestMapping(value="/insert",method=RequestMethod.POST)
	public String insert(Items items){
		mainService.insert(items);
		return "redirect:/";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update(Items items){
		mainService.updateItems(items);
		return "redirect:/";
	}
	
	@RequestMapping(value="/getTime",method=RequestMethod.GET)
	public String getTime(Model model){
		Time time=mainService.get();
		model.addAttribute("abc", mainService.get());
		return "activity";
	}
	
	@RequestMapping(value="/updateTime",method=RequestMethod.POST)
	public String updateTime(Time time){
		mainService.updateTime(time);
		return "redirect:/getTime";
	}
	
	
	
	
	
}
