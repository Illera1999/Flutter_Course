void main(List<String> args) {
  Square square = Square(10);
  square.setSide(20);
  print(square.getSide());
  print(square.getArea());
}


class Square {

  double side;

  Square(this.side);

  void setSide(double side) {
    this.side = side;
  }

  double getSide() {
    return this.side;
  }

  double getArea() {
    return this.side * this.side;
  }
}