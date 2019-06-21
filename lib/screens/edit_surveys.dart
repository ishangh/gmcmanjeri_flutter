import 'package:flutter/cupertino.dart' as prefix1;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class EditSurvey extends StatefulWidget {
  static const String routeName = "/edit_surveys";

  @override
  State<StatefulWidget> createState() {
    return EditSurveyState();
  }
}

class EditSurveyState extends State<EditSurvey>
{
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surveys'),
      ),
      body: Container(
        padding: EdgeInsets.all(12.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            Container(
              height: 54.0,
              padding: EdgeInsets.all(12.0),
              child: Text('Data passed to this page:',
               style: TextStyle(fontWeight: FontWeight.w700))),
            Padding(
          padding:
              EdgeInsets.only(top: 10.0, bottom: 25.0, left: 15.0, right: 15.0),
          child: Builder(
              builder: (context) => RaisedButton(
                    child: Text(
                      "PROCEED TO QUESTIONNAIRE",
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.white),
                    ),
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.pop(context);
                      Navigator.of(context).pushNamed("/");
                    },
                  ))),
          ],
        ),
      )
    );
  }

  ListView getSurveyListView()
  {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position)
      {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text('Dummy Title', style: titleStyle,),
            subtitle: Text('Dummy Date'),
            trailing: Icon(Icons.delete, color: Colors.grey,),
            onTap: () {
              debugPrint("ListTile Tapped");
            },
          ),
        );
      },
    );
  }
}

