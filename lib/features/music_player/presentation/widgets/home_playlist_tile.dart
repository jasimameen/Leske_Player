import 'package:flutter/material.dart';
import '../../../../core/utils/navigation.dart';
import '../pages/playlist_page.dart';

import '../../../../core/utils/constants.dart';

class HomePlayListTile extends StatelessWidget {
  const HomePlayListTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigation.pushNamed(PlaylistPage.routeName);
      },
      child: Column(
        children: [
          // image
          Container(
            width: screenWidth * 0.45,
            height: screenWidth * 0.45,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(
                  dummyImage,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 10),

          // title
          Text(
            'Synthwave',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
