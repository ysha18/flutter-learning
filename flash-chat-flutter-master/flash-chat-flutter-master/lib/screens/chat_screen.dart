import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInUser;

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  String messageText;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async{
    try{
      final user = await _auth.currentUser;
      if(user!=null){
        loggedInUser = user;
      }
    }catch(e){
      print(e);
    }
  }

  void getMessages() async{
    final messages  = await _firestore.collection('message').get();
    for(var message in messages.docs){
      print(message.data());
    }
  }

  void messagesStream() async{
    await for(var snapshot in  _firestore.collection('message').snapshots()){
      for(var message in snapshot.docs){
        print(message.data());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                // _auth.signOut();
                // Navigator.pop(context);
                messagesStream();
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      textEditingController.clear();
                      _firestore.collection('message').add({
                        'sender' : loggedInUser.email,
                        'text' : messageText,
                        'time' : DateTime.now(),
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore.collection('message').orderBy('time',descending: true).snapshots(),
      builder: (context,snapshot)  { // This snapshot is the builder snapshot => AsyncSnapshot
        List<MessageBubble> messagesWidgets = [];
        if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        }
        final messages = snapshot.data.docs;
        for(var message in messages){
          final messageText = message['text'];
          final messageSender = message['sender'];
          messagesWidgets.add(MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: loggedInUser.email == messageSender,
          ));
        }
        return Expanded(
          child: ListView(
            padding: EdgeInsets.all(10.0),
            children: messagesWidgets,
            reverse: true,
          ),
        );
      },
    );
  }
}



class MessageBubble extends StatelessWidget {

  MessageBubble({this.sender,this.text,this.isMe});

  final String sender;
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all( 10.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            sender,
            style: TextStyle(
              color: Colors.grey[600]
            ),
          ),
          isMe ?
          Bubble(
            text: text,
            textColor: Colors.white,
            bubbleColor: Colors.lightGreen,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),bottomRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
          ) :
          Bubble(
              text: text,
            textColor: Colors.black,
            bubbleColor: Colors.white,
            borderRadius: BorderRadius.only(topRight: Radius.circular(30.0),bottomRight: Radius.circular(30.0),bottomLeft: Radius.circular(30.0)),
          ),
        ],
      ),
    );
  }
}

class Bubble extends StatelessWidget {

  Bubble({this.text, this.textColor, this.bubbleColor, this.borderRadius});

  final String text;
  final Color textColor;
  final Color bubbleColor;
  final BorderRadius borderRadius;


  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: borderRadius,
      color:  bubbleColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 16.0,
              color: textColor
          ),
        ),
      ),
    );
  }
}

