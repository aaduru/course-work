
const Coord = require('./coord');
class Snake {
  constructor() {
    this.direction = "N";
    this.start = new Coord([10,10]);
    this.segments = [this.start];
    this.DIRS = {
      n: new Coord([-1,0]),
      s: new Coord([1,0]),
      e: new Coord([0,1]),
      w: new Coord([0,-1])
    };
  }

  move() {
    if (this.direction === "N") {
      this.segments.forEach((coord, i) => {
        this.segments[i] = coord.plus(this.DIRS['n']);
      });
    } else if (this.direction === "E") {
      this.segments.forEach((coord, i) => {
        this.segments[i] = coord.plus(this.DIRS['e']);
      });
    } else if (this.direction === "S") {
      this.segments.forEach((coord, i) => {
        this.segments[i] = coord.plus(this.DIRS['s']);
      });
    } else {
      this.segments.forEach((coord, i) => {
        this.segments[i] = coord.plus(this.DIRS['w']);
      });
    }
  }

  turn(dir) {
    this.direction = dir;
  }
}

module.exports = Snake;
