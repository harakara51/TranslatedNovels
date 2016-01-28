package Data;

import java.util.List;



public interface NovelDAO
{
		public int getNovelByID(String name);
		public NovelBean getNovelByName(String name);
		public List<NovelBean> getNovels();
		public List<NovelBean> getNovelByLanguage(String language);
		public List<NovelBean> getNovelByGenre(String Genre);
		public List<NovelBean> getNovelByRating(Double Rating);
		public List<NovelBean> getNovelByAuthor(String Author);
		

	
}
