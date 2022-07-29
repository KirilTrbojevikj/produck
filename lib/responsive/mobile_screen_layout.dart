
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:produck/utils/colors.dart';


class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout>{


  @override
  Widget build(BuildContext context) {
    int _page = 0;
    late PageController pageController;
    pageController = PageController();


    void navigationTapped(int page ){
      pageController.jumpToPage(page);
    }

    @override
    void dispose(){
      super.dispose();
      pageController.dispose();
    }

    void onPageChanged( int page){
      setState(() {
        _page = page;
      });
    }

    return  Scaffold(
      body:  PageView(
        children: [
          Text('feed'),
          Text('search'),
          Text('add'),
          Text('favourite'),
          Text('profile'),
        ],
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChanged,
      ),
      bottomNavigationBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search,  color: _page==1 ? primaryColor : secondaryColor,),
              label: '',
              backgroundColor: primaryColor
          ),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle,  color: _page==2 ? primaryColor: secondaryColor,),
              label: '',
              backgroundColor: primaryColor
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_rounded,  color: _page==3 ? primaryColor : secondaryColor,),
              label: '',
              backgroundColor: primaryColor
          ),

          BottomNavigationBarItem(icon: Icon(Icons.person,  color: _page==4 ? primaryColor : secondaryColor,),
              label: '',
              backgroundColor: primaryColor
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }

}
