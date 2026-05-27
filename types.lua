---@meta
---  Many functions require a handle as an argument or return a handle.

--- The handle is a custom data type called =="light_userdata"==.
---
--- The handle is a unique identifier that refers to a grandMA3 object, for instance, a specific sequence, cue, preset, or fixture.
---
--- The object the handle refers to has some properties. Some can be changed, and some are read-only. The object might also have child objects. The object always has Name, Class, and Path information.
---
--- The path is the same as an address that identifies where the object exists in the structure of the showfile.
---@class MAHandle
---@field Name string
---@field Class string
---@field Path string
MAHandle = {}

---@alias FaderToken
---| "FaderMaster"
---| "FaderX"
---| "FaderXA"
---| "FaderXB"
---| "FaderTemp"
---| "FaderRate"
---| "FaderSpeed"
---| "FaderHighlight"
---| "FaderLowlight"
---| "FaderSolo"
---| "FaderTime"

---@class FaderOptions
---@field token FaderToken
---@field index? integer

---@class SetFaderOptions
---@field value? number
---@field token? FaderToken
---@field faderEnabled? boolean
---
--- The ==FromAddr== Lua function converts a numbered string address into a handle that can be used in commands.
---
--- # Arguments
--- **handleString**
---      A text string identifying an object. It can be a numbered or named address.
--- **handle(optional)**
---     The default is to write the address from the root location. This optional handle can specify a different base location. It still needs to be a base location in the address path from the root to the object.
---
--- # Return
--- **Handle:**
---      The handle for the addressed object.
---
--- # Example
--- This example prints the address of the first sequence:
--- ```lua
---return function()
---     -- Converts the string to a handle and store in a variabel.
---     local mySequenceHandle = FromAddr("14.14.1.6.1")
---     -- Converts the handle back to a numbered string and prints it.
---     Printf("The address is: " ..mySequenceHandle:Addr())
---     -- Converts the handle to a named string and prints it.
---     Printf("The address is: " ..mySequenceHandle:AddrNative())
---
---     -- Store the handle of the selected datapool.
---     local myDataPool = DataPool()
---     -- Prints the address of the selected datapool.
---     Printf("The datapool address is: " ..myDataPool:Addr())
---
---     --- The follwoing example uses the name of a sequence in the sequence pool.
---     --- Please adjust the "Default" name in the next line to match an existing named sequence.
---     -- Finds the address based on the base location and a text string with names.
---     local alsoMySequenceHandle = FromAddr("Sequences.Default", myDataPool)
---     -- Converts the handle back to a numbered string and prints it.
---     Printf("The address is: " ..alsoMySequenceHandle:Addr())
---     -- Converts the handle to a named string and prints it.
---     Printf("The address is: " ..alsoMySequenceHandle:AddrNative())
--- end
--- ```
---@param handleString string
---@param handle? MAHandle
---@return MAHandle
function MAHandle:FromAddr(handleString, handle) end

---@return string
function MAHandle:HandleToStr() end

---@return integer
function MAHandle:HandleToInt() end

---@return string
function MAHandle:ToAddr() end
