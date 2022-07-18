class snake_obj {
  PVector dir = new PVector(0, 0);
  PVector head;
  ArrayList<PVector> body = new ArrayList<PVector>();

  snake_obj(PVector spawn_pos) {
    head = new PVector(spawn_pos.x, spawn_pos.y);
  }

  void move(PVector direction) {

    PVector prev_pos = new PVector(head.x, head.y);
    head.x += size*direction.x;
    head.y += size*direction.y;

    for (int i=0; i<body.size(); i++) {
      PVector tmp_prev_pos = new PVector(body.get(i).x, body.get(i).y);
      body.get(i).x = prev_pos.x;
      body.get(i).y = prev_pos.y;
      prev_pos.x = tmp_prev_pos.x;
      prev_pos.y = tmp_prev_pos.y;
    }

    if (head.x < size) {
      head.x = width-size;
    } else if (head.x > width - size) {
      head.x = size;
    }
    if (head.y < size) {
      head.y = height-size;
    } else if (head.y > height - size) {
      head.y = size;
    }
  }

  void show() {
    fill(#686868);
    square(head.x, head.y, size);
    for (int i=0; i<body.size(); i++) {
      fill(#E79D22);
      square(body.get(i).x, body.get(i).y, size);
    }
    //fill(0);
    //circle(head.x, head.y, size*0.25);
  }

  void get_dir() {
    if (keyCode == RIGHT) {
      if (dir.x == -1) {
        return;
      }
      this.dir = new PVector(1, 0);
    } else if (keyCode == UP) {
      if (dir.y == 1) {
        return;
      }
      this.dir = new PVector(0, -1);
    } else if (keyCode == LEFT) {
      if (dir.x == 1) {
        return;
      }
      this.dir = new PVector(-1, 0);
    } else if (keyCode == DOWN) {
      if (dir.y == -1) {
        return;
      }
      this.dir = new PVector(0, 1);
    }
  }

  boolean eat_food(PVector food_loc) {
    if (
      abs(sn.head.x - food_loc.x) < size/5 &&
      abs(sn.head.y - food_loc.y) < size/5)
    {
      body.add(new PVector(food_loc.x, food_loc.y));
      return true;
    }
    return false;
  }

  boolean is_on_itself() {
    for (int i=0; i<body.size(); i++) {
      if (eat_food(new PVector(body.get(i).x, body.get(i).y))) {
        return true;
      }
    }
    return false;
  }
}
