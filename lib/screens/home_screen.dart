import 'package:flutter/material.dart';
import 'package:flutter_demo/models/dark_theme_model.dart';
import 'package:flutter_demo/models/message_model.dart';
import 'package:flutter_demo/widgets/category_selector.dart';
import 'package:flutter_demo/widgets/favorite_contacts.dart';
import 'package:flutter_demo/widgets/recent_chats.dart';
import 'package:flutter_demo/constants.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  bool isCollapsed = true;
  final Duration duration = Duration(milliseconds: 300);
  

  AnimationController _controller;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

     _controller = AnimationController(vsync: this, duration: duration);
     scaleAnimation = Tween<double>(begin: 1, end: 0.7).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      // appBar: AppBar(
      //   leading: 
      //   title: Center(
      //     child: 
      //   ),
      //   actions: <Widget>[
          
      //   ],
      //   elevation: 0.0,
      // ),
      body: Stack(
        children: <Widget>[
          sideDrawer(context),
          mainScreen(context),
        ],
      ),
       
    );
  }
  
//I just thought of adding this feature at the end. That is why it is so messed up
  Widget sideDrawer( context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(' '),
          Column(
            
        crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage(currentUser.imageUrl),
                  radius: kCircleAvatarRadii,
                ),
              ),
              Text('   ${currentUser.name}', style: kDrawerName),
              SizedBox(height: 30.0,),
              ListTile(leading: Icon(Icons.mail_outline, color: Colors.white, size: kAppBarIconSize,),title: Text('Message', style: kDrawerOptions.copyWith(color: Colors.white)),),
              ListTile(leading: Icon(Icons.outlined_flag, color: Colors.white60, size: kAppBarIconSize,),title: Text('Flagged', style: kDrawerOptions),),
              ListTile(leading: Icon(Icons.delete_outline, color: Colors.white60, size: kAppBarIconSize,),title: Text('Bin', style: kDrawerOptions),),
              ListTile(leading: Icon(Icons.lock_outline, color: Colors.white60, size: kAppBarIconSize,),title: Text('Archive', style: kDrawerOptions),),
              ListTile(leading: Icon(Icons.settings, color: Colors.white60, size: kAppBarIconSize,),title: Text('Settings', style: kDrawerOptions),),
            ],
          ),
          ListTile(leading: Switch(value: Provider.of<DarkData>(context).isDark,
          activeTrackColor: Colors.white54,
          activeColor: Colors.white,
           onChanged: (value){
            
            Provider.of<DarkData>(context, listen: false).toggleDarkTheme();
          }),title: Text('Dark Theme', style: kDrawerOptions),),

        ],
      ),
    );
  }

  Widget mainScreen(context) {
    Matrix4 translation = isCollapsed ? Matrix4.translationValues(0, 0, 0) : Matrix4.translationValues(MediaQuery.of(context).size.width * 0.6, 0, 0);


    return ScaleTransition(
        scale: scaleAnimation,
      child: AnimatedContainer(
        duration: duration,
        transform: translation,
              child: Material(
    elevation: 8.0,
    color: Theme.of(context).primaryColor,
          child: Column(
        children: <Widget>[
          SizedBox(height: 25.0,),
          Row(
            //This row customly implements appBar
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
              icon: Icon(Icons.menu), iconSize: kAppBarIconSize, onPressed: () {
                setState(() {
                  if(isCollapsed){
                    _controller.forward();
                  } else {
                    _controller.reverse();
                  }
                  isCollapsed=!isCollapsed;
                });
              }, color: Colors.white,),
              Text(
              'Chats',
              style: kAppBarTextStyle.copyWith(color: Colors.white),
            ),
  IconButton(
                icon: Icon(Icons.search), iconSize: kAppBarIconSize, onPressed: () {}, color: Colors.white),
            ],
          ),
          CategorySelector(),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: kOuterBorderRadius,
              ),
              child: Column(
                children: <Widget>[
                  FavoriteContacts(),
                  RecentChats(),
                ],
              ),
            ),
          )
        ],
    ),
          ),
      ),
      );
  }
}
