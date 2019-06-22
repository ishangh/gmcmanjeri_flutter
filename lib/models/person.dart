class Person
{
  int id = 0;
  String name = "";
  String address = "";
  int phoneno = 0;
  String religion = "";
  String occupation = "";
  String education = "";
  bool diabetes = false;
  int gender = 0;
  bool smoker = false;
  int age = 0;
  int sbp = 0;
  int cholestrol = 0;

  bool isAHTT = false;
  double ahttMonths = 0.0;

  bool isMenopause = false;
  bool isPrematureMenopause = false;
  bool famHistoryOfCADRel = false;

  double height = 0.0;
  double weight = 0.0;
  double bmi = 0.0;
  
  double waistCirc = 0.0;
  double hipCirc = 0.0;

  String color = 'green';

  Person(this.id, this.name, this.address, this.phoneno, this.religion, this.occupation, this.education);
  void updateValues( { bool isM = false, bool isPM = false, bool fhCADRel = false, double ht = 0.0, double wt = 0.0, double bmi = 0.0, double wstC = 0.0, double hipC = 0.0 } ){
    this.isMenopause = isM;
    this.isPrematureMenopause = isPM;
    this.famHistoryOfCADRel = fhCADRel;
    this.height = ht;
    this.weight = wt;
    this.bmi = bmi;
    this.waistCirc = wstC;
    this.hipCirc = hipC;
  }
}