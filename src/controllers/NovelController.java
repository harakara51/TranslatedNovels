package controllers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import Data.NovelBean;
import Data.NovelDAO;
import Data.NovelFileDAO;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes({"IDCounter, readingList, masterlist"})
public class NovelController
{
	@Autowired
	private NovelDAO NovelDAO;
	
	@ModelAttribute("IDCounter")
	public int createCounterObject()
	{
		int counter = 24;
		return counter;
	}
	
	@ModelAttribute("readingList")
	public List<NovelBean> createReadingListObject()
	{
		List<NovelBean> readingList = new ArrayList<>();
		return readingList;
	}
	@ModelAttribute("masterlist")
	public List<NovelBean> createMastList()
	{
		List<NovelBean> masterList = NovelDAO.getNovels();
		return masterList;
	}
	
	@RequestMapping(path = "GetNovel.do", params = "language", method = RequestMethod.GET)
	public ModelAndView getByName(@RequestParam("language") String language)
	{
		ModelAndView mv = new ModelAndView();
		//System.out.println("In controller and size of array is" +  NovelDAO.getNovelByLanguage(language).size());
		mv.setViewName("results.jsp");
		mv.addObject("NovelsByLanguage", NovelDAO.getNovelByLanguage(language));
		
		return mv;
	}
	
	@RequestMapping(path = "GetNovel.do", params = "genre", method = RequestMethod.GET)
	public ModelAndView getByGenre(@RequestParam("genre") String Genre)
	{
		ModelAndView mv = new ModelAndView();
		//System.out.println("In controller and size of array is" +  NovelDAO.getNovelByLanguage(language).size());
		mv.setViewName("results.jsp");
		mv.addObject("NovelsByGenre", NovelDAO.getNovelByGenre(Genre));
		
		return mv;
	}
	
	@RequestMapping(path = "GetNovel.do", params = "rating", method = RequestMethod.GET)
	public ModelAndView getByRating(@RequestParam("rating") Double rating)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("results.jsp");
		mv.addObject("NovelsByRating", NovelDAO.getNovelByRating(rating));
		
		return mv;
	}
	@RequestMapping(path = "GetNovel.do", params = "random", method = RequestMethod.GET)
	public ModelAndView getByRandom()
	{
		ModelAndView mv = new ModelAndView();
		Collections.shuffle(NovelDAO.getNovels());
		mv.setViewName("results.jsp");
		mv.addObject("RandomNovel", NovelDAO.getNovels().get(0));
		
		return mv;
	}
	
	@RequestMapping(path = "Novel.do", params = "submitNovel", method = RequestMethod.POST)
	public ModelAndView getAddNewNovel(NovelBean novelBean, @ModelAttribute("masterList") ArrayList<NovelBean> masterList,@ModelAttribute("IDCounter") int counter )
	{
		System.out.println("in adding novel method");
		System.out.println(counter);
		novelBean.setID(counter);
		counter++;
		System.out.println(masterList.size());
		masterList.add(novelBean);
		System.out.println(masterList.size());
		ModelAndView mv = new ModelAndView();
		Collections.shuffle(NovelDAO.getNovels());
		mv.setViewName("results.jsp");
		mv.addObject("IDCounter", counter);
		
		return mv;
	}
	
}
