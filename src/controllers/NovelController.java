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
public class NovelController
{
	@Autowired
	private NovelDAO NovelDAO;

	
	@RequestMapping(path = "GetNovel.do", params = "language", method = RequestMethod.GET)
	public ModelAndView getByName(@RequestParam("language") String language)
	{
		ModelAndView mv = new ModelAndView();
		System.out.println("In controller and size of array is" +  NovelDAO.getNovelByLanguage(language).size());
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
		System.out.println("In controller, in rating method and size of array is" +  NovelDAO.getNovelByRating(rating).size());
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
	
}
