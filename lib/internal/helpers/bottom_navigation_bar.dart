import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rick_and_morty/features/episodes/presentation/screens/all_episode_screen/all_episodes.dart';
import 'package:rick_and_morty/features/settings/presentation/screens/settings_screen/settings_screen.dart';

import '../../features/characters/presentation/screens/character_list_screen/character_list.dart';
import '../../features/locations/presentation/screens/locations_screen/locations_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          CharacterList(),
          LocationsScreen(),
          AllEpisodes(),
          SettingsScreen(),
        ],
      ),

      // _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/charactersA.png',
              scale: 4.r,
            ),
            icon: Image.asset(
              'assets/images/characters.png',
              scale: 4.r,
            ),
            label: 'Персонажи',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/locationsA.png',
              scale: 4.r,
            ),
            icon: Image.asset(
              'assets/images/locations.png',
              scale: 4.r,
            ),
            label: 'Локации',
          ),
          BottomNavigationBarItem(
            activeIcon: Image.asset(
              'assets/images/episodeA.png',
              scale: 4.sp,
            ),
            icon: Image.asset(
              'assets/images/episodes.png',
              scale: 4.sp,
            ),
            label: 'Эпизоды',
          ),
          BottomNavigationBarItem(
              activeIcon: Image.asset(
                'assets/images/settingsA.png',
                scale: 4.sp,
              ),
              icon: Image.asset(
                'assets/images/settings.png',
                scale: 4.sp,
              ),
              label: 'Настройки'),
        ],
        selectedLabelStyle: TextStyle(
          fontSize: 12.sp,
        ),
        unselectedFontSize: 12.sp,
        selectedFontSize: 12.sp,
        selectedItemColor: Color(0xff22A2BD),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
