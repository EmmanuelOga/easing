local easing = require("../lib/easing")

local function assert_equal_val(a, b)
  local almostZero = 0.01
  assert_less_than(math.abs(b - a), almostZero)
end

context("easing functions", function()
  before(function()
    propBegin = 1
    propEnd = 2
    propChange = propEnd - propBegin
    duration = 1
  end)

  for funcName, easingFun in pairs(easing) do
    context("Using the " .. funcName .. " easing funcation", function()

      test(funcName .. " at beginning of duration returns beginning value", function()
        assert_equal_val(easingFun(0, propBegin, propChange, duration), propBegin)
      end)

      test(funcName .. " at ending of duration returns ending value", function()
        assert_equal_val(easingFun(duration, propBegin, propChange, duration), propEnd)
      end)

    end)
  end
end)
