local easingFunctions = require("easing")

outInBounce = easingFunctions.outInBounce

-- All easing functions take this parameters:
--
-- t = time     should go from 0 to duration
-- b = begin    value of the property being ease.
-- c = change   ending value of the property - beginning value of the property
-- d = duration

-- Some functions allow additional modifiers, like the elastic functions
-- which also can receive an amplitud and a period parameters (defaults
-- are included)

beginVal = 0
endVal = 1
change = endVal - beginVal
duration = 1

print(outInBounce(0             , beginVal, change, duration)) --> 0
print(outInBounce(duration / 4  , beginVal, change, duration)) --> 0.3828125
print(outInBounce(duration / 2  , beginVal, change, duration)) --> 0.5
print(outInBounce(duration / 3/4, beginVal, change, duration)) --> 0.10503472222222
print(outInBounce(duration      , beginVal, change, duration)) --> 1
