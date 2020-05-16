extension DateTimeExtension on DateTime {
  DateTime getFirstDayOfWeek () {
    var _weekDay = this.weekday == 7 ? 0 : this.weekday;
    var date = this.subtract(new Duration(days: _weekDay));
    return date;
  }

  // ///__Templates__
  // ///
  // ///*dd day number
  // ///*MM month number
  // ///*yyyy year number
  // ///
  // ///__Full template__
  // ///
  // ///*ds ex: May 23, 1991
  // String format (String format) {
  //   var day = (this.day < 10 ? "0" : "") + this.day.toString();

  //   if(format == "ds"){
  //     var template = CustomLocalizations.of(navigatorKey.currentContext).translate("template-dateWithMonthName");
  //     return template.replaceAll("yyyy", this.year.toString())
  //       .replaceAll("MM", _monthName(this.month))
  //       .replaceAll("dd", day);
  //   }
  //   else{
  //     var month = (this.month < 10 ? "0" : "") + this.month.toString();
  //     format = format.replaceAll("yyyy", this.year.toString())
  //     .replaceAll("MM", month)
  //     .replaceAll("dd", day);
  //   }
  //   return format;
  // }

  // String _monthName(int month){
  //   var _array = [
  //     "Janeiro",
  //     "Fevereiro",
  //     "Março",
  //     "Abril",
  //     "Maio",
  //     "Junho",
  //     "Julho",
  //     "Agosto",
  //     "Setembro",
  //     "outubro",
  //     "Novembro",
  //     "Dezembro"
  //   ];
  //   return CustomLocalizations.of(navigatorKey.currentContext).translate(_array[month-1]);
  // }
}