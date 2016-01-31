package controllers;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import Data.NovelBean;
import Data.NovelDAO;
import Data.NovelFileDAO;

@Controller

@SessionAttributes({ "readingList"})
public class EmailController
{

	
	@ModelAttribute("readingList")
	public Set<NovelBean> createReadingListObject()
	{
		
		Set<NovelBean> readingList = new HashSet();
		return readingList;
	}
	
//	@RequestMapping(path = "GetNovel.do", params = "addtoReadingList", method = RequestMethod.GET)
//	public ModelAndView getReadingLIst(@RequestParam("addtoReadingList") String novel, @ModelAttribute("readingList") Set<NovelBean> List, 
//			@ModelAttribute("NovelsByLanguage") ArrayList<NovelBean> LanguageList)
//	{
//		
//		
//	
//		
//	int counter =0;
//		List.add(NovelDAO.getNovelByName(novel));
//		System.out.println("the size of the reading list is now : " + List.size());
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("readinglist2", NovelDAO.getNovelByName(novel));
//	
//		mv.addObject("NovelsByLanguage", NovelDAO.getNovelByLanguage(novel));
//		
//		mv.setViewName("index.jsp");
//		return mv;
//	}
}
