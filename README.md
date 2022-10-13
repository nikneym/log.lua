log.lua
====
Simple logger for simple duties. Sometimes you may want some colorful output on what you do.

![Example Output](https://github.com/nikneym/log.lua/blob/main/test.png)

## Setup
Download the `log.lua` file and include it in your project like `local log = require "log" (true)`.

## Usage
```lua
-- passing false there would've turned off the logging
local log = require "log" (true)
-- e.g
-- local log = require "log" (false)

-- same as log.trace
log "quick brown fox jumps over the lazy dog"

log.warn  "quick brown fox jumps over the lazy dog"
log.debug "quick brown fox jumps over the lazy dog"
log.trace "quick brown fox jumps over the lazy dog"
log.error "quick brown fox jumps over the lazy dog"
log.info  "quick brown fox jumps over the lazy dog"
log.fatal "quick brown fox jumps over the lazy dog"

-- string can be formatted by passing desired values to the log call
-- anything can be passed
log.info("Hello good people of the %s!", "internet")
```

## License
See [LICENSE](LICENSE) for details.
