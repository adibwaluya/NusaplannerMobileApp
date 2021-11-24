import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:nusaplanner_app/classes/user_sp.dart';
import 'package:nusaplanner_app/widgets/button_date_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatePickerWidget extends StatefulWidget {
  const DatePickerWidget({Key? key}) : super(key: key);

  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  final storage = FlutterSecureStorage();
  DateTime? date;
  DateTime? endDate;
  String dateStartString = "";
  String dateEndString = "";
  String _dateEndString = "";

  _loadDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _dateEndString = (prefs.getString('addDateEnd') ?? "");
    });
  }

  /* To be used soon! */
  /* _setDate(String date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _dateEndString = date;
    });
    await prefs.setString('addDateEnd', _dateEndString);
  } */

  _setUserDateEnd(String date) async {
    setState(() {
      _dateEndString = date;
    });
    await UserSimplePreferences.setDate(_dateEndString);
  }

  String getStartText() {
    if (date == null) {
      return 'Start of your study preparation';
    } else {
      dateStartString = DateFormat('dd/MM/yyyy').format(date!);
      _setStoredStartDate(dateStartString);
      return dateStartString;
    }
  }

  String getEndText() {
    if (date == null) {
      return 'Estimation of End Date';
    } else {
      dateEndString = DateFormat('dd/MM/yyyy').format(endDate!);

      _setStoredEndDate(dateEndString);
      return dateEndString;
    }
  }

  void _setStoredStartDate(String date) async {
    await storage.write(key: 'dateStart', value: date);
  }

  void _setStoredEndDate(String date) async {
    await storage.write(key: 'dateEnd', value: date);
  }

  @override
  Widget build(BuildContext context) {
    return ButtonHeaderWidget(
      title: 'Date',
      text: getStartText(),
      endText: getEndText(),
      onClicked: () => pickDate(context),
    );
  }

  Future pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: date ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 5),
        lastDate: DateTime(DateTime.now().year + 5));
    final newEndDate = newDate!.add(const Duration(hours: 24 * 190));
    if (newDate == null) return;

    setState(() {
      date = newDate;
      endDate = newEndDate;
      // await _setDate(DateFormat('dd/MM/yyyy').format(endDate!));
      _setUserDateEnd(DateFormat('dd/MM/yyyy').format(endDate!));
    });
  }
}
