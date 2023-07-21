import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:shoe_eshop_ui/Model/shoe_items_model.dart';
import 'package:shoe_eshop_ui/Widget/shoe_item_card.dart';

class ShoeListView extends StatelessWidget {
  
  final shoesList;

  ShoeListView(this.shoesList);

  final options = const LiveOptions(
    // Start animation after (default zero)
    delay: Duration(milliseconds: 250),

    // Show each item through (default 250)
    showItemInterval: Duration(milliseconds: 250),

    // Animation duration (default 250)
    showItemDuration: Duration(milliseconds: 250),

    // Animations starts at 0.05 visible
    // item fraction in sight (default 0.025)
    visibleFraction: 0.05,

    // Repeat the animation of the appearance 
    // when scrolling in the opposite direction (default false)
    // To get the effect as in a showcase for ListView, set true
    reAnimateOnVisibility: false,
  );

  @override
  Widget build(BuildContext context) {
    return LiveList.options(
      options: options,

      // Like GridView.builder, but also includes animation property
      itemBuilder: buildAnimatedItem,

      // Other properties correspond to the `ListView.builder` / `ListView.separated` widget
      itemCount: shoesList.length,
      physics: BouncingScrollPhysics(),
      
    );
  }

  // Build animated item (helper for all examples)
Widget buildAnimatedItem(
    BuildContext context,
    int i,
    Animation<double> animation,
  ) =>
  // For example wrap with fade transition
  FadeTransition(
    opacity: Tween<double>(
      begin: 0,
      end: 1,
    ).animate(animation),
    // And slide transition
    child: SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -0.1),
        end: Offset.zero,
      ).animate(animation),
      // Paste you Widget
      child: ShoeItemCard(shoesList[i].id, shoesList[i].imgPath, shoesList[i].shoeName, 
           shoesList[i].shoeBrand, shoesList[i].shoePrice),
    ),
  );

  
}
