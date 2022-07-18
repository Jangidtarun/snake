int size = 20;
PVector spawn_loc = new PVector(width/2, height/2);
snake_obj sn;
int score = 0;

boolean show_grid = true;
//boolean is_game_over = false;

food f;

void setup() {
  size(800, 800);
  f = new food(
    int(random(1, (width-size)/size))*size,
    int(random(1, (height-size)/size))*size
    );
  sn = new snake_obj(new PVector(
    int(random(1, (width-size)/size))*size,
    int(random(1, (height-size)/size))*size
    ));
}

void draw() {
  rectMode(CENTER);

  background(200);
  if (show_grid) {
    for (int i=size; i<width; i+=size) {
      for (int j=size; j<height; j+=size) {
        color odd_color = #6DADE7;
        color even_color = #27E7DA;
        if ((i/size+j/size)%2 == 0) {
          fill(even_color, 100);
        } else {
          fill(odd_color, 100);
        }
        square(i, j, size);
      }
    }
  }

  sn.get_dir();
  sn.move(sn.dir);
  sn.show();

  if (sn.is_on_itself()) {
    textSize(64);
    fill(0);
    textAlign(CENTER);
    //stroke(0);
    //strokeWeight(10);
    text("GAME OVER\nScore: " + score, width/2, height/2);
    //is_game_over = true;
    noLoop();
  }

  if (sn.eat_food(f.location)) {
    f.pick_location();
    score++;
  }
  f.show();


  frameRate(width/size/4.0);

  //if (is_game_over && mousePressed == true) {
  //  sn.head = new PVector(size, size);
  //  //is_game_over = false;
  //  loop();
  //}
}
