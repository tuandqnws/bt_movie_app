import 'package:bt_movie_app/common/app_colors.dart';
import 'package:bt_movie_app/common/app_textstyles.dart';
import 'package:bt_movie_app/ui/pages/home_screen/home_logic.dart';
import 'package:bt_movie_app/ui/pages/home_screen/home_state.dart';
import 'package:bt_movie_app/ui/widgets/custom_bottom_navigation_bar.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/hello_bar.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/list_options.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/most_popular_list/most_popular_view.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/search_bar.dart';
import 'package:bt_movie_app/ui/pages/home_screen/widgets/upcoming_releases_list/upcoming_releases_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeLogic logic = Get.put(HomeLogic());
  final HomeState state = Get.find<HomeLogic>().state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: state.currentPage.value,
          onPageChange: (value) {
            logic.setCurrentPage(page: value);
          },
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.gradientBackgroundColor,
        ),
      ),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const SizedBox(height: 32),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 64),
            child: HelloBar(),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 52),
            child: SearchBar(),
          ),
          const SizedBox(height: 28),
          Padding(
            padding: const EdgeInsets.only(left: 52),
            child: Text(
              'Most Popular',
              style: AppTextStyles.whiteS18Bold,
            ),
          ),
          const MostPopularView(),
          const SizedBox(height: 4),
          const ListOptions(),
          const SizedBox(height: 36),
          Padding(
            padding: const EdgeInsets.only(left: 52, bottom: 16),
            child: Text(
              'Upcoming releases',
              style: AppTextStyles.whiteS18Bold,
            ),
          ),
          const UpcomingReleasesView(),
        ],
      ),
    );
  }
}
