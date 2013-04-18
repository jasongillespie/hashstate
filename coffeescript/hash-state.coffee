##
#  Manage the web page's state by turning the URL hash
#  into key: value pairs.  Provide methods for setting the state,
#  and getting the state.
##
class HashState

	##
	#  Get the url hash as an object with key: value pairs
	#  @return an object version of the url hash
	##
	@getAll: ->
		states = {}
		states_array = window.location.hash.substring(1).split '&'
		for value in states_array
			if value.search('=') > -1
				key_value = value.split '='
				states[key_value[0]] = key_value[1]
		return states

	##
	# Get the value of a segment in the url hash by it's key
	# @param key - a string representing the key of the object
	# @return - if a value exists for key, return the value; if not, return false.
	##
	@get: (key) ->
		states = @getAll()
		if states[key] == 'undefined'
			return false
		else
			return states[key]
			
	##
	# Set the state of the hash string
	# @param states - an object containing the {key: value} pair
	##
	@set: (states) ->
		current_states = @getAll()
		for key of states
			current_states[key] = states[key]

			if !current_states[key]
				delete current_states[key]

		hash = '#'
		for k,v of current_states
			hash += k + '=' + v + '&'

		#remove last '&' and set hash
		window.location.hash = hash.substring(0, hash.length - 1)
