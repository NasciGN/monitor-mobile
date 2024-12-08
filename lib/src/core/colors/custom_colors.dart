import 'package:flutter/material.dart';

const darkBgColor = Color.fromARGB(255, 23, 23, 24);
const darkScdBgColor = Color(0xFF2B2B2B);
const darkPrmBgColor = Color(0xFF454545);

const darkIcnColor = Color.fromARGB(255, 189, 3, 3);
const darkBtnColor = Color(0xFF69808D);

const whiteBgColor = Color(0xFFEBEEF0);
const whiteScdBgColor = Color(0xFFFFFFFF);
const whiteTrdBgColor = Color(0xFF0A466A);
const whiteIcnColor = Color(0xFF8CB2CA);
const whiteBtnColor = Color(0xFF0275B8);

const activeItmColor = Color(0xFF42C039);
const inactiveItmColor = Color(0xFFFF485A);
const linkColor = Color(0xFF3B96BA);

const availabilityAvailable = Color(0xFF42C039);
const availabilityUnavailable = Color(0xFFE45959);
const availabilityUnknown = Color(0xFF97AAB3);
const availabilityTotal = Color(0xFF131619);

const notClassified = {
  "txtColor": Color(0xFF97AAB3),
  "bgColor": Color(0xFF97AAB3),
};
const information = {
  "txtColor": Color(0xFF00268E),
  "bgColor": Color(0xFF7499FF),
};
const warning = {
  "txtColor": Color(0xFF8A4D1D),
  "bgColor": Color(0xFFFFC859),
};
const average = {
  "txtColor": Color(0xFFBB5100),
  "bgColor": Color(0xFFFFA059),
};
const high = {
  "txtColor": Color(0xFF52190B),
  "bgColor": Color(0xFFE97659),
};
const disaster = {
  "txtColor": Color(0xFFFFA059),
  "bgColor": Color(0xFFE45959),
};

Map<String, Color> getSeverityColors(String severity) {
  switch (severity) {
    case '0':
      return notClassified;
    case '1':
      return information;
    case '2':
      return warning;
    case '3':
      return average;
    case '4':
      return high;
    case '5':
      return disaster;
    default:
      return {
        "txtColor": Colors.grey,
        "bgColor": Colors.grey
      }; // Cor padrão caso não haja correspondência
  }
}
