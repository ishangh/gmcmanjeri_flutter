import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';


// For deciding the type of Result to be displayed, change the value passed into the ResultContent Widget, in the layout of HOME section

// For adding new properties to the type of Results use RESULT CLASS

// Add new type of Results in the MAIN FUNCTION or changing existing properties



//*****************************RESULT CLASS*******************************
class Result {
  double percentage;
  Color fillColor;
  String displayText;
  String displaySubText;

  Result(
      this.percentage, this.fillColor, this.displayText, this.displaySubText);
}
//***************************************************************************



var resultsList = new List<Result>();


// Change the value of this variable to change the width of the progress bar
double width = 10.0;





//*******************MAIN FUNCTION*****************************************

void main() {

  //THIS IS WHERE YOU CAN ADD CATEGORIES OR CHANGE THEIR PROPERTIES

  resultsList.add(new Result(20.0, Colors.green, "LOW RISK", "(<10%)"));
  resultsList.add(
      new Result(40.0, Colors.amberAccent, "LOW MEDIUM RISK", "(10%-20%)"));
  resultsList.add(new Result(60.0, Colors.amber, "MEDIUM RISK", "(20%-30)"));
  resultsList.add(new Result(80.0, Colors.redAccent, "HIGH RISK", "(30%-40%)"));
  resultsList.add(new Result(100.0, Colors.red, "CRITICAL RISK", "(>40%)"));

  runApp(MyApp());
}
//***************************************************************************





class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GMC Manjeri Survey',
      color: Colors.white,
      theme: ThemeData(
          primaryColor: Colors.black,
          appBarTheme:
          AppBarTheme(iconTheme: IconThemeData(color: Colors.black)),
          inputDecorationTheme: InputDecorationTheme(
              border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(5.0))),
          iconTheme: IconThemeData(color: Colors.black)),
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}


//*********************************** HOME ******************************************


class Home extends StatelessWidget {

  //BASIC LAYOUT
  // Scaffold
  //      Home Content
  //      Save and Delete Buttons

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RESULTS"),
      ),
      body: ResultContent(3),

      //********************* IMPORTANT ***********************************

      //CHANGE THE VARIABLE PASSED INTO ResultContent (given right above) TO DECIDE THE TYPE OF RESULT
      // 0 - LOW RISK
      // 1 - LOW MEDIUM RISK
      // 2 - MEDIUM RISK
      // 3 - HIGH RISK
      // 4 - CRITICAL RISK

      //********************************************************************


      floatingActionButton: Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton.extended(
              onPressed: () {},
              label: const Text("Save"),
              elevation: 10.0,
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
            ),
          ),
          FloatingActionButton.extended(
            onPressed: () {},
            label: const Text("Delete"),
            elevation: 10.0,
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

//**********************************************************************************



//*************************************RESULT CONTENT******************************************

class ResultContent extends StatefulWidget {


  int choice;

  ResultContent(var choice)
  {
    this.choice = choice;
    resultsList.add(new Result(20.0, Colors.green, "LOW RISK", "(<10%)"));
  resultsList.add(
      new Result(40.0, Colors.amberAccent, "LOW MEDIUM RISK", "(10%-20%)"));
  resultsList.add(new Result(60.0, Colors.amber, "MEDIUM RISK", "(20%-30)"));
  resultsList.add(new Result(80.0, Colors.redAccent, "HIGH RISK", "(30%-40%)"));
  resultsList.add(new Result(100.0, Colors.red, "CRITICAL RISK", "(>40%)"));
  }

  @override
  _ResultContentState createState() {
    return _ResultContentState(choice);
  }
}

class _ResultContentState extends State<ResultContent>
    with TickerProviderStateMixin {
  double tempPercentage = 0.0;
  double newPercentage = 0.0;
  double percentage = 0.0;
  int choice;
  String displayText ;
  String displaySubText ;


  Color fillColor;
  AnimationController percentageAnimationController;

  _ResultContentState(this.choice);

  @override
  void initState() {
    super.initState();

    setState(() {
      percentage = 0.0;

      tempPercentage = resultsList[choice].percentage;
      fillColor = resultsList[choice].fillColor;
      displayText = resultsList[choice].displayText;
      displaySubText = resultsList[choice].displaySubText;


    });

    // For the Animation of the progress bar filling

    percentageAnimationController = new AnimationController(
        vsync: this, duration: Duration(milliseconds: 80000))
      ..addListener(() {
        setState(() {
          percentage = lerpDouble(
              percentage, newPercentage, percentageAnimationController.value);


          /*
          if(percentage <= 10)
            fillColor = Colors.green;
          else if(percentage<=20)
            fillColor = Colors.amberAccent;
          else if(percentage<=30)
            fillColor = Colors.amber;
          else if(percentage <= 40)
            fillColor = Colors.redAccent;
          else if(percentage>40)
            fillColor = Colors.red;
*/


        });
      });

    startAnimation();
  }


  // Function to kick off the animation
  void startAnimation() {

    setState(() {
      newPercentage = tempPercentage;
      percentageAnimationController.forward(from: -1.0);
    });
  }



  // Contains the ProgressBar and the text inside

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Result"),
      ),
      body: Center(
      child: Container(
        height: 200.0,
        width: 200.0,
        child: CustomPaint(
          foregroundPainter: ProgressBar(
              completeColor: fillColor,
              lineColor: Colors.blueGrey,
              completePercent: percentage,
              width: width),
          child: Center(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      displayText,
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Text(
                    displaySubText,
                    style: TextStyle(fontSize: 16.0),
                  ),Padding(
          padding:
              EdgeInsets.only(top: 10.0, bottom: 25.0, left: 15.0, right: 15.0),
          child: Builder(
              builder: (context) => RaisedButton(
                  child: Text(
                    "Continue",
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 25.0),
                  ),
                  elevation: 2.0,
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    debugPrint("Proceed clicked");
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pop(context);
                      Navigator.of(context).pushNamed("/");
                  }))),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              )),
        ),
      ),
    ),
    );
  }
}

//***********************************************************************





//Implemented using the canvas and the CustomPainter class

class ProgressBar extends CustomPainter {
  Color lineColor;
  Color completeColor;
  double completePercent;
  double width;

  ProgressBar(
      {this.lineColor, this.completeColor, this.width, this.completePercent});

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = lineColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = new Paint()
      ..color = completeColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;

    Offset center = new Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);

    double arcAngle = 2 * pi * (completePercent / 100);

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
