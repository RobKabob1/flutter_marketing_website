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
    SocialButton2Data(
      title: StringConst.instagram,
      iconData: FontAwesomeIcons.instagram,
      url: StringConst.instagramURL,
      titleColor: AppColors.yellow300,
      buttonColor: AppColors.yellow300,
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
  static List<StatItemData> statItemsData = [
    StatItemData(value: 120, subtitle: StringConst.happyClients),
    StatItemData(value: 10, subtitle: StringConst.yearsOfExperience),
    StatItemData(value: 230, subtitle: StringConst.incredibleProjects),
    StatItemData(value: 18, subtitle: StringConst.awardWinning),
  ];

  static List<ProjectCategoryData> projectCategories = [
    ProjectCategoryData(title: StringConst.all, number: 6, isSelected: true),
    ProjectCategoryData(title: StringConst.branding, number: 1),
    ProjectCategoryData(title: StringConst.packaging, number: 1),
    ProjectCategoryData(title: StringConst.photographer, number: 2),
    ProjectCategoryData(title: StringConst.webDesign, number: 3),
  ];

  static List<String> awards1 = [
    StringConst.awards1,
    StringConst.awards2,
    StringConst.awards3,
    StringConst.awards4,
    StringConst.awards5,
  ];
  static List<String> awards2 = [
    StringConst.awards6,
    StringConst.awards7,
    StringConst.awards8,
    StringConst.awards9,
    StringConst.awards10,
  ];
  static List<BlogCardData> blogData = [
    BlogCardData(
      category: StringConst.blogCategory1,
      title: StringConst.blogTitle1,
      date: StringConst.blogDate,
      buttonText: StringConst.readMore,
      imageUrl: ImagePath.blog01,
    ),
    BlogCardData(
      category: StringConst.blogCategory2,
      title: StringConst.blogTitle2,
      date: StringConst.blogDate,
      buttonText: StringConst.readMore,
      imageUrl: ImagePath.blog02,
    ),
    BlogCardData(
      category: StringConst.blogCategory3,
      title: StringConst.blogTitle3,
      date: StringConst.blogDate,
      buttonText: StringConst.readMore,
      imageUrl: ImagePath.blog03,
    ),
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

  static List<ProjectData> allProjects = [
    ProjectData(
      title: StringConst.portfolio1Title,
      category: StringConst.photography,
      projectCoverUrl: ImagePath.portfolio1,
      width: 0.5,
      mobileHeight: 0.3,
    ),
    ProjectData(
      title: StringConst.portfolio2Title,
      category: StringConst.webDesign,
      projectCoverUrl: ImagePath.portfolio2,
      width: 0.225,
    ),
    ProjectData(
      title: StringConst.portfolio3Title,
      category: StringConst.branding,
      projectCoverUrl: ImagePath.portfolio3,
      width: 0.225,
    ),
    ProjectData(
      title: StringConst.portfolio4Title,
      category: StringConst.webDesign,
      projectCoverUrl: ImagePath.portfolio4,
      width: 0.2375,
    ),
    ProjectData(
      title: StringConst.portfolio5Title,
      category: StringConst.packaging,
      projectCoverUrl: ImagePath.portfolio5,
      width: 0.2375,
    ),
    ProjectData(
      title: StringConst.portfolio6Title,
      category: StringConst.photography,
      projectCoverUrl: ImagePath.portfolio6,
      width: 0.475,
      mobileHeight: 0.3,
    ),
  ];
  static List<ProjectData> branding = [
    ProjectData(
      title: StringConst.portfolio3Title,
      category: StringConst.branding,
      projectCoverUrl: ImagePath.portfolio3,
      width: 0.225,
    ),
  ];
  static List<ProjectData> packaging = [
    ProjectData(
      title: StringConst.portfolio5Title,
      category: StringConst.packaging,
      projectCoverUrl: ImagePath.portfolio5,
      width: 0.2375,
    ),
  ];
  static List<ProjectData> photograhy = [
    ProjectData(
      title: StringConst.portfolio1Title,
      category: StringConst.photography,
      projectCoverUrl: ImagePath.portfolio1,
      width: 0.5,
      mobileHeight: 0.3,
    ),
    ProjectData(
      title: StringConst.portfolio6Title,
      category: StringConst.photography,
      projectCoverUrl: ImagePath.portfolio6,
      width: 0.475,
      mobileHeight: 0.3,
    ),
  ];
  static List<ProjectData> webDesign = [
    ProjectData(
      title: StringConst.portfolio2Title,
      category: StringConst.webDesign,
      projectCoverUrl: ImagePath.portfolio2,
      width: 0.225,
    ),
    ProjectData(
      title: StringConst.portfolio4Title,
      category: StringConst.webDesign,
      projectCoverUrl: ImagePath.portfolio4,
      width: 0.2375,
    ),
    ProjectData(
      title: StringConst.portfolio5Title,
      category: StringConst.packaging,
      projectCoverUrl: ImagePath.portfolio5,
      width: 0.2375,
    ),
  ];
}
