const Snake = require('./snake');

class Board {
  constructor() {
    this.snake = new Snake();
    this.grid = this.generateGrid();
  }

  generateGrid() {
    let grid = [];
    for (var i = 0; i < 20; i++) {
      grid[i] = [];
      for (var j = 0; j < 20; j++) {
        grid[i][j] = null;
      }
    }
    return grid;
  }
}

module.exports = Board;
