const apiUtil = require('./api_util');

class FollowToggle {
  constructor (el, options) {
    this.$el = $(el);
    this.userId = this.$el.data("user-id") || options.userId;
    this.followState = (this.$el.data("initial-follow-state") ||
        options.followState);
    this.handleClick();
    this.render();
  }

  render(){
    if (this.followState === 'unfollowed'){
      this.$el.text("follow!");
      this.$el.prop('disabled', false);
    }
    else if (this.followState ==='followed') {
      this.$el.text("unfollow!");
      this.$el.prop('disabled', false);
    }
    else if (this.followState ==='following'){
      this.$el.text("following...");
      this.$el.prop('disabled', true);
    }
    else {
      this.$el.text("unfollowing...");
      this.$el.prop('disabled', true);
    }


  }

  handleClick() {
    const buttonClick = this.$el.on("click", (e)=> {
      e.preventDefault();
      const toggleThis = this;
      if (toggleThis.followState === "unfollowed") {
        toggleThis.followState = 'following';
        toggleThis.render();
         apiUtil.followUser(toggleThis.userId).then( ()  => {
           toggleThis.followState = 'followed';
           toggleThis.render();
         });
      }
      else {
        toggleThis.followState = 'unfollowing';
        toggleThis.render();
        apiUtil.unfollowUser(toggleThis.userId).then( () => {
            toggleThis.followState = 'unfollowed';
            toggleThis.render();
        });
      }
    });
  }
}

module.exports = FollowToggle;
