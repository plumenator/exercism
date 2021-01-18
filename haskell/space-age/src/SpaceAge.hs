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
ageOn planet seconds = seconds / orbitalPeriod planet

orbitalPeriod :: Planet -> Float
orbitalPeriod Earth = 31557600
orbitalPeriod Mercury = 0.2408467 * orbitalPeriod Earth
orbitalPeriod Venus = 0.61519726 * orbitalPeriod Earth
orbitalPeriod Mars = 1.8808158 * orbitalPeriod Earth
orbitalPeriod Jupiter = 11.862615 * orbitalPeriod Earth
orbitalPeriod Saturn = 29.447498 * orbitalPeriod Earth
orbitalPeriod Uranus = 84.016846 * orbitalPeriod Earth
orbitalPeriod Neptune = 164.79132 * orbitalPeriod Earth
