type
  Planet* = enum
    Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune

proc age*(planet: Planet, seconds: int64): float =
  seconds.float / 31557600 / (case planet
                              of Mercury: 0.2408467
                              of Venus: 0.61519726
                              of Earth: 1
                              of Mars: 1.8808158
                              of Jupiter: 11.862615
                              of Saturn: 29.447498
                              of Uranus: 84.016846
                              of Neptune: 164.79132)
  
