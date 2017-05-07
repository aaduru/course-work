/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId])
/******/ 			return installedModules[moduleId].exports;
/******/
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			exports: {},
/******/ 			id: moduleId,
/******/ 			loaded: false
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.loaded = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(0);
/******/ })
/************************************************************************/
/******/ ([
/* 0 */
/***/ function(module, exports, __webpack_require__) {

	const toggle = __webpack_require__(1);
	const UsersSearch = __webpack_require__(3);
	
	$ (() => {
	  const toggleButton = $('button.follow-toggle');
	  toggleButton.each((index, element) => {
	    new toggle(element);
	  });
	
	  const userSearch = $('nav.users-search');
	  userSearch.each((index, element) => {
	    new UsersSearch(element);
	  });
	});


/***/ },
/* 1 */
/***/ function(module, exports, __webpack_require__) {

	const apiUtil = __webpack_require__(2);
	
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


/***/ },
/* 2 */
/***/ function(module, exports) {

	const APIUtil = {
	  followUser(id) {
	    // ...
	    return $.ajax({
	      url: `/users/${id}/follow`,
	      method: 'POST',
	      dataType: 'JSON'
	      // success: success
	
	    });
	  },
	
	  unfollowUser(id) {
	    // ...
	    return $.ajax({
	      url: `/users/${id}/follow`,
	      method: 'DELETE',
	      dataType: 'JSON'
	      // success: success
	    });
	  },
	
	  searchUsers(queryVal) {
	    return $.ajax({
	      url: `/users/search/?query=${queryVal}`,
	      method: 'GET',
	      dataType: 'JSON'
	    });
	
	  }
	};
	
	module.exports = APIUtil;


/***/ },
/* 3 */
/***/ function(module, exports, __webpack_require__) {

	const apiUtil = __webpack_require__(2);
	const followtoggle = __webpack_require__(1);
	
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


/***/ }
/******/ ]);
//# sourceMappingURL=bundle.js.map