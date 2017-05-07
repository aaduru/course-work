class Coord {
  constructor(arr) {
    this.coord = arr;
  }

  plus(otherCoord) {
    return [this.coord[0] + otherCoord.coord[0],
            this.coord[1] + otherCoord.coord[1]];
  }

  equals(otherCoord) {
    return this === otherCoord;
  }

  isOpposite(otherCoord) {

  }
}

module.exports = Coord;
