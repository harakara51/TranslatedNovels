package Data;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

public class NovelFileDAO implements NovelDAO
{

	private static final String FILE_NAME = "/WEB-INF/NovelList4.csv";
	private List<NovelBean> NovelsbyLanguage = new ArrayList<>();
	private List<NovelBean> NovelsbyRating = new ArrayList<>();
	private List<NovelBean> NovelsbyGenre = new ArrayList<>();
	private List<NovelBean> NovelsbyAuthor = new ArrayList<>();
	private List<NovelBean> Novels = new ArrayList<>();
	/*
	 * Use Autowired to have Spring inject an instance of an ApplicationContext
	 * into this object after creation. We will use the ApplicationContext to
	 * retrieve an InputStream so we can read from a file.
	 */
	@Autowired
	private ApplicationContext ac;

	/*
	 * The @PostConstruct method is called by Spring after object creation and
	 * dependency injection
	 */
	@PostConstruct
	public void init()
	{
		// Retrieve an input stream from the application context
		// rather than directly from the file system
		try (InputStream is = ac.getResource(FILE_NAME).getInputStream();
				BufferedReader buf = new BufferedReader(new InputStreamReader(is));)
		{
			String line = buf.readLine();
			while ((line = buf.readLine()) != null)
			{
				
			//	System.out.println("in File Reader");
				String[] tokens = line.split(",");
			//	System.out.print( "read name :" +tokens[1]);
				int ID = Integer.parseInt(tokens[0]);
				String name = tokens[1];
			//	System.out.print( "read name :" +tokens[1]);
				String author = tokens[2];
				//System.out.print( "read author :" +tokens[2]);
				String translator = tokens[3];
				//System.out.print( "read translator :" +tokens[3]);
				String translatorProgress = tokens[4];
				String link = tokens[5];
				String language = tokens[6];
				String translatorStatus = tokens[7];
				String genre = tokens[8];
				String Tags = tokens[9];
				//System.out.print( "going to read Sypnosis :" );
				String sypnosis = tokens[10];
				
				Double rating = Double.parseDouble(tokens[11]);

				Novels.add(new NovelBean(ID, name, author, translator, translatorProgress, link, language,
						translatorStatus, genre, Tags, sypnosis, rating));
			}
		} catch (Exception e)
		{
			System.err.println(e);
		}
	}

	@Override
	public int getNovelByID(int ID)
	{
		for (NovelBean novelBean : Novels)
		{
			if ((novelBean.getID())==(ID))
			{
				int ID2 = novelBean.getID();
				return ID2;

			}
	}
		return 0;

	}

	@Override
	public NovelBean getNovelByName(String name)
	{
		for (NovelBean novelBean : Novels)
		{
			if ((novelBean.getNovelName().trim()).equals(name.trim()))
			{
				
				return novelBean;

			}
	}
		return null;
	}

	@Override
	public List<NovelBean> getNovelByLanguage(String language)
	{
		NovelsbyLanguage.clear();
		for (NovelBean novelBean : Novels)
		{
			if ((language.trim()).contains(novelBean.getLanguage().trim().substring(0, 3)))
			{
				NovelsbyLanguage.add(novelBean);
				

			}
	}
		System.out.println(NovelsbyLanguage.size());
		return NovelsbyLanguage;
	}

	@Override
	public List<NovelBean> getNovelByGenre(String Genre)
	{
		NovelsbyGenre.clear();
		for (NovelBean novelBean : Novels)
		{
			if ((novelBean.getGenre().trim().toLowerCase()).contains(Genre))
			{
				NovelsbyGenre.add(novelBean);
				

			}
	}
		return NovelsbyGenre;
	}

	@Override
	public List<NovelBean> getNovelByRating(Double rating)
	{

		NovelsbyRating.clear();
		for (NovelBean novelBean : Novels)
		{
			//Double rating = Double.parseDouble(novelBean.getRating());
			if ((novelBean.getRating()>=rating))
			{
				NovelsbyRating.add(novelBean);
				

			}
	}
		return NovelsbyRating;
	}

	@Override
	public List<NovelBean> getNovelByAuthor(String author)
	{
		for (NovelBean novelBean : Novels)
		{
			if ((novelBean.getAuthor().trim()).equals(author.trim()))
			{
				NovelsbyAuthor.add(novelBean);
				

			}
	}
		return NovelsbyAuthor;
	}

	@Override
	public List<NovelBean> getNovels()
	{
		
		return Novels;
	}
	public void addNovels(NovelBean newNovel)
	{
	Novels.add(newNovel)	;
		
	}

}
