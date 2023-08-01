import 'package:flutter/material.dart';
import 'package:deeps_website/presentation/layout/adaptive.dart';
import 'package:deeps_website/presentation/widgets/buttons/deeps_website_button.dart';
import 'package:deeps_website/presentation/widgets/content_area.dart';
import 'package:deeps_website/presentation/widgets/deeps_website_info_section.dart';
import 'package:deeps_website/presentation/widgets/news_item.dart';
import 'package:deeps_website/presentation/widgets/spaces.dart';
import 'package:deeps_website/values/values.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:visibility_detector/visibility_detector.dart';

const double kSpacing = 20.0;
const double kRunSpacing = 16.0;

class NewsCategoryData {
  final String title;
  final int number;
  bool isSelected;

  NewsCategoryData({
    required this.title,
    required this.number,
    this.isSelected = false,
  });
}

class NewsSection extends StatefulWidget {
  const NewsSection({super.key});

  @override
  NewsSectionState createState() => NewsSectionState();
}

class NewsSectionState extends State<NewsSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _newsController;
  late Animation<double> _newsScaleAnimation;
  List<List<NewsData>> news = [
    Data.allNews,
    Data.newsList,
    Data.guidesList,
    Data.updateNotesList,
  ];
  late List<NewsData> selectedNews;
  late List<NewsCategoryData> newsCategories;

  @override
  void initState() {
    super.initState();
    selectedNews = news[0];
    newsCategories = Data.newsCategories;
    _newsController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _newsScaleAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _newsController,
        curve: Curves.fastOutSlowIn,
      ),
    );
  }

  @override
  void dispose() {
    _newsController.dispose();
    super.dispose();
  }

  Future<void> _playNewsAnimation() async {
    try {
      await _newsController.forward().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because it was disposed of
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = widthOfScreen(context) - (getSidePadding(context) * 2);
    double contentAreaWidth = screenWidth;
    return VisibilityDetector(
      key: const Key('news-section-sm'),
      onVisibilityChanged: (visibilityInfo) {
        double visiblePercentage = visibilityInfo.visibleFraction * 100;
        if (visiblePercentage > 20) {
          _playNewsAnimation();
        }
      },
      child: ResponsiveBuilder(
        refinedBreakpoints: const RefinedBreakpoints(),
        builder: (context, sizingInformation) {
          double screenWidth = sizingInformation.screenSize.width;
          if (screenWidth < (const RefinedBreakpoints().tabletLarge)) {
            return Container(
              padding:
                  EdgeInsets.symmetric(horizontal: getSidePadding(context)),
              child: ContentArea(
                width: contentAreaWidth,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDeepsWebsiteInfoSectionSm(),
                    const SpaceH40(),
                    DeepsWebsiteButton(
                      buttonTitle: StringConst.allNews,
                      buttonColor: AppColors.primaryColor,
                      onPressed: () {},
                    ),
                    const SpaceH40(),
                    Wrap(
                      spacing: kSpacing,
                      runSpacing: kRunSpacing,
                      children: _buildNewsCategories(newsCategories),
                    ),
                    const SpaceH40(),
                    Wrap(
                      runSpacing: assignHeight(context, 0.05),
                      children: _buildNews(
                        selectedNews,
                        isMobile: true,
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return VisibilityDetector(
              key: const Key('news-section_lg'),
              onVisibilityChanged: (visibilityInfo) {
                double visiblePercentage = visibilityInfo.visibleFraction * 100;
                if (visiblePercentage > 40) {
                  _playNewsAnimation();
                }
              },
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: getSidePadding(context),
                    ),
                    child: ContentArea(
                      width: contentAreaWidth,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ContentArea(
                            width: contentAreaWidth * 0.6,
                            child: _buildDeepsWebsiteInfoSectionLg(),
                          ),
                          const Spacer(),
                          DeepsWebsiteButton(
                            buttonTitle: StringConst.allNews,
                            buttonColor: AppColors.primaryColor,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SpaceH40(),
                  SizedBox(
                    width: widthOfScreen(context),
                    child: Wrap(
                      spacing: assignWidth(context, 0.025),
                      runSpacing: assignWidth(context, 0.025),
                      children: _buildNews(selectedNews),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildDeepsWebsiteInfoSectionSm() {
    return const DeepsWebsiteInfoSection2(
      sectionTitle: StringConst.myWorks,
      title1: StringConst.meetMyNews,
      hasTitle2: false,
      body: StringConst.newsDesc,
//      child: ,
    );
  }

  Widget _buildDeepsWebsiteInfoSectionLg() {
    return DeepsWebsiteInfoSection1(
      sectionTitle: StringConst.myWorks,
      title1: StringConst.meetMyNews,
      hasTitle2: false,
      body: StringConst.newsDesc,
      child: Wrap(
        spacing: kSpacing,
        runSpacing: kRunSpacing,
        children: _buildNewsCategories(newsCategories),
      ),
    );
  }

  List<Widget> _buildNewsCategories(List<NewsCategoryData> categories) {
    List<Widget> items = [];

    for (int index = 0; index < categories.length; index++) {
      items.add(
        NewsCategory(
          title: categories[index].title,
          number: categories[index].number,
          isSelected: categories[index].isSelected,
          onTap: () => onNewsCategoryTap(index),
        ),
      );
    }
    return items;
  }

  List<Widget> _buildNews(List<NewsData> data, {bool isMobile = false}) {
    List<Widget> items = [];
    for (int index = 0; index < data.length; index++) {
      items.add(
        ScaleTransition(
          scale: _newsScaleAnimation,
          child: NewsItem(
            width: isMobile
                ? assignWidth(context, data[index].mobileWidth)
                : assignWidth(context, data[index].width),
            height: isMobile
                ? assignHeight(context, data[index].mobileHeight)
                : assignHeight(context, data[index].height),
            bannerHeight: isMobile
                ? assignHeight(context, data[index].mobileHeight) / 2
                : assignHeight(context, data[index].height) / 3,
            title: data[index].title,
            subtitle: data[index].category,
            imageUrl: data[index].newsCoverUrl,
          ),
        ),
      );
    }

    return items;
  }

  void onNewsCategoryTap(index) {
    _newsController.reset();
    changeCategorySelected(index);
    setState(() {
      selectedNews = news[index];
      _playNewsAnimation();
    });
  }

  changeCategorySelected(int selectedIndex) {
    for (int index = 0; index < newsCategories.length; index++) {
      if (index == selectedIndex) {
        setState(() {
          newsCategories[selectedIndex].isSelected = true;
        });
      } else {
        newsCategories[index].isSelected = false;
      }
    }
  }
}

class NewsCategory extends StatefulWidget {
  const NewsCategory({
    super.key,
    required this.title,
    required this.number,
    this.titleColor = AppColors.black,
    this.numberColor = Colors.transparent,
    this.hoverColor = AppColors.primaryColor,
    this.titleStyle,
    this.numberStyle,
    this.onTap,
    this.isSelected = false,
  });

  final String title;
  final Color titleColor;
  final Color numberColor;
  final TextStyle? titleStyle;
  final int number;
  final Color hoverColor;
  final TextStyle? numberStyle;
  final GestureTapCallback? onTap;
  final bool isSelected;

  @override
  NewsCategoryState createState() => NewsCategoryState();
}

class NewsCategoryState extends State<NewsCategory>
    with SingleTickerProviderStateMixin {
  bool _isHovering = false;
  late AnimationController _controller;
  late Color color;

  @override
  void initState() {
    super.initState();
    color = widget.titleColor;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: InkWell(
        onTap: widget.onTap,
        hoverColor: Colors.transparent,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: widget.title,
                style: widget.titleStyle?.copyWith(
                      color: colorOfCategory(),
                    ) ??
                    textTheme.titleMedium?.copyWith(
                      fontSize: Sizes.textSize16,
                      color: colorOfCategory(),
                    ),
              ),
              WidgetSpan(
                child: widget.isSelected
                    ? numberOfNewsItems()
                    : FadeTransition(
                        opacity: _controller.view,
                        child: numberOfNewsItems(),
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget numberOfNewsItems() {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Transform.translate(
      offset: const Offset(2, -8),
      child: Text(
        "(${widget.number})",
        textScaleFactor: 0.7,
        style: widget.numberStyle?.copyWith(
              color: widget.hoverColor,
            ) ??
            textTheme.titleMedium?.copyWith(
              fontSize: Sizes.textSize16,
              color: widget.hoverColor,
            ),
      ),
    );
  }

  void _mouseEnter(bool hovering) {
    setState(() {
      _isHovering = hovering;
    });
    if (hovering) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  Color colorOfSuperScript() {
    if (_isHovering) {
      return widget.hoverColor;
    } else if (widget.isSelected) {
      return widget.hoverColor;
    } else {
      return widget.numberColor;
    }
  }

  Color colorOfCategory() {
    if (_isHovering) {
      return widget.hoverColor;
    } else if (widget.isSelected) {
      return widget.hoverColor;
    } else {
      return widget.titleColor;
    }
  }
}
