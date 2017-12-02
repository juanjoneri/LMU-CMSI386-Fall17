-- The file Cylinder.elm should contain an type alias for a cylinder, where a cylinder is represented as a record storing a radius and height. A “new” cylinder should have a radius of 1.0 and a height of 1.0. Include volume and surface area functions, as well as a widen and stretch functions that “grow” the radius and height, respectively, by a given factor. (These functions are not, of course, mutators, even though the description makes it sound like they are.)\
module Cylinder exposing (..)

type alias Cylinder =
    { radius : Float
    , height : Float
    }

new =
    Cylinder 1 1

volume: Cylinder -> Float
volume {radius, height} =
    height * pi * radius ^ 2
