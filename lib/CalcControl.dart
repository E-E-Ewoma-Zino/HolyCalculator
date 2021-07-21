//controls all the functions
class Control {
  List<int> _temp = [];
  int _ctr = 1;

  int _num1000 = 0,
      _num500 = 0,
      _num200 = 0,
      _num100 = 0,
      _num50 = 0,
      _num20 = 0,
      _num10 = 0,
      _num5 = 0;

  int convertToInt() {
    if (_ctr == 2) {
      print('ctr $_ctr');
      _num1000 = int.parse(convertToString(_temp));
      _temp.clear();
      print('_num1000 $_num1000');

      return _num1000;
    }

    if (_ctr == 3) {
      print('ctr $_ctr');
      _num500 = int.parse(convertToString(_temp));
      _temp.clear();
      print('_num500 $_num500');

      return _num500;
    }

    if (_ctr == 4) {
      print('ctr $_ctr');
      _num200 = int.parse(convertToString(_temp));
      _temp.clear();
      print('_num200 $_num200');

      return _num200;
    }

    if (_ctr == 5) {
      print('ctr $_ctr');
      _num100 = int.parse(convertToString(_temp));
      _temp.clear();
      print('_num100 $_num100');

      return _num100;
    }

    if (_ctr == 6) {
      print('ctr $_ctr');
      _num50 = int.parse(convertToString(_temp));
      _temp.clear();
      print('_num50 $_num50');

      return _num50;
    }

    if (_ctr == 7) {
      print('ctr $_ctr');
      _num20 = int.parse(convertToString(_temp));
      _temp.clear();
      print('_num20 $_num20');

      return _num1000;
    }

    if (_ctr == 8) {
      print('ctr $_ctr');
      _num10 = int.parse(convertToString(_temp));
      _temp.clear();
      print('_num10 $_num10');

      return _num10;
    }

    if (_ctr == 9) {
      print('ctr $_ctr');
      _num5 = int.parse(convertToString(_temp));
      _temp.clear();
      print('_num5 $_num5');

      return _num5;
    }
    return null;
  }

  String convertToString(List myList) {
    String _numText = '0';

    for (int i = 0; i < myList.length; i++) {
      _numText += myList[i].toString();
    }
    return _numText;
  }

  int getCounter() {
    return _ctr;
  }

  int getValue(int _num) {
    if (_num == 1) {
      return _num1000;
    } else if (_num == 2) {
      return _num500;
    } else if (_num == 3) {
      return _num200;
    } else if (_num == 4) {
      return _num100;
    } else if (_num == 5) {
      return _num50;
    } else if (_num == 6) {
      return _num20;
    } else if (_num == 7) {
      return _num10;
    } else if (_num == 8) {
      return _num5;
    } else
      return null;
  }

  void holdNum(int _num) {
    _temp.add(_num);
  }

  void next() {
    if (_ctr < 10) {
      _ctr++;
    }
  }

  void setActive(int num) {
    _ctr = num;
  }

  void cancel() {
    _temp.clear();
  }

  void clearAll() {
    _num1000 = 0;
    _num500 = 0;
    _num200 = 0;
    _num100 = 0;
    _num50 = 0;
    _num20 = 0;
    _num10 = 0;
    _num5 = 0;

    _ctr = 1;

    _temp.clear();
  }

//  This function is a place holder function. it displays
//  the placeholder until the user enters the text
  String placeholder(String num) {
    if (_ctr >= 9) {
      return 'Refresh';
    }

    if (num == '') {
      return 'Enter amount';
    } else {
      return '$num';
    }
  }
}
