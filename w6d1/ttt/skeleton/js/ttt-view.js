class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $('li').click((event) => {
      let li = event.currentTarget;
      let $li = $(li);
      if (!this.game.isOver()) {
        this.makeMove($li);
      }
    });
  }

  makeMove($square) {
    this.game.playMove($square.data('pos'));
    $square.text(this.game.currentPlayer);
    if (this.game.currentPlayer === "x") {
      $square.addClass('x');
    } else {
      $square.addClass('o');
    }
    if (this.game.isOver()) {
      $('h2').append(`${this.game.currentPlayer} has won!`);
      $(`.${this.game.currentPlayer}`).css('background-color', 'yellow');
    }
  }

  setupBoard() {
    let $ul = $('<ul></ul>');
    this.$el.append($ul);
    for (var i = 0; i < 9; i++) {
      let row, col;
      if (i < 3) {
        row = 0;
        col = i;
      } else if (i > 2 && i < 6) {
        row = 1;
        col = i - 3;
      } else {
        row = 2;
        col = i - 6;
      }
      let $li = $('<li></li>');
      $li.data('pos', [row, col]);
      $ul.append($li);
    }
  }
}

module.exports = View;
