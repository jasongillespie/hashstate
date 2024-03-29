// Generated by CoffeeScript 1.6.2
(function() {
  var HashState;

  HashState = (function() {
    function HashState() {}

    HashState.getAll = function() {
      var key_value, states, states_array, value, _i, _len;

      states = {};
      states_array = window.location.hash.substring(1).split('&');
      for (_i = 0, _len = states_array.length; _i < _len; _i++) {
        value = states_array[_i];
        if (value.search('=') > -1) {
          key_value = value.split('=');
          states[key_value[0]] = key_value[1];
        }
      }
      return states;
    };

    HashState.get = function(key) {
      var states;

      states = this.getAll();
      if (states[key] === 'undefined') {
        return false;
      } else {
        return states[key];
      }
    };

    HashState.set = function(states) {
      var current_states, hash, k, key, v;

      current_states = this.getAll();
      for (key in states) {
        current_states[key] = states[key];
        if (!current_states[key]) {
          delete current_states[key];
        }
      }
      hash = '#';
      for (k in current_states) {
        v = current_states[k];
        hash += k + '=' + v + '&';
      }
      return window.location.hash = hash.substring(0, hash.length - 1);
    };

    return HashState;

  })();

}).call(this);
