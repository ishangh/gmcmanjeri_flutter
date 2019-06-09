class Person{
  int _id = 0;
  String _name = "";
  String _address = "";
  String _religion = "";
  String _occupation = "";
  String _education = "";

  Person(int id, String name, String address, String religion, String occupation, String education){
    this._id = id;
    this._name = name;
    this._address = address;
    this._religion = religion;
    this._occupation = occupation;
    this._education = education;
  }

  int get id => _id;
  String get name => _name;
  String get address => _address;
  String get religion => _religion;
  String get occupation => _occupation;
  String get education => _education;

  set name(String newName){
    this._name = newName;
  }

  set address(String newAddress){
    this._address = newAddress;
  }

  set religion(String newReligion){
    this._religion = newReligion;
  }

  set occupation(String newOccupation){
    this._occupation = newOccupation;
  }

  set education(String newEducation){
    this._education = newEducation;
  }
}