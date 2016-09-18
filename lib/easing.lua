--[[
   Adapted from
   Tweener's easing functions (Penner's Easing Equations)
   and http://code.google.com/p/tweener/ (jstweener javascript version)
   
	Disclaimer for Robert Penner's Easing Equations license:

	TERMS OF USE - EASING EQUATIONS

	Open source under the BSD License.

	Copyright © 2001 Robert Penner
	All rights reserved.

	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

	* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
	* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
	* Neither the name of the author nor the names of contributors may be used to endorse or promote products derived from this software without specific prior written permission.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

-- For all easing functions:
-- t = elapsed time
-- b = begin
-- c = change == ending - beginning
-- d = duration (total time)

-- Where applicable
-- a = amplitude
-- p = period

local sin, cos, pi, abs, asin = math.sin, math.cos, math.pi, math.abs, math.asin
local _2pi = 2 * pi
local _halfpi = .5 * pi

local function linear(t, b, c, d)
	return c * t / d + b
end

local function inQuad(t, b, c, d)
	t = t / d
	return c * t * t + b
end

local function outQuad(t, b, c, d)
	t = t / d
	return -c * t * (t - 2) + b
end

local function inOutQuad(t, b, c, d)
	t = t / d * 2
	return t < 1 and
		c * 0.5 * t * t + b
	or
		-c * 0.5 * ((t - 1) * (t - 3) - 1) + b
end

local function outInQuad(t, b, c, d)
	if t < d * 0.5 then
		t = 2 * t / d
		return -0.5 * c * t * (t - 2) + b
	else
		t, c = ((t * 2) - d) / d, 0.5 * c
		return c * t * t + b + c
	end
end

local function inCubic(t, b, c, d)
	t = t / d
	return c * t * t * t + b
end

local function outCubic(t, b, c, d)
	t = t / d - 1
	return c * (t * t * t + 1) + b
end

local function inOutCubic(t, b, c, d)
	t = t / d * 2
	if t < 1 then
		return c * 0.5 * t * t * t + b
	else
		t = t - 2
		return c * 0.5 * (t * t * t + 2) + b
	end
end

local function outInCubic(t, b, c, d)
	if t < d * 0.5 then
		t = t * 2 / d - 1
		return c * 0.5 * (t * t * t + 1) + b
	else
		t, c = ((t * 2) - d) / d, c * 0.5
		return c * t * t * t + b + c
	end
end

local function inQuart(t, b, c, d)
	t = t / d
	return c * t * t * t * t + b
end

local function outQuart(t, b, c, d)
	t = t / d - 1
	return -c * (t * t * t * t - 1) + b
end

local function inOutQuart(t, b, c, d)
	t = t / d * 2
	if t < 1 then
		return c * 0.5 * t * t * t * t + b
	else
		t = t - 2
		return -c * 0.5 * (t * t * t * t - 2) + b
	end
end

local function outInQuart(t, b, c, d)
	if t < d * 0.5 then
		t, c = t * 2 / d - 1, c * 0.5
		return -c * (t * t * t * t - 1) + b
	else
		t, c = ((t * 2) - d) / d, c * 0.5
		return c * t * t * t * t + b + c
	end
end

local function inQuint(t, b, c, d)
	t = t / d
	return c * t * t * t * t * t + b
end

local function outQuint(t, b, c, d)
	t = t / d - 1
	return c * (t * t * t * t * t + 1) + b
end

local function inOutQuint(t, b, c, d)
	t = t / d * 2
	if t < 1 then
		return c * 0.5 * t * t * t * t * t + b
	else
		t = t - 2
		return c * 0.5 * (t * t * t * t * t + 2) + b
	end
end

local function outInQuint(t, b, c, d)
	if t < d * 0.5 then
		t = t * 2 / d - 1
		return c * 0.5 * (t * t * t * t * t + 1) + b
	else
		t, c = ((t * 2) - d) / d, c * 0.5
		return c * t * t * t * t * t + b + c
	end
end

local function inSine(t, b, c, d)
	return -c * cos(t / d * _halfpi) + c + b
end

local function outSine(t, b, c, d)
	return c * sin(t / d * _halfpi) + b
end

local function inOutSine(t, b, c, d)
	return -c * 0.5 * (cos(pi * t / d) - 1) + b
end

local function outInSine(t, b, c, d)
	c = c * 0.5
	return t < d * 0.5 and c * sin(t * 2 / d * _halfpi) + b or -c * cos(((t * 2) - d) / d * _halfpi) + 2 * c + b
end

local function inExpo(t, b, c, d)
	return t == 0 and b or c * 2 ^ (10 * (t / d - 1)) + b - c * 0.001
end

local function outExpo(t, b, c, d)
	return t == d and b + c or c * 1.001 * (1 - 2 ^ (-10 * t / d)) + b
end

local function inOutExpo(t, b, c, d)
	t = t / d * 2
	return t == 0 and b or t == 2 and b + c or t < 1 and c * 0.5 * 2 ^ (10 * (t - 1)) + b - c * 0.0005 or c * 0.5 * 1.0005 * (2 - 2 ^ (-10 * (t - 1))) + b
end

local function outInExpo(t, b, c, d)
	c = c * 0.5
	return t < d * 0.5 and (t * 2 == d and b + c or c * 1.001 * (1 - 2 ^ (-20 * t / d)) + b) or t * 2 - d == 0 and b + c or c * 2 ^ (10 * ((t * 2 - d) / d - 1)) + b + c - c * 0.001
end

local function inCirc(t, b, c, d)
	t = t / d
	return -c * ((1 - t * t) ^ 0.5 - 1) + b
end

local function outCirc(t, b, c, d)
	t = t / d - 1
	return c * (1 - t * t) ^ 0.5 + b
end

local function inOutCirc(t, b, c, d)
	t = t / d * 2
	if t < 1 then
		return -c * 0.5 * ((1 - t * t) ^ 0.5 - 1) + b
	else
		t = t - 2
		return c * 0.5 * ((1 - t * t) ^ 0.5 + 1) + b
	end
end

local function outInCirc(t, b, c, d)
	c = c * 0.5
	if t < d * 0.5 then
		t = t * 2 / d - 1
		return c * (1 - t * t) ^ 0.5 + b
	else
		t = (t * 2 - d) / d
		return -c * ((1 - t * t) ^ 0.5 - 1) + b + c
	end
end

local function inElastic(t, b, c, d, a, p)
	t = t / d - 1
	p = p or d * 0.3
	return t == -1 and b or t == 0 and b + c or not a or a < abs(c) and -(c * 2 ^ (10 * t) * sin((t * d - p * .25) * _2pi / p)) + b or -(a * 2 ^ (10 * t) * sin((t * d - p / _2pi * asin(c/a)) * _2pi / p)) + b
end

local function outElastic(t, b, c, d, a, p)
	t = t / d
	p = p or d * 0.3
	return t == 0 and b or t == 1 and b + c or not a or a < abs(c) and c * 2 ^ (-10 * t) * sin((t * d - p * .25) * _2pi / p) + c + b or a * 2 ^ (-10 * t) * sin((t * d - p / _2pi * asin(c / a)) * _2pi / p) + c + b
end

local function inOutElastic(t, b, c, d, a, p)
	if t == 0 then
		return b
	end

	t = t / d * 2 - 1

	if t == 1 then
		return b + c
	end

	p = p or d * .45
	a = a or 0

	local s

	if not a or a < abs(c) then
		a = c
		s = p * .25
	else
		s = p / _2pi * asin(c / a)
	end

	if t < 1 then
		return -0.5 * a * 2 ^ (10 * t) * sin((t * d - s) * _2pi / p) + b
	else
		return a * 2 ^ (-10 * t) * sin((t * d - s) * _2pi / p ) * 0.5 + c + b
	end
end

local function outInElastic(t, b, c, d, a, p)
	if t < d * 0.5 then
		return outElastic(t * 2, b, c * 0.5, d, a, p)
	else
		return inElastic(t * 2 - d, b + c * 0.5, c * 0.5, d, a, p)
	end
end

local function inBack(t, b, c, d, s)
	s = s or 1.70158
	t = t / d
	return c * t * t * ((s + 1) * t - s) + b
end

local function outBack(t, b, c, d, s)
	s = s or 1.70158
	t = t / d - 1
	return c * (t * t * ((s + 1) * t + s) + 1) + b
end

local function inOutBack(t, b, c, d, s)
	s = (s or 1.70158) * 1.525
	t = t / d * 2
	if t < 1 then
		return c * 0.5 * (t * t * ((s + 1) * t - s)) + b
	else
		t = t - 2
		return c * 0.5 * (t * t * ((s + 1) * t + s) + 2) + b
	end
end

local function outInBack(t, b, c, d, s)
	c = c * 0.5
	s = s or 1.70158
	if t < d * 0.5 then
		t = (t * 2) / d - 1
		return c * (t * t * ((s + 1) * t + s) + 1) + b
	else
		t = ((t * 2) - d) / d
		return c * t * t * ((s + 1) * t - s) + b + c
	end
end

local function outBounce(t, b, c, d)
	t = t / d
	if t < 1 / 2.75 then
		return c * (7.5625 * t * t) + b
	elseif t < 2 / 2.75 then
		t = t - (1.5 / 2.75)
		return c * (7.5625 * t * t + 0.75) + b
	elseif t < 2.5 / 2.75 then
		t = t - (2.25 / 2.75)
		return c * (7.5625 * t * t + 0.9375) + b
	else
		t = t - (2.625 / 2.75)
		return c * (7.5625 * t * t + 0.984375) + b
	end
end

local function inBounce(t, b, c, d)
	return c - outBounce(d - t, 0, c, d) + b
end

local function inOutBounce(t, b, c, d)
	if t < d * 0.5 then
		return inBounce(t * 2, 0, c, d) * 0.5 + b
	else
		return outBounce(t * 2 - d, 0, c, d) * 0.5 + c * 0.5 + b
	end
end

local function outInBounce(t, b, c, d)
	if t < d * 0.5 then
		return outBounce(t * 2, b, c * 0.5, d)
	else
		return inBounce(t * 2 - d, b + c * 0.5, c * 0.5, d)
	end
end

return {
  linear    = linear;    spring     = spring;    softSpring    = softSpring;
  inQuad    = inQuad;    outQuad    = outQuad;    inOutQuad    = inOutQuad;    outInQuad    = outInQuad;
  inCubic   = inCubic;   outCubic   = outCubic;   inOutCubic   = inOutCubic;   outInCubic   = outInCubic;
  inQuart   = inQuart;   outQuart   = outQuart;   inOutQuart   = inOutQuart;   outInQuart   = outInQuart;
  inQuint   = inQuint;   outQuint   = outQuint;   inOutQuint   = inOutQuint;   outInQuint   = outInQuint;
  inSine    = inSine;    outSine    = outSine;    inOutSine    = inOutSine;    outInSine    = outInSine;
  inExpo    = inExpo;    outExpo    = outExpo;    inOutExpo    = inOutExpo;    outInExpo    = outInExpo;
  inCirc    = inCirc;    outCirc    = outCirc;    inOutCirc    = inOutCirc;    outInCirc    = outInCirc;
  inElastic = inElastic; outElastic = outElastic; inOutElastic = inOutElastic; outInElastic = outInElastic;
  inBack    = inBack;    outBack    = outBack;    inOutBack    = inOutBack;    outInBack    = outInBack;
  inBounce  = inBounce;  outBounce  = outBounce;  inOutBounce  = inOutBounce;  outInBounce  = outInBounce;
}
