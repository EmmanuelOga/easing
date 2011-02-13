Easing Library
==============

This is a lua port of the Robert Penner's equations for easing. You can find much
more information about it on his web site:

http://www.robertpenner.com/easing/

This library was based of two libraries:

* http://code.google.com/p/tweener/ -- ActionScript tweening library
* http://coderepos.org/share/wiki/JSTweener -- JavaScript version of tweener (ported by Yuichi Tateno)

However, this library only includes the function, and not any kind of tweening
helpers.

Usage
=====

Requiring the easing library returns a table with all the different
functions.

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

Examples
========

There is a plain lua example and an interactive one based on the LÖVE
game library. To run the examples you'll need to get the engine from
http://love2d.org. Once you have the love executable, move into the
examples/love directory and run "love ."

![love2d running easing examples](/doc/ease-love.png "easing on love2d")

License
=======

Like the tweener library, easing is licensed under the MIT license.

Authors
=======

* Tweener authors
* Yuichi Tateno
* Emmanuel Oga
