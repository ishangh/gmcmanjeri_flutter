import 'package:flutter/cupertino.dart' as prefix1;
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:gmcmanjeri_flutter/models/person.dart';

class EditSurvey extends StatefulWidget {
  static const String routeName = "/edit_surveys";

  @override
  State<StatefulWidget> createState() {
    return EditSurveyState();
  }
}

class EditSurveyState extends State<EditSurvey> {
  int count = 3;
  Color deleteButton;
  List<Person> personList = new List<Person>();

  @override
  void initState() {
    deleteButton = Colors.grey;
    personList.add(new Person(
        1, "Asd", "asdm", "9442123423", "dfs", "student", "logic"));
    personList.add(new Person(
        2, "Sdf", "Trm", "9442123423", "hxc", "student", "logic"));
    personList.add(new Person(
        3, "Dsw", "Tsdm", "9442123423", "we", "student", "logic"));
    personList.add(new Person(
        4, "Gds", "Tdrasfm", "9442123423", "as", "student", "logic"));
    personList.add(new Person(
        5, "Asdds", "Tam", "9442123423", "fd", "student", "logic"));
    personList.add(new Person(
        6, "Sfer", "Trsdf", "9442123423", "we", "student", "logic"));
    personList.add(new Person(
        7, "Qwds", "asd", "9442123423", "du", "student", "logic"));
    personList.add(new Person(
        8, "Hae", "asf", "9442123423", "hf", "student", "logic"));
    personList.add(new Person(
        9, "Lia", "SADf", "9442123423", "as", "student", "logic"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Surveys'),
      ),
      body:getSurveyListView(),
      );

  }

  ListView getSurveyListView() {
    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: personList.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.keyboard_arrow_right),
            ),
            title: Text(
              personList[position].name,
              style: titleStyle,
            ),
            subtitle: Text(personList[position].id.toString()),
            trailing: IconButton(
              color: Colors.grey,
              icon: Icon(
                Icons.delete,
              ),
              onPressed: () {
                setState(() {

                  personList.removeAt(position);

                });
              },
            ),
            onTap: () {
              debugPrint("ListTile Tapped");
            },
          ),
        );
      },
    );
  }
}
