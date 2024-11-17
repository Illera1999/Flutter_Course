void main(List<String> args) {
  Square square = Square( side: 10);
  square.setSide(20);
  print(square.getSide());
  print(square.getArea());
}


class Square {

  double _side;

  Square({
    required double side
  }):assert(side >= 0, 'Side must be >= 0'),
  _side = side;

  void setSide(double side) {
    _side = side;
  }

  double getSide() {
    return _side;
  }

  double getArea() {
    return _side * _side;
  }
}