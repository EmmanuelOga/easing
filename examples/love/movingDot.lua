local easing = require("easing")

local RADIUS = W / 50
local DURATION = 1

local function movingDot(height, funcName)
  local self = {}

  local fun = easing[funcName]

  local function downFun(v)
    return fun(v, 0, height, DURATION)
  end

  local function upFun(v)
    return fun(v, height, -height, DURATION)
  end

  local offset = 0 -- property to ease.
  local timeElapsed = 0
  local currentFun = downFun

  function self.update(dt)
    timeElapsed = timeElapsed + dt

    if timeElapsed > DURATION then
      timeElapsed = 0
      if currentFun == downFun then currentFun = upFun else currentFun = downFun end
    end

    offset = currentFun(timeElapsed)
  end

  function self.render(x, y)
    love.graphics.setColor(0, 0, 255, 255)
    love.graphics.line(x - 20, y, x + 20, y)
    love.graphics.line(x - 20, y + height, x + 20, y + height)

    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.circle("fill", x, y + offset, RADIUS, RADIUS)
  end

  return self
end

return movingDot
