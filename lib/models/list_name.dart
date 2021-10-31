class ListName{
  final int number;
  final String title;
  final String firstName;
  final String lastName;

  ListName({
    required this.number,
    required this.title,
    required this.firstName,
    required this.lastName,
  });

  factory ListName.fromJson(Map<String, dynamic> json) {
    return ListName(
      number: json['number'],
      title: json['title'],
      firstName: json['firstName'],
      lastName: json['lastName'],
    );
  }

  ListName.fromJson2(Map<String, dynamic> json)
      : number = json['number'],
        title = json['title'],
        firstName = json['firstName'],
        lastName = json['lastName'];
}