//This class has everything to do with the calculation of the app
class Calculator {
  int num1000 = 0,
      num500 = 0,
      num200 = 0,
      num100 = 0,
      num50 = 0,
      num20 = 0,
      num10 = 0,
      num5 = 0;

  int a1 = 0, a2 = 0, a3 = 0, a4 = 0, a5 = 0, a6 = 0, a7 = 0, a8 = 0;

  Calculator({
    int num1000,
    num500,
    num200,
    num100,
    num50,
    num20,
    num10,
    num5,
  }) {
    this.num1000 = num1000;
    this.num500 = num500;
    this.num200 = num200;
    this.num100 = num100;
    this.num50 = num50;
    this.num20 = num20;
    this.num10 = num10;
    this.num5 = num5;
  }

//  this multiply the numbers passed into it
  int _multiply(int mul, int num) {
//    the value * the literal value
    return mul * num;
  }

//  adds up the multiplied result
  int add() {
    a1 = _multiply(num1000, 1000);
    a2 = _multiply(num500, 500);
    a3 = _multiply(num200, 200);
    a4 = _multiply(num100, 100);
    a5 = _multiply(num50, 50);
    a6 = _multiply(num20, 20);
    a7 = _multiply(num10, 10);
    a8 = _multiply(num5, 5);

    return a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8;
  }

//  advance add adds only the active column
  int addOnly(int num) {
    if (num == 1) {
      return a1;
    } else if (num == 2) {
      return a2;
    } else if (num == 3) {
      return a3;
    } else if (num == 4) {
      return a4;
    } else if (num == 5) {
      return a5;
    } else if (num == 6) {
      return a6;
    } else if (num == 7) {
      return a7;
    } else if (num == 8) {
      return a8;
    }
    return null;
  }
}
