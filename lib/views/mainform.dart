import 'package:flutter/material.dart';
import 'package:gmcmanjeri_flutter/models/person.dart';
import 'package:gmcmanjeri_flutter/views/questionnaire.dart';

// ONLY FOR TESTING = Some ID Value
int _id = 0;

// We declare religions here.
const List<String> _Religions = [
  "Hindu",
  "Christian",
  "Muslim",
  "Atheist",
  "Buddhist",
  "Jain",
  "Others"
];
// We declare occupation here.
const List<String> _Occupations = [
  "Government",
  "Private",
  "Agriculture/Farming",
  "Self Employed",
  "Manual Labour",
  "Others"
];
// We declare education here.
const List<String> _EducationCategories = [
  "< Class 10",
  "Class 10",
  "Class 12",
  "Graduate",
  "Post-Graduate",
//  "Doctorate"
];

class MainForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainFormState();
  }
}


class MainFormState extends State<MainForm>{

  // Selected Strings for Options
  static String _selectedReligion = '';
  static String _selectedOccupation = '';
  static String _selectedEducation = '';
  // TEXT FIELD CONTROLLER STRINGS
  TextEditingController nameController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  // Widget Builder (UI Builder)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('GMC Manjeri Survey', style: TextStyle(color: Colors.black),),
          backgroundColor: Colors.white,
          leading: GestureDetector(
            child: Icon(Icons.menu),
            onTap: (){
              debugPrint("Hamburger Menu Clicked");
            },
          ),
        ),
        body: Builder(
            builder: (context) => Padding(
                padding: EdgeInsets.only(top: 0.0),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: commonPadding(),
                      child: TextField(
                        controller: nameController,
                        onChanged: (value){
                          setState() {
                            debugPrint("[main] Name Controller Changed");
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                      ), // TEXTFIELD
                    ), // PADDING
                    Padding(
                      padding: commonPadding(),
                      child: TextField(
                        controller: addressController,
                        keyboardType: TextInputType.multiline,
                        maxLines: 5,
                        onChanged: (value){
                          setState(() {
                            debugPrint('[main] Address Controller Changed');
                          });
                        },
                        decoration: InputDecoration(
                          labelText: 'Address',
                        ),
                      ),
                    ),
                    Padding(
                        padding: commonPadding(),
                        child: Column(
                          children: <Widget>[
                            Center(
                                child: Text("Select Religion", style: TextStyle(color: Colors.grey))
                            ),
                            Wrap(
                                spacing: 5,
                                children: _Religions.map((String religion)=> ChoiceChip(
                                  selected: _selectedReligion == religion,
                                  backgroundColor: Colors.black12,
                                  label: Text(religion.toString(), style: TextStyle(color: Colors.black),),
                                  //                        avatar: _selectedReligion == religion
                                  //                            ? Icon(Icons.done)
                                  //                            : null,
                                  selectedColor: Colors.grey,
                                  onSelected: (bool isChecked){
                                    setState(() {
                                      _selectedReligion = isChecked ? religion : "";
                                    });
                                  },
                                )).toList()
                            ), // WRAP
                          ],
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                                child: Text("Select Occupation", style: TextStyle(color: Colors.grey))
                            ),
                            Wrap(
                                spacing: 5,
                                children: _Occupations.map((String occupation)=> ChoiceChip(
                                  selected: _selectedOccupation == occupation,
                                  backgroundColor: Colors.black12,
                                  label: Text(occupation.toString(), style: TextStyle(color: Colors.black),),
                                  //                        avatar: _selectedReligion == religion
                                  //                            ? Icon(Icons.done)
                                  //                            : null,
                                  selectedColor: Colors.grey,
                                  onSelected: (bool isChecked){
                                    setState(() {
                                      _selectedOccupation = isChecked ? occupation : "";
                                    });
                                  },
                                )).toList()
                            ), // WRAP
                          ],
                        )
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Column(
                          children: <Widget>[
                            Center(
                                child: Text("Select Education", style: TextStyle(color: Colors.grey))
                            ),
                            Wrap(
                                spacing: 5,
                                children: _EducationCategories.map((String education)=> ChoiceChip(
                                  selected: _selectedEducation == education,
                                  backgroundColor: Colors.black12,
                                  label: Text(education.toString(), style: TextStyle(color: Colors.black),),
                                  //                        avatar: _selectedReligion == religion
                                  //                            ? Icon(Icons.done)
                                  //                            : null,
                                  selectedColor: Colors.grey,
                                  onSelected: (bool isChecked){
                                    setState(() {
                                      _selectedEducation = isChecked ? education : "";
                                    });
                                  },
                                )).toList()
                            ), // WRAP
                          ],
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0, bottom: 25.0, left: 15.0, right: 15.0),
                      child: RaisedButton(
                        child: Text(
                          "PROCEED TO QUESTIONNAIRE",
                          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                        color: Colors.black,
                        onPressed: (){
                          debugPrint("Proceed clicked");
                          if((_selectedEducation.isNotEmpty) &&
                              (_selectedOccupation.isNotEmpty) &&
                              (_selectedOccupation.isNotEmpty) &&
                              (nameController.text.isNotEmpty) &&
                              (addressController.text.isNotEmpty))

                          {
                            Person person = new Person(
                                getNewId(),
                                nameController.text,
                                addressController.text,
                                _selectedReligion,
                                _selectedOccupation,
                                _selectedEducation
                            );
                            navigateToQuestionnaire(person);
                          }
                          else{
                            Scaffold.of(context).showSnackBar(_showSnack("One or more fields above are empty."));
                          }
                        },
                      ),
                    )
                  ],
                )
            )
        )
    );

  }
  EdgeInsets commonPadding(){
    return EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15);
  }
  void navigateToQuestionnaire(Person person) async{
//    final dataFromQuestionnaire = await Navigator.push(
//      context, MaterialPageRoute(builder: (context){
//        return QuestionnaireState(person: person);
//    })
//    );
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return Questionnaire(person);
    }));
  }
  int getNewId(){
    return _id++;
  }

  SnackBar _showSnack(String text){
    return SnackBar(content: Text(text));
  }
}