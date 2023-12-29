# GDScript Documentation

Code is divided up into regions for easier viewing, note that this only works on Godot 4.2+, otherwise the regions will act as normal comments in earlier versions. The documentation has been divided in the same order as the regions and functions appear in the script for easier cross reference.

## 2D Move Functions
*NOTE: All 2D move functions are designed to work with any type of node, a CharacterBody2D is not required.*

- **'move_8_direction(_leftInputName : String, _rightInputName : String, _upInputName : String, _downInputName : String, _speed : float) -> Vector2:'**

    Basic 8 directional movement. To implement, do **'nodeToMove.global_position += MinoqisUtils.move_8_direction("left", "right", "up", "down", speed) * delta'** in the **'_process(delta)'** function.

- **'move_4_direction(_leftInputName : String, _rightInputName : String, _upInputName : String, _downInputName : String, _speed : float) -> Vector2:'**

    Basic 4 directional movement. To implement, do **'nodeToMove.global_position += MinoqisUtils.move_4_direction("left", "right", "up", "down", speed) * delta'** in the **'_process(delta)'** function.

- **'move_towards_2D(_currentPos : Vector2, _targetPos : Vector2, _speed : float) -> Vector2:'**

    This function works exactly like Unitys MoveTowards or like Godots move_and_slide function, but works on any node and doesn't require a CharacterBody. To implement, do **'nodeToMove.global_position += MinoqisUtils.move_towards_2D(currentPosition, targetPosition, speed) * delta'** in the **'_process(delta)'** function.

## 3D Move Functions
*NOTE: All 3D move functions are designed to work with any type of node, a CharacterBody3D is not required.*

- **'move_towards_3D(_currentPos : Vector2, _targetPos : Vector2, _speed : float) -> Vector3:'**

    This function works exactly like Unitys MoveTowards or like Godots move_and_slide function, but works on any node and doesn't require a CharacterBody. To implement, do **'nodeToMove.global_position += MinoqisUtils.move_towards_3D(currentPosition, targetPosition, speed) * delta'** in the **'_process(delta)'** function.

## Grid Functions

- **'check_if_in_range_grid_cell_2D(_x : int, _y : int, _maxX : int, _maxY : int, _minX : int, _minY : int) -> bool:'**

    Checks if cell is within range of a grid in a 2D format.

- **'check_if_in_range_grid_cell_3D(_x : int, _y : int, _z : int, _maxX : int, _maxY : int, _maxZ : int, _minX : int, _minY : int, _minZ : int) -> bool:'**

    Checks if cell is within range of a grid in a 3D format.

- **'check_if_taken_grid_cell(_toCheck, _listToCheck : Array) -> bool:'**

    Checks if a cell on the grid is taken. This can be used for things like checking of a cell is walkable.

## UI Functions

- **'open_external_link(_link : String, _sfx : AudioStream = null, _sfxAudioPlayer : AudioStreamPlayback = null) -> void:'**

    Used to make an external link open, typically used for buttons. Takes in the link (mandatory), as well as a SFX (sound effect) and AudioStreamPlayback (optional) to play a SFX if wanted.


## Combat Functions

- **'take_damage(_damage : float, _health : float, _defense : float = 0) -> float:'**

    Calulate health after taking damage. Can take in a defense value to calculate into the health after damage is taken.

- **'heal(_healAmount : float, _health : float) -> float:'**

    Calculate health after healing (potion etc).