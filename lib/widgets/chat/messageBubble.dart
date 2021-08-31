import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: Color.fromRGBO(136, 14, 79, .1),
  100: Color.fromRGBO(136, 14, 79, .2),
  200: Color.fromRGBO(136, 14, 79, .3),
  300: Color.fromRGBO(136, 14, 79, .4),
  400: Color.fromRGBO(136, 14, 79, .5),
  500: Color.fromRGBO(136, 14, 79, .6),
  600: Color.fromRGBO(136, 14, 79, .7),
  700: Color.fromRGBO(136, 14, 79, .8),
  800: Color.fromRGBO(136, 14, 79, .9),
  900: Color.fromRGBO(136, 14, 79, 1),
};

class MessageBubble extends StatelessWidget {
  MaterialColor myBoxColor = MaterialColor(0xFF800000, color);
  MaterialColor textColor = MaterialColor(0xFFF4A460, color);
  MaterialColor messageColor = MaterialColor(0xFFFFFFFF, color);
  MaterialColor counterTextColor = MaterialColor(0xFFE6E6FA, color);
  MessageBubble(
    this.message,
    this.userName,
    this.userImage,
    this.isMe, {
    this.key,
  });
  final Key key; //create a key to update the list efficently
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment:
              isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: isMe ? myBoxColor : Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                  bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(12),
                  bottomRight: isMe ? Radius.circular(0) : Radius.circular(12),
                ),
              ),
              width: 140,
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 16,
              ),
              margin: EdgeInsets.symmetric(
                vertical: 16,
                horizontal: 8,
              ),
              child: Column(
                crossAxisAlignment: isMe
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start, // text'i sağa sola kaydırma
                children: <Widget>[
                  Text(
                    isMe ? 'Me' : userName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isMe ? textColor : counterTextColor,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(message,
                      style: TextStyle(
                        color: isMe
                            ? messageColor
                            : Theme.of(context).accentTextTheme.headline1.color,
                      ),
                      textAlign: isMe ? TextAlign.end : TextAlign.start),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          left: isMe ? null : 120,
          right: isMe ? 120 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(userImage),
          ),
        ),
      ],
      overflow: Overflow.visible,
    );
  }
}
