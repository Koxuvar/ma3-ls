---@meta

-- grandMA3 Object-Free Lua API
-- https://help2.malighting.com/Page/grandMA3/lua_object_free_api/en/

--------------------------------------------------------------------------------
-- Object-Free API Functions
--------------------------------------------------------------------------------

--- Adds fixtures to the patch. Must be run with the command line in the correct patch destination.
--- Use Cmd("ChangeDestination ...") to navigate to the correct location before calling this.
---
--- Example:
--- ```lua
--- Cmd('ChangeDestination "ShowData"."Patch"')
--- local t = {}
--- t.mode = Patch().FixtureTypes.Dimmer.DMXModes["Mode 0"]
--- t.amount = 1
--- t.fid = "301"
--- t.name = "MyDimmer"
--- t.patch = {"10.001"}
--- local result = AddFixtures(t)
--- ```
---@param fixtureTable AddFixturesTable Table with fixture data
---@return boolean|nil success Returns true if successful, nil on failure
function AddFixtures(fixtureTable) end

--- Returns a handle to the variable set connected to a specific addon.
---
--- Example:
--- ```lua
--- local vars = AddonVars("MyAddon")
--- ```
---@param addonName string Name of the addon
---@return MAHandle handle Handle to the addon's variable set
function AddonVars(addonName) end

--- Returns a table with key-value pairs describing the current software build.
---
--- Example:
--- ```lua
--- local details = BuildDetails()
--- Printf("Version: " .. details.BigVersion)
--- ```
---@return BuildDetailsTable buildDetails Table of build information
function BuildDetails() end

--- Checks if a specific DMX address range is available or already in use.
--- Uses the number of DMX channels in a specific DMX mode of a fixture type to calculate the range.
---
--- Example:
--- ```lua
--- local available = CheckDMXCollision(dmxModeHandle, "10.001")
--- ```
---@param dmxModeHandle MAHandle Handle to a DMX mode object
---@param address string DMX address string in "universe.channel" format
---@param count? integer Number of channels to check (default: 1)
---@param break_index? integer DMX break index to check (default: 1)
---@return boolean|nil result True if available, nil if collision
function CheckDMXCollision(dmxModeHandle, address, count, break_index) end

--- Checks if a specific FID or CID range is available or already in use.
---
--- Example:
--- ```lua
--- local available = CheckFIDCollision(301, 5) -- check FIDs 301-305
--- ```
---@param id integer The ID to check
---@param count? integer Number of subsequent IDs to check (default: 1)
---@param idtype? integer ID type integer. 0 = Fixture (default)
---@return boolean|nil result True if available, nil if collision
function CheckFIDCollision(id, count, idtype) end

--- Returns a boolean indicating whether the provided string is a valid grandMA3 class name.
---
--- Example:
--- ```lua
--- if ClassExists("Display") then
---   Printf("Display is a valid class")
--- end
--- ```
---@param className string A single word to check as a class name
---@return boolean exists True if the class exists, false if not
function ClassExists(className) end

--- Closes all open overlays (pop-ups and menus) on all displays.
---
--- Example:
--- ```lua
--- CloseAllOverlays()
--- ```
---@return nil
function CloseAllOverlays() end

--- Closes an undo list created by CreateUndo(). Must be called after all operations are complete.
---
--- Example:
--- ```lua
--- local undo = CreateUndo("My Action")
--- -- ... perform operations ...
--- CloseUndo(undo)
--- ```
---@param undoHandle MAHandle Handle to the undo list returned by CreateUndo()
---@return nil
function CloseUndo(undoHandle) end

--- Executes a command in the grandMA3 command line synchronously in the Lua task.
--- Blocks the Lua task until the command completes. A bad command can block the system.
---
--- Example:
--- ```lua
--- local result = Cmd("ClearAll")
--- if result == "OK" then Printf("Command succeeded") end
--- ```
---@param command string The command to execute. Do not add "Please" or Enter.
---@param undoHandle? MAHandle Optional handle to an undo (oops) list
---@param ... any Additional arguments for the command
---@return string result "OK", "Syntax Error", or "Illegal Command"
function Cmd(command, undoHandle, ...) end

--- Executes a command asynchronously in the Main task. Does not block Lua execution.
--- Use when you don't need to wait for the command to finish.
---
--- Example:
--- ```lua
--- CmdIndirect("Go+ Sequence 1")
--- ```
---@param command string The command to execute. Do not add "Please" or Enter.
---@param undoHandle? MAHandle Optional handle to an undo list
---@param callbackHandle? MAHandle Optional handle for callback
---@return nil
function CmdIndirect(command, undoHandle, callbackHandle) end

--- Executes a command synchronously in the Main task. Does not block Lua execution
--- but waits for the command to finish before continuing.
---
--- Example:
--- ```lua
--- CmdIndirectWait("Store Sequence 1 Cue 1")
--- ```
---@param command string The command to execute. Do not add "Please" or Enter.
---@param undoHandle? MAHandle Optional handle to an undo list
---@param callbackHandle? MAHandle Optional handle for callback
---@return nil
function CmdIndirectWait(command, undoHandle, callbackHandle) end

--- Returns a handle to the command line object.
---
--- Example:
--- ```lua
--- local cmdObj = CmdObj()
--- Printf(Dump(cmdObj))
--- ```
---@return MAHandle handle Handle to the command line object
function CmdObj() end

--- Returns a table with configuration information as key-value pairs.
--- Informational only — the table has no callable functions.
---
--- Example:
--- ```lua
--- local cfg = ConfigTable()
--- for k, v in pairs(cfg) do Printf(k .. " = " .. tostring(v)) end
--- ```
---@return table config Key-value configuration table
function ConfigTable() end

--- Opens a confirmation pop-up dialog with Yes/No options. Blocks until the user responds.
---
--- Example:
--- ```lua
--- local confirmed = Confirm("Are you sure?", "This will clear all", nil, true)
--- ```
---@param title string Title text for the pop-up
---@param message? string Body text for the pop-up
---@param screen? integer Screen index (currently unused, can be nil)
---@param defaultYes? boolean If true, Yes is the default button
---@return boolean result True if user confirmed, false if denied
function Confirm(title, message, screen, defaultYes) end

--- Creates multi-patch fixtures for a table of fixture handles.
---
--- Example:
--- ```lua
--- local fixtures = { handle1, handle2 }
--- CreateMultiPatch(fixtures, 2, "My multi patch")
--- ```
---@param handles MAHandle[] Table of fixture handles to apply multi-patch to
---@param count integer Number of multi patch fixtures to create
---@param undoText? string Optional undo label text
---@return integer|nil result Number of created multi patches, or nil on failure
function CreateMultiPatch(handles, count, undoText) end

--- Creates a new undo (oops) group. All operations using the returned handle are grouped together.
--- Must be closed with CloseUndo() when done.
---
--- Example:
--- ```lua
--- local undo = CreateUndo("Batch store cues")
--- Cmd("Store Cue 1", undo)
--- Cmd("Store Cue 2", undo)
--- CloseUndo(undo)
--- ```
---@param label string Text label identifying this undo group
---@return MAHandle undoHandle Handle to the undo list
function CreateUndo(label) end

--- Returns a handle to the current user's selected environment.
---
--- Example:
--- ```lua
--- local env = CurrentEnvironment()
--- Printf(Dump(env))
--- ```
---@return MAHandle handle Handle to the current environment
function CurrentEnvironment() end

--- Returns a handle to the current user's selected executor page.
---
--- Example:
--- ```lua
--- local page = CurrentExecPage()
--- Printf(Dump(page))
--- ```
---@return MAHandle handle Handle to the current executor page
function CurrentExecPage() end

--- Returns a handle to the current user's profile.
---
--- Example:
--- ```lua
--- local profile = CurrentProfile()
--- Printf(Dump(profile))
--- ```
---@return MAHandle handle Handle to the current user profile
function CurrentProfile() end

--- Returns a handle to the current user's screen configuration.
---
--- Example:
--- ```lua
--- local screenCfg = CurrentScreenConfig()
--- Printf(Dump(screenCfg))
--- ```
---@return MAHandle handle Handle to the current screen configuration
function CurrentScreenConfig() end

--- Returns a handle to the current user object.
---
--- Example:
--- ```lua
--- local user = CurrentUser()
--- Printf(Dump(user))
--- ```
---@return MAHandle handle Handle to the current user
function CurrentUser() end

--- Returns a handle to the data pool object.
---
--- Example:
--- ```lua
--- local pool = DataPool()
--- Printf(Dump(pool))
--- ```
---@return MAHandle handle Handle to the data pool
function DataPool() end

--- Returns a handle to the default display positions object.
---
--- Example:
--- ```lua
--- local ddp = DefaultDisplayPositions()
--- Printf(Dump(ddp))
--- ```
---@return MAHandle handle Handle to default display positions
function DefaultDisplayPositions() end

--- Deletes a variable from a variable set.
---
--- Example:
--- ```lua
--- local vars = UserVars()
--- DelVar(vars, "myVar")
--- ```
---@param varSetHandle MAHandle Handle to the variable set
---@param varName string Name of the variable to delete
---@return nil
function DelVar(varSetHandle, varName) end

--- Returns a boolean indicating whether the desk is currently locked.
---
--- Example:
--- ```lua
--- if DeskLocked() then Printf("Desk is locked") end
--- ```
---@return boolean locked True if the desk is locked
function DeskLocked() end

--- Returns a handle to the device configuration object.
---
--- Example:
--- ```lua
--- local cfg = DeviceConfiguration()
--- Printf(Dump(cfg))
--- ```
---@return MAHandle handle Handle to the device configuration
function DeviceConfiguration() end

--- Returns a table of files at a specified path, with optional filter.
---
--- Example:
--- ```lua
--- local files = DirList("/media/", "*.xml")
--- for _, f in ipairs(files) do Printf(f.name) end
--- ```
---@param path string The directory path to list
---@param filter? string Optional filter string. Supports * as wildcard e.g. "*.xml"
---@return DirListEntry[] files Table of file entries with name, size, and time fields
function DirList(path, filter) end

--- Draws a red pointer on the specified display at the given position.
--- Only one pointer can be shown per display at a time.
---
--- Example:
--- ```lua
--- DrawPointer(1, {x=500, y=300}, 5000) -- draw on display 1 for 5 seconds
--- ```
---@param displayIndex integer Index of the display to draw on
---@param position PositionTable Table with x and y keys for the position
---@param duration? integer Duration in milliseconds. Fades out after. Stays visible if omitted.
---@return nil
function DrawPointer(displayIndex, position, duration) end

--- Prints a list of all currently active hooks to the command line history.
---
--- Example:
--- ```lua
--- DumpAllHooks()
--- ```
---@return nil
function DumpAllHooks() end

--- Prints a string to the Command Line History without a newline.
---
--- Example:
--- ```lua
--- Echo("Hello ")
--- Echo("World")
--- ```
---@param message string The string to print
---@return nil
function Echo(message) end

--- Prints a string to the error output in the Command Line History.
---
--- Example:
--- ```lua
--- ErrEcho("Something went wrong")
--- ```
---@param message string The error string to print
---@return nil
function ErrEcho(message) end

--- Prints a formatted error string to the Command Line History. Supports printf-style formatting.
---
--- Example:
--- ```lua
--- ErrPrintf("Error in cue %d: %s", cueNumber, errorMsg)
--- ```
---@param format string Printf-style format string
---@param ... any Format arguments
---@return nil
function ErrPrintf(format, ...) end

--- Exports a Lua table to an XML file. Correlates with Import().
---
--- Example:
--- ```lua
--- local data = {name = "Test", value = 42}
--- Export("/media/usb/mydata.xml", data)
--- ```
---@param filename string Full path and filename for the exported file
---@param data table The Lua table to export
---@return boolean success True if export succeeded, false if it failed
function Export(filename, data) end

--- Exports a Lua table to a CSV file.
---
--- Example:
--- ```lua
--- ExportCSV("/media/usb/mydata.csv", myTable)
--- ```
---@param filename string Full path and filename for the exported file
---@param data table The Lua table to export
---@return boolean success True if export succeeded, false if it failed
function ExportCSV(filename, data) end

--- Exports a Lua table to a JSON file.
---
--- Example:
--- ```lua
--- ExportJson("/media/usb/mydata.json", myTable)
--- ```
---@param filename string Full path and filename for the exported file
---@param data table The Lua table to export
---@return boolean success True if export succeeded, false if it failed
function ExportJson(filename, data) end

--- Returns a boolean indicating whether a file exists at the specified path.
---
--- Example:
--- ```lua
--- if FileExists("/media/usb/show.xml") then
---   Printf("File found")
--- end
--- ```
---@param path string Full file path to check
---@return boolean exists True if the file exists
function FileExists(path) end

--- Returns a handle to a texture object by name.
---
--- Example:
--- ```lua
--- local tex = FindTexture("MyTexture")
--- ```
---@param name string Name of the texture
---@return MAHandle|nil handle Handle to the texture, or nil if not found
function FindTexture(name) end

--- Returns a handle to the first fixture that uses the specified DMX mode.
---
--- Example:
--- ```lua
--- local fixture = FirstDmxModeFixture(dmxModeHandle)
--- ```
---@param dmxModeHandle MAHandle Handle to a DMX mode object
---@return MAHandle|nil handle Handle to the first matching fixture, or nil
function FirstDmxModeFixture(dmxModeHandle) end

--- Returns a handle to the fixture type pool object.
---
--- Example:
--- ```lua
--- local ft = FixtureType()
--- Printf(Dump(ft))
--- ```
---@return MAHandle handle Handle to the fixture type pool
function FixtureType() end

--- Converts a numbered or named address string into a handle.
---
--- Example:
--- ```lua
--- local handle = FromAddr("14.14.1.6.1")
--- local handle2 = FromAddr("Sequences.Default", DataPool())
--- ```
---@param address string A numbered or named address string
---@param baseHandle? MAHandle Optional base handle. Defaults to root.
---@return MAHandle handle Handle to the addressed object
function FromAddr(address, baseHandle) end

--- Returns a table describing all object-free Lua API functions.
--- Informational only.
---
--- Example:
--- ```lua
--- local api = GetApiDescriptor()
--- ```
---@return table descriptor Table of API function descriptions
function GetApiDescriptor() end

--- Returns a handle to the attribute connected to a specific UI Channel index.
---
--- Example:
--- ```lua
--- local attr = GetAttributeByUIChannel(1)
--- ```
---@param uiChannelIndex integer The UI channel index from the Parameter List
---@return MAHandle handle Handle to the attribute
function GetAttributeByUIChannel(uiChannelIndex) end

--- Returns the total number of attribute definitions in the show.
---
--- Example:
--- ```lua
--- Printf("Attributes: " .. GetAttributeCount())
--- ```
---@return integer count Total number of attribute definitions
function GetAttributeCount() end

--- Returns the 0-based index of an attribute definition by its system name.
---
--- Example:
--- ```lua
--- local idx = GetAttributeIndex("Dimmer")
--- ```
---@param systemName string The attribute system name
---@return integer index 0-based index of the attribute
function GetAttributeIndex(systemName) end

--- Returns a key-value table of button states for an MA3 hardware module.
--- Each key (1-512) maps to a boolean: true means the button is pressed or fader is touched.
---
--- Example:
--- ```lua
--- local states = GetButton(moduleHandle)
--- if states[1] then Printf("Button 1 is pressed") end
--- ```
---@param moduleHandle MAHandle Handle to the MA3 module
---@return table<integer, boolean> states Table of 512 button states
function GetButton(moduleHandle) end

--- Returns a handle to a channel function based on UI channel and attribute indexes.
---
--- Example:
--- ```lua
--- local cf = GetChannelFunction(uiIndex, attrIndex)
--- ```
---@param uiChannelIndex integer UI channel index from the Parameter List
---@param attributeIndex integer Attribute index (0-based)
---@return MAHandle handle Handle to the channel function
function GetChannelFunction(uiChannelIndex, attributeIndex) end

--- Returns the integer index matching a channel function based on UI channel and attribute indexes.
---
--- Example:
--- ```lua
--- local idx = GetChannelFunctionIndex(uiIndex, attrIndex)
--- ```
---@param uiChannelIndex integer UI channel index from the Parameter List
---@param attributeIndex integer Attribute index (0-based)
---@return integer index Index of the channel function
function GetChannelFunctionIndex(uiChannelIndex, attributeIndex) end

--- Returns the derivation level index for a class by name.
---
--- Example:
--- ```lua
--- local level = GetClassDerivationLevel("Pool")
--- ```
---@param className string Name of the class
---@return integer level Derivation level index
function GetClassDerivationLevel(className) end

--- Returns a handle to the last activated cue in the selected sequence.
---
--- Example:
--- ```lua
--- local cue = GetCurrentCue()
--- Printf(Dump(cue))
--- ```
---@return MAHandle handle Handle to the current cue
function GetCurrentCue() end

--- Returns a float number indicating the current frames per second.
---
--- Example:
--- ```lua
--- Printf("FPS: " .. GetDebugFPS())
--- ```
---@return number fps Current frames per second
function GetDebugFPS() end

--- Returns a handle to the display object matching the provided index.
---
--- Example:
--- ```lua
--- local display = GetDisplayByIndex(1)
--- ```
---@param index integer Display index number
---@return MAHandle handle Handle to the display object
function GetDisplayByIndex(index) end

--- Returns a handle to the DisplayCollect object.
---
--- Example:
--- ```lua
--- local dc = GetDisplayCollect()
--- Printf(Dump(dc))
--- ```
---@return MAHandle handle Handle to the DisplayCollect
function GetDisplayCollect() end

--- Returns a table of all 512 DMX channel values for a universe.
---
--- Example:
--- ```lua
--- local universe = GetDMXUniverse(1, false) -- DMX values 0-255
--- Printf("Channel 1: " .. universe[1])
--- ```
---@param universe integer Universe number (1-1024)
---@param asPercent? boolean If true returns values 0-100, if false returns values 0-255
---@return table<integer,number>|nil values Table of 512 channel values, or nil if universe unavailable
function GetDMXUniverse(universe, asPercent) end

--- Returns the DMX value of a specific DMX address.
---
--- Example:
--- ```lua
--- local val = GetDMXValue(1, 1, false) -- address 1 in universe 1, as DMX value
--- ```
---@param address integer DMX address (1-512 if universe provided, 1-524288 if absolute)
---@param universe? integer Universe number
---@param asPercent? boolean If true returns 0-100, if false returns 0-255
---@return number value DMX value at the address
function GetDMXValue(address, universe, asPercent) end

--- Returns handles to both the executor and the page for a given executor number.
---
--- Example:
--- ```lua
--- local exec, page = GetExecutor(201)
--- Printf("Executor: " .. Dump(exec))
--- ```
---@param executorNumber integer The executor number
---@return MAHandle executorHandle Handle to the executor
---@return MAHandle pageHandle Handle to the executor page
function GetExecutor(executorNumber) end

--- Returns a handle to the UI object that currently has focus.
---
--- Example:
--- ```lua
--- local focused = GetFocus()
--- ```
---@return MAHandle handle Handle to the focused UI object
function GetFocus() end

--- Returns a handle to the display object that currently has focus.
---
--- Example:
--- ```lua
--- local display = GetFocusDisplay()
--- ```
---@return MAHandle handle Handle to the focused display
function GetFocusDisplay() end

--- Returns a table describing all object API Lua functions.
--- Informational only.
---
--- Example:
--- ```lua
--- local api = GetObjApiDescriptor()
--- ```
---@return table descriptor Table of object API function descriptions
function GetObjApiDescriptor() end

--- Returns the file system path for a named grandMA3 folder.
--- Can take a string folder name or an integer path identifier.
---
--- Example:
--- ```lua
--- local path = GetPath("showfiles", true) -- creates folder if missing
--- ```
---@param nameOrIndex string|integer Folder name string or integer path ID
---@param createIfMissing? boolean If true, creates the folder if it doesn't exist (only with string)
---@return string path The file system path string
function GetPath(nameOrIndex, createIfMissing) end

--- Returns the path of a grandMA3 folder, with optional override for removable drives.
---
--- Example:
--- ```lua
--- local path = GetPathOverrideFor("showfiles", "/media/usb/")
--- ```
---@param nameOrIndex string|integer Folder name string or integer path ID
---@param basePath string The base path string (e.g. a USB drive path)
---@param createIfMissing? boolean If true, creates the folder if it doesn't exist
---@return string path The resolved path string
function GetPathOverrideFor(nameOrIndex, basePath, createIfMissing) end

--- Returns the path separator character for the current operating system.
---
--- Example:
--- ```lua
--- local sep = GetPathSeparator() -- "\" on Windows, "/" on Linux/Mac
--- ```
---@return string separator Single character path separator
function GetPathSeparator() end

--- Returns a string describing the path type for a given handle.
--- Useful when importing objects.
---
--- Example:
--- ```lua
--- local pathType = GetPathType(myHandle)
--- ```
---@param handle MAHandle Handle to the object
---@param mode? integer Optional integer to specify user path type format
---@return string pathType The path type name string
function GetPathType(handle, mode) end

--- Returns a table with information about an RT channel by index.
---
--- Example:
--- ```lua
--- local rtCh = GetRTChannel(1)
--- ```
---@param index integer Index number of the RT channel
---@return GetRTChannelResult channel Table with fixture, subfixture, and dmx_channel handles
function GetRTChannel(index) end

--- Returns a table with preset data for a given preset handle.
---
--- Example:
--- ```lua
--- local data = GetPresetData(presetHandle)
--- ```
---@param presetHandle MAHandle Handle to the preset
---@param includeEmptyValues? boolean Whether to include empty values
---@param resolvePresets? boolean Whether to resolve nested presets
---@return table presetData Complex nested table of preset data
function GetPresetData(presetHandle, includeEmptyValues, resolvePresets) end

--- Returns the total number of RT channels in the show.
---
--- Example:
--- ```lua
--- Printf("RT channels: " .. GetRTChannelCount())
--- ```
---@return integer count Total number of RT channels
function GetRTChannelCount() end

--- Returns a table of RT channel indexes or handles for a fixture.
--- Accepts either a subfixture patch index or a handle.
---
--- Example:
--- ```lua
--- local channels = GetRTChannels(1, true) -- returns handles for subfixture index 1
--- ```
---@param indexOrHandle integer|MAHandle Subfixture patch index or fixture handle
---@param returnHandles? boolean If true returns handles, if false returns indexes
---@return table channels Table of RT channel indexes or handles
function GetRTChannels(indexOrHandle, returnHandles) end

--- Returns a float representing a system resource usage percentage.
---
--- Example:
--- ```lua
--- Printf("CPU: " .. GetSample("CPU") .. "%")
--- ```
---@param sampleKey SampleKey The resource to sample
---@return number value Usage percentage as a float
function GetSample(sampleKey) end

--- Returns a handle to the screen content based on a screen configuration handle.
---
--- Example:
--- ```lua
--- local content = GetScreenContent(CurrentScreenConfig())
--- ```
---@param screenConfigHandle MAHandle Handle to a screen configuration
---@return MAHandle handle Handle to the screen content
function GetScreenContent(screenConfigHandle) end

--- Returns a handle to the currently selected attribute.
---
--- Example:
--- ```lua
--- local attr = GetSelectedAttribute()
--- ```
---@return MAHandle handle Handle to the selected attribute
function GetSelectedAttribute() end

--- Returns a string describing the current show file status.
---
--- Example:
--- ```lua
--- local status = GetShowFileStatus()
--- if status == "ShowLoaded" then Printf("Show is loaded") end
--- ```
---@return ShowFileStatus status The current show file status string
function GetShowFileStatus() end

--- Returns a handle to the fixture at the specified patch index (subfixtureindex).
---
--- Example:
--- ```lua
--- local fixture = GetSubfixture(0) -- first fixture in patch
--- ```
---@param patchIndex integer The 0-based patch index of the fixture
---@return MAHandle handle Handle to the fixture
function GetSubfixture(patchIndex) end

--- Returns the total number of patched fixtures across all stages in the show.
---
--- Example:
--- ```lua
--- Printf("Total fixtures: " .. GetSubfixtureCount())
--- ```
---@return integer count Total number of patched fixtures
function GetSubfixtureCount() end

--- Returns the full keyword string for a given short keyword abbreviation.
--- Returns nil if no corresponding keyword exists.
---
--- Example:
--- ```lua
--- local full = GetTokenName("Seq") -- returns "Sequence"
--- ```
---@param shortToken string Short version of a keyword
---@return string|nil keyword Full keyword string, or nil if not found
function GetTokenName(shortToken) end

--- Returns the keyword string for a given keyword index number.
---
--- Example:
--- ```lua
--- local name = GetTokenNameByIndex(5)
--- ```
---@param index integer Index number of the keyword
---@return string|nil keyword Keyword string, or nil if not found
function GetTokenNameByIndex(index) end

--- Returns a handle to the modal (blocking pop-up) at the top of the UI stack.
---
--- Example:
--- ```lua
--- local modal = GetTopModal()
--- if modal then Printf("Modal is open") end
--- ```
---@return MAHandle|nil handle Handle to the top modal, or nil if none
function GetTopModal() end

--- Returns a handle to the overlay (pop-up/menu) at the top of the display stack.
---
--- Example:
--- ```lua
--- local overlay = GetTopOverlay()
--- ```
---@return MAHandle|nil handle Handle to the top overlay, or nil if none
function GetTopOverlay() end

--- Returns the total number of UI channels in the show.
---
--- Example:
--- ```lua
--- Printf("UI channels: " .. GetUIChannelCount())
--- ```
---@return integer count Total number of UI channels
function GetUIChannelCount() end

--- Returns the UI channel index for a fixture and attribute combination.
---
--- Example:
--- ```lua
--- local idx = GetUIChannelIndex(patchIndex, attrIndex)
--- ```
---@param patchIndex integer Patch index of the fixture
---@param attributeIndex integer Attribute index (0-based)
---@return integer index UI channel index
function GetUIChannelIndex(patchIndex, attributeIndex) end

--- Returns a table of UI channel indexes or handles for a fixture.
--- Accepts either a subfixture patch index or a handle.
---
--- Example:
--- ```lua
--- local channels = GetUIChannels(1, true) -- returns handles for subfixture index 1
--- ```
---@param indexOrHandle integer|MAHandle Subfixture patch index or fixture handle
---@param returnHandles? boolean If true returns handles, if false returns indexes
---@return table channels Table of UI channel indexes or handles
function GetUIChannels(indexOrHandle, returnHandles) end

--- Returns a handle to the UI object at a specified position on a display.
---
--- Example:
--- ```lua
--- local obj = GetUIObjectAtPosition(1, {x = 200, y = 300})
--- ```
---@param displayIndex integer Display index number
---@param position PositionTable Table with x and y keys
---@return MAHandle|nil handle Handle to the UI object at the position, or nil
function GetUIObjectAtPosition(displayIndex, position) end

--- Returns the value of a named variable from a variable set.
---
--- Example:
--- ```lua
--- local val = GetVar(UserVars(), "myVar")
--- ```
---@param varSetHandle MAHandle Handle to the variable set
---@param varName string Name of the variable
---@return any value The variable's value, or nil if it doesn't exist
function GetVar(varSetHandle, varName) end

--- Returns a handle to the global variables set.
---
--- Example:
--- ```lua
--- local g = GlobalVars()
--- SetVar(g, "myGlobal", 42)
--- ```
---@return MAHandle handle Handle to the global variable set
function GlobalVars() end

--- Converts a handle into an integer.
---
--- Example:
--- ```lua
--- local int = HandleToInt(SelectedSequence())
--- Printf("Handle as int: " .. int)
--- ```
---@param handle MAHandle The handle to convert
---@return integer result The handle as an integer
function HandleToInt(handle) end

--- Converts a handle into a hexadecimal string.
---
--- Example:
--- ```lua
--- local str = HandleToStr(SelectedSequence())
--- Printf("Handle as hex: " .. str)
--- ```
---@param handle MAHandle The handle to convert
---@return string result The handle as a hexadecimal string
function HandleToStr(handle) end

--- Registers a callback function that fires when a grandMA3 object changes.
--- Returns an integer hook ID that can be used with Unhook().
---
--- Example:
--- ```lua
--- local function onChange(hookId, obj) Printf("Object changed") end
--- local id = HookObjectChange(onChange, SelectedSequence(), Root())
--- ```
---@param callback function Function to call when the object changes
---@param watchHandle MAHandle Handle to the object to watch for changes
---@param rootHandle MAHandle Root handle context
---@param filterHandle? MAHandle Optional handle to filter which changes trigger the callback
---@return integer hookId Integer ID for this hook, used with Unhook()
function HookObjectChange(callback, watchHandle, rootHandle, filterHandle) end

--- Returns a string with the operating system of the device running the plugin.
--- Possible values include "Windows", "Linux", "Mac".
---
--- Example:
--- ```lua
--- Printf("OS: " .. HostOS())
--- ```
---@return string os Operating system name string
function HostOS() end

--- Returns a string with the host sub-type of the station.
--- Possible values include "FullSize", "Light", "RPU", "onPCRackUnit", "Undefined".
---
--- Example:
--- ```lua
--- Printf("Sub-type: " .. HostSubType())
--- ```
---@return string subType Host sub-type string
function HostSubType() end

--- Returns a string with the host type of the device.
--- Possible values include "Console" or "onPC".
---
--- Example:
--- ```lua
--- Printf("Host type: " .. HostType())
--- ```
---@return string hostType Host type string
function HostType() end

--- Imports a Lua table from an XML file. Correlates with Export().
---
--- Example:
--- ```lua
--- local data = Import("/media/usb/mydata.xml")
--- ```
---@param filename string Full path and filename of the file to import
---@return table data The imported Lua table
function Import(filename) end

--- Increments the progress bar value by a given integer amount.
--- The progress bar must exist (created with StartProgress).
---
--- Example:
--- ```lua
--- local bar = StartProgress("Loading")
--- SetProgressRange(bar, 0, 100)
--- IncProgress(bar, 10)
--- ```
---@param progressHandle MAHandle Handle to the progress bar from StartProgress()
---@param increment integer Amount to increment the progress value
---@return nil
function IncProgress(progressHandle, increment) end

--- Converts an integer into a handle. The integer must correspond to a valid handle.
---
--- Example:
--- ```lua
--- local handle = IntToHandle(12345)
--- ```
---@param integer integer The integer to convert
---@return MAHandle handle The corresponding handle
function IntToHandle(integer) end

--- Returns a boolean indicating if one class is derived from another.
---
--- Example:
--- ```lua
--- if IsClassDerivedFrom("Sequence", "Pool") then Printf("Yes") end
--- ```
---@param childClass string The class that might be derived
---@param parentClass string The potential base class
---@return boolean result True if childClass is derived from parentClass
function IsClassDerivedFrom(childClass, parentClass) end

--- Returns true if the supplied handle is a valid grandMA3 object, or nil if not.
---
--- Example:
--- ```lua
--- if IsObjectValid(someHandle) then Printf("Valid object") end
--- ```
---@param handle MAHandle The handle to validate
---@return boolean|nil valid True if valid, nil if not
function IsObjectValid(handle) end

--- Returns a handle to the first found keyboard object.
---
--- Example:
--- ```lua
--- local kb = KeyboardObj()
--- Printf(Dump(kb))
--- ```
---@return MAHandle handle Handle to the keyboard object
function KeyboardObj() end

--- Returns a handle to the masters pool.
---
--- Example:
--- ```lua
--- local masters = MasterPool()
--- Printf(Dump(masters))
--- ```
---@return MAHandle handle Handle to the master pool
function MasterPool() end

--- Creates a pop-up message box. Can be simple or complex with multiple input options.
--- Elements in the message box are displayed in alphabetical order.
---
--- Example:
--- ```lua
--- local result = MessageBox({
---   title = "Warning",
---   body = "This will delete everything",
---   buttons = {
---     { label = "OK", value = 1 },
---     { label = "Cancel", value = 0 }
---   }
--- })
--- ```
---@param options table Key-value table defining the message box content and buttons
---@return any result The value associated with the button the user pressed
function MessageBox(options) end

--- Returns a handle to the first found mouse object.
---
--- Example:
--- ```lua
--- local mouse = MouseObj()
--- Printf(Dump(mouse))
--- ```
---@return MAHandle handle Handle to the mouse object
function MouseObj() end

--- Returns a boolean indicating if there are unsaved changes to the show file.
---
--- Example:
--- ```lua
--- if NeedShowSave() then Printf("Unsaved changes exist") end
--- ```
---@return boolean unsaved True if there are unsaved changes
function NeedShowSave() end

--- Returns a table of handles based on a command string selection.
--- The string must be a valid command that produces a range of objects in the command line.
---
--- Example:
--- ```lua
--- local cues = ObjectList("Sequence 1 Cue 1 Thru 10")
--- for _, cue in ipairs(cues) do Printf(cue:Addr()) end
--- ```
---@param command string A command string that produces a range of objects
---@param options? ObjectListOptions Optional table with reverse_order and selected_as_default keys
---@return MAHandle[] handles Table of handles matching the selection
function ObjectList(command, options) end

--- Returns a handle to the patch object.
---
--- Example:
--- ```lua
--- local patch = Patch()
--- Printf(Dump(patch))
--- ```
---@return MAHandle handle Handle to the patch object
function Patch() end

--- Prints a formatted string to the Command Line History and System Monitor.
--- Supports printf-style format specifiers.
---
--- Example:
--- ```lua
--- Printf("Cue %d fired at %.2f seconds", cueNum, Time())
--- ```
---@param format string Printf-style format string
---@param ... any Format arguments
---@return nil
function Printf(format, ...) end

--- Returns a handle to the current programmer object.
---
--- Example:
--- ```lua
--- local prog = Programmer()
--- Printf(Dump(prog))
--- ```
---@return MAHandle handle Handle to the programmer
function Programmer() end

--- Returns a handle to the current programmer part object.
---
--- Example:
--- ```lua
--- local part = ProgrammerPart()
--- Printf(Dump(part))
--- ```
---@return MAHandle handle Handle to the programmer part
function ProgrammerPart() end

--- Returns a handle to the Pult object at Root/GraphicsRoot/PultCollect.
--- The Pult object contains display and device information.
---
--- Example:
--- ```lua
--- local pult = Pult()
--- Printf(Dump(pult))
--- ```
---@return MAHandle handle Handle to the Pult object
function Pult() end

--- Returns a string with the release type of the MA software.
--- Production software returns "Release". Development builds may return other values.
---
--- Example:
--- ```lua
--- Printf("Release type: " .. ReleaseType())
--- ```
---@return string releaseType Release type string
function ReleaseType() end

--- Returns a handle to the root object of the show data hierarchy.
---
--- Example:
--- ```lua
--- local root = Root()
--- Printf(Dump(root))
--- ```
---@return MAHandle handle Handle to the root object
function Root() end

--- Returns a handle to the currently selected feature.
---
--- Example:
--- ```lua
--- local feature = SelectedFeature()
--- Printf(Dump(feature))
--- ```
---@return MAHandle handle Handle to the selected feature
function SelectedFeature() end

--- Returns a handle to the currently selected layout.
--- Layouts are 2D drafts for arranging fixtures and pool objects.
---
--- Example:
--- ```lua
--- local layout = SelectedLayout()
--- Printf(Dump(layout))
--- ```
---@return MAHandle handle Handle to the selected layout
function SelectedLayout() end

--- Returns a handle to the currently selected sequence.
---
--- Example:
--- ```lua
--- local seq = SelectedSequence()
--- Printf("Selected: " .. seq:Name())
--- ```
---@return MAHandle handle Handle to the selected sequence
function SelectedSequence() end

--- Returns a handle to the currently selected timecode show object.
---
--- Example:
--- ```lua
--- local tc = SelectedTimecode()
--- ```
---@return MAHandle handle Handle to the selected timecode object
function SelectedTimecode() end

--- Returns a handle to the currently selected timer object.
---
--- Example:
--- ```lua
--- local timer = SelectedTimer()
--- ```
---@return MAHandle handle Handle to the selected timer
function SelectedTimer() end

--- Returns a handle to the object holding the current fixture selection.
---
--- Example:
--- ```lua
--- local sel = Selection()
--- Printf(Dump(sel))
--- ```
---@return MAHandle handle Handle to the selection object
function Selection() end

--- Returns the number of currently selected fixtures. Returns 0 if no selection.
---
--- Example:
--- ```lua
--- Printf("Selected: " .. SelectionCount() .. " fixtures")
--- ```
---@return integer count Number of selected fixtures
function SelectionCount() end

--- Returns four integers for the first fixture in the current selection.
--- Returns patch index (0-based) and XYZ grid position values.
--- Not all four return values need to be used.
---
--- Example:
--- ```lua
--- local idx, x, y, z = SelectionFirst()
--- Printf("First fixture patch index: " .. idx)
--- ```
---@return integer patchIndex 0-based patch index of the first fixture
---@return integer x X position in the selection grid (0-based)
---@return integer y Y position in the selection grid (0-based)
---@return integer z Z position in the selection grid (0-based)
function SelectionFirst() end

--- Returns four integers for the next fixture in the selection after the given index.
--- Returns patch index (0-based) and XYZ grid position values.
---
--- Example:
--- ```lua
--- local idx, x, y, z = SelectionFirst()
--- while idx do
---   Printf("Fixture: " .. idx)
---   idx, x, y, z = SelectionNext(idx)
--- end
--- ```
---@param currentIndex integer Current patch index to find the next fixture after
---@return integer|nil patchIndex 0-based patch index of the next fixture, or nil if end of selection
---@return integer x X position in the selection grid
---@return integer y Y position in the selection grid
---@return integer z Z position in the selection grid
function SelectionNext(currentIndex) end

--- Returns the serial number of the grandMA3 hardware or onPC.
---
--- Example:
--- ```lua
--- Printf("Serial: " .. SerialNumber())
--- ```
---@return string serialNumber Serial number string
function SerialNumber() end

--- Enables or disables blocking of user input on the desk.
---
--- Example:
--- ```lua
--- SetBlockInput(true)  -- block input
--- SetBlockInput(false) -- unblock input
--- ```
---@param blocked boolean True to block input, false to unblock
---@return nil
function SetBlockInput(blocked) end

--- Sends LED brightness values to an MA3 hardware module.
--- The system resets LED values to defaults after approximately 2 seconds.
--- Do not set values above the documented maximum.
---
--- Example:
--- ```lua
--- SetLED(moduleHandle, {[1] = 100, [2] = 0})
--- ```
---@param moduleHandle MAHandle Handle to the MA3 module
---@param values table Key-value table of LED index to brightness value
---@return nil
function SetLED(moduleHandle, values) end

--- Sets the progress bar to a specific value within its range.
--- The progress bar must exist (created with StartProgress).
---
--- Example:
--- ```lua
--- local bar = StartProgress("Processing")
--- SetProgressRange(bar, 0, 100)
--- SetProgress(bar, 50)
--- ```
---@param progressHandle MAHandle Handle to the progress bar
---@param value integer Value to set within the progress range
---@return nil
function SetProgress(progressHandle, value) end

--- Sets the range for a progress bar. The progress bar must exist.
---
--- Example:
--- ```lua
--- local bar = StartProgress("Loading")
--- SetProgressRange(bar, 0, 100)
--- ```
---@param progressHandle MAHandle Handle to the progress bar
---@param min integer Minimum value of the range
---@param max integer Maximum value of the range
---@return nil
function SetProgressRange(progressHandle, min, max) end

--- Sets additional text displayed next to the title in a progress bar.
--- The title cannot be changed after creation, but this text can be updated dynamically.
---
--- Example:
--- ```lua
--- SetProgressText(bar, "Step 3 of 10")
--- ```
---@param progressHandle MAHandle Handle to the progress bar
---@param text string The text to display next to the title
---@return nil
function SetProgressText(progressHandle, text) end

--- Sets a variable in a variable set. Creates the variable if it doesn't exist.
---
--- Example:
--- ```lua
--- SetVar(UserVars(), "myVar", 42)
--- SetVar(UserVars(), "myString", "hello")
--- ```
---@param varSetHandle MAHandle Handle to the variable set
---@param varName string Name of the variable
---@param value any The value to set
---@return nil
function SetVar(varSetHandle, varName, value) end

--- Returns a handle to the ShowData object at Root/ShowData.
---
--- Example:
--- ```lua
--- local sd = ShowData()
--- Printf(Dump(sd))
--- ```
---@return MAHandle handle Handle to the ShowData object
function ShowData() end

--- Returns a handle to the ShowSettings object at Root/ShowData/ShowSettings.
---
--- Example:
--- ```lua
--- local settings = ShowSettings()
--- Printf(Dump(settings))
--- ```
---@return MAHandle handle Handle to the ShowSettings object
function ShowSettings() end

--- Creates and displays a progress bar on all screens. Returns a handle to interact with it.
--- The bar stays visible until StopProgress() is called.
---
--- Example:
--- ```lua
--- local bar = StartProgress("Exporting cues")
--- SetProgressRange(bar, 0, 100)
--- SetProgress(bar, 50)
--- StopProgress(bar)
--- ```
---@param title string Title text displayed on the progress bar
---@return MAHandle progressHandle Handle to the progress bar
function StartProgress(title) end

--- Removes a progress bar from the screen. The bar must exist.
---
--- Example:
--- ```lua
--- local bar = StartProgress("Working")
--- -- ... do work ...
--- StopProgress(bar)
--- ```
---@param progressHandle MAHandle Handle to the progress bar from StartProgress()
---@return nil
function StopProgress(progressHandle) end

--- Converts a hexadecimal string into a handle. The string must correspond to a valid handle.
---
--- Example:
--- ```lua
--- local handle = StrToHandle("0x00001234")
--- ```
---@param hexString string Handle in hexadecimal string format
---@return MAHandle handle The corresponding handle
function StrToHandle(hexString) end

--- Opens a text input pop-up and returns the typed string. Blocks until the user confirms.
---
--- Example:
--- ```lua
--- local name = TextInput("Enter name", "Default Name")
--- if name then Printf("Got: " .. name) end
--- ```
---@param title? string Title for the pop-up (prefixed with "Edit" by default)
---@param defaultText? string Pre-filled text in the input field
---@param screen? integer Screen index (currently unused)
---@param maxLength? integer Maximum character length for input
---@return string|nil input The text entered by the user, or nil if cancelled
function TextInput(title, defaultText, screen, maxLength) end

--- Returns the time in seconds since the grandMA3 application started.
--- This is an uptime counter, not the current time of day.
---
--- Example:
--- ```lua
--- local uptime = Time()
--- Printf("Station has been on for " .. uptime .. " seconds")
--- ```
---@return number uptime Station uptime in seconds as a float
function Time() end

--- Calls a function repeatedly using a timer interval.
---
--- Example:
--- ```lua
--- local function tick() Printf("Tick!") end
--- Timer(tick, 1, 10) -- call tick every 1 second, 10 times
--- ```
---@param callback function Function to call on each tick
---@param interval integer Wait time between calls in seconds
---@param count integer Number of times to call the function
---@param onFinish? function Optional function called when the timer completes
---@param contextHandle? MAHandle Optional handle to an object passed to the callback
---@return nil
function Timer(callback, interval, count, onFinish, contextHandle) end

--- Converts a handle to an address string. Object-free version.
--- See also MAHandle:ToAddr() for the object method version.
---
--- Example:
--- ```lua
--- local addr = ToAddr(SelectedSequence())
--- ```
---@param handle MAHandle The handle to convert
---@param useIndex? boolean If true, uses the index number format
---@return string address Address string
function ToAddr(handle, useIndex) end

--- Returns a handle to the first found touch input object.
---
--- Example:
--- ```lua
--- local touch = TouchObj()
--- Printf(Dump(touch))
--- ```
---@return MAHandle handle Handle to the touch object
function TouchObj() end

--- Removes a hook by its integer ID. Get the ID from HookObjectChange().
---
--- Example:
--- ```lua
--- local id = HookObjectChange(myFn, obj, Root())
--- -- later...
--- Unhook(id)
--- ```
---@param hookId integer The hook ID returned by HookObjectChange()
---@return nil
function Unhook(hookId) end

--- Removes multiple hooks matching the provided function and handle filter.
--- Use DumpAllHooks() to see existing hooks before calling this.
---
--- Example:
--- ```lua
--- UnhookMultiple(myCallback, watchedObj, rootHandle)
--- ```
---@param callback function|nil Function reference to match, or nil to match any
---@param watchHandle MAHandle Handle of the watched object to match
---@param rootHandle MAHandle Root handle to match
---@return nil
function UnhookMultiple(callback, watchHandle, rootHandle) end

--- Returns a handle to the current user's variable set.
---
--- Example:
--- ```lua
--- local vars = UserVars()
--- SetVar(vars, "counter", 0)
--- ```
---@return MAHandle handle Handle to the user variable set
function UserVars() end

--- Returns a string with the current grandMA3 software version.
---
--- Example:
--- ```lua
--- Printf("Version: " .. Version())
--- ```
---@return string version Software version string
function Version() end
