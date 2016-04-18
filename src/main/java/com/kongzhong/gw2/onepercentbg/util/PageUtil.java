package com.kongzhong.gw2.onepercentbg.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class PageUtil {
	
	public static List<Integer> generatePageList(int pageIndex, int totalPage) {
		List<Integer> pageList = new ArrayList<Integer>();
		if(pageIndex <= 5) {
			for(int i = 1; i < 10 && i <= totalPage; i++) {
				pageList.add(i);
			}
		} else if(pageIndex >= totalPage - 4) {
			for(int i = totalPage; i > 0 && i > totalPage - 9; i--) {
				pageList.add(i);
			}
			Collections.reverse(pageList);
		} else {
			for(int i = pageIndex - 4; i <= pageIndex + 4; i++) {
				pageList.add(i);
			}
		}
		return pageList;
	}

}
