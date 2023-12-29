extends Node
class_name MinoqisUtils


#region 2D Move Functions
## NO MOVE FUNCTIONS REQUIRE IT TO BE A CHARACTERBODY
static func move_8_direction(_leftInputName : String, _rightInputName : String, _upInputName : String, _downInputName : String, _speed : float) -> Vector2:
	var movementDirection : Vector2 = Input.get_vector(_leftInputName, _rightInputName, _upInputName, _downInputName)
	return movementDirection * _speed


static func move_4_direction(_leftInputName : String, _rightInputName : String, _upInputName : String, _downInputName : String, _speed : float) -> Vector2:
	var movementDirection : Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed(_leftInputName):
		movementDirection = Vector2(-1, 0)
	elif Input.is_action_pressed(_rightInputName):
		movementDirection = Vector2(1, 0)
	elif Input.is_action_pressed(_upInputName):
		movementDirection = Vector2(0, -1)
	elif Input.is_action_pressed(_downInputName):
		movementDirection = Vector2(0, 1)
	
	return movementDirection * _speed


# Works like Unitys MoveTowards function and Godots move_and_slide function, but will work on any node (ignores collisions)
static func move_towards_2D(_currentPos : Vector2, _targetPos : Vector2, _speed : float) -> Vector2:
	# Variables
	var x : float = _targetPos.x - _currentPos.x
	var y : float = _targetPos.y - _currentPos.y
	var sqrDist : float = (x * x) + (y * y)
	
	# Check if at target position
	if (sqrDist == 0 or _speed >= 0) and sqrDist <= _speed * _speed:
		return _targetPos
	
	var dist : float = sqrt(sqrDist)
	
	return Vector2(_currentPos.x + x / dist * _speed, _currentPos.y + y / dist * _speed)
#endregion


#region 3D Move Functions
# Works like Unitys MoveTowards function and Godots move_and_slide function, but will work on any node (ignores collisions)
static func move_towards_3D(_currentPos : Vector3, _targetPos : Vector3, _speed : float) -> Vector3:
	# Variables
	var x : float = _targetPos.x - _currentPos.x
	var y : float = _targetPos.y - _currentPos.y
	var z : float = _targetPos.z - _currentPos.z
	var sqrDist : float = (x * x) + (y * y) + (z * z)
	
	# Check if at target position
	if (sqrDist == 0 or _speed >= 0) and sqrDist <= _speed * _speed:
		return _targetPos
	
	var dist : float = sqrt(sqrDist)
	
	return Vector3(_currentPos.x + x / dist * _speed, _currentPos.y + y / dist * _speed, _currentPos.z + z / dist * _speed)
#endregion


#region Grid Functions
# Checks if cell is within range of a grid in a 2D format
static func check_if_in_range_grid_cell_2D(_x : int, _y : int, _maxX : int, _maxY : int, _minX : int, _minY : int) -> bool:
	if _x < _maxX and _x >= _minX: # Check for in range of X
		if _y < _maxY and _y >= _minY: #Check for in range of Y
			return true
	
	return false


# Checks if tile is within range of a grid in a 3D array format
static func check_if_in_range_grid_cell_3D(_x : int, _y : int, _z : int, _maxX : int, _maxY : int, _maxZ : int, _minX : int, _minY : int, _minZ : int) -> bool:
	if _x < _maxX and _x >= _minX: # Check for in range of X
		if _y < _maxY and _y >= _minY: #Check for in range of Y
			if _z < _maxZ and _z >= _minZ: # Check for in range of Z
				return true
	
	return false


# Checks if a cell on a grid is taken (obstacle is on it, if it's walkable etc.)
static func check_if_taken_grid_cell(_toCheck, _listToCheck : Array) -> bool:
	for i in range(_listToCheck.size()):
		if _toCheck == _listToCheck[i]:
			return true
	
	return false
#endregion


#region UI Functions
static func open_external_link(_link : String, _sfx : AudioStream = null, _sfxAudioPlayer : AudioStreamPlayback = null) -> void:
	if _sfxAudioPlayer != null and _sfx != null:
		_sfxAudioPlayer.play(_sfx)
	
	OS.shell_open(_link)
#endregion


#region Combat Functions
static func take_damage(_damage : float, _health : float, _defense : float = 0) -> float:
	var finalDamage = _defense - _damage
	
	if finalDamage <= 0:
		return _health - (finalDamage * -1)
	
	return _health


static func heal(_healAmount : float, _health : float) -> float:
	return _health + _healAmount
#endregion
