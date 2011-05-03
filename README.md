Easing Library
==============

This is a lua port of the Robert Penner's equations for easing. You can find much
more information about it on [http://www.robertpenner.com/easing/](his web site).

This library was based off:

* [http://code.google.com/p/tweener/](Tweener, ActionScript tweening library)
* [http://coderepos.org/share/wiki/JSTweener](JavaScript port of tweener, by Yuichi Tateno)

However, only the easing functions are included, and not any kind of tweening helpers.

Usage
=====

Requiring the easing library returns a table which contains all the different
functions.

    local easingFunctions = require("easing")

    outInBounce = easingFunctions.outInBounce

    -- All easing functions take these parameters:
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

There is a plain lua example and an interactive one based on the [LÖVE](http://love2d.org)
game library. To run the examples you'll need to get the engine from
[http://love2d.org](http://love2d.org). Once you have the love executable, move into the
examples/love directory and run "love ."

![love2d running easing examples](https://github.com/EmmanuelOga/easing/raw/master/doc/ease-love.png "easing on love2d")

Running Tests
=============

To run the tests you'll need [telescope](https://github.com/norman/telescope).
From the library's root directory, run:

    ▸ tsc tests/easing_tests.lua
    80 tests 80 passed 80 assertions 0 failed 0 errors 0 unassertive 0 pending

TODO
====

Copy the documentation from the tweener source and convert it to luadoc.

License
=======

Like the tweener library, easing is licensed under the MIT license.

Authors
=======

* Tweener authors
* Yuichi Tateno
* Emmanuel Oga

Contributors
============

* kikito (Enrique García) (https://github.com/EmmanuelOga/easing/pull/2)