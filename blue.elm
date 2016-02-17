import Graphics.Element exposing (..)
import Graphics.Collage exposing (..)
import Color exposing (..)
import Window exposing (..)
import Mouse
relativePosition : (Int,Int)->(Int,Int) -> (Int,Int)
relativePosition (ox,oy) (x,y) = (x - ox, -(y-oy))

center : (Int,Int) -> (Int,Int)
center (w,h) = (w//2,h//2)

render (x,y) =
  let forms = [circle 15 |> filled lightBlue
                         |> move (toFloat x,toFloat y)]
  in color gray <| collage 400 400  forms
myText = show << relativePosition (100,100)
main = Signal.map render <|  Signal.map (relativePosition (200,200)) Mouse.position
-- main = Signal.map render <|  Mouse.position
