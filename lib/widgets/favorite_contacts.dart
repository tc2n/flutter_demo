import 'package:flutter/material.dart';
import 'package:flutter_demo/models/message_model.dart';
import 'package:flutter_demo/constants.dart';
import 'package:flutter_demo/screens/chat_screen.dart';

class FavoriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Favorite Contacts',
                  style: TextStyle(
                      color: Theme.of(context).textSelectionColor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
                Icon(
                  Icons.more_horiz,
                  color: Theme.of(context).textSelectionColor,
                  size: 28.0,
                ),
              ],
            ),
          ),
          Container(
            height: 120.0,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: favorites.length,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen(user: favorites[index])));
                      },
                                          child: Column(
                        children: <Widget>[
                          CircleAvatar(
                            radius: kCircleAvatarRadii,
                            backgroundImage: AssetImage(favorites[index].imageUrl),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            favorites[index].name,
                            style: kFavContacts.copyWith(color: Theme.of(context).textSelectionColor),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
