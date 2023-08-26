class Multiplication {
  int multiplicand = -1;
  int multiplier = -1;
  int product = -1;

  Multiplication(this.multiplicand, this.multiplier) {
    if (multiplicand <= 0 || multiplier <= 0) {
      throw Exception('multiplicand と multiplier は 1 以上の整数である必要があります');
    }
    product = multiplicand * multiplier;
  }
}
