import 'package:flutter/material.dart';

const darkBgColor = Color.fromARGB(255, 23, 23, 24);
const darkPrmBgColor = Color(0xFF2B2B2B);
const darkScdBgColor = Color(0xFF454545);
const darkIcnColor = Color(0xFFD0D0D0);
const darkBtnColor = Color(0xFF69808D);

const whiteBgColor = Color(0xFFEBEEF0);
const whiteScdBgColor = Color(0xFFFFFFFF);
const whiteTrdBgColor = Color(0xFF0A466A);
const whiteIcnColor = Color(0xFF8CB2CA);
const whiteBtnColor = Color(0xFF0275B8);

const activeItmColor = Color(0xFF42C039);
const inactiveItmColor = Color(0xFFFF485A);
const linkColor = Color(0xFF3B96BA);

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
  "bgColor": Color(0xFFFFA059),
};
const disaster = {
  "txtColor": Color(0xFFFFA059),
  "bgColor": Color(0xFFFFA059),
};

Object map<String, int>(String severity) {
  switch (severity) {
    case '0':
      return notClassified; // not classified
    case '1':
      return information; // information
    case '2':
      return warning; // warning
    case '3':
      return average; // average
    case '4':
      return high; // high
    case '5':
      return disaster; // disaster
    default:
      return Colors.grey; // Cor padrão caso não haja correspondência
  }
}
