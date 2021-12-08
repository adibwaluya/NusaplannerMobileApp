class Todolist {
  /* int id;
  int userId; */
  int planningLanguageOne;
  int planningLanguageTwo;
  int planningLanguageThree;
  int planningDocumentOne;
  int planningDocumentTwo;
  int planningDocumentThree;
  int planningBankAccountOne;
  int planningVisaOne;
  int planningVisaTwo;
  int planningAnpOne;
  int planningAnpTwo;
  int planningDepartureOne;
  int planningDepartureTwo;

  Todolist(
      {/* required this.id,
      required this.userId, */
      required this.planningLanguageOne,
      required this.planningLanguageTwo,
      required this.planningLanguageThree,
      required this.planningDocumentOne,
      required this.planningDocumentTwo,
      required this.planningDocumentThree,
      required this.planningBankAccountOne,
      required this.planningVisaOne,
      required this.planningVisaTwo,
      required this.planningAnpOne,
      required this.planningAnpTwo,
      required this.planningDepartureOne,
      required this.planningDepartureTwo});

  factory Todolist.fromJson(Map<String, dynamic> json) {
    return Todolist(
        /* id: json['id'],
        userId: json['userId'], */
        planningLanguageOne: json['languageOne'],
        planningLanguageTwo: json['languageTwo'],
        planningLanguageThree: json['languageThree'],
        planningDocumentOne: json['documentOne'],
        planningDocumentTwo: json['documentTwo'],
        planningDocumentThree: json['documentThree'],
        planningBankAccountOne: json['bankOne'],
        planningVisaOne: json['visaOne'],
        planningVisaTwo: json['visaTwo'],
        planningAnpOne: json['anpOne'],
        planningAnpTwo: json['anpTwo'],
        planningDepartureOne: json['depOne'],
        planningDepartureTwo: json['depTwo']);
  }
}
