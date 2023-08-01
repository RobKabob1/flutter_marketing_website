part of values;

class Data {
  static List<SocialButton2Data> socialData2 = [
    SocialButton2Data(
      title: StringConst.behance,
      iconData: FontAwesomeIcons.behance,
      url: StringConst.behanceURL,
      titleColor: AppColors.blue300,
      buttonColor: AppColors.blue300,
      iconColor: AppColors.white,
    ),
    SocialButton2Data(
      title: StringConst.dribble,
      iconData: FontAwesomeIcons.dribbble,
      url: StringConst.dribbleURL,
      titleColor: AppColors.pink300,
      buttonColor: AppColors.pink300,
      iconColor: AppColors.white,
    ),
  ];

  static List<SkillLevelData> skillLevelData = [
    SkillLevelData(
      skill: StringConst.skills1,
      level: 80,
    ),
    SkillLevelData(
      skill: StringConst.skills2,
      level: 90,
    ),
    SkillLevelData(
      skill: StringConst.skills3,
      level: 70,
    ),
  ];

  static List<SkillCardData> skillCardData = [
    SkillCardData(
      title: StringConst.skills1,
      description: StringConst.skills1Desc,
      iconData: FontAwesomeIcons.compress,
    ),
    SkillCardData(
        title: "",
        description: "",
        iconData: Icons.pages_outlined), //not being used
    SkillCardData(
      title: StringConst.skills2,
      description: StringConst.skills2Desc,
      iconData: Icons.pages_outlined,
    ),
    SkillCardData(
      title: StringConst.skills3,
      description: StringConst.skills3Desc,
      iconData: FontAwesomeIcons.paintbrush,
    ),
    SkillCardData(
      title: StringConst.skills4,
      description: StringConst.skills4Desc,
      iconData: FontAwesomeIcons.recordVinyl,
    ),
    SkillCardData(
        title: "",
        description: "",
        iconData: Icons.pages_outlined), //not being used
  ];

  static List<NewsCategoryData> newsCategories = [
    NewsCategoryData(title: StringConst.all, number: 6, isSelected: true),
    NewsCategoryData(title: StringConst.news, number: 1),
    NewsCategoryData(title: StringConst.guides, number: 1),
    NewsCategoryData(title: StringConst.photographer, number: 2),
    NewsCategoryData(title: StringConst.webDesign, number: 3),
  ];

  static List<DeepsWebsiteCardData> deepsWebsiteCardData = [
    DeepsWebsiteCardData(
      title: StringConst.uiUX,
      subtitle: StringConst.uiUXDesc,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
    ),
    DeepsWebsiteCardData(
      title: StringConst.photographer,
      subtitle: StringConst.photographerDesc,
      leadingIcon: Icons.done,
      trailingIcon: Icons.chevron_right,
      circleBgColor: AppColors.yellow100,
    ),
    DeepsWebsiteCardData(
      title: StringConst.freelancer,
      subtitle: StringConst.freelancerDesc,
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
      title: StringConst.portfolio3Title,
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
