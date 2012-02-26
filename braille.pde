var kBrailleChars = {
  "a": [1, 0, 0, 0, 0, 0],
  "b": [1, 0, 1, 0, 0, 0],
  "c": [1, 1, 0, 0, 0, 0]
};

String[] kCharList = ["a", "b", "c"];
int gIndex = 0;

class Dot {
  int x;
  int y;

  Dot(int x, int y) {
    this.x = x;
    this.y = y;
  }

  void drawWith(boolean aSet) {
    if (aSet) {
      // Red
      fill(255, 0, 0);
    }
    else {
      // White
      fill(255);
    }

    ellipse(this.x, this.y, 32, 32);
  }
}

Dot[] gDots = {
  new Dot(64, 72),
  new Dot(128, 72),
  new Dot(64, 136),
  new Dot(128, 136),
  new Dot(64, 200),
  new Dot(128, 200)
};

PFont gFont;

void setup() {
  size(400, 280);
  gFont = createFont("serif", 200);
  noLoop();
}

void draw() {
  background(255);
  var currChar = kCharList[gIndex];
  var currDots = kBrailleChars[currChar];
  for (int i = 0; i < gDots.length(); i++) {
    gDots[i].drawWith(currDots[i]);
  }
  textFont(gFont);
  fill(0);
  text(currChar, 240, 216);
}

void moveNext() {
  gIndex = (gIndex + 1) % kCharList.length();
  redraw();
}

document.getElementById("next-button").addEventListener("click", moveNext, false);
