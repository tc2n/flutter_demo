import 'package:flutter/material.dart';
import 'package:flutter_demo/constants.dart';
import 'package:flutter_demo/models/message_model.dart';
import 'package:flutter_demo/models/user_model.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  _buildMessage(Message message, bool isMe) {
    return Container(
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0, right: 80.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width * 0.75,
      decoration: BoxDecoration(
        border: Border.all(width: 0.1, color: Colors.white54),
        color: isMe ? Theme.of(context).accentColor : Theme.of(context).secondaryHeaderColor,
        borderRadius: isMe
            ? kChatTileBorderRadiusLeft
            : kChatTileBorderRadiusRight,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            message.time,
            style: kFavContacts.copyWith(color: Theme.of(context).textSelectionColor),
          ),
          Text(
            message.text,
            style: kFavContacts.copyWith(color:Theme.of(context).focusColor),
          ),
        ],
      ),
    );
  }

  bool notEmpty = false;

  _buildMessageComposer(){
    return Container(
      color: Theme.of(context).cardColor,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: BoxDecoration(
          border: Border.all(width: 0.1, color: Colors.white54),
         color: Theme.of(context).accentColor,
         borderRadius: BorderRadius.all(Radius.circular(500.0),), 
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
         children: <Widget>[
           IconButton(icon: Icon(Icons.sentiment_satisfied,
           size: kAppBarIconSize,), onPressed: (){},
           color: Theme.of(context).textSelectionColor,),
           Expanded(child: TextField(
             style: TextStyle(color: Theme.of(context).focusColor),
             onChanged: (value){
               setState(() {
                 if(value!=''){
                   notEmpty=true;
                 } else {
                   notEmpty=false;
                 }
               });
             },
             decoration: InputDecoration.collapsed(
              hintText: 'Type your message...',
              hintStyle: TextStyle(color: Theme.of(context).cursorColor),
             ),
           ),),
           IconButton(icon: Icon(notEmpty ? Icons.send : Icons.attach_file,
           size: 30.0,), onPressed: (){}, color: notEmpty?Theme.of(context).primaryColor:Theme.of(context).textSelectionColor,),
         ], 
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.user.name,
            style: kAppBarTextStyle
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.more_horiz), iconSize: kAppBarIconSize, onPressed: () {})
        ],
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: kOuterBorderRadius,
              ),
              child: ClipRRect(
                borderRadius: kOuterBorderRadius,
                child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(top: 15.0),
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = messages[index];
                    bool isMe = message.sender.id == currentUser.id;
                    return _buildMessage(message, isMe);
                  },
                ),
              ),
            ),
          ),
          _buildMessageComposer(),
        ],
      ),
    );
  }
}
