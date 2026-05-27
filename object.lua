---@meta

--- The Addr Lua object function converts a handle to an address string that can be used in commands.
--- # Arguments
--- **Handle:**
---     The function takes a handle of the type "light_userdata" as an argument. This is the handle to the object where the address is requested.
---     It can be omitted when using the colon notation on an object.
--- **baseHandle**
---     The returned address is from the root as a default. This optional handle can specify a different base location. It must still be a base location in the address path from the root to the object.
--- **useToAddrIndex**
---     This can be useful if there is a difference between the ==ToAddr()== and ==Addr()==. Setting this to "true" uses the index number from the ToAddr() instead of the Addr() index number.
--- **fixResolution**
---      In some edge cases, the cue address is not resolved correctly. Setting this boolean to true will fix this.
---
--- # Return
--- **String:**
---      Text string with the address in a parent-child number format separated by dots.
---
--- # Example
---     This example prints different versions of the address to a cue in a sequence.
---
--- ```lua
--- return function()
---     -- Creates a cue in sequence 1
---     Cmd("Store Sequence 1 Cue 100 /Merge /NoConfirmation")
---     --Store a handle to the created cue
---     local cueObject = ObjectList("Sequence 1 Cue 100")[1]
---     --Print different version of the handle address
---     Printf("ToAddr:              " .. cueObject:ToAddr())
---     Printf("Addr:                " .. cueObject:Addr())
---     Printf("Addr(Parent, false, false): " .. cueObject:Addr(cueObject:Parent(), false, false))
---     Printf("Addr(Parent, true, false):  " .. cueObject:Addr(cueObject:Parent(), true, false))
---     Printf("Addr(Parent, false, true): " .. cueObject:Addr(cueObject:Parent(), false, true))
---     Printf("Addr(Parent, true, true):  " .. cueObject:Addr(cueObject:Parent(), true, true))
--- end
--- ```
---
---@param baseHandle? MAHandle
---@param useToAddrIndex? boolean
---@param fixResolution? boolean
---@return string
function MAHandle:Addr(baseHandle, useToAddrIndex, fixResolution) end

--- The Addr Lua object function converts a handle to an address string that can be used in commands.
--- # Arguments
--- **Handle:**
---     The function takes a handle of the type "light_userdata" as an argument. This is the handle to the object where the address is requested.
---     It can be omitted when using the colon notation on an object.
--- **baseHandle**
---     The returned address is from the root as a default. This optional handle can specify a different base location. It must still be a base location in the address path from the root to the object.
--- **useToAddrIndex**
---     This can be useful if there is a difference between the ==ToAddr()== and ==Addr()==. Setting this to "true" uses the index number from the ToAddr() instead of the Addr() index number.
--- **fixResolution**
---      In some edge cases, the cue address is not resolved correctly. Setting this boolean to true will fix this.
---
--- # Return
--- **String:**
---      Text string with the address in a parent-child number format separated by dots.
---
--- # Example
---     This example prints different versions of the address to a cue in a sequence.
---
--- ```lua
--- return function()
---     -- Creates a cue in sequence 1
---     Cmd("Store Sequence 1 Cue 100 /Merge /NoConfirmation")
---     --Store a handle to the created cue
---     local cueObject = ObjectList("Sequence 1 Cue 100")[1]
---     --Print different version of the handle address
---     Printf("ToAddr:              " .. cueObject:ToAddr())
---     Printf("Addr:                " .. cueObject:Addr())
---     Printf("Addr(Parent, false, false): " .. cueObject:Addr(cueObject:Parent(), false, false))
---     Printf("Addr(Parent, true, false):  " .. cueObject:Addr(cueObject:Parent(), true, false))
---     Printf("Addr(Parent, false, true): " .. cueObject:Addr(cueObject:Parent(), false, true))
---     Printf("Addr(Parent, true, true):  " .. cueObject:Addr(cueObject:Parent(), true, true))
--- end
--- ```
---
---@param handle MAHandle
---@param baseHandle? MAHandle
---@param useToAddrIndex? boolean
---@param fixResolution? boolean
---@return string
function Addr(handle, baseHandle, useToAddrIndex, fixResolution) end

--- The AddrNative Lua object function converts a handle to an address string that can be used in commands.
--- # Arguments
--- **Handle:**
---     The function takes a handle as an argument. This is the handle to the object where the address is requested.
---     It can be omitted when using the colon notation on an object.
--- **baseHandle**
---     The returned address is from the root as a default. This optional handle can specify a different base location. It still needs to be a base location in the address path from the root to the object.
--- **withQuotes**
---     Set this to "true" to get the returned names in quotation marks.
---
--- # Return
--- **String:**
---      Text string with the address in a parent-child name format separated by dots.
---
--- # Example
---      This example prints the address of the first sequence:
--- ```lua
--- return function()
---     -- Stores the handle to the first sequence.
---     local mySequence = DataPool().Sequences[1]
---     -- Print the native address.
---     Printf("The full address is: " .. mySequence:AddrNative())
---     -- Stores a handle to the default DataPool.
---     local myDataPool = DataPool()
---     -- Print the native address to the datapool using the default datapool as a base.
---     Printf("The address in the datapool is: " .. mySequence:AddrNative(myDataPool))
---     -- Print the native address to the datapool, using the default datapool as a base, with names as strings.
---     Printf("The address in the datapool with quotes around the names is: " .. mySequence:AddrNative(myDataPool, true))
--- end
--- ```
---@param handle MAHandle
---@param baseHandle? MAHandle
---@param withQuotes? boolean
---@return string
function MAHandle:AddrNative(handle, baseHandle, withQuotes) end

--- The AddrNative Lua object function converts a handle to an address string that can be used in commands.
--- # Arguments
--- **Handle:**
---     The function takes a handle as an argument. This is the handle to the object where the address is requested.
---     It can be omitted when using the colon notation on an object.
--- **baseHandle**
---     The returned address is from the root as a default. This optional handle can specify a different base location. It still needs to be a base location in the address path from the root to the object.
--- **withQuotes**
---     Set this to "true" to get the returned names in quotation marks.
---
--- # Return
--- **String:**
---      Text string with the address in a parent-child name format separated by dots.
---
--- # Example
---      This example prints the address of the first sequence:
--- ```lua
--- return function()
---     -- Stores the handle to the first sequence.
---     local mySequence = DataPool().Sequences[1]
---     -- Print the native address.
---     Printf("The full address is: " .. mySequence:AddrNative())
---     -- Stores a handle to the default DataPool.
---     local myDataPool = DataPool()
---     -- Print the native address to the datapool using the default datapool as a base.
---     Printf("The address in the datapool is: " .. mySequence:AddrNative(myDataPool))
---     -- Print the native address to the datapool, using the default datapool as a base, with names as strings.
---     Printf("The address in the datapool with quotes around the names is: " .. mySequence:AddrNative(myDataPool, true))
--- end
--- ```
---@param baseHandle? MAHandle
---@param withQuotes? boolean
---@return string
function AddrNative(baseHandle, withQuotes) end

--- The ==Children== Lua function creates a table of handles for the children of an object
---
--- # Arguments
--- **Handle:**
---     The function takes a handle of the type =="light_userdata"== as an argument.
---     It can be omitted when using colon notiation on an object.
---
--- # Return
--- **Table:**
---     The function returns a table with handles for the child objects. If there are no children, then it returns an empty table.
---
--- # Example
--- This example returns the name of the cues in the first sequenve of the selected data pool:
--- ```
--- return function()
---     -- Stores the handle for sequence 1 in a variable.
---     local mySequence = DataPool().Sequences[1]
---     if mySequence ~= nil then
---             -- Use the "Children()" funciton to store a table with all the children in a new variable.
---         local cues = mySequence:Children()
---         -- For loop that uses the length operator on the cue variable.
---         for i = 1, #cues do
---             -- Text is printed for each child.
---             Printf("Sequence 1 Child " .. i .. " = " .. cues[i].name)
---         end
---     else
---         ErrPrintf("Sequence could not be found.")
---     end
--- end
--- ```
---@param handle MAHandle
---@return {}
function Children(handle) end

--- The ==Children== Lua function creates a table of handles for the children of an object
---
--- # Arguments
--- **Handle:**
---     The function takes a handle of the type =="light_userdata"== as an argument.
---     It can be omitted when using colon notiation on an object.
---
--- # Return
--- **Table:**
---     The function returns a table with handles for the child objects. If there are no children, then it returns an empty table.
---
--- # Example
--- This example returns the name of the cues in the first sequenve of the selected data pool:
--- ```
--- return function()
---     -- Stores the handle for sequence 1 in a variable.
---     local mySequence = DataPool().Sequences[1]
---     if mySequence ~= nil then
---             -- Use the "Children()" funciton to store a table with all the children in a new variable.
---         local cues = mySequence:Children()
---         -- For loop that uses the length operator on the cue variable.
---         for i = 1, #cues do
---             -- Text is printed for each child.
---             Printf("Sequence 1 Child " .. i .. " = " .. cues[i].name)
---         end
---     else
---         ErrPrintf("Sequence could not be found.")
---     end
--- end
--- ```
---@return {}
function MAHandle:Children(handle) end

---@return integer
function MAHandle:Count() end

---@param handle MAHandle
---@return integer
function Count(handle) end

function MAHandle:Dump() end

---@param handle MAHandle
function Dump(handle) end

---@param path string
---@param fileName string
---@return boolean
function MAHandle:Export(path, fileName) end

---@param handle MAHandle
---@param path string
---@param fileName string
---@return boolean
function Export(handle, path, fileName) end

---@param propertyName string
---@param roleInt? integer
---@return string
function MAHandle:Get(propertyName, roleInt) end

---@param handle MAHandle
---@param propertyName string
---@param roleInt? integer
---@return string
function Get(handle, propertyName, roleInt) end

---@return string
function MAHandle:GetChildClass() end

---@param handle MAHandle
---@return string
function GetChildClass(handle) end

---@return string
function MAHandle:GetClass() end

---@param handle MAHandle
---@return string
function GetClass(handle) end

---@return {}
function MAHandle:GetDependencies() end

---@param handle MAHandle
---@return {}
function GetDependencies(handle) end

---@return {}
function MAHandle:GetReferences() end

---@param handle MAHandle
---@return {}
function GetReferences(handle) end

---@param tokenIndexTable FaderOptions
---@return number
function MAHandle:GetFader(tokenIndexTable) end

---@param handle MAHandle
---@param tokenIndexTable FaderOptions
---@return number
function GetFader(handle, tokenIndexTable) end

---@param tokenIndexTable FaderOptions
---@return string
function MAHandle:GetFaderText(tokenIndexTable) end

---@param handle MAHandle
---@param tokenIndexTable FaderOptions
---@return string
function GetFaderText(handle, tokenIndexTable) end

---@return string
function MAHandle:GetUIEditor() end

---@param handle MAHandle
---@return string
function GetUIEditor(handle) end

---@return string
function MAHandle:GetUISettings() end

---@param handle MAHandle
---@return string
function GetUISettings(handle) end

---@return boolean
function MAHandle:HasActivePlayback() end

---@param handle MAHandle
---@return boolean
function HasActivePlayback(handle) end

---@param filePath string
---@param fileName string
---@return boolean
function MAHandle:Import(filePath, fileName) end

---@param handle MAHandle
---@param filePath string
---@param fileName string
---@return boolean
function Import(handle, filePath, fileName) end

---@param childIndex integer
---@return MAHandle | nil
function MAHandle:Ptr(childIndex) end

---@param handle MAHandle
---@param childIndex integer
---@return MAHandle | nil
function Ptr(handle, childIndex) end

---@param options SetFaderOptions
function MAHandle:SetFader(options) end

---@param handle MAHandle
---@param options SetFaderOptions
function SetFader(handle, options) end

---@param returnNameOrType boolean
---@return string
function MAHandle:ToAddr(returnNameOrType) end

---@param handle MAHandle
---@param returnNameOrType boolean
---@return string
function ToAddr(handle, returnNameOrType) end
