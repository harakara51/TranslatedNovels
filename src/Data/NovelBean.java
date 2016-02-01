package Data;

import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Null;
import javax.validation.constraints.Size;

public class NovelBean
{
	@Min(0)
	@Max(500)
	private int ID;
	@Null
	@Size(min=2, max=100)
	private String novelName;
	@Size(min=2, max=100)
	private String author;
	@Size(min=2, max=100)
	private String Translator;
	@Size(min=2, max=100)
	private String translationProgress;
	@Size(min=2, max=160)
	private String link;
	@Size(min=2, max=100)
	private String language;
	@Size(min=2, max=100)
	private String translationStatus;
	@Size(min=2, max=200)
	private String genre;
	@Size(min=2, max=250)
	private String tags;
	@Size(min=2, max=800)
	private String Sypnosis;
	@Min(0)
	@Max(5)
	private Double rating;
	
	public NovelBean ()
	{
		
	}
	
	
	public NovelBean(int ID, String novelName, String author, String translator, String translationProgress, String link,
			String language, String translationStatus, String genre, String sypnosis,String tags,  Double rating)
	{
		super();
		this.ID = ID;
		this.novelName = novelName;
		this.author = author;
		Translator = translator;
		this.translationProgress = translationProgress;
		this.link = link;
		this.language = language;
		this.translationStatus = translationStatus;
		this.genre = genre;
		this.tags = tags;
		Sypnosis = sypnosis;
		this.rating = rating;
	}


	/**
	 * @return the novelName
	 */
	public String getNovelName()
	{
		return novelName;
	}


	/**
	 * @return the author
	 */
	public String getAuthor()
	{
		return author;
	}


	/**
	 * @return the translator
	 */
	public String getTranslator()
	{
		return Translator;
	}


	/**
	 * @return the translationProgress
	 */
	public String getTranslationProgress()
	{
		return translationProgress;
	}


	/**
	 * @return the link
	 */
	public String getLink()
	{
		return link;
	}


	/**
	 * @return the language
	 */
	public String getLanguage()
	{
		return language;
	}


	/**
	 * @return the translationStatus
	 */
	public String getTranslationStatus()
	{
		return translationStatus;
	}


	/**
	 * @return the genre
	 */
	public String getGenre()
	{
		return genre;
	}


	/**
	 * @return the tags
	 */
	public String getTags()
	{
		return tags;
	}


	/**
	 * @return the sypnosis
	 */
	public String getSypnosis()
	{
		return Sypnosis;
	}


	/**
	 * @return the rating
	 */
	public Double getRating()
	{
		return rating;
	}


	/**
	 * @param novelName the novelName to set
	 */
	public void setNovelName(String novelName)
	{
		this.novelName = novelName;
	}


	/**
	 * @param author the author to set
	 */
	public void setAuthor(String author)
	{
		this.author = author;
	}


	/**
	 * @param translator the translator to set
	 */
	public void setTranslator(String translator)
	{
		Translator = translator;
	}


	/**
	 * @param translationProgress the translationProgress to set
	 */
	public void setTranslationProgress(String translationProgress)
	{
		this.translationProgress = translationProgress;
	}


	/**
	 * @param link the link to set
	 */
	public void setLink(String link)
	{
		this.link = link;
	}


	/**
	 * @param language the language to set
	 */
	public void setLanguage(String language)
	{
		this.language = language;
	}


	/**
	 * @param translationStatus the translationStatus to set
	 */
	public void setTranslationStatus(String translationStatus)
	{
		this.translationStatus = translationStatus;
	}


	/**
	 * @param genre the genre to set
	 */
	public void setGenre(String genre)
	{
		this.genre = genre;
	}


	/**
	 * @param tags the tags to set
	 */
	public void setTags(String tags)
	{
		this.tags = tags;
	}


	/**
	 * @param sypnosis the sypnosis to set
	 */
	public void setSypnosis(String sypnosis)
	{
		Sypnosis = sypnosis;
	}


	/**
	 * @param rating the rating to set
	 */
	public void setRating(Double rating)
	{
		this.rating =rating;
//		int count =10;
//		count++;
//		this.rating = ((this.rating*count) + rating)/count;

	}


	/**
	 * @return the iD
	 */
	public int getID()
	{
		return ID;
	}


	/**
	 * @param iD the iD to set
	 */
	public void setID(int iD)
	{
		ID = iD;
	}
	
	
	
	

}
