# Coding Standard GDScript

I use a mix of C# standards and GDScript standards when writing my programs. Here's the list of the coding standard.

## Classes
**'
extends BLANK
class_name ClassName
'**

## Variables
***NOTE: Variables MUST be statically typed unless dynamic typing is absolutely necessary for it's function***

**'
enum EnumName{
    ENUMHERE,
    ENUMHERE2
}

@export var variableName : type
@onready var variableName : type
var variableName : type
'**

## Functions
***NOTE: Variables and Functions MUST be statically typed unless dynamic typing is absolutely necessary for it's function. Parameter names MUST start with an _***

**'static func functino_name_here(_parameter1 : type, _parameter2 : type) -> returnType:**'

## Comments
It is *strongly* recommended that you comment your code so it's easy to tell what's happening from a glance.

**'
## Double hashed comments are for use above the function if needed.
# Single hashed comments are used to describe details within the function.
'**