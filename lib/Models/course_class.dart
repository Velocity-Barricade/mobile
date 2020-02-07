class CourseClass {
  String name;
  String venue;
  String time;

  CourseClass({this.name, this.venue, this.time});

  factory CourseClass.fromJson(Map<String, dynamic> json) {
    return CourseClass(
        name: json['name'], venue: json['venue'], time: json['time']);
  }

  @override
  String toString() {
    return "name: $name, venue: $venue, time: $time";
  }
}
