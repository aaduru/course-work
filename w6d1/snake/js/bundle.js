/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};

/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {

/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;

/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};

/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);

/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;

/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}


/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;

/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;

/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";

/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const View = __webpack_require__(1);

	$( () => {
	  const rootEl = $('.snake');
	  new View(rootEl);
	});


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const Board = __webpack_require__(3);
	const Coord = __webpack_require__(4);

	class View {
	  constructor($el) {
	    this.board = new Board();
	    this.$el = $el;
	    this.eventBinders();
	    this.setupBoard();
	    setInterval(this.step.bind(this), 500);
	  }

	  step() {
	    this.board.snake.move();
	    this.render();
	  }

	  setupBoard() {
	    for (var i = 0; i < 20; i++) {
	      let $ul = $('<ul></ul>');
	      $ul.data('row', i);
	      this.$el.append($ul);
	      for (var j = 0; j < 20; j++) {
	        let $li = $('<li></li>');
	        $li.data('col', j);

	        $ul.append($li);
	      }
	    }
	  }

	  render() {
	    $('li').removeClass('.segment');
	    this.board.snake.segments.forEach((segment) => {
	      let $ul = $(`ul[data-row='${segment.coord[0]}']`);
	      let $li = $ul.find(`li[data-col='${segment.coord[1]}']`);
	      $li.addClass('.segment');
	    });
	  }

	  eventBinders() {
	    $(document).keydown((event) => {
	      let key = event.key;
	      if (key === "ArrowDown") {
	        this.board.snake.turn("S");
	      } else if (key === "ArrowUp") {
	        this.board.snake.turn("N");
	      } else if (key === "ArrowLeft") {
	        this.board.snake.turn("W");
	      } else if (key === "ArrowRight") {
	        this.board.snake.turn("E");
	      }
	    });
	  }


	}

	module.exports = View;


/***/ },
/* 2 */
/***/ function(module, exports, __webpack_require__) {

	
	const Coord = __webpack_require__(4);
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


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const Snake = __webpack_require__(2);

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


/***/ },
/* 4 */
/***/ function(module, exports) {

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


/***/ }
/******/ ]);