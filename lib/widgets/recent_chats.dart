import 'package:flutter/material.dart';
import 'package:flutter_demo/models/message_model.dart';
import 'package:flutter_demo/screens/chat_screen.dart';
import 'package:flutter_demo/constants.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: kOuterBorderRadius,
        ),
        child: ClipRRect(
          borderRadius: kMaterialBorderRadius,
          child: ListView.builder(
            reverse: true,
            itemCount: chats.length,
            itemBuilder: (BuildContext context, index) {
              final chat = chats[index];
              Color acolor = Theme.of(context).cardColor;
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(user: chat.sender)));
                },
                              child: Container(
                  margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 15.0),
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  decoration: BoxDecoration(
                    gradient: chat.unread ? LinearGradient(colors: [acolor,Theme.of(context).secondaryHeaderColor]): LinearGradient(colors: [acolor, acolor]),
                      // color: chat.unread ? Color(0xffffefee) : Colors.transparent,
                      borderRadius: kChatTileBorderRadiusRight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35.0,
                        backgroundImage: AssetImage(chat.sender.imageUrl),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            chat.sender.name,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).cursorColor,
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            child: Text(
                              chat.text,
                              style: kChatPeekText.copyWith(color: Theme.of(context).textSelectionColor),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(chat.time,
                          style: kChatPeekText.copyWith(color: Theme.of(context).textSelectionColor),),
                          chat.unread
                              ? Container(
                                width: 40.0,
                                height: 20.0,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                 color: Theme.of(context).primaryColor,
                                 borderRadius: BorderRadius.all(Radius.circular(50.0),), 
                                ),
                                  child: Text('NEW',
                                  style: TextStyle(
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),),
                                )
                              : Text(' '),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
