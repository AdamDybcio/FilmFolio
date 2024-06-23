import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_bloc_app/common/blocs/bloc/nav_bar_bloc.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';

class CustomBottomNavbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarBloc, NavBarState>(
      builder: (_, state) {
        return BottomNavigationBar(
          elevation: 5,
          backgroundColor: AppColors.blackHowl,
          selectedItemColor: AppColors.perfume,
          iconSize: 20,
          selectedFontSize: 15,
          showUnselectedLabels: false,
          currentIndex: state is NavBarChanged ? state.currentIndex : 0,
          selectedIconTheme: const IconThemeData(size: 25),
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            context.read<NavBarBloc>().add(NavBarTapEvent(index));
            context.go(index == 0
                ? '/'
                : index == 1
                    ? '/search'
                    : index == 2
                        ? '/favorite'
                        : '/profile');
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: AppColors.blackHowl,
              icon: const FaIcon(FontAwesomeIcons.house),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.blackHowl,
              icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.blackHowl,
              icon: const FaIcon(FontAwesomeIcons.solidHeart),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              backgroundColor: AppColors.blackHowl,
              icon: const FaIcon(FontAwesomeIcons.solidUser),
              label: 'Profile',
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 100);
}
