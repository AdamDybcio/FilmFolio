import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movie_bloc_app/common/blocs/bloc/nav_bar_bloc.dart';
import 'package:movie_bloc_app/core/utils/helpers/helper_functions.dart';
import 'package:movie_bloc_app/core/utils/strings/app_colors.dart';

class CustomBottomNavbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomBottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = HelperFunctions.isDarkMode(context);
    return BlocBuilder<NavBarBloc, NavBarState>(
      builder: (_, state) {
        return SizedBox(
          height: 70,
          child: BottomNavigationBar(
            elevation: 5,
            backgroundColor: dark ? AppColors.magicWhale : AppColors.coolFrost,
            selectedItemColor: dark ? AppColors.diamondCut : AppColors.magicWhale,
            iconSize: 20,
            selectedFontSize: 15,
            showUnselectedLabels: false,
            currentIndex: state is NavBarChanged ? state.currentIndex : 0,
            selectedIconTheme: const IconThemeData(size: 25),
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              context.read<NavBarBloc>().add(NavBarTapEvent(index));
            },
            items: const [
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.house),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidHeart),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: FaIcon(FontAwesomeIcons.solidUser),
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 150);
}
