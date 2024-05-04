String formatDate(String date) {
  var resultParse = DateTime.parse(date);
  return '${resultParse.day}.${resultParse.month}.${resultParse.year}';
}
