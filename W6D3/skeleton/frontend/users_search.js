const apiUtil = require('./api_util');
const followtoggle = require('./follow_toggle');

class UsersSearch {

  constructor(el) {
    this.$el = $(el);
    this.$input = this.$el.find("input")[0];
    this.$ul = $(this.$el.find("ul")[0]);
    this.handleInput();
  }

  renderResults(res){
    this.$ul.children().remove();
    res.forEach((user) => {
      let $li = $(`<li>${user.username}</li>`);
      let $button = $('<button></button>');
      let followvalue = "";
      if (user.followed){
        followvalue = 'followed';
      } else {
        followvalue = 'unfollowed';
      }
      const toggle = new followtoggle($button, {userId: user.id, followState: followvalue});
      $button.addClass('follow-toggle');
      $li.append($button);
      this.$ul.append($li);
    });
  }

  handleInput(){
    const keyPress = this.$el.keyup((e)=> {
      const keyPressThis = this;
      apiUtil.searchUsers(this.$input.value).then((res) => {
        keyPressThis.renderResults(res);
      });
    });
  }

}

module.exports = UsersSearch;
