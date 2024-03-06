class FormatData {
  Map<String, dynamic> convertData(Map<String, dynamic> json) {
    Map<String, dynamic> result = {};

    switch (json["units"]) {
      case "b":
        List<String> convertedValues = convertBits(json["lastvalue"]);
        result['newValue'] = convertedValues[0];
        result['newUnits'] = convertedValues[1];
        break;
      case 'bps':
        List<String> convertedValues = convertBitsPerSecond(json["lastvalue"]);
        result['newValue'] = convertedValues[0];
        result['newUnits'] = convertedValues[1];
        break;
      case 'B':
        List<String> convertedValues = convertBytes(json["lastvalue"]);
        result['newValue'] = convertedValues[0];
        result['newUnits'] = convertedValues[1];
        break;
      case 'Bps':
        List<String> convertedValues = convertBytesPerSecond(json["lastvalue"]);
        result['newValue'] = convertedValues[0];
        result['newUnits'] = convertedValues[1];
        break;
      case '%':
        result['newValue'] = percentageConverter(json["lastvalue"]);
        result['newUnits'] = '%';
        break;
      case 's':
        List<String> convertedValues = convertSeconds(json["lastvalue"]);
        result['newValue'] = convertedValues[0];
        result['newUnits'] = convertedValues[1];
        break;
      case 'uptime':
        String convertedValues = convertTimestampToUptime(json["lastvalue"]);
        result['newValue'] = convertedValues;
        result['newUnits'] = "";
        break;
      default:
        result['newValue'] = json["lastvalue"];
        result["newUnits"] = json["units"];
        break;
    }

    return result;
  }

  String convertTimestampToUptime(String value) {
    int uptimeSeconds = int.parse(value);

    int days = uptimeSeconds ~/ (24 * 3600);
    int hours = (uptimeSeconds % (24 * 3600) ~/ 3600);
    int minutes = (uptimeSeconds % 3600 ~/ 60);
    int seconds = uptimeSeconds % 60;

    String uptimeString = '';
    if (days > 0) {
      uptimeString += '${days} dias, ';
    }

    String hoursString = hours < 10 ? '0$hours' : '$hours';
    String minutesString = minutes < 10 ? '0$minutes' : '$minutes';
    String secondsString = seconds < 10 ? '0$seconds' : '$seconds';

    uptimeString += '$hoursString:$minutesString:$secondsString';

    return uptimeString;
  }

  static convertBytes(String stringBps) {
    int bps = int.parse(stringBps);
    List<String> values = [];
    const int bistInKilobit = 1024;
    const int bitsInMegabit = 1048576;
    const int bitsInGigabit = 1073741824;

    if (bps < bistInKilobit) {
      values.clear();
      values.add(bps.toStringAsFixed(2));
      values.add('B');
      return values;
    } else if (bps < bitsInMegabit) {
      double mbps = bps / bistInKilobit;
      values.clear();
      values.add(mbps.toStringAsFixed(2));
      values.add('KB');
      return values;
    } else if (bps < bitsInGigabit) {
      double gbps = bps / bitsInMegabit;
      values.clear();
      values.add(gbps.toStringAsFixed(2));
      values.add('MB');
      return values;
    } else {
      double tbps = bps / bitsInGigabit;
      values.clear();
      values.add(tbps.toStringAsFixed(2));
      values.add('GB');
      return values;
    }
  }

  static convertBits(String stringBps) {
    int bps = int.parse(stringBps);
    List<String> values = [];
    const int bistInKilobit = 1000;
    const int bitsInMegabit = 1000000;
    const int bitsInGigabit = 1000000000;

    if (bps < bistInKilobit) {
      values.clear();
      values.add(bps.toStringAsFixed(2));
      values.add('B');
      return values;
    } else if (bps < bitsInMegabit) {
      double mbps = bps / bistInKilobit;
      values.clear();
      values.add(mbps.toStringAsFixed(2));
      values.add('KB');
      return values;
    } else if (bps < bitsInGigabit) {
      double gbps = bps / bitsInMegabit;
      values.clear();
      values.add(gbps.toStringAsFixed(2));
      values.add('MB');
      return values;
    } else {
      double tbps = bps / bitsInGigabit;
      values.clear();
      values.add(tbps.toStringAsFixed(2));
      values.add('GB');
      return values;
    }
  }

  static convertBytesPerSecond(String stringbps) {
    int bps = int.parse(stringbps);
    List<String> values = [];
    const int bistInKilobit = 1024;
    const int bitsInMegabit = 1048576;
    const int bitsInGigabit = 1073741824;

    if (bps < bistInKilobit) {
      values.clear();
      values.add(bps.toStringAsFixed(2));
      values.add('bps');
      return values;
    } else if (bps < bitsInMegabit) {
      double mbps = bps / bistInKilobit;
      values.clear();
      values.add(mbps.toStringAsFixed(2));
      values.add('Kbps');
      return values;
    } else if (bps < bitsInGigabit) {
      double gbps = bps / bitsInMegabit;
      values.clear();
      values.add(gbps.toStringAsFixed(2));
      values.add('Mbps');
      return values;
    } else {
      double tbps = bps / bitsInGigabit;
      values.clear();
      values.add(tbps.toStringAsFixed(2));
      values.add('Gbps');
      return values;
    }
  }

  static convertBitsPerSecond(String stringbps) {
    int bps = int.parse(stringbps);
    List<String> values = [];
    const int bistInKilobit = 1000;
    const int bitsInMegabit = 1000000;
    const int bitsInGigabit = 1000000000;

    if (bps < bistInKilobit) {
      values.clear();
      values.add(bps.toStringAsFixed(2));
      values.add('bps');
      return values;
    } else if (bps < bitsInMegabit) {
      double mbps = bps / bistInKilobit;
      values.clear();
      values.add(mbps.toStringAsFixed(2));
      values.add('Kbps');
      return values;
    } else if (bps < bitsInGigabit) {
      double gbps = bps / bitsInMegabit;
      values.clear();
      values.add(gbps.toStringAsFixed(2));
      values.add('Mbps');
      return values;
    } else {
      double tbps = bps / bitsInGigabit;
      values.clear();
      values.add(tbps.toStringAsFixed(2));
      values.add('Gbps');
      return values;
    }
  }

  List<String> convertSeconds(String value) {
    double seconds = double.parse(value);
    List<String> values = [];
    const int secondsInMinute = 60;
    const int minutesInHour = 60;
    const int hoursInDay = 24;
    const int millisInSecond = 1000;

    if (seconds < 0.001) {
      values.add("< 1 ms");
    } else if (seconds < secondsInMinute) {
      values.add((seconds * millisInSecond).toStringAsFixed(1));
      values.add('ms');
    } else if (seconds < secondsInMinute * minutesInHour) {
      double minutes = seconds / secondsInMinute;
      values.add((minutes).toStringAsFixed(0));
      values.add('m');
      if (seconds >= secondsInMinute * minutesInHour) {
        values.add(
            ((seconds % (secondsInMinute * minutesInHour)) / secondsInMinute)
                .toStringAsFixed(0));
        values.add('s');
      }
    } else if (seconds < secondsInMinute * minutesInHour * hoursInDay) {
      double hours = seconds / (secondsInMinute * minutesInHour);
      values.add((hours).toStringAsFixed(0));
      values.add('h');
      if (seconds >= secondsInMinute * minutesInHour * hoursInDay) {
        values.add(((seconds % (secondsInMinute * minutesInHour * hoursInDay)) /
                (secondsInMinute * minutesInHour))
            .toStringAsFixed(0));
        values.add('m');
      }
    } else {
      double days = seconds / (secondsInMinute * minutesInHour * hoursInDay);
      values.add((days).toStringAsFixed(0));
      values.add('d');
      if (seconds >= secondsInMinute * minutesInHour * hoursInDay) {
        values.add(((seconds % (secondsInMinute * minutesInHour * hoursInDay)) /
                (secondsInMinute * minutesInHour))
            .toStringAsFixed(0));
        values.add('h');
      }
    }

    return values;
  }

  static percentageConverter(String doubleValue) {
    double value = double.parse(doubleValue);
    return value.toStringAsFixed(1);
  }

  interfaceTypeToString(String interfaceType) {
    String newValue = switch (interfaceType) {
      '1' => 'ZBX',
      '2' => 'SNMP',
      '3' => 'IPMI',
      '4' => 'JMX',
      _ => '',
    };
    return newValue;
  }
}
