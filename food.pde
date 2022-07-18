class food {
  PVector location;
  //color c = color(random(255), random(255), random(255));
  food(float wide, float high) {
    location = new PVector(wide, high);
  }


  void pick_location() {
    location = new PVector(
      int(random(1, (width)/size))*size,
      int(random(1, (height)/size))*size
      );
    //c = color(random(150,255), random(150,255), random(150,255));
  }


  void show() {
    fill(#E76E93);
    noStroke();
    square(location.x, location.y, size*0.8);
  }
}
