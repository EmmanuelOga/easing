local easing = require("easing")

local function renderFun(x, y, w, h, funName)
  -- linear func. for reference.
  love.graphics.setColor(128, 128, 128, 128)
  love.graphics.line(x, y + h, x + w, y)

  for i = 0, 10 do
    love.graphics.setColor(128, 128, 128, 128)
    love.graphics.line(x,              y + h * i / 10, x + w,          y + h * i / 10)
    love.graphics.line(x + i * w / 10, y,              x + i * w / 10, y + h)
    love.graphics.setColor(255, 255, 255, 128)
    love.graphics.print(i / 10, i * (w / 10) + x - FONT_SIZE / 2, y + h + FONT_SIZE / 2)
    love.graphics.print(i / 10, x - FONT_SIZE * 2, y + h - i * (h / 10) - FONT_SIZE / 2)
  end

  love.graphics.setColor(255, 255, 255, 255)
  love.graphics.line(x, y, x, y + h, x + w, y + h)

  -- define a plot function
  love.graphics.translate(x, y)
  local function plot(x, y, x1, y1)
    local alpha
    if x < 0 or x1 > 1 then
      alpha = 32
    else
      alpha = 255
    end
    local i,   j = x * w,  h - (y * h)
    local i1, j1 = x1 * w, h - (y1 * h)
    love.graphics.setColor(0, 0, 255, alpha)
    love.graphics.line(i, j, i1, j1)
    love.graphics.setColor(255, 255, 0, alpha)
    love.graphics.points(i,j,i1,j1)
  end

  -- get the function and plot it.
  local fun = easing[funName]

  local function f(v)
    -- t = time
    -- b = begin
    -- c = change --> ending - beginning
    -- d = duration
    return fun(v, 0, 1, 1)
  end

  local u, v = -SEGMENTS / 2, f(-SEGMENTS / 2)
  local lu, lv = u, v

  for i = -SEGMENTS, SEGMENTS * 2 do
    lu, u = u, i / SEGMENTS
    lv, v = v, f(u)
    plot(lu, lv, u, v)
  end
end

return renderFun
