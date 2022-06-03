-- license is included at the end of the file

local levels = {
  -- you can add new levels by specifying a name and color
  { name = "fatal", color = 31 },
  { name = "error", color = 31 },
  { name = "debug", color = 96 },
  { name = "trace", color = 35 },
  { name = "warn",  color = 91 },
  { name = "info",  color = 32 }
}

local function log_msg(level, color, fmt, ...)
  if type(fmt) ~= "string" then
    fmt = tostring(fmt)
  else
    fmt = string.format(fmt, ...)
  end

  local log_str = string.format(
    "%s \027[%dm[%s %s\027[0m",
    os.date("%X"),
    color,
    level,
    fmt
  )

  print(log_str)
end

local log = {}

setmetatable(log, {
  __call = function(t, fmt, ...)
    return log.trace(fmt, ...)
  end
})

return function(on)
  if on then
    for _, level in ipairs(levels) do
      log[level.name] = function(fmt, ...)
        log_msg((#level.name < 5 and level.name .. "] " or level.name .. "]"):upper(), level.color, fmt, ...)
      end
    end
  else
    -- just add empty functions
    for _, level in ipairs(levels) do
      log[level.name] = function(fmt, ...)
      end
    end
    print "\027[31mAll logs are silencely ignored.\027[0m"
  end

  return log
end

--[[
MIT License

Copyright (c) 2022 nikneym

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
]]