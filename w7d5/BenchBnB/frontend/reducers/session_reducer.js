import {
          RECEIVE_CURRENT_USER,
          RECEIVE_ERRORS,
          RECEIVE_LOGOUT_SUCCESS
       } from '../actions/session_actions.js';

import merge from 'lodash/merge';

const _nullUser = {
  currentUser: null,
  errors: []
};

const SessionReducer = (oldState = _nullUser, action) => {
  switch(action.type){
    case RECEIVE_CURRENT_USER:
      return{
        currentUser: action.currentUser,
        errors: []
      };
    case RECEIVE_ERRORS:
      const errors = {errors: action.errors};
      return merge({}, oldState, errors);
    case RECEIVE_LOGOUT_SUCCESS:
      return _nullUser;
    default:
      return oldState;
  }
};

export default SessionReducer;
