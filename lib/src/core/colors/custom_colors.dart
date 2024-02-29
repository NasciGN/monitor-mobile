import 'package:flutter/material.dart';

const darkBgColor = Color(0x000E1012);
const darkScdBgColor = Color(0x002B2B2B);
const darkTrdBgColor = Color(0x00454545);
const darkIcnColor = Color(0x00D0D0D0);
const darkBtnColor = Color(0x0069808D);

const whiteBgColor = Color(0x00EBEEF0);
const whiteScdBgColor = Color(0x00FFFFFF);
const whiteTrdBgColor = Color(0x000A466A);
const whiteIcnColor = Color(0x008CB2CA);
const whiteBtnColor = Color(0x000275B8);

const activeItmColor = Color(0x0042C039);
const inactiveItmColor = Color(0x00FF485A);
const linkColor = Color(0x003B96BA);

const notClassified = {
  "txtColor": 0x0,
  "bgColor": 0x0097AAB3,
};
const information = {
  "txtColor": 0x0000268E,
  "bgColor": 0x007499FF,
};
const warning = {
  "txtColor": 0x008A4D1D,
  "bgColor": 0x00FFC859,
};
const average = {
  "txtColor": 0x00BB5100,
  "bgColor": 0x00FFA059,
};
const high = {
  "txtColor": 0x0052190B,
  "bgColor": 0x00FFA059,
};
const disaster = {
  "txtColor": 0x0,
  "bgColor": 0x00FFA059,
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
