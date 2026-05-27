---@meta

---@class MAHandle
local MAHandle = {}

-- grandMA3 Object Lua API
-- Generated from grandMA3 User Manual v2.3
-- All functions exist in two forms:
--   object:Method()       -- colon notation, handle is implicit self
--   Method(handle, ...)   -- standard notation, handle passed explicitly

--------------------------------------------------------------------------------
-- Addr
--------------------------------------------------------------------------------

--- Converts a handle to a numbered dot-notation address string for use in commands.
--- The address is in parent-child number format e.g. "1.2.3".
---
--- Example:
--- ```lua
--- local cueObject = ObjectList("Sequence 1 Cue 100")[1]
--- Printf("Addr: " .. cueObject:Addr())
--- Printf("Addr(Parent, false, false): " .. cueObject:Addr(cueObject:Parent(), false, false))
--- Printf("Addr(Parent, true, false): "  .. cueObject:Addr(cueObject:Parent(), true, false))
--- Printf("Addr(Parent, false, true): "  .. cueObject:Addr(cueObject:Parent(), false, true))
--- Printf("Addr(Parent, true, true): "   .. cueObject:Addr(cueObject:Parent(), true, true))
--- ```
---@param baseHandle? MAHandle Optional base location handle. Defaults to root.
---@param useToAddrIndex? boolean If true, uses the index number from ToAddr() instead of Addr()
---@param fixResolution? boolean If true, fixes edge cases where cue address resolves incorrectly
---@return string address Address string in parent-child dot notation
function MAHandle:Addr(baseHandle, useToAddrIndex, fixResolution) end

--- Converts a handle to a numbered dot-notation address string for use in commands.
--- The address is in parent-child number format e.g. "1.2.3".
---
--- Example:
--- ```lua
--- local cueObject = ObjectList("Sequence 1 Cue 100")[1]
--- Printf("Addr: " .. Addr(cueObject))
--- Printf("Addr(Parent): " .. Addr(cueObject, cueObject:Parent(), false, false))
--- ```
---@param handle MAHandle The handle to convert
---@param baseHandle? MAHandle Optional base location handle. Defaults to root.
---@param useToAddrIndex? boolean If true, uses the index number from ToAddr() instead of Addr()
---@param fixResolution? boolean If true, fixes edge cases where cue address resolves incorrectly
---@return string address Address string in parent-child dot notation
function Addr(handle, baseHandle, useToAddrIndex, fixResolution) end

--------------------------------------------------------------------------------
-- AddrNative
--------------------------------------------------------------------------------

--- Converts a handle to a named dot-notation address string for use in commands.
--- Returns names rather than index numbers, optionally wrapped in quotation marks.
---
--- Example:
--- ```lua
--- local mySequence = DataPool().Sequences[1]
--- Printf("Full address: " .. mySequence:AddrNative())
--- local myDataPool = DataPool()
--- Printf("DataPool address: " .. mySequence:AddrNative(myDataPool))
--- Printf("With quotes: " .. mySequence:AddrNative(myDataPool, true))
--- ```
---@param baseHandle? MAHandle Optional base location handle. Defaults to root.
---@param withQuotes? boolean If true, wraps each name segment in quotation marks
---@return string address Address string in parent-child name format separated by dots
function MAHandle:AddrNative(baseHandle, withQuotes) end

--- Converts a handle to a named dot-notation address string for use in commands.
--- Returns names rather than index numbers, optionally wrapped in quotation marks.
---
--- Example:
--- ```lua
--- local mySequence = DataPool().Sequences[1]
--- Printf("Full address: " .. AddrNative(mySequence))
--- ```
---@param handle MAHandle The handle to convert
---@param baseHandle? MAHandle Optional base location handle. Defaults to root.
---@param withQuotes? boolean If true, wraps each name segment in quotation marks
---@return string address Address string in parent-child name format separated by dots
function AddrNative(handle, baseHandle, withQuotes) end

--------------------------------------------------------------------------------
-- Children
--------------------------------------------------------------------------------

--- Returns a table of handles for all child objects of this object.
--- Returns an empty table if the object has no children.
---
--- Example:
--- ```lua
--- local mySequence = DataPool().Sequences[1]
--- if mySequence ~= nil then
---     local cues = mySequence:Children()
---     for i = 1, #cues do
---         Printf("Child " .. i .. " = " .. cues[i].Name)
---     end
--- end
--- ```
---@return MAHandle[] children Table of child object handles, empty if no children
function MAHandle:Children() end

--- Returns a table of handles for all child objects of the given handle.
--- Returns an empty table if the object has no children.
---
--- Example:
--- ```lua
--- local cues = Children(DataPool().Sequences[1])
--- for i = 1, #cues do Printf(cues[i].Name) end
--- ```
---@param handle MAHandle The parent object handle
---@return MAHandle[] children Table of child object handles, empty if no children
function Children(handle) end

--------------------------------------------------------------------------------
-- Count
--------------------------------------------------------------------------------

--- Returns the number of child objects this object has.
---
--- Example:
--- ```lua
--- local cueCount = SelectedSequence():Count()
--- Printf("The selected sequence has " .. cueCount .. " cues.")
--- ```
---@return integer count Number of child objects
function MAHandle:Count() end

--- Returns the number of child objects the given handle has.
---
--- Example:
--- ```lua
--- local count = Count(SelectedSequence())
--- Printf("Cue count: " .. count)
--- ```
---@param handle MAHandle The object handle
---@return integer count Number of child objects
function Count(handle) end

--------------------------------------------------------------------------------
-- Dump
--------------------------------------------------------------------------------

--- Prints detailed information about this object to the Command Line History.
--- Output includes the object's name, class, path, properties, and children.
--- Useful for exploring unfamiliar objects.
---
--- Example:
--- ```lua
--- Printf("======= START =======")
--- SelectedSequence():Dump()
--- Printf("======== END ========")
--- ```
---@return nil
function MAHandle:Dump() end

--- Prints detailed information about the given handle to the Command Line History.
--- Output includes the object's name, class, path, properties, and children.
---
--- Example:
--- ```lua
--- local seq = SelectedSequence()
--- Printf("======= START =======")
--- Dump(seq)
--- Printf("======== END ========")
--- ```
---@param handle MAHandle The object handle to dump
---@return nil
function Dump(handle) end

--------------------------------------------------------------------------------
-- Export
--------------------------------------------------------------------------------

--- Exports this object to an XML file at the specified path.
--- Use GetPath() to get valid grandMA3 folder paths.
--- Correlates with the Import() object function.
---
--- Example:
--- ```lua
--- local seq = SelectedSequence()
--- if seq then
---     local path = GetPath(Enums.PathType.UserSequences)
---     local success = seq:Export(path, "mySequence.xml")
---     if success then Printf("Exported to: " .. path) end
--- end
--- ```
---@param path string File system path to the destination folder
---@param fileName string Name of the file to create including extension e.g. "mySequence.xml"
---@return boolean success True if the export succeeded
function MAHandle:Export(path, fileName) end

--- Exports the given handle's object to an XML file at the specified path.
--- Correlates with the Import() object function.
---
--- Example:
--- ```lua
--- local success = Export(SelectedSequence(), GetPath(Enums.PathType.UserSequences), "seq.xml")
--- ```
---@param handle MAHandle The object to export
---@param path string File system path to the destination folder
---@param fileName string Name of the file to create including extension
---@return boolean success True if the export succeeded
function Export(handle, path, fileName) end

--------------------------------------------------------------------------------
-- Get
--------------------------------------------------------------------------------

--- Returns the value of a named property on this object.
--- Boolean properties return "0" or "1" by default. Supply a role integer to get "No"/"Yes" instead.
---
--- Example:
--- ```lua
--- local seq = SelectedSequence()
--- local tracking = seq:Get("Tracking")             -- returns "0" or "1"
--- local trackingStr = seq:Get("Tracking", Enums.Roles.Edit)  -- returns "No" or "Yes"
--- Printf("Tracking: " .. trackingStr)
--- ```
---@param propertyName string Name of a valid property on this object
---@param roleInt? integer Optional role integer. When supplied, booleans return as "No"/"Yes"
---@return string value The property value as a string
function MAHandle:Get(propertyName, roleInt) end

--- Returns the value of a named property on the given handle's object.
--- Boolean properties return "0" or "1" by default. Supply a role integer to get "No"/"Yes" instead.
---
--- Example:
--- ```lua
--- local val = Get(SelectedSequence(), "Tracking", Enums.Roles.Edit)
--- Printf("Tracking: " .. val)
--- ```
---@param handle MAHandle The object handle
---@param propertyName string Name of a valid property on this object
---@param roleInt? integer Optional role integer. When supplied, booleans return as "No"/"Yes"
---@return string value The property value as a string
function Get(handle, propertyName, roleInt) end

--------------------------------------------------------------------------------
-- GetChildClass
--------------------------------------------------------------------------------

--- Returns the class name of this object's children.
---
--- Example:
--- ```lua
--- Printf("Child class: " .. SelectedSequence():GetChildClass())
--- ```
---@return string className Class name of the child objects
function MAHandle:GetChildClass() end

--- Returns the class name of the given handle's children.
---
--- Example:
--- ```lua
--- Printf("Child class: " .. GetChildClass(SelectedSequence()))
--- ```
---@param handle MAHandle The object handle
---@return string className Class name of the child objects
function GetChildClass(handle) end

--------------------------------------------------------------------------------
-- GetClass
--------------------------------------------------------------------------------

--- Returns the class name of this object.
---
--- Example:
--- ```lua
--- Printf("Class: " .. SelectedSequence():GetClass())
--- ```
---@return string className The class name of this object
function MAHandle:GetClass() end

--- Returns the class name of the given handle's object.
---
--- Example:
--- ```lua
--- Printf("Class: " .. GetClass(SelectedSequence()))
--- ```
---@param handle MAHandle The object handle
---@return string className The class name of the object
function GetClass(handle) end

--------------------------------------------------------------------------------
-- GetDependencies
--------------------------------------------------------------------------------

--- Returns a table of handles for all objects this object depends on.
--- Returns nil if there are no dependencies.
---
--- Example:
--- ```lua
--- local deps = SelectedSequence():GetDependencies()
--- if deps ~= nil then
---     Printf("======= START =======")
---     deps[1]:Dump()
---     Printf("======== END ========")
--- else
---     Printf("No dependencies found")
--- end
--- ```
---@return MAHandle[]|nil dependencies Table of dependency handles, or nil if none
function MAHandle:GetDependencies() end

--- Returns a table of handles for all objects the given handle depends on.
---
--- Example:
--- ```lua
--- local deps = GetDependencies(SelectedSequence())
--- ```
---@param handle MAHandle The object handle
---@return MAHandle[]|nil dependencies Table of dependency handles, or nil if none
function GetDependencies(handle) end

--------------------------------------------------------------------------------
-- GetReferences
--------------------------------------------------------------------------------

--- Returns a table of handles for all objects that reference this object.
--- Returns nil if nothing references this object.
---
--- Example:
--- ```lua
--- local refs = SelectedSequence():GetReferences()
--- if refs ~= nil then
---     refs[1]:Dump()
--- else
---     Printf("No references found")
--- end
--- ```
---@return MAHandle[]|nil references Table of referencing object handles, or nil if none
function MAHandle:GetReferences() end

--- Returns a table of handles for all objects that reference the given handle.
---
--- Example:
--- ```lua
--- local refs = GetReferences(SelectedSequence())
--- ```
---@param handle MAHandle The object handle
---@return MAHandle[]|nil references Table of referencing object handles, or nil if none
function GetReferences(handle) end

--------------------------------------------------------------------------------
-- GetFader
--------------------------------------------------------------------------------

--- Returns a float indicating the fader position for this object.
--- Use the token field to specify which fader to read. Defaults to FaderMaster.
---
--- Example:
--- ```lua
--- local seq = SelectedSequence()
--- local master = seq:GetFader({})                        -- FaderMaster (default)
--- local rate   = seq:GetFader({token = "FaderRate"})
--- Printf("Master: " .. master .. "  Rate: " .. rate)
--- ```
---@param options FaderOptions Table with optional token and index fields
---@return number value Fader position as a float
function MAHandle:GetFader(options) end

--- Returns a float indicating the fader position for the given handle.
---
--- Example:
--- ```lua
--- local val = GetFader(SelectedSequence(), {token = "FaderRate"})
--- ```
---@param handle MAHandle The object handle
---@param options FaderOptions Table with optional token and index fields
---@return number value Fader position as a float
function GetFader(handle, options) end

--------------------------------------------------------------------------------
-- GetFaderText
--------------------------------------------------------------------------------

--- Returns a text string representation of the fader value for this object.
--- Use the token field to specify which fader to read. Defaults to FaderMaster.
---
--- Example:
--- ```lua
--- local seq = SelectedSequence()
--- local masterText = seq:GetFaderText({})
--- local rateText   = seq:GetFaderText({token = "FaderRate"})
--- Printf("Master: " .. tostring(masterText))
--- Printf("Rate: "   .. tostring(rateText))
--- ```
---@param options FaderOptions Table with optional token and index fields
---@return string value Fader value as a display text string
function MAHandle:GetFaderText(options) end

--- Returns a text string representation of the fader value for the given handle.
---
--- Example:
--- ```lua
--- local text = GetFaderText(SelectedSequence(), {token = "FaderRate"})
--- ```
---@param handle MAHandle The object handle
---@param options FaderOptions Table with optional token and index fields
---@return string value Fader value as a display text string
function GetFaderText(handle, options) end

--------------------------------------------------------------------------------
-- GetUIEditor
--------------------------------------------------------------------------------

--- Returns the name of the UI editor associated with this object.
--- Returns nil if the object has no editor.
---
--- Example:
--- ```lua
--- local editor = SelectedSequence():GetUIEditor()
--- if editor then Printf("Editor: " .. editor) end
--- ```
---@return string|nil editorName Name of the UI editor, or nil if none
function MAHandle:GetUIEditor() end

--- Returns the name of the UI editor associated with the given handle.
---
--- Example:
--- ```lua
--- local editor = GetUIEditor(SelectedSequence())
--- ```
---@param handle MAHandle The object handle
---@return string|nil editorName Name of the UI editor, or nil if none
function GetUIEditor(handle) end

--------------------------------------------------------------------------------
-- GetUISettings
--------------------------------------------------------------------------------

--- Returns the name of the UI settings associated with this object.
--- Returns nil if the object has no settings.
---
--- Example:
--- ```lua
--- local settings = SelectedSequence():GetUISettings()
--- if settings then Printf("Settings: " .. settings) end
--- ```
---@return string|nil settingsName Name of the UI settings, or nil if none
function MAHandle:GetUISettings() end

--- Returns the name of the UI settings associated with the given handle.
---
--- Example:
--- ```lua
--- local settings = GetUISettings(SelectedSequence())
--- ```
---@param handle MAHandle The object handle
---@return string|nil settingsName Name of the UI settings, or nil if none
function GetUISettings(handle) end

--------------------------------------------------------------------------------
-- HasActivePlayback
--------------------------------------------------------------------------------

--- Returns true if this object has an active playback, for instance if a sequence has a running cue.
---
--- Example:
--- ```lua
--- local seq = SelectedSequence()
--- if seq:HasActivePlayback() then
---     Printf("'" .. seq.Name .. "' has active playback")
--- else
---     Printf("'" .. seq.Name .. "' has no active playback")
--- end
--- ```
---@return boolean active True if there is active playback, false if not
function MAHandle:HasActivePlayback() end

--- Returns true if the given handle has an active playback.
---
--- Example:
--- ```lua
--- if HasActivePlayback(SelectedSequence()) then Printf("Playing") end
--- ```
---@param handle MAHandle The object handle
---@return boolean active True if there is active playback, false if not
function HasActivePlayback(handle) end

--------------------------------------------------------------------------------
-- Import
--------------------------------------------------------------------------------

--- Imports an XML file and merges its content into this object.
--- The file must already exist. Merges without any confirmation pop-up.
--- Correlates with the Export() object function.
---
--- Example:
--- ```lua
--- local seq = SelectedSequence()
--- if seq then
---     local path = GetPath(Enums.PathType.UserSequences)
---     local success = seq:Import(path, "mySequence.xml")
---     if success then
---         Printf("Imported from: " .. path .. GetPathSeparator() .. "mySequence.xml")
---     end
--- end
--- ```
---@param path string File system path to the folder containing the file
---@param fileName string Name of the file to import including extension e.g. "mySequence.xml"
---@return boolean success True if the import succeeded
function MAHandle:Import(path, fileName) end

--- Imports an XML file and merges its content into the given handle's object.
--- The file must already exist. Merges without any confirmation pop-up.
---
--- Example:
--- ```lua
--- local success = Import(SelectedSequence(), GetPath(Enums.PathType.UserSequences), "seq.xml")
--- ```
---@param handle MAHandle The target object handle to import into
---@param path string File system path to the folder containing the file
---@param fileName string Name of the file to import including extension
---@return boolean success True if the import succeeded
function Import(handle, path, fileName) end

--------------------------------------------------------------------------------
-- Ptr
--------------------------------------------------------------------------------

--- Returns a handle to a child object by 1-based index.
--- Returns nil if no child exists at that index.
---
--- Example:
--- ```lua
--- local seq = SelectedSequence()
--- if seq then
---     local firstCue = seq:Ptr(1)
---     if firstCue then
---         firstCue:Dump()
---     else
---         ErrPrintf("No child at index 1")
---     end
--- end
--- ```
---@param childIndex integer 1-based index of the child object
---@return MAHandle|nil child Handle to the child, or nil if it doesn't exist
function MAHandle:Ptr(childIndex) end

--- Returns a handle to a child object of the given handle by 1-based index.
--- Returns nil if no child exists at that index.
---
--- Example:
--- ```lua
--- local firstCue = Ptr(SelectedSequence(), 1)
--- ```
---@param handle MAHandle The parent object handle
---@param childIndex integer 1-based index of the child object
---@return MAHandle|nil child Handle to the child, or nil if it doesn't exist
function Ptr(handle, childIndex) end

--------------------------------------------------------------------------------
-- Set
--------------------------------------------------------------------------------

--- Sets a named property on this object to a new value.
--- Property names and valid values depend on the object type.
--- Use Get() or Dump() to discover available properties.
---
--- Example:
--- ```lua
--- local seq = SelectedSequence()
--- seq:Set("Tracking", "No")
--- ```
---@param propertyName string Name of the property to set
---@param value string The new value for the property
---@param roleInt? integer Optional role integer
---@return nil
function MAHandle:Set(propertyName, value, roleInt) end

--- Sets a named property on the given handle's object to a new value.
---
--- Example:
--- ```lua
--- Set(SelectedSequence(), "Tracking", "No")
--- ```
---@param handle MAHandle The object handle
---@param propertyName string Name of the property to set
---@param value string The new value for the property
---@param roleInt? integer Optional role integer
---@return nil
function Set(handle, propertyName, value, roleInt) end

--------------------------------------------------------------------------------
-- SetFader
--------------------------------------------------------------------------------

--- Sets a fader on this object to a specified level (0-100).
--- The value field is required. Token defaults to FaderMaster if omitted.
--- Use faderEnabled to toggle faders that can be enabled or disabled.
---
--- Example:
--- ```lua
--- local seq = SelectedSequence()
--- seq:SetFader({value = 100.0})                              -- set Master to 100%
--- seq:SetFader({value = 50.0, faderEnabled = true, token = "FaderTime"})  -- enable and set Time fader
--- ```
---@param options SetFaderOptions Table with value (required), token (optional), faderEnabled (optional)
---@return nil
function MAHandle:SetFader(options) end

--- Sets a fader on the given handle's object to a specified level (0-100).
---
--- Example:
--- ```lua
--- SetFader(SelectedSequence(), {value = 100.0})
--- ```
---@param handle MAHandle The object handle
---@param options SetFaderOptions Table with value (required), token (optional), faderEnabled (optional)
---@return nil
function SetFader(handle, options) end

--------------------------------------------------------------------------------
-- ToAddr
--------------------------------------------------------------------------------

--- Converts this handle to a named address string.
--- Returns the address using object names rather than index numbers.
--- See Addr() for the numbered index version.
---
--- Example:
--- ```lua
--- local cueObject = ObjectList("Sequence 1 Cue 100")[1]
--- Printf("ToAddr: " .. cueObject:ToAddr())
--- ```
---@param useIndex? boolean If true, uses index format instead of name format
---@return string address Named address string
function MAHandle:ToAddr(useIndex) end

--- Converts the given handle to a named address string.
---
--- Example:
--- ```lua
--- Printf(ToAddr(SelectedSequence()))
--- ```
---@param handle MAHandle The handle to convert
---@param useIndex? boolean If true, uses index format instead of name format
---@return string address Named address string
function ToAddr(handle, useIndex) end
