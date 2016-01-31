package controllers;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.validation.Valid;

import Data.NovelBean;
import Data.NovelDAO;
import Data.NovelFileDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@SessionAttributes({ "IDCounter","readingList","masterlist", "novelsBylanguage"})
public class NovelController
{
	
	private String toEmail;
	private String emailBody;
	@Autowired
	private NovelDAO NovelDAO;

	@ModelAttribute("IDCounter")
	public int createCounterObject()
	{
		int counter = 24;
		return counter;
	}

	@ModelAttribute("readingList")
	public Set<NovelBean> createReadingListObject()
	{
		
		Set<NovelBean> readingList = new HashSet();
		return readingList;
	}
	
	@ModelAttribute("novelsBylanguage")
	public List <NovelBean> createNovelsBylanuageObject()
	{
		
		List<NovelBean> LanguageList = new ArrayList();
		return LanguageList;
	}
	@ModelAttribute("masterlist")
	public List<NovelBean> createMastList()
	{
		System.out.println("in creating masterList method on top");
		List<NovelBean> masterList = new ArrayList<>();
//		List<NovelBean> temp2 = NovelDAO.getNovels();
//		for (NovelBean novelBean : temp2)
//		{
//			masterList.add(novelBean);
//		}
		
		
		return masterList;
	}

	@RequestMapping(path = "GetNovel.do", params = "language", method = RequestMethod.GET)
	public ModelAndView getByName(@RequestParam("language") String language, @ModelAttribute("novelbyLanguage") ArrayList<NovelBean> LanguageList)
	{
		ModelAndView mv = new ModelAndView();
		// System.out.println("In controller and size of array is" +
		// NovelDAO.getNovelByLanguage(language).size());
		mv.setViewName("results.jsp");

		mv.addObject("NovelsByLanguage", NovelDAO.getNovelByLanguage(language));
		

		return mv;
	}

	@RequestMapping(path = "GetNovel.do", params = "genre", method = RequestMethod.GET)
	public ModelAndView getByGenre(@RequestParam("genre") String Genre)
	{
		ModelAndView mv = new ModelAndView();
		// System.out.println("In controller and size of array is" +
		// NovelDAO.getNovelByLanguage(language).size());
		mv.setViewName("results.jsp");
		mv.addObject("NovelsByGenre", NovelDAO.getNovelByGenre(Genre));

		return mv;
	}

	@RequestMapping(path = "GetNovel.do", params = "rating", method = RequestMethod.GET)
	public ModelAndView getByRating(@RequestParam("rating") Double rating2)
	{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("results.jsp");
		mv.addObject("NovelsByRating", NovelDAO.getNovelByRating(rating2));

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

	@RequestMapping(path = "Novel.do", params = "submitNovel", method = RequestMethod.GET)
	public ModelAndView getAddNewNovel(NovelBean novelBean,
			@ModelAttribute("masterlist") ArrayList<NovelBean> masterList, @ModelAttribute("IDCounter") int counter)
	{
	System.out.println(masterList.size());
	
		novelBean.setID(counter);
	List<NovelBean> temp2 = NovelDAO.getNovels();
		for (NovelBean novelBean2 : temp2)
		{
			masterList.add(novelBean2);
		}
		
		temp2.add(novelBean);		
	counter++;
	
		masterList.add(novelBean);
		temp2.add(novelBean);
	System.out.println(masterList.size());
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("index.jsp");
		mv.addObject("IDCounter", counter);

		return mv;
	}
	
	@RequestMapping(path = "GetNovel.do", params = "ReadMORE", method = RequestMethod.GET)
	public ModelAndView getDisplayNovel(@RequestParam("ReadMORE") String novel)
	{	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("result2.jsp");
		mv.addObject("Novel", NovelDAO.getNovelByName(novel));

		return mv;
	}
	
	@RequestMapping(path = "GetNovel.do", params = "addtoReadingList", method = RequestMethod.GET)
	public ModelAndView getReadingLIst(@RequestParam("addtoReadingList") String novel, @ModelAttribute("readingList") Set<NovelBean> List, 
			@ModelAttribute("NovelsByLanguage") ArrayList<NovelBean> LanguageList)
	{
		
		
	
		
	int counter =0;
		List.add(NovelDAO.getNovelByName(novel));
		System.out.println("the size of the reading list is now : " + List.size());
		ModelAndView mv = new ModelAndView();
		mv.addObject("readinglist2", NovelDAO.getNovelByName(novel));
	
		//SendEmail();
		mv.addObject("NovelsByLanguage", NovelDAO.getNovelByLanguage(novel));
		
		mv.setViewName("index.jsp");
		return mv;
	}
	
	@RequestMapping(path = "GetNovel.do", params = "EditNovel", method = RequestMethod.GET)
	public ModelAndView getEditNovel(@RequestParam("EditNovel") String novel)
	{	
		ModelAndView mv = new ModelAndView();
		mv.setViewName("editNovel.jsp");
		mv.addObject("Novel", NovelDAO.getNovelByName(novel));

		return mv;
	}
	
	@RequestMapping(path = "Novel.do", params = "submitchangedNovel", method = RequestMethod.POST)
	public ModelAndView geteditNewNovel(@ModelAttribute("masterlist") ArrayList<NovelBean> masterList, @RequestParam("Translator") String Translator,
			@RequestParam("rating") Double rating,@RequestParam("tags") String tags, @RequestParam("translationStatus") String translationStatus, @RequestParam("novelName") String novelName)
	{
		System.out.println("In editing book method");
		NovelBean test =NovelDAO.getNovelByName(novelName);
		test.setTranslationStatus(translationStatus);
		test.setRating(rating);
		test.setTranslator(Translator);
		test.setTags(tags);
		
		masterList.add(test);
		
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("index.jsp");
	//	mv.addObject("Novel", NovelDAO.getNovelByName(novel));
		return mv;
	}
	
	
	@RequestMapping(path = "GetNovel.do", params = "deleteNovel", method = RequestMethod.GET)
	public ModelAndView getRemoveBookfromMasterlist(@RequestParam("deleteNovel") String novel, @ModelAttribute("masterlist") ArrayList<NovelBean> MasterList)
	{
	
		List<NovelBean> temp2 =NovelDAO.getNovels();
		System.out.println("the size of the master list before removing: " + MasterList.size());
	System.out.println("The novel name is " + novel);
	//List.remove(1);
	MasterList.remove(NovelDAO.getNovelByName(novel));
	temp2.remove(NovelDAO.getNovelByName(novel));
		System.out.println("the size of the masterlist is now : " + MasterList.size());
		ModelAndView mv = new ModelAndView();
	mv.setViewName("index.jsp");
	
	SendEmailUsingGMailSMTP test = new SendEmailUsingGMailSMTP ();
	
	
		return mv;
	}
	//in method to remove book from reading LIst
	@RequestMapping(path = "GetNovel.do", params = "removeFromReadingList", method = RequestMethod.GET)
	public ModelAndView getRemoveBookfromReadinglist(@RequestParam("removeFromReadingList") String novel, @ModelAttribute("readingList") Set<NovelBean> ReadingList)
	{
		System.out.println(ReadingList.size());
		ReadingList.remove(NovelDAO.getNovelByName(novel));
		System.out.println(ReadingList.size());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("results3.jsp");
		return mv;	
	}
	
	public static void SendEmail ()
	{
		// Recipient's email ID needs to be mentioned.
	      String to = "harakara51@gmail.com";//change accordingly

	      // Sender's email ID needs to be mentioned
	      String from = "hafu52@gmail.com";//change accordingly
	      final String username = "hafu52@gmail.com";//change accordingly
	      final String password = "51Keralagon53#";//change accordingly

	      // Assuming you are sending email through relay.jangosmtp.net
	      String host = "smtp.gmail.com";

	      Properties props = new Properties();
	      props.put("mail.smtp.auth", "true");
	      props.put("mail.smtp.starttls.enable", "true");
	      props.put("mail.smtp.host", host);
	      props.put("mail.smtp.port", "587");

	      // Get the Session object.
	      Session session = Session.getInstance(props,
	      new javax.mail.Authenticator() {
	         protected PasswordAuthentication getPasswordAuthentication() {
	            return new PasswordAuthentication(username, password);
	         }
	      });

	      try {
	         // Create a default MimeMessage object.
	         Message message = new MimeMessage(session);

	         // Set From: header field of the header.
	         message.setFrom(new InternetAddress(from));

	         // Set To: header field of the header.
	         message.setRecipients(Message.RecipientType.TO,
	         InternetAddress.parse(to));

	         // Set Subject: header field
	         message.setSubject("Your reading list");

	         // Now set the actual message
	         message.setText("Hello, this is sample for to check send "
	            + "email using JavaMailAPI ");

	         // Send message
	         Transport.send(message);

	         System.out.println("Sent message successfully....");

	      } catch (MessagingException e) {
	            throw new RuntimeException(e);
	      }
	   }
	}
	

