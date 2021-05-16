import 'package:flutter/material.dart';

class NewsTile extends StatelessWidget {

  final String name, newsId;
  const NewsTile({Key key, @required this.name, @required this.newsId,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.lightBlue),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(name, style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),),
          ),
          SizedBox(height: 12,),
          Align(
            alignment: Alignment.bottomRight,
            child: Text('Dated : '+newsId, style: TextStyle(
              color: Colors.black45,
            ),),
          ),
        ],
      ),
    );
  }
}
