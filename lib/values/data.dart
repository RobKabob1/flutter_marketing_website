part of values;

class Data {
  static List<NewsCategoryData> newsCategories = [
    NewsCategoryData(title: StringConst.all, number: 6, isSelected: true),
    NewsCategoryData(title: StringConst.news, number: 3),
    NewsCategoryData(title: StringConst.guides, number: 1),
    NewsCategoryData(title: StringConst.updateNotes, number: 2),
  ];

  static List<DeepsWebsiteCardData> deepsWebsiteCardData = [
    DeepsWebsiteCardData(
      title: StringConst.playFree,
      subtitle: StringConst.playFreeDesc,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
    ),
    DeepsWebsiteCardData(
      title: StringConst.shop,
      subtitle: StringConst.shopDesc,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      circleBgColor: AppColors.yellow100,
    ),
    DeepsWebsiteCardData(
      title: StringConst.explore,
      subtitle: StringConst.exploreDesc,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      leadingIconColor: AppColors.black,
      circleBgColor: AppColors.grey50,
    ),
  ];

  static List<NewsData> allNews = [
    NewsData(
      title: StringConst.portfolio1Title,
      category: StringConst.news,
      newsCoverUrl: ImagePath.portfolio1,
      width: 0.5,
      mobileHeight: 0.3,
    ),
    NewsData(
      title: StringConst.portfolio2Title,
      category: StringConst.updateNotes,
      newsCoverUrl: ImagePath.portfolio2,
      width: 0.225,
    ),
    NewsData(
      title: StringConst.portfolio3Title,
      category: StringConst.news,
      newsCoverUrl: ImagePath.portfolio3,
      width: 0.225,
    ),
    NewsData(
      title: StringConst.portfolio4Title,
      category: StringConst.news,
      newsCoverUrl: ImagePath.portfolio4,
      width: 0.2375,
    ),
    NewsData(
      title: StringConst.portfolio5Title,
      category: StringConst.guides,
      newsCoverUrl: ImagePath.portfolio5,
      width: 0.2375,
    ),
    NewsData(
      title: StringConst.portfolio6Title,
      category: StringConst.updateNotes,
      newsCoverUrl: ImagePath.portfolio6,
      width: 0.475,
      mobileHeight: 0.3,
    ),
  ];
  static List<NewsData> newsList = [
    NewsData(
      title: StringConst.portfolio1Title,
      category: StringConst.news,
      newsCoverUrl: ImagePath.portfolio1,
      width: 0.5,
      mobileHeight: 0.3,
    ),
    NewsData(
      title: StringConst.portfolio3Title,
      category: StringConst.news,
      newsCoverUrl: ImagePath.portfolio3,
      width: 0.225,
    ),
    NewsData(
      title: StringConst.portfolio4Title,
      category: StringConst.news,
      newsCoverUrl: ImagePath.portfolio4,
      width: 0.2375,
    ),
  ];
  static List<NewsData> guidesList = [
    NewsData(
      title: StringConst.portfolio5Title,
      category: StringConst.guides,
      newsCoverUrl: ImagePath.portfolio5,
      width: 0.2375,
    ),
  ];
  static List<NewsData> updateNotesList = [
    NewsData(
      title: StringConst.portfolio2Title,
      category: StringConst.updateNotes,
      newsCoverUrl: ImagePath.portfolio2,
      width: 0.225,
    ),
    NewsData(
      title: StringConst.portfolio6Title,
      category: StringConst.updateNotes,
      newsCoverUrl: ImagePath.portfolio6,
      width: 0.475,
      mobileHeight: 0.3,
    ),
  ];
}
