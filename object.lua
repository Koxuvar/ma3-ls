---@meta

-- grandMA3 Object Lua API
-- Complete stub file generated from grandMA3 User Manual v2.3 and official API dump.
-- All functions exist in two forms:
--   object:Method()       -- colon notation, handle is implicit self
--   Method(handle, ...)   -- standard notation, handle passed explicitly

---@class MAHandle
local MAHandle = {}

--------------------------------------------------------------------------------
-- Address / Path
--------------------------------------------------------------------------------

--- Converts this handle to a numbered dot-notation address string.
--- The address is in parent-child number format e.g. "1.2.3".
---
--- Example:
--- ```lua
--- local cueObject = ObjectList("Sequence 1 Cue 100")[1]
--- Printf("Addr: " .. cueObject:Addr())
--- Printf("Addr(Parent, false, false): " .. cueObject:Addr(cueObject:Parent(), false, false))
--- ```
---@param baseHandle? MAHandle Optional base location handle. Defaults to root.
---@param forceParentBased? boolean If true, forces parent-based address calculation
---@param forceCmdlineIndex? boolean If true, forces command line index-based address
---@return string address Address string in parent-child dot notation
function MAHandle:Addr(baseHandle, forceParentBased, forceCmdlineIndex) end

---@param handle MAHandle
---@param baseHandle? MAHandle
---@param forceParentBased? boolean
---@param forceCmdlineIndex? boolean
---@return string address
function Addr(handle, baseHandle, forceParentBased, forceCmdlineIndex) end

--- Converts this handle to a named dot-notation address string.
---
--- Example:
--- ```lua
--- local mySequence = DataPool().Sequences[1]
--- Printf("Full address: " .. mySequence:AddrNative())
--- Printf("With quotes: " .. mySequence:AddrNative(DataPool(), true))
--- ```
---@param baseHandle? MAHandle Optional base location handle. Defaults to root.
---@param escapeNames? boolean If true, wraps each name segment in quotation marks
---@return string address Address string in parent-child name format
function MAHandle:AddrNative(baseHandle, escapeNames) end

---@param handle MAHandle
---@param baseHandle? MAHandle
---@param escapeNames? boolean
---@return string address
function AddrNative(handle, baseHandle, escapeNames) end

--- Converts this handle to a named address string using ToAddr format.
---
--- Example:
--- ```lua
--- local cueObject = ObjectList("Sequence 1 Cue 100")[1]
--- Printf("ToAddr: " .. cueObject:ToAddr())
--- ```
---@param withName? boolean If true returns named address, if false returns numeric
---@param useVisibleAddr? boolean If true uses the visible address format
---@return string address Named address string
function MAHandle:ToAddr(withName, useVisibleAddr) end

---@param handle MAHandle
---@param withName? boolean
---@param useVisibleAddr? boolean
---@return string address
function ToAddr(handle, withName, useVisibleAddr) end

--------------------------------------------------------------------------------
-- Object info / inspection
--------------------------------------------------------------------------------

--- Prints detailed information about this object to the Command Line History.
--- Output includes the object's name, class, path, properties, and children.
---
--- Example:
--- ```lua
--- Printf("===== START =====")
--- SelectedSequence():Dump()
--- Printf("====== END ======")
--- ```
---@return nil
function MAHandle:Dump() end

---@param handle MAHandle
---@return nil
function Dump(handle) end

--- Returns the 1-based index of this object within its parent.
---@return integer index 1-based index in the parent
function MAHandle:Index() end

---@param handle MAHandle
---@return integer index
function Index(handle) end

--- Returns the class name of this object.
---
--- Example:
--- ```lua
--- Printf("Class: " .. SelectedSequence():GetClass())
--- ```
---@return string className The class name of this object
function MAHandle:GetClass() end

---@param handle MAHandle
---@return string className
function GetClass(handle) end

--- Returns the class name of this object's children.
---
--- Example:
--- ```lua
--- Printf("Child class: " .. SelectedSequence():GetChildClass())
--- ```
---@return string className Class name of the child objects
function MAHandle:GetChildClass() end

---@param handle MAHandle
---@return string className
function GetChildClass(handle) end

--- Returns true if this handle is a valid grandMA3 object.
---@return boolean valid True if valid
function MAHandle:IsValid() end

---@param handle MAHandle
---@return boolean valid
function IsValid(handle) end

--- Returns true if this handle refers to a class object rather than an instance.
---@return boolean isClass True if this is a class handle
function MAHandle:IsClass() end

---@param handle MAHandle
---@return boolean isClass
function IsClass(handle) end

--- Returns true if this object is empty (has no meaningful content).
---@return boolean empty True if the object is empty
function MAHandle:IsEmpty() end

---@param handle MAHandle
---@return boolean empty
function IsEmpty(handle) end

--- Returns true if this object is locked.
---@return boolean locked True if the object is locked
function MAHandle:IsLocked() end

---@param handle MAHandle
---@return boolean locked
function IsLocked(handle) end

--- Compares this object with another handle.
---@param otherHandle MAHandle Handle to compare against
---@return boolean isEqual True if the objects are equal
---@return string whatDiffers Description of what differs if not equal
function MAHandle:Compare(otherHandle) end

---@param handle MAHandle
---@param otherHandle MAHandle
---@return boolean isEqual
---@return string whatDiffers
function Compare(handle, otherHandle) end

--- Returns true if the given object is an ancestor of this object.
---@param objectHandle MAHandle Handle to the potential ancestor
---@return nil
function MAHandle:HasParent(objectHandle) end

---@param handle MAHandle
---@param objectHandle MAHandle
---@return nil
function HasParent(handle, objectHandle) end

--- Returns the handle to the object assigned to this object (e.g. an assigned preset).
---@return MAHandle|nil assigned Handle to the assigned object, or nil
function MAHandle:GetAssignedObj() end

---@param handle MAHandle
---@return MAHandle|nil assigned
function GetAssignedObj(handle) end

--- Returns whether this object has a UI editor settings panel.
---@return boolean result True if a settings UI exists
function MAHandle:HasEditSettingUI() end

---@param handle MAHandle
---@return boolean result
function HasEditSettingUI(handle) end

--- Returns whether this object has a UI editor panel.
---@return boolean result True if an editor UI exists
function MAHandle:HasEditUI() end

---@param handle MAHandle
---@return boolean result
function HasEditUI(handle) end

--- Returns the name of the UI editor associated with this object.
---@return string|nil editorName Name of the UI editor, or nil if none
function MAHandle:GetUIEditor() end

---@param handle MAHandle
---@return string|nil editorName
function GetUIEditor(handle) end

--- Returns the name of the UI settings associated with this object.
---@return string|nil settingsName Name of the UI settings, or nil if none
function MAHandle:GetUISettings() end

---@param handle MAHandle
---@return string|nil settingsName
function GetUISettings(handle) end

--- Returns whether this object has an active playback (e.g. a sequence with a running cue).
---
--- Example:
--- ```lua
--- if SelectedSequence():HasActivePlayback() then Printf("Playing") end
--- ```
---@return boolean active True if there is active playback
function MAHandle:HasActivePlayback() end

---@param handle MAHandle
---@return boolean active
function HasActivePlayback(handle) end

--- Returns whether this object has any references from other objects.
---@return boolean result True if references exist
function MAHandle:HasReferences() end

---@param handle MAHandle
---@return boolean result
function HasReferences(handle) end

--- Returns whether this object has any dependencies on other objects.
---@return boolean result True if dependencies exist
function MAHandle:HasDependencies() end

---@param handle MAHandle
---@return boolean result
function HasDependencies(handle) end

--- Returns a table of handles for all objects that reference this object.
---
--- Example:
--- ```lua
--- local refs = SelectedSequence():GetReferences()
--- if refs then refs[1]:Dump() end
--- ```
---@return MAHandle[]|nil references Table of referencing handles, or nil if none
function MAHandle:GetReferences() end

---@param handle MAHandle
---@return MAHandle[]|nil references
function GetReferences(handle) end

--- Returns a table of handles for all objects this object depends on.
---@return MAHandle[]|nil dependencies Table of dependency handles, or nil if none
function MAHandle:GetDependencies() end

---@param handle MAHandle
---@return MAHandle[]|nil dependencies
function GetDependencies(handle) end

--- Returns the suggested export filename for this object.
---@param camelCaseToFileName? boolean If true, converts CamelCase to file-name-case
---@return string fileName Suggested file name string
function MAHandle:GetExportFileName(camelCaseToFileName) end

---@param handle MAHandle
---@param camelCaseToFileName? boolean
---@return string fileName
function GetExportFileName(handle, camelCaseToFileName) end

--- Returns the number of text lines in this object.
---@return integer count Number of lines
function MAHandle:GetLineCount() end

---@param handle MAHandle
---@return integer count
function GetLineCount(handle) end

--- Returns the text content of the line at the given line number.
---@param lineNumber integer Line number (1-based)
---@return string content Text content of the line
function MAHandle:GetLineAt(lineNumber) end

---@param handle MAHandle
---@param lineNumber integer
---@return string content
function GetLineAt(handle, lineNumber) end

--------------------------------------------------------------------------------
-- Properties
--------------------------------------------------------------------------------

--- Returns the value of a named property on this object.
--- Boolean properties return "0" or "1" by default. Supply a role integer to get "No"/"Yes".
---
--- Example:
--- ```lua
--- local tracking = SelectedSequence():Get("Tracking", Enums.Roles.Edit) -- "No" or "Yes"
--- ```
---@param propertyName string Name of a valid property on this object
---@param roleInt? integer Optional role integer. When supplied, booleans return as "No"/"Yes"
---@return MAHandle|string value The child handle or property value as a string
function MAHandle:Get(propertyName, roleInt) end

---@param handle MAHandle
---@param propertyName string
---@param roleInt? integer
---@return MAHandle|string value
function Get(handle, propertyName, roleInt) end

--- Sets a named property on this object to a new value.
---
--- Example:
--- ```lua
--- SelectedSequence():Set("Tracking", "No")
--- ```
---@param propertyName string Name of the property to set
---@param value string The new value for the property
---@param changeLevelOverride? integer Optional Enums.ChangeLevel override
---@return nil
function MAHandle:Set(propertyName, value, changeLevelOverride) end

---@param handle MAHandle
---@param propertyName string
---@param value string
---@param changeLevelOverride? integer
---@return nil
function Set(handle, propertyName, value, changeLevelOverride) end

--- Sets a property on all immediate children of this object.
---@param propertyName string Name of the property to set
---@param value string New value for the property
---@param recursive? boolean If true, sets recursively (default: false)
---@return nil
function MAHandle:SetChildren(propertyName, value, recursive) end

---@param handle MAHandle
---@param propertyName string
---@param value string
---@param recursive? boolean
---@return nil
function SetChildren(handle, propertyName, value, recursive) end

--- Sets a property recursively on all children of this object.
---@param propertyName string Name of the property to set
---@param value string New value for the property
---@param recursive? boolean If true, sets recursively (default: false)
---@return nil
function MAHandle:SetChildrenRecursive(propertyName, value, recursive) end

---@param handle MAHandle
---@param propertyName string
---@param value string
---@param recursive? boolean
---@return nil
function SetChildrenRecursive(handle, propertyName, value, recursive) end

--- Returns the total number of properties on this object.
---@return integer count Number of properties
function MAHandle:PropertyCount() end

---@param handle MAHandle
---@return integer count
function PropertyCount(handle) end

--- Returns the name of the property at the given 1-based index.
---@param propertyIndex integer 1-based property index
---@return string name Property name
function MAHandle:PropertyName(propertyIndex) end

---@param handle MAHandle
---@param propertyIndex integer
---@return string name
function PropertyName(handle, propertyIndex) end

--- Returns the type string of the property at the given 1-based index.
---@param propertyIndex integer 1-based property index
---@return string typeName Property type name string
function MAHandle:PropertyType(propertyIndex) end

---@param handle MAHandle
---@param propertyIndex integer
---@return string typeName
function PropertyType(handle, propertyIndex) end

--- Returns a table of flags and info for the property at the given 1-based index.
---@param propertyIndex integer 1-based property index
---@return {ReadOnly: boolean, ExportIgnore: boolean, ImportIgnore: boolean, EnumCollection: string} info
function MAHandle:PropertyInfo(propertyIndex) end

---@param handle MAHandle
---@param propertyIndex integer
---@return {ReadOnly: boolean, ExportIgnore: boolean, ImportIgnore: boolean, EnumCollection: string} info
function PropertyInfo(handle, propertyIndex) end

--- Marks this object as changed at the given change level.
---@param changeLevel string Change level enum name (Enums.ChangeLevel)
---@return nil
function MAHandle:Changed(changeLevel) end

---@param handle MAHandle
---@param changeLevel string
---@return nil
function Changed(handle, changeLevel) end

--- Prepares this object for access, ensuring it is ready to be read or written.
---@return nil
function MAHandle:PrepareAccess() end

---@param handle MAHandle
---@return nil
function PrepareAccess(handle) end

--------------------------------------------------------------------------------
-- Hierarchy / Navigation
--------------------------------------------------------------------------------

--- Returns the parent object handle.
---@return MAHandle parent Handle to the parent object
function MAHandle:Parent() end

---@param handle MAHandle
---@return MAHandle parent
function Parent(handle) end

--- Returns the number of child objects this object has.
---
--- Example:
--- ```lua
--- Printf("Cue count: " .. SelectedSequence():Count())
--- ```
---@return integer count Number of child objects
function MAHandle:Count() end

---@param handle MAHandle
---@return integer count
function Count(handle) end

--- Returns the maximum possible number of children this object can hold.
---@return integer maxCount Maximum child count
function MAHandle:MaxCount() end

---@param handle MAHandle
---@return integer maxCount
function MaxCount(handle) end

--- Returns a handle to a child object by 1-based index.
---
--- Example:
--- ```lua
--- local firstCue = SelectedSequence():Ptr(1)
--- if firstCue then firstCue:Dump() end
--- ```
---@param childIndex integer 1-based index of the child object
---@return MAHandle|nil child Handle to the child, or nil if it doesn't exist
function MAHandle:Ptr(childIndex) end

---@param handle MAHandle
---@param childIndex integer
---@return MAHandle|nil child
function Ptr(handle, childIndex) end

--- Returns a handle to a child object using the command line index (1-based).
---@param index integer 1-based command line index
---@return MAHandle|nil child Handle to the child, or nil if not found
function MAHandle:CmdlinePtr(index) end

---@param handle MAHandle
---@param index integer
---@return MAHandle|nil child
function CmdlinePtr(handle, index) end

--- Returns a table of handles for all child objects.
---
--- Example:
--- ```lua
--- local cues = DataPool().Sequences[1]:Children()
--- for i = 1, #cues do Printf(cues[i].Name) end
--- ```
---@return MAHandle[] children Table of child object handles, empty if no children
function MAHandle:Children() end

---@param handle MAHandle
---@return MAHandle[] children
function Children(handle) end

--- Returns a table of child handles using the command line ordering.
---@return MAHandle[] children Table of child handles in command line order
function MAHandle:CmdlineChildren() end

---@param handle MAHandle
---@return MAHandle[] children
function CmdlineChildren(handle) end

--- Returns the currently active child object.
---@return MAHandle|nil child Handle to the current child, or nil if none
function MAHandle:CurrentChild() end

---@param handle MAHandle
---@return MAHandle|nil child
function CurrentChild(handle) end

--- Finds the nearest ancestor of this object matching the given class name.
---@param className string Class name to search for
---@return MAHandle|nil found Handle to the found ancestor, or nil
function MAHandle:FindParent(className) end

---@param handle MAHandle
---@param className string
---@return MAHandle|nil found
function FindParent(handle, className) end

--- Finds a child by name, optionally filtered by class name.
---@param name string Name to search for
---@param className? string Optional class name filter
---@return MAHandle|nil found Handle to the found object, or nil
function MAHandle:Find(name, className) end

---@param handle MAHandle
---@param name string
---@param className? string
---@return MAHandle|nil found
function Find(handle, name, className) end

--- Finds a child recursively by name, optionally filtered by class name.
---@param name string Name to search for
---@param className? string Optional class name filter
---@return MAHandle|nil found Handle to the found object, or nil
function MAHandle:FindRecursive(name, className) end

---@param handle MAHandle
---@param name string
---@param className? string
---@return MAHandle|nil found
function FindRecursive(handle, name, className) end

--- Finds a child by wildcard name pattern.
---@param pattern string Wildcard name pattern
---@return MAHandle|nil found Handle to the found object, or nil
function MAHandle:FindWild(pattern) end

---@param handle MAHandle
---@param pattern string
---@return MAHandle|nil found
function FindWild(handle, pattern) end

--------------------------------------------------------------------------------
-- Object modification
--------------------------------------------------------------------------------

--- Resizes the object to hold the given number of children.
---@param size integer New size
---@return nil
function MAHandle:Resize(size) end

---@param handle MAHandle
---@param size integer
---@return nil
function Resize(handle, size) end

--- Creates a child at the given 1-based index, optionally of a specific class.
---@param childIndex integer 1-based index for the new child
---@param class? string Optional class name for the new child
---@param undoHandle? MAHandle Optional undo handle
---@return MAHandle child Handle to the created child
function MAHandle:Create(childIndex, class, undoHandle) end

---@param handle MAHandle
---@param childIndex integer
---@param class? string
---@param undoHandle? MAHandle
---@return MAHandle child
function Create(handle, childIndex, class, undoHandle) end

--- Appends a new child to this object, optionally of a specific class.
---@param class? string Optional class name
---@param undoHandle? MAHandle Optional undo handle
---@param count? integer Optional number of children to append
---@return MAHandle child Handle to the appended child
function MAHandle:Append(class, undoHandle, count) end

---@param handle MAHandle
---@param class? string
---@param undoHandle? MAHandle
---@param count? integer
---@return MAHandle child
function Append(handle, class, undoHandle, count) end

--- Acquires (creates or reuses) a child of this object.
---@param class? string Optional class name
---@param undoHandle? MAHandle Optional undo handle
---@return MAHandle child Handle to the acquired child
function MAHandle:Acquire(class, undoHandle) end

---@param handle MAHandle
---@param class? string
---@param undoHandle? MAHandle
---@return MAHandle child
function Acquire(handle, class, undoHandle) end

--- Alias for Acquire() — alternate spelling used in some MA3 contexts.
---@param class? string Optional class name
---@param undoHandle? MAHandle Optional undo handle
---@return MAHandle child Handle to the acquired child
function MAHandle:Aquire(class, undoHandle) end

---@param handle MAHandle
---@param class? string
---@param undoHandle? MAHandle
---@return MAHandle child
function Aquire(handle, class, undoHandle) end

--- Deletes the child at the given 1-based index.
---@param childIndex integer 1-based index of the child to delete
---@param undoHandle? MAHandle Optional undo handle
---@return nil
function MAHandle:Delete(childIndex, undoHandle) end

---@param handle MAHandle
---@param childIndex integer
---@param undoHandle? MAHandle
---@return nil
function Delete(handle, childIndex, undoHandle) end

--- Inserts a new child at the given 1-based index.
---@param childIndex integer 1-based index to insert at
---@param class? string Optional class name
---@param undoHandle? MAHandle Optional undo handle
---@param count? integer Optional number to insert
---@return MAHandle child Handle to the inserted child
function MAHandle:Insert(childIndex, class, undoHandle, count) end

---@param handle MAHandle
---@param childIndex integer
---@param class? string
---@param undoHandle? MAHandle
---@param count? integer
---@return MAHandle child
function Insert(handle, childIndex, class, undoHandle, count) end

--- Removes the child at the given 1-based index.
---@param childIndex integer 1-based index of the child to remove
---@param undoHandle? MAHandle Optional undo handle
---@return nil
function MAHandle:Remove(childIndex, undoHandle) end

---@param handle MAHandle
---@param childIndex integer
---@param undoHandle? MAHandle
---@return nil
function Remove(handle, childIndex, undoHandle) end

--- Copies data from a source handle into this object.
---@param srcHandle MAHandle Handle to copy from
---@param undoHandle? MAHandle Optional undo handle
---@return nil
function MAHandle:Copy(srcHandle, undoHandle) end

---@param dstHandle MAHandle
---@param srcHandle MAHandle
---@param undoHandle? MAHandle
---@return nil
function Copy(dstHandle, srcHandle, undoHandle) end

--------------------------------------------------------------------------------
-- File operations
--------------------------------------------------------------------------------

--- Exports this object to an XML file.
---
--- Example:
--- ```lua
--- local path = GetPath(Enums.PathType.UserSequences)
--- local success = SelectedSequence():Export(path, "mySequence.xml")
--- ```
---@param path string File system path to the destination folder
---@param fileName string Name of the file to create including extension
---@return boolean success True if the export succeeded
function MAHandle:Export(path, fileName) end

---@param handle MAHandle
---@param path string
---@param fileName string
---@return boolean success
function Export(handle, path, fileName) end

--- Imports an XML file and merges its content into this object.
--- The file must already exist. Merges without any confirmation pop-up.
---
--- Example:
--- ```lua
--- local path = GetPath(Enums.PathType.UserSequences)
--- local success = SelectedSequence():Import(path, "mySequence.xml")
--- ```
---@param path string File system path to the folder containing the file
---@param fileName string Name of the file to import including extension
---@return boolean success True if the import succeeded
function MAHandle:Import(path, fileName) end

---@param handle MAHandle
---@param path string
---@param fileName string
---@return boolean success
function Import(handle, path, fileName) end

--- Loads data from a file into this object.
---@param path string File system path to the folder
---@param fileName string Name of the file to load
---@return boolean success True if the load succeeded
function MAHandle:Load(path, fileName) end

---@param handle MAHandle
---@param path string
---@param fileName string
---@return boolean success
function Load(handle, path, fileName) end

--- Saves this object to a file.
---@param path string File system path to the folder
---@param fileName string Name of the file to save
---@return boolean success True if the save succeeded
function MAHandle:Save(path, fileName) end

---@param handle MAHandle
---@param path string
---@param fileName string
---@return boolean success
function Save(handle, path, fileName) end

--------------------------------------------------------------------------------
-- Fader control
--------------------------------------------------------------------------------

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
---@field token? FaderToken Which fader to query (default: FaderMaster)
---@field index? integer Optional fader index

---@class SetFaderOptions
---@field value? number Fader value to set (0-100)
---@field token? FaderToken Which fader to target (default: FaderMaster)
---@field faderEnabled? boolean Enable or disable the fader

--- Returns a float indicating the fader position for this object (0-100).
---
--- Example:
--- ```lua
--- local master = SelectedSequence():GetFader({})
--- local rate   = SelectedSequence():GetFader({token = "FaderRate"})
--- ```
---@param options FaderOptions Table with optional token and index fields
---@return number value Fader position as a float (0-100)
function MAHandle:GetFader(options) end

---@param handle MAHandle
---@param options FaderOptions
---@return number value
function GetFader(handle, options) end

--- Returns a text string representation of the fader value for this object.
---@param options FaderOptions Table with optional token and index fields
---@return string value Fader value as a display text string
function MAHandle:GetFaderText(options) end

---@param handle MAHandle
---@param options FaderOptions
---@return string value
function GetFaderText(handle, options) end

--- Sets a fader on this object to a specified level (0-100).
---
--- Example:
--- ```lua
--- local seq = SelectedSequence()
--- seq:SetFader({value = 100.0})
--- seq:SetFader({value = 50.0, faderEnabled = true, token = "FaderTime"})
--- ```
---@param options SetFaderOptions Table with value (required), token and faderEnabled (optional)
---@return nil
function MAHandle:SetFader(options) end

---@param handle MAHandle
---@param options SetFaderOptions
---@return nil
function SetFader(handle, options) end

--------------------------------------------------------------------------------
-- Command operations
--------------------------------------------------------------------------------

--- Executes this object as a command directed at a destination handle.
---@param destHandle MAHandle Destination handle
---@param focusSearchAllowed? boolean If true, allows focus search (default: true)
---@return nil
function MAHandle:CommandCall(destHandle, focusSearchAllowed) end

---@param handle MAHandle
---@param destHandle MAHandle
---@param focusSearchAllowed? boolean
---@return nil
function CommandCall(handle, destHandle, focusSearchAllowed) end

--- Addresses this object in the command line.
---@return nil
function MAHandle:CommandAt() end

---@param handle MAHandle
---@return nil
function CommandAt(handle) end

--- Deletes this object via the command line.
---@return nil
function MAHandle:CommandDelete() end

---@param handle MAHandle
---@return nil
function CommandDelete(handle) end

--- Stores this object via the command line.
---@return nil
function MAHandle:CommandStore() end

---@param handle MAHandle
---@return nil
function CommandStore(handle) end

--- Creates default values for this object via the command line.
---@return nil
function MAHandle:CommandCreateDefaults() end

---@param handle MAHandle
---@return nil
function CommandCreateDefaults(handle) end

--------------------------------------------------------------------------------
-- Input UI functions
-- Used on input UI elements (text fields, etc.)
--------------------------------------------------------------------------------

--- Sets the title of an input UI element.
---@param name string Title text
---@return nil
function MAHandle:InputSetTitle(name) end

---@param handle MAHandle
---@param name string
---@return nil
function InputSetTitle(handle, name) end

--- Sets the value of an input UI element.
---@param value string Value string
---@return nil
function MAHandle:InputSetValue(value) end

---@param handle MAHandle
---@param value string
---@return nil
function InputSetValue(handle, value) end

--- Sets the edit title of an input UI element.
---@param name string Edit title text
---@return nil
function MAHandle:InputSetEditTitle(name) end

---@param handle MAHandle
---@param name string
---@return nil
function InputSetEditTitle(handle, name) end

--- Sets an additional parameter on an input UI element by name.
---@param paramName string Parameter name
---@param paramValue string Parameter value
---@return nil
function MAHandle:InputSetAdditionalParameter(paramName, paramValue) end

---@param handle MAHandle
---@param paramName string
---@param paramValue string
---@return nil
function InputSetAdditionalParameter(handle, paramName, paramValue) end

--- Triggers the input UI element to run (submit its value).
---@return nil
function MAHandle:InputRun() end

---@param handle MAHandle
---@return nil
function InputRun(handle) end

--- Calls a named function on the input UI element with optional arguments.
---@param functionName string Name of the function to call
---@param ... any Optional arguments
---@return any result Return value depends on the function called
function MAHandle:InputCallFunction(functionName, ...) end

---@param handle MAHandle
---@param functionName string
---@param ... any
---@return any result
function InputCallFunction(handle, functionName, ...) end

--- Returns true if the input UI element has a function with the given name.
---@param functionName string Name of the function to check
---@return true|nil result True if the function exists, nil if not
function MAHandle:InputHasFunction(functionName) end

---@param handle MAHandle
---@param functionName string
---@return true|nil result
function InputHasFunction(handle, functionName) end
