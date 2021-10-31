class ListResult{
  final int number;
  final String title;
  final String firstName;
  final String lastName;
  final String score;

  ListResult({
    required this.number,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.score,
  });

  factory ListResult.fromJson(Map<String, dynamic> json) {
    return ListResult(
      number: json['number'],
      title: json['title'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      score: json['score'],
    );
  }

  ListResult.fromJson2(Map<String, dynamic> json)
      : number = json['number'],
        title = json['title'],
        firstName = json['firstName'],
        lastName = json['lastName'],
        score = json['score'];
}