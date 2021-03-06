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

	const HanoiGame = __webpack_require__(2);
	const HanoiView = __webpack_require__(1);

	$( () => {
	  const rootEl = $('.hanoi');
	  const game = new HanoiGame();
	  new HanoiView(game, rootEl);
	});


/***/ },
/* 1 */
/***/ function(module, exports) {

	class HanoiView{
	  constructor(game, $el){
	    this.game = game;
	    this.from = undefined;
	    this.to = undefined;
	    this.$el = $el;
	    this.setupTowers();
	    this.clickTower();
	  }
	  setupTowers(){
	    this.$el.append('<ul></ul>');
	    for (var i = 0; i < 3; i++) {
	      let $li = $('<li></li>');
	      $li.data('tower', i);
	      $('ul').append($li);
	      if (i === 0){
	        let $divBig = $("<div class='big'></div>");
	        let $divMedium = $("<div class='medium'></div>");
	        let $divSmall = $("<div class='small'></div>");
	        $li.append($divSmall);
	        $li.append($divMedium);
	        $li.append($divBig);
	      }
	    }

	  }
	  clickTower(){
	    let $li1, $li2;
	    $('li').click((event) => {
	      if (this.from === undefined){
	        $li1 = event.currentTarget;
	        this.from = $($li1).data('tower');
	      }
	      else
	      {
	        $li2 = event.currentTarget;
	        this.to = $($li2).data('tower');
	        if (!this.game.isValidMove(this.from, this.to)){
	          alert('invalid move');
	        }else {
	          this.game.move(this.from, this.to);
	          this.render($li1, $li2);
	        }
	        if (this.game.isWon()){
	          $('h2').append('you win');
	        }
	        this.from = undefined;
	        this.to = undefined;
	      }
	    });
	  }

	  render(from, to){
	    let $li1 = $(from);
	    let $li2 = $(to);
	    let $fromDiv = $li1.children().first();
	    $fromDiv.remove();
	    $li2.prepend($fromDiv);

	  }
	}

	module.exports = HanoiView;


/***/ },
/* 2 */
/***/ function(module, exports) {

	class Game {
	  constructor() {
	    this.towers = [[3, 2, 1], [], []];
	  }

	  isValidMove(startTowerIdx, endTowerIdx) {
	      const startTower = this.towers[startTowerIdx];
	      const endTower = this.towers[endTowerIdx];

	      if (startTower.length === 0) {
	        return false;
	      } else if (endTower.length == 0) {
	        return true;
	      } else {
	        const topStartDisc = startTower[startTower.length - 1];
	        const topEndDisc = endTower[endTower.length - 1];
	        return topStartDisc < topEndDisc;
	      }
	  }

	  isWon() {
	      // move all the discs to the last or second tower
	      return (this.towers[2].length == 3) || (this.towers[1].length == 3);
	  }

	  move(startTowerIdx, endTowerIdx) {
	      if (this.isValidMove(startTowerIdx, endTowerIdx)) {
	        this.towers[endTowerIdx].push(this.towers[startTowerIdx].pop());
	        return true;
	      } else {
	        return false;
	      }
	  }

	  print() {
	      console.log(JSON.stringify(this.towers));
	  }

	  promptMove(reader, callback) {
	      this.print();
	      reader.question("Enter a starting tower: ", start => {
	        const startTowerIdx = parseInt(start);
	        reader.question("Enter an ending tower: ", end => {
	          const endTowerIdx = parseInt(end);
	          callback(startTowerIdx, endTowerIdx)
	        });
	      });
	  }

	  run(reader, gameCompletionCallback) {
	      this.promptMove(reader, (startTowerIdx, endTowerIdx) => {
	        if (!this.move(startTowerIdx, endTowerIdx)) {
	          console.log("Invalid move!");
	        }

	        if (!this.isWon()) {
	          // Continue to play!
	          this.run(reader, gameCompletionCallback);
	        } else {
	          this.print();
	          console.log("You win!");
	          gameCompletionCallback();
	        }
	      });
	  }
	}

	module.exports = Game;


/***/ }
/******/ ]);