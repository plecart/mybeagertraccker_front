String convertDate(String inputDate) {
  List<String> parts = inputDate.split('/');
  int day = int.parse(parts[0]);
  int month = int.parse(parts[1]);
  int year = int.parse(parts[2]);
  DateTime dateTime = DateTime(year, month, day);
  String formattedDate = dateTime.toIso8601String();
  return formattedDate;
}