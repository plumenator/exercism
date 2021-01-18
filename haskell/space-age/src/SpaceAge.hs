module SpaceAge (Planet(..), ageOn) where

data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = seconds / (orbitalFrac planet * baseOrbitalSeconds)

baseOrbitalSeconds :: Float
baseOrbitalSeconds = 31557600

orbitalFrac :: Planet -> Float
orbitalFrac Earth = 1
orbitalFrac Mercury = 0.2408467
orbitalFrac Venus = 0.61519726
orbitalFrac Mars = 1.8808158
orbitalFrac Jupiter = 11.862615
orbitalFrac Saturn = 29.447498
orbitalFrac Uranus = 84.016846
orbitalFrac Neptune = 164.79132
