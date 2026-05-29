---@meta

-- grandMA3 Object-Free Lua API
-- Complete stub file generated from grandMA3 User Manual v2.3 and official API dump.
-- grandMA3 injects all these functions as bare globals into the Lua environment.

--------------------------------------------------------------------------------
-- Shared types
--------------------------------------------------------------------------------

---@alias SampleKey
---| "MEMORY"   # RAM usage percentage
---| "CPU"      # CPU usage percentage
---| "CPUTEMP"  # CPU temperature percentage
---| "GPUTEMP"  # GPU temperature percentage
---| "SYSTEMP"  # System temperature percentage
---| "FANRPM"   # Fan RPM percentage

---@alias ShowFileStatus
---| "NoShow"
---| "ShowLoaded"
---| "ShowDownloaded"
---| "ShowSaving"
---| "DataNegotiationActive"

---@class AddFixturesTable
---@field mode MAHandle Handle to a valid dmx_mode defining the fixture type and mode
---@field amount integer Number of fixtures to add
---@field name? string Name of the first fixture
---@field fid? string Fixture ID string
---@field cid? string Channel ID — only valid if idtype is not "Fixture"
---@field idtype? string ID type name, only needed if different from "Fixture"
---@field patch? string[] Up to 8 patch address strings in "universe.address" format e.g. "10.001"
---@field layer? string Layer name
---@field class? string Class name
---@field parent? MAHandle Handle of parent fixture, only needed for sub-fixtures
---@field insert_index? integer Insert index position
---@field undo? string Text label for the undo entry

---@class BuildDetailsTable
---@field GitDate string Date of the repository branch
---@field GitHead string Branch name of the repository
---@field GitHash string Hash of the repository commit
---@field CompileDate string Date the software was compiled
---@field CompileTime string Time the software was compiled
---@field BigVersion string Full software version string
---@field SmallVersion string Small version number

---@class ObjectListOptions
---@field reverse_order? boolean If true, returns the list in reverse order
---@field selected_as_default? boolean If true, returns only the selected object when no other match

---@class DirListEntry
---@field name string File name
---@field size integer File size in bytes
---@field time integer File timestamp

---@class PositionTable
---@field x integer X position on the display
---@field y integer Y position on the display

---@class GetRTChannelResult
---@field fixture MAHandle Handle to the fixture
---@field subfixture MAHandle Handle to the subfixture
---@field dmx_channel MAHandle Handle to the DMX channel

---@class PhaserStep
---@field channel_function? integer Channel function index
---@field absolute? number Absolute value as percent
---@field absolute_value? integer Absolute value as raw integer
---@field relative? number Relative value as percent
---@field accel? number Acceleration as percent
---@field accel_type? integer Spline type enum (Enums.SplineType)
---@field decel? number Deceleration as percent
---@field decel_type? integer Spline type enum (Enums.SplineType)
---@field trans? number Transition as percent
---@field width? number Width as percent
---@field integrated? MAHandle Integrated preset handle

---@class PhaserData : PhaserStep
---@field abs_preset? MAHandle Absolute preset handle
---@field rel_preset? MAHandle Relative preset handle
---@field fade? number Fade time in seconds
---@field delay? number Delay time in seconds
---@field speed? number Speed in Hz
---@field phase? number Phase in degrees
---@field measure? number Measure as percent
---@field gridpos? integer Grid position

--------------------------------------------------------------------------------
-- Output / Printing
--------------------------------------------------------------------------------

--- Prints a string to the Command Line History without a newline.
---@param format string Printf-style format string
---@param ... any Format arguments
---@return nil
function Echo(format, ...) end

--- Prints a string to the error output in the Command Line History without a newline.
---@param format string Printf-style format string
---@param ... any Format arguments
---@return nil
function ErrEcho(format, ...) end

--- Prints a formatted string to the Command Line History and System Monitor.
---
--- Example:
--- ```lua
--- Printf("Hello World!")
--- Printf("Cue %d fired at %.2f seconds", cueNum, Time())
--- ```
---@param format string Printf-style format string
---@param ... any Format arguments
---@return nil
function Printf(format, ...) end

--- Prints a formatted error string to the Command Line History.
---@param format string Printf-style format string
---@param ... any Format arguments
---@return nil
function ErrPrintf(format, ...) end

--------------------------------------------------------------------------------
-- Command execution
--------------------------------------------------------------------------------

--- Executes a command in the grandMA3 command line synchronously.
--- Blocks the Lua task until complete. A bad command can block the system.
---
--- Example:
--- ```lua
--- local result = Cmd("ClearAll")
--- if result == "OK" then Printf("Command succeeded") end
--- ```
---@param command string The command to execute. Do not add "Please" or Enter.
---@param undoHandle? MAHandle Optional undo handle
---@param ... any Additional command arguments
---@return string result "OK", "Syntax Error", or "Illegal Command"
function Cmd(command, undoHandle, ...) end

--- Executes a command asynchronously in the Main task. Does not block.
---@param command string The command to execute
---@param undoHandle? MAHandle Optional undo handle
---@param targetHandle? MAHandle Optional target handle
---@return nil
function CmdIndirect(command, undoHandle, targetHandle) end

--- Executes a command in the Main task and waits for completion without blocking Lua.
---@param command string The command to execute
---@param undoHandle? MAHandle Optional undo handle
---@param targetHandle? MAHandle Optional target handle
---@return nil
function CmdIndirectWait(command, undoHandle, targetHandle) end

--- Returns a handle to the command line object.
---@return MAHandle handle Handle to the command line object
function CmdObj() end

--- Calls a function protected by the realtime lock.
---@param func function The function to call
---@return any result The return value of the function
function CallRealtimeLockedProtected(func) end

--- Executes a command on a remote grandMA3 station via IP address.
---@param ip string IP address of the remote station
---@param command string The command to execute
---@return boolean success True if sent successfully
function RemoteCommand(ip, command) end

--------------------------------------------------------------------------------
-- System / Host info
--------------------------------------------------------------------------------

--- Returns the operating system of the device. e.g. "Windows", "Linux", "Mac"
---@return string os Operating system name
function HostOS() end

--- Returns the host type of the device. e.g. "Console" or "onPC"
---@return string hostType Host type string
function HostType() end

--- Returns the host sub-type. e.g. "FullSize", "Light", "RPU", "onPCRackUnit"
---@return string subType Host sub-type string
function HostSubType() end

--- Returns the hardware revision string of the device.
---@return string revision Hardware revision string
function HostRevision() end

--- Returns the serial number of the device.
---@return string serialNumber Serial number string
function SerialNumber() end

--- Returns the release type of the software. Production builds return "Release".
---@return string releaseType Release type string
function ReleaseType() end

--- Returns the current software version string.
---@return string version Software version string
function Version() end

--- Returns the current 3D dev mode state string.
---@return string devmode Dev mode string
function DevMode3d() end

--- Returns a handle to the overall device certificate object.
---@return MAHandle handle Handle to the device certificate
function OverallDeviceCertificate() end

--- Returns a table with key-value pairs describing the current software build.
---
--- Example:
--- ```lua
--- local details = BuildDetails()
--- Printf("Version: " .. details.BigVersion)
--- ```
---@return BuildDetailsTable buildDetails Table of build information
function BuildDetails() end

--- Returns a string describing the current show file status.
---@return ShowFileStatus status The current show file status
function GetShowFileStatus() end

--- Returns a table with configuration information as key-value pairs.
---@return table config Key-value configuration table
function ConfigTable() end

--- Returns whether a remote call is currently running.
---@return boolean running True if a remote call is active
function RemoteCallRunning() end

--- Returns whether there are unsaved changes to the show file.
---@return boolean unsaved True if there are unsaved changes
function NeedShowSave() end

--------------------------------------------------------------------------------
-- Messaging / Network
--------------------------------------------------------------------------------

--- Opens a named message queue for inter-plugin communication.
---@param queueName string Name of the queue to open
---@return boolean success True if opened successfully
function OpenMessageQueue(queueName) end

--- Closes a named message queue.
---@param queueName string Name of the queue to close
---@return boolean success True if closed successfully
function CloseMessageQueue(queueName) end

--- Sends a Lua table as a message to another station or plugin via a named channel.
---@param target string IP address or station name
---@param channelName string Name of the message channel
---@param data table The Lua table to send
---@return boolean success True if sent successfully
function SendLuaMessage(target, channelName, data) end

--------------------------------------------------------------------------------
-- Show data handles
--------------------------------------------------------------------------------

--- Returns a handle to the root object of the show data hierarchy.
---@return MAHandle handle Handle to the root object
function Root() end

--- Returns a handle to the Pult object at Root/GraphicsRoot/PultCollect.
---@return MAHandle handle Handle to the Pult object
function Pult() end

--- Returns a handle to the default display positions object.
---@return MAHandle handle Handle to default display positions
function DefaultDisplayPositions() end

--- Returns a handle to the patch object.
---@return MAHandle handle Handle to the patch
function Patch() end

--- Returns a handle to the fixture type pool object.
---@return MAHandle handle Handle to the fixture type pool
function FixtureType() end

--- Returns a handle to the ShowData object at Root/ShowData.
---@return MAHandle handle Handle to ShowData
function ShowData() end

--- Returns a handle to the ShowSettings object at Root/ShowData/ShowSettings.
---@return MAHandle handle Handle to ShowSettings
function ShowSettings() end

--- Returns a handle to the data pool object.
---@return MAHandle handle Handle to the data pool
function DataPool() end

--- Returns a handle to the masters pool.
---@return MAHandle handle Handle to the master pool
function MasterPool() end

--- Returns a handle to the device configuration object.
---@return MAHandle handle Handle to the device configuration
function DeviceConfiguration() end

--- Returns a handle to the current programmer object.
---@return MAHandle handle Handle to the programmer
function Programmer() end

--- Returns a handle to the current programmer part object.
---@return MAHandle handle Handle to the programmer part
function ProgrammerPart() end

--- Returns a handle to the object holding the current fixture selection.
---@return MAHandle handle Handle to the selection object
function Selection() end

--- Returns a handle to the current user object.
---@return MAHandle handle Handle to the current user
function CurrentUser() end

--- Returns a handle to the current user's profile.
---@return MAHandle handle Handle to the current user profile
function CurrentProfile() end

--- Returns a handle to the current user's selected environment.
---@return MAHandle handle Handle to the current environment
function CurrentEnvironment() end

--- Returns a handle to the current user's screen configuration.
---@return MAHandle handle Handle to the current screen configuration
function CurrentScreenConfig() end

--- Returns a handle to the current user's selected executor page.
---@return MAHandle handle Handle to the current executor page
function CurrentExecPage() end

--- Returns a handle to the currently selected sequence.
---
--- Example:
--- ```lua
--- local seq = SelectedSequence()
--- Printf("Selected: " .. seq.Name)
--- ```
---@return MAHandle handle Handle to the selected sequence
function SelectedSequence() end

--- Returns a handle to the last activated cue in the selected sequence.
---@return MAHandle handle Handle to the current cue
function GetCurrentCue() end

--- Returns a handle to the currently selected timecode show object.
---@return MAHandle handle Handle to the selected timecode
function SelectedTimecode() end

--- Returns a handle to the currently selected layout.
---@return MAHandle handle Handle to the selected layout
function SelectedLayout() end

--- Returns a handle to the currently selected timer object.
---@return MAHandle handle Handle to the selected timer
function SelectedTimer() end

--- Returns a handle to the currently selected attribute.
---@return MAHandle handle Handle to the selected attribute
function GetSelectedAttribute() end

--- Returns a handle to the currently selected feature.
---@return MAHandle handle Handle to the selected feature
function SelectedFeature() end

--- Returns a handle to the currently selected drive object.
---@return MAHandle handle Handle to the selected drive
function SelectedDrive() end

--- Returns handles to both the executor and the page for a given executor number.
---
--- Example:
--- ```lua
--- local exec, page = GetExecutor(201)
--- ```
---@param executorNumber integer The executor number
---@return MAHandle executorHandle Handle to the executor
---@return MAHandle pageHandle Handle to the executor page
function GetExecutor(executorNumber) end

--- Loads the executor configuration for the given executor handle.
---@param executorHandle MAHandle Handle to the executor
---@return nil
function LoadExecConfig(executorHandle) end

--- Saves the executor configuration for the given executor handle.
---@param executorHandle MAHandle Handle to the executor
---@return nil
function SaveExecConfig(executorHandle) end

--------------------------------------------------------------------------------
-- Selection
--------------------------------------------------------------------------------

--- Returns a table of subfixture indexes for the current selection.
---@return integer[] indexes Table of subfixture indexes
function SelectionTable() end

--- Returns a table of UI channel indexes for a given attribute name or index.
---@param attributeNameOrIndex string|integer Attribute name or 0-based index
---@return integer[] indexes Table of UI channel indexes
function ChannelTable(attributeNameOrIndex) end

--- Returns four integers for the first fixture in the current selection.
---
--- Example:
--- ```lua
--- local idx, x, y, z = SelectionFirst()
--- while idx do
---   Printf("Fixture: " .. idx)
---   idx, x, y, z = SelectionNext(idx)
--- end
--- ```
---@return integer patchIndex 0-based patch index of the first fixture
---@return integer x X position in the selection grid
---@return integer y Y position in the selection grid
---@return integer z Z position in the selection grid
function SelectionFirst() end

--- Returns four integers for the next fixture after the given patch index.
---@param currentIndex integer Current patch index
---@return integer|nil patchIndex 0-based patch index of the next fixture, or nil if end
---@return integer x X position
---@return integer y Y position
---@return integer z Z position
function SelectionNext(currentIndex) end

--- Returns the number of currently selected fixtures.
---@return integer count Number of selected fixtures
function SelectionCount() end

--- Returns selection grid component info for the X axis.
---@return integer min @return integer max @return integer index @return integer block @return integer group
function SelectionComponentX() end

--- Returns selection grid component info for the Y axis.
---@return integer min @return integer max @return integer index @return integer block @return integer group
function SelectionComponentY() end

--- Returns selection grid component info for the Z axis.
---@return integer min @return integer max @return integer index @return integer block @return integer group
function SelectionComponentZ() end

--- Begins a selection notification batch. Pair with SelectionNotifyObject() and SelectionNotifyEnd().
---@param contextHandle MAHandle Associated context handle
---@return nil
function SelectionNotifyBegin(contextHandle) end

--- Notifies the system about an object during a selection batch.
---@param objectHandle MAHandle The object to notify about
---@return nil
function SelectionNotifyObject(objectHandle) end

--- Ends a selection notification batch started with SelectionNotifyBegin().
---@param contextHandle MAHandle Associated context handle
---@return nil
function SelectionNotifyEnd(contextHandle) end

--------------------------------------------------------------------------------
-- Fixture / DMX
--------------------------------------------------------------------------------

--- Returns the total number of patched fixtures in the show.
---@return integer count Total number of patched fixtures
function GetSubfixtureCount() end

--- Returns a handle to the fixture at the specified 0-based patch index.
---@param patchIndex integer 0-based patch index
---@return MAHandle handle Handle to the fixture
function GetSubfixture(patchIndex) end

--- Returns the total number of UI channels in the show.
---@return integer count Total number of UI channels
function GetUIChannelCount() end

--- Returns the total number of RT channels in the show.
---@return integer count Total number of RT channels
function GetRTChannelCount() end

--- Returns the total number of attribute definitions in the show.
---@return integer count Total number of attribute definitions
function GetAttributeCount() end

--- Returns a table of UI channel indexes or handles for a fixture.
---@param indexOrHandle integer|MAHandle Subfixture patch index or handle
---@param returnHandles? boolean If true returns handles, if false returns indexes
---@return table channels Table of UI channel indexes or handles
function GetUIChannels(indexOrHandle, returnHandles) end

--- Returns a table of RT channel indexes or handles for a fixture.
---@param indexOrHandle integer|MAHandle Subfixture patch index or fixture handle
---@param returnHandles? boolean If true returns handles, if false returns indexes
---@return table channels Table of RT channel indexes or handles
function GetRTChannels(indexOrHandle, returnHandles) end

--- Returns a UI channel descriptor table for a specific fixture and attribute.
---@param subfixOrHandle integer|MAHandle Subfixture index or handle
---@param attributeIndexOrName integer|string Attribute index or name
---@return table descriptor UI channel descriptor table
function GetUIChannel(subfixOrHandle, attributeIndexOrName) end

--- Returns a table with info about an RT channel by index.
---@param index integer Index of the RT channel
---@return GetRTChannelResult channel Table with fixture, subfixture, and dmx_channel handles
function GetRTChannel(index) end

--- Returns a handle to the attribute connected to a specific UI channel index.
---@param uiChannelIndex integer UI channel index
---@return MAHandle handle Handle to the attribute
function GetAttributeByUIChannel(uiChannelIndex) end

--- Returns a handle to the first fixture that uses the specified DMX mode.
---@param dmxModeHandle MAHandle Handle to a DMX mode object
---@return MAHandle|nil handle Handle to the first matching fixture, or nil
function FirstDmxModeFixture(dmxModeHandle) end

--- Returns the next fixture using the same DMX mode as the given fixture.
---
--- Example:
--- ```lua
--- local fixture = FirstDmxModeFixture(dmxModeHandle)
--- while fixture do
---   Printf(fixture.Name)
---   fixture = NextDmxModeFixture(fixture)
--- end
--- ```
---@param fixtureHandle MAHandle Handle to the current fixture
---@return MAHandle|nil handle Handle to the next fixture, or nil
function NextDmxModeFixture(fixtureHandle) end

--- Returns the 0-based index of an attribute definition by its system name.
---@param systemName string The attribute system name
---@return integer index 0-based index of the attribute
function GetAttributeIndex(systemName) end

--- Returns the UI channel index for a fixture and attribute combination.
---@param patchIndex integer Patch index of the fixture
---@param attributeIndex integer Attribute index (0-based)
---@return integer index UI channel index
function GetUIChannelIndex(patchIndex, attributeIndex) end

--- Returns the integer index matching a channel function based on UI channel and attribute.
---@param uiChannelIndex integer UI channel index
---@param attributeIndex integer Attribute index (0-based)
---@return integer index Index of the channel function
function GetChannelFunctionIndex(uiChannelIndex, attributeIndex) end

--- Returns a handle to a channel function based on UI channel and attribute indexes.
---@param uiChannelIndex integer UI channel index
---@param attributeIndex integer Attribute index (0-based)
---@return MAHandle handle Handle to the channel function
function GetChannelFunction(uiChannelIndex, attributeIndex) end

--- Returns the full keyword string for a given short keyword abbreviation.
---@param shortToken string Short version of a keyword
---@return string|nil keyword Full keyword string, or nil if not found
function GetTokenName(shortToken) end

--- Returns the keyword string for a given keyword index number.
---@param index integer Index number of the keyword
---@return string|nil keyword Keyword string, or nil if not found
function GetTokenNameByIndex(index) end

--- Finds the best available DMX patch address for a given footprint.
---@param patchHandle MAHandle Handle to the patch object
---@param startingAddress integer Starting address to search from (absolute)
---@param footprint integer Number of DMX channels required
---@return integer address Best available absolute DMX address
function FindBestDMXPatchAddr(patchHandle, startingAddress, footprint) end

--- Checks if a specific DMX address range is available.
---@param dmxModeHandle MAHandle Handle to a DMX mode object
---@param address string DMX address string in "universe.channel" format
---@param count? integer Number of channels to check (default: 1)
---@param breakIndex? integer DMX break index (default: 1)
---@return boolean|nil result True if available, nil if collision
function CheckDMXCollision(dmxModeHandle, address, count, breakIndex) end

--- Checks if a specific FID or CID range is available.
---@param id integer The ID to check
---@param count? integer Number of subsequent IDs to check (default: 1)
---@param idtype? integer ID type. 0 = Fixture (default)
---@return boolean|nil result True if available, nil if collision
function CheckFIDCollision(id, count, idtype) end

--- Returns the DMX value of a specific DMX address.
---@param address integer DMX address
---@param universe? integer Universe number
---@param asPercent? boolean If true returns 0-100, if false returns 0-255
---@return integer value DMX value at the address
function GetDMXValue(address, universe, asPercent) end

--- Returns a table of all 512 DMX channel values for a universe.
---
--- Example:
--- ```lua
--- local universe = GetDMXUniverse(1, false)
--- Printf("Channel 1: " .. universe[1])
--- ```
---@param universe integer Universe number (1-1024)
---@param asPercent? boolean If true returns 0-100, if false returns 0-255
---@return table<integer,integer>|nil values Table of 512 channel values, or nil if unavailable
function GetDMXUniverse(universe, asPercent) end

--- Sends LED brightness values to an MA3 hardware module.
---@param moduleHandle MAHandle Handle to the MA3 module
---@param values table Key-value table of LED index to brightness value
---@return nil
function SetLED(moduleHandle, values) end

--- Returns a key-value table of button states for an MA3 hardware module.
---@param moduleHandle MAHandle Handle to the MA3 module
---@return table<integer, boolean> states Table of 512 button states
function GetButton(moduleHandle) end

--- Adds fixtures to the patch. Must be run with the command line in the correct patch destination.
---
--- Example:
--- ```lua
--- Cmd('ChangeDestination "ShowData"."Patch"')
--- local t = { mode = Patch().FixtureTypes.Dimmer.DMXModes["Mode 0"], amount = 1, fid = "301", patch = {"10.001"} }
--- AddFixtures(t)
--- ```
---@param fixtureTable AddFixturesTable Table with fixture data
---@return boolean|nil success True if successful, nil on failure
function AddFixtures(fixtureTable) end

--- Creates multi-patch fixtures for a table of fixture handles.
---@param handles MAHandle[] Table of fixture handles
---@param count integer Number of multi patch fixtures to create
---@param undoText? string Optional undo label
---@return integer|nil result Number of created multi patches, or nil on failure
function CreateMultiPatch(handles, count, undoText) end

--------------------------------------------------------------------------------
-- Programmer / Phaser
--------------------------------------------------------------------------------

--- Sets phaser data for a UI channel in the programmer.
---@param uiChannelIndex integer UI channel index
---@param data PhaserData Phaser data table
---@return nil
function SetProgPhaser(uiChannelIndex, data) end

--- Sets a single phaser step value for a UI channel in the programmer.
---@param uiChannelIndex integer UI channel index
---@param step integer Step number (1-based)
---@param data PhaserStep Step data table
---@return nil
function SetProgPhaserValue(uiChannelIndex, step, data) end

--- Returns the current phaser data for a UI channel from the programmer.
---@param uiChannelIndex integer UI channel index
---@param phaserOnly boolean If true returns only phaser data
---@return PhaserData data Phaser data table
function GetProgPhaser(uiChannelIndex, phaserOnly) end

--- Returns a single phaser step value for a UI channel from the programmer.
---@param uiChannelIndex integer UI channel index
---@param step integer Step number (1-based)
---@return PhaserStep data Step data table
function GetProgPhaserValue(uiChannelIndex, step) end

--- Returns a table with preset data for a given preset handle.
---@param presetHandle MAHandle Handle to the preset
---@param phasersOnly? boolean Whether to return only phaser data (default: false)
---@param byFixtures? boolean Whether to resolve by fixtures (default: true)
---@return table presetData Complex nested table of preset data
function GetPresetData(presetHandle, phasersOnly, byFixtures) end

--- Sets a color value in the programmer using the specified color model.
---@param colorModel string Color model: "RGB", "xyY", "Lab", "XYZ", or "HSB"
---@param value1 number First color component
---@param value2 number Second color component
---@param value3 number Third color component
---@param brightness number Brightness value
---@param quality number Quality value
---@param constBrightness boolean Whether to use constant brightness
---@return integer flag Result flag
function SetColor(colorModel, value1, value2, value3, brightness, quality, constBrightness) end

--- Performs a dark calibration on the connected color measurement device.
---@return integer flag Result flag
function ColMeasureDeviceDarkCalibrate() end

--- Performs a measurement using the connected color measurement device.
---@return table values Table of measured color values
function ColMeasureDeviceDoMeasurement() end

--------------------------------------------------------------------------------
-- Object lookup / handles
--------------------------------------------------------------------------------

--- Returns a handle to the object at the given address string.
---@param address string Address string of the object
---@return MAHandle handle Handle to the object
function GetObject(address) end

--- Returns a table of handles based on a command string selection.
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

--- Converts a handle to an address string.
---@param handle MAHandle The handle to convert
---@param withName? boolean If true returns named address, if false returns numeric
---@param useVisibleAddr? boolean If true uses the visible address format
---@return string address Address string
function ToAddr(handle, withName, useVisibleAddr) end

--- Converts an integer into a handle.
---@param integer integer The integer to convert
---@return MAHandle handle The corresponding handle
function IntToHandle(integer) end

--- Converts a handle into an integer.
---@param handle MAHandle The handle to convert
---@return integer result The handle as an integer
function HandleToInt(handle) end

--- Converts a hexadecimal string (H#... format) into a handle.
---@param hexString string Handle in H#... format
---@return MAHandle handle The corresponding handle
function StrToHandle(hexString) end

--- Converts a handle into a hexadecimal string (H#... format).
---@param handle MAHandle The handle to convert
---@return string result The handle as a hex string
function HandleToStr(handle) end

--- Returns true if the supplied handle is a valid grandMA3 object.
---@param handle MAHandle The handle to validate
---@return boolean|nil valid True if valid, nil if not
function IsObjectValid(handle) end

--------------------------------------------------------------------------------
-- File / Export / Import
--------------------------------------------------------------------------------

--- Exports a Lua table to an XML file.
---@param filename string Full path and filename
---@param data table The Lua table to export
---@return boolean success True if export succeeded
function Export(filename, data) end

--- Imports a Lua table from an XML file.
---@param filename string Full path and filename
---@return table data The imported Lua table
function Import(filename) end

--- Exports a Lua table to a JSON file.
---@param filename string Full path and filename
---@param data table The Lua table to export
---@return boolean success True if export succeeded
function ExportJson(filename, data) end

--- Exports a Lua table to a CSV file.
---@param filename string Full path and filename
---@param data table The Lua table to export
---@return boolean success True if export succeeded
function ExportCSV(filename, data) end

--------------------------------------------------------------------------------
-- Hooks
--------------------------------------------------------------------------------

--- Registers a callback that fires when a grandMA3 object changes.
--- Returns an integer hook ID usable with Unhook().
---
--- Example:
--- ```lua
--- local id = HookObjectChange(function(hookId, obj) Printf("Changed") end, SelectedSequence(), Root())
--- ```
---@param callback function Function called when the object changes
---@param watchHandle MAHandle Handle to the object to watch
---@param pluginHandle MAHandle Plugin context handle
---@param filterHandle? MAHandle Optional filter handle
---@return integer hookId Integer ID for this hook
function HookObjectChange(callback, watchHandle, pluginHandle, filterHandle) end

--- Prepares a hook to wait for an object to change.
---@param handle MAHandle Handle to the object to watch
---@param changeLevelThreshold? integer Minimum change level to trigger
---@return boolean|nil result True if prepared, nil on failure
function PrepareWaitObjectChange(handle, changeLevelThreshold) end

--- Removes a hook by its integer ID.
---@param hookId integer The hook ID returned by HookObjectChange()
---@return nil
function Unhook(hookId) end

--- Removes multiple hooks matching the given criteria. Any param can be nil to match any.
---@param callback function|nil Function reference to match, or nil for any
---@param targetHandle MAHandle|nil Handle of the watched object, or nil for any
---@param contextHandle MAHandle|nil Context handle, or nil for any
---@return integer count Number of hooks removed
function UnhookMultiple(callback, targetHandle, contextHandle) end

--- Prints a list of all currently active hooks to the command line history.
---@return nil
function DumpAllHooks() end

--------------------------------------------------------------------------------
-- Paths / File system
--------------------------------------------------------------------------------

--- Returns the file system path for a named grandMA3 folder.
---@param nameOrIndex string|integer Folder name string or Enums.PathType integer
---@param createIfMissing? boolean If true, creates the folder if it doesn't exist
---@return string path The file system path string
function GetPath(nameOrIndex, createIfMissing) end

--- Returns the path type string for a given handle.
---@param handle MAHandle Handle to the object
---@param contentType? integer Optional Enums.PathContentType integer
---@return string pathType The path type name string
function GetPathType(handle, contentType) end

--- Returns the path of a grandMA3 folder with optional drive override.
---@param nameOrIndex string|integer Folder name or Enums.PathType integer
---@param basePath string The base override path
---@param createIfMissing? boolean If true, creates the folder if it doesn't exist
---@return string path The resolved path string
function GetPathOverrideFor(nameOrIndex, basePath, createIfMissing) end

--- Returns the path separator character for the current OS. "/" on Linux/Mac, "\" on Windows.
---@return string separator Single character path separator
function GetPathSeparator() end

--- Returns true if a file exists at the specified path.
---@param path string Full file path to check
---@return boolean exists True if the file exists
function FileExists(path) end

--- Copies a file from source to destination path.
---@param sourcePath string Full source file path
---@param destinationPath string Full destination file path
---@return boolean success True if the copy succeeded
function CopyFile(sourcePath, destinationPath) end

--- Creates a directory and all intermediate directories recursively.
---@param path string Full path to create
---@return boolean success True if created successfully
function CreateDirectoryRecursive(path) end

--- Synchronizes the file system, flushing any pending writes.
---@return nil
function SyncFS() end

--- Returns a table of files at a specified path, with optional filter.
---
--- Example:
--- ```lua
--- local files = DirList("/media/", "*.xml")
--- for _, f in ipairs(files) do Printf(f.name) end
--- ```
---@param path string The directory path to list
---@param filter? string Optional filter string. Supports * as wildcard e.g. "*.xml"
---@return DirListEntry[] files Table of file entries
function DirList(path, filter) end

--------------------------------------------------------------------------------
-- Progress bars
-- Note: Progress bars use integer indexes, NOT handles.
--------------------------------------------------------------------------------

--- Creates and displays a progress bar on all screens. Returns an integer index.
---
--- Example:
--- ```lua
--- local bar = StartProgress("Exporting cues")
--- SetProgressRange(bar, 0, 100)
--- SetProgress(bar, 50)
--- StopProgress(bar)
--- ```
---@param title string Title text displayed on the progress bar
---@return integer progressIndex Integer index for referencing this progress bar
function StartProgress(title) end

--- Removes a progress bar from the screen.
---@param progressIndex integer Index returned by StartProgress()
---@return nil
function StopProgress(progressIndex) end

--- Sets additional text displayed next to the progress bar title.
---@param progressIndex integer Index returned by StartProgress()
---@param text string The text to display
---@return nil
function SetProgressText(progressIndex, text) end

--- Sets the min/max range for a progress bar.
---@param progressIndex integer Index returned by StartProgress()
---@param min integer Minimum value
---@param max integer Maximum value
---@return nil
function SetProgressRange(progressIndex, min, max) end

--- Sets the progress bar to a specific value within its range.
---@param progressIndex integer Index returned by StartProgress()
---@param value integer Value to set
---@return nil
function SetProgress(progressIndex, value) end

--- Increments the progress bar value.
---@param progressIndex integer Index returned by StartProgress()
---@param delta? integer Amount to increment (default: 1)
---@return nil
function IncProgress(progressIndex, delta) end

--------------------------------------------------------------------------------
-- Undo
--------------------------------------------------------------------------------

--- Creates a new undo group. All operations using the returned handle are grouped.
--- Must be closed with CloseUndo() when done.
---
--- Example:
--- ```lua
--- local undo = CreateUndo("Batch store cues")
--- Cmd("Store Cue 1", undo)
--- CloseUndo(undo)
--- ```
---@param label string Text label for this undo group
---@return MAHandle undoHandle Handle to the undo list
function CreateUndo(label) end

--- Closes an undo list. Returns true if closed, false if still in use.
---@param undoHandle MAHandle Handle to the undo list
---@return boolean closed True if closed, false if still in use
function CloseUndo(undoHandle) end

--- Returns true if the desk is currently locked.
---@return boolean locked True if the desk is locked
function DeskLocked() end

--------------------------------------------------------------------------------
-- Variables
--------------------------------------------------------------------------------

--- Returns a handle to the global variables set.
---@return MAHandle handle Handle to the global variable set
function GlobalVars() end

--- Returns a handle to the current user's variable set.
---@return MAHandle handle Handle to the user variable set
function UserVars() end

--- Returns a handle to the variable set for a specific plugin.
--- If no name is provided, returns the current plugin's variable set.
---@param pluginName? string Name of the plugin
---@return MAHandle handle Handle to the plugin variable set
function PluginVars(pluginName) end

--- Returns a handle to the variable set connected to a specific addon.
---@param addonName string Name of the addon
---@return MAHandle handle Handle to the addon's variable set
function AddonVars(addonName) end

--- Sets a variable in a variable set. Creates it if it doesn't exist.
---
--- Example:
--- ```lua
--- SetVar(UserVars(), "myVar", 42)
--- ```
---@param varSetHandle MAHandle Handle to the variable set
---@param varName string Name of the variable
---@param value any The value to set
---@return boolean success True if set successfully
function SetVar(varSetHandle, varName, value) end

--- Returns the value of a named variable from a variable set.
---@param varSetHandle MAHandle Handle to the variable set
---@param varName string Name of the variable
---@return any value The variable's value, or nil if it doesn't exist
function GetVar(varSetHandle, varName) end

--- Returns the version integer of a variable. Increments each time the variable changes.
---@param varSetHandle MAHandle Handle to the variable set
---@param varName string Name of the variable
---@return integer version Version number
function GetVarVersion(varSetHandle, varName) end

--- Deletes a variable from a variable set.
---@param varSetHandle MAHandle Handle to the variable set
---@param varName string Name of the variable to delete
---@return boolean success True if deleted
function DelVar(varSetHandle, varName) end

--------------------------------------------------------------------------------
-- Class inspection
--------------------------------------------------------------------------------

--- Returns true if the provided string is a valid grandMA3 class name.
---@param className string Class name to check
---@return boolean exists True if the class exists
function ClassExists(className) end

--- Returns true if one class is derived from another.
---@param childClass string The class that might be derived
---@param parentClass string The potential base class
---@return boolean result True if childClass is derived from parentClass
function IsClassDerivedFrom(childClass, parentClass) end

--- Returns the derivation level index for a class by name.
---@param className string Name of the class
---@return integer|nil level Derivation level, or nil if not found
function GetClassDerivationLevel(className) end

--------------------------------------------------------------------------------
-- API descriptors
--------------------------------------------------------------------------------

--- Returns a table describing all object-free Lua API functions.
---@return table descriptor Table of API function descriptions
function GetApiDescriptor() end

--- Returns a table describing all object API Lua functions.
---@return table descriptor Table of object API function descriptions
function GetObjApiDescriptor() end

--------------------------------------------------------------------------------
-- Text screen / Debug
--------------------------------------------------------------------------------

--- Returns the internal line number of the current text screen position.
---@return integer lineNumber Internal line number
function GetTextScreenLine() end

--- Returns the number of lines from a starting internal line number.
---@param startLine? integer Starting line number (default: 0)
---@return integer count Number of lines
function GetTextScreenLineCount(startLine) end

--- Returns the current frames per second.
---@return number fps Current frames per second
function GetDebugFPS() end

--- Returns a system resource usage percentage.
---
--- Example:
--- ```lua
--- Printf("CPU: " .. GetSample("CPU") .. "%")
--- ```
---@param sampleKey SampleKey The resource to sample
---@return integer value Usage percentage (0-100)
function GetSample(sampleKey) end

--------------------------------------------------------------------------------
-- Time / Timer
--------------------------------------------------------------------------------

--- Returns the time in seconds since the grandMA3 application started.
---@return integer uptime Station uptime in seconds
function Time() end

--- Calls a function repeatedly on a timer interval.
---
--- Example:
--- ```lua
--- Timer(function() Printf("Tick!") end, 1, 10)
--- ```
---@param callback function Function to call on each tick
---@param interval integer Wait time between calls in seconds
---@param count integer Number of times to call the function
---@param onFinish? function Optional function called when the timer completes
---@param contextHandle? MAHandle Optional context handle passed to the callback
---@return nil
function Timer(callback, interval, count, onFinish, contextHandle) end

--------------------------------------------------------------------------------
-- Hardware input simulation
--------------------------------------------------------------------------------

--- Returns a handle to the first found mouse object.
---@return MAHandle handle Handle to the mouse object
function MouseObj() end

--- Returns a handle to the first found touch input object.
---@return MAHandle handle Handle to the touch object
function TouchObj() end

--- Returns a handle to the first found keyboard object.
---@return MAHandle handle Handle to the keyboard object
function KeyboardObj() end

--- Simulates a keyboard event on the specified display.
---@param displayIndex integer Display index
---@param eventType string Event type: "press", "char", or "release"
---@param charOrKeycode? string Character or keycode string
---@param shift? boolean Shift modifier
---@param ctrl? boolean Ctrl modifier
---@param alt? boolean Alt modifier
---@param numlock? boolean Numlock modifier
---@return nil
function Keyboard(displayIndex, eventType, charOrKeycode, shift, ctrl, alt, numlock) end

--- Simulates a mouse event on the specified display.
---@param displayIndex integer Display index
---@param eventType string Event type: "press", "move", or "release"
---@param buttonOrX? string|integer Button name or absolute X for move
---@param y? integer Absolute Y position for move events
---@return nil
function Mouse(displayIndex, eventType, buttonOrX, y) end

--- Simulates a touch event on the specified display.
---@param displayIndex integer Display index
---@param eventType string Event type: "press", "move", or "release"
---@param touchId integer Touch point identifier
---@param x integer Absolute X position
---@param y integer Absolute Y position
---@return nil
function Touch(displayIndex, eventType, touchId, x, y) end

--------------------------------------------------------------------------------
-- Library
--------------------------------------------------------------------------------

--- Refreshes the library for the given handle, reloading any cached data.
---@param handle MAHandle Handle to refresh
---@return nil
function RefreshLibrary(handle) end

--------------------------------------------------------------------------------
-- UI / Display
--------------------------------------------------------------------------------

--- Returns a handle to the UI object that currently has focus.
---@return MAHandle handle Handle to the focused UI object
function GetFocus() end

--- Returns a handle to the display object that currently has focus.
---@return MAHandle handle Handle to the focused display
function GetFocusDisplay() end

--- Returns a handle to the DisplayCollect object.
---@return MAHandle handle Handle to the DisplayCollect
function GetDisplayCollect() end

--- Returns a handle to the display object matching the provided index.
---@param index integer Display index number
---@return MAHandle handle Handle to the display object
function GetDisplayByIndex(index) end

--- Returns the remote video info for the current station.
---@return integer wingID Wing ID integer
---@return boolean isExtension True if the station is an extension
function GetRemoteVideoInfo() end

--- Returns a handle to the UI object at a specified position on a display.
---@param displayIndex integer Display index number
---@param position PositionTable Table with x and y keys
---@return MAHandle|nil handle Handle to the UI object, or nil
function GetUIObjectAtPosition(displayIndex, position) end

--- Draws a pointer on the specified display at the given position.
---@param displayIndex integer Index of the display
---@param position PositionTable Table with x and y keys
---@param duration? integer Duration in milliseconds
---@return nil
function DrawPointer(displayIndex, position, duration) end

--- Waits for a UI object to be deleted, blocking until deletion or timeout.
---@param handle MAHandle Handle to the UI object to watch
---@param timeout? number Seconds to wait
---@return boolean|nil result True if deleted, nil on timeout
function WaitObjectDelete(handle, timeout) end

--- Finds and moves focus to the best focusable UI element.
---@param handle? MAHandle Optional handle to search from
---@return nil
function FindBestFocus(handle) end

--- Moves focus to the next focusable UI element.
---@param backwards? boolean If true, moves backwards (default: false)
---@param reason? integer Focus reason enum value
---@return nil
function FindNextFocus(backwards, reason) end

--- Closes all open overlays on all displays.
---@return nil
function CloseAllOverlays() end

--- Returns a handle to the modal overlay at the top of the UI stack.
---@return MAHandle|nil handle Handle to the top modal, or nil if none
function GetTopModal() end

--- Returns a handle to the overlay at the top of a specific display's stack.
---@param displayIndex integer Display index number
---@return MAHandle|nil handle Handle to the top overlay, or nil if none
function GetTopOverlay(displayIndex) end

--- Waits for a modal overlay to appear, blocking until it does or the timeout expires.
---@param timeout? number Seconds to wait
---@return MAHandle|nil handle Handle to the modal overlay, or nil on timeout
function WaitModal(timeout) end

--- Enables or disables blocking of user input on the desk.
---@param blocked boolean True to block input, false to unblock
---@param showInfo? boolean Whether to show info while blocked
---@return nil
function SetBlockInput(blocked, showInfo) end

--- Returns whether input blocking is currently active.
---@return boolean blocked True if input is blocked
function GetBlockInput() end

--- Returns a handle to a texture object by name.
---@param name string Name of the texture
---@return MAHandle|nil handle Handle to the texture, or nil if not found
function FindTexture(name) end

--- Returns a handle to the screen content based on a screen configuration handle.
---@param screenConfigHandle MAHandle Handle to a screen configuration
---@return MAHandle handle Handle to the screen content
function GetScreenContent(screenConfigHandle) end

--- Returns the column ID for a named property on a grid handle.
---@param handle MAHandle Handle to the grid object
---@param propertyName string Name of the property
---@return integer columnId Column ID integer
function GetPropertyColumnId(handle, propertyName) end

--- Returns the column ID for an attribute on a grid handle.
---@param handle MAHandle Handle to the grid object
---@param attributeHandle MAHandle Handle to the attribute
---@return integer columnId Column ID integer
function GetAttributeColumnId(handle, attributeHandle) end

--------------------------------------------------------------------------------
-- Dialogs / Pop-ups
--------------------------------------------------------------------------------

--- Opens a text input pop-up and returns the typed string. Blocks until confirmed.
---
--- Example:
--- ```lua
--- local name = TextInput("Enter name", "Default")
--- if name then Printf("Got: " .. name) end
--- ```
---@param title? string Title for the pop-up
---@param defaultText? string Pre-filled text
---@param x? integer X position hint
---@param y? integer Y position hint
---@return string|nil input Text entered by the user, or nil if cancelled
function TextInput(title, defaultText, x, y) end

--- Opens a pop-up input selector with configurable items and options.
---@param options table Options table — see grandMA3 docs for full structure
---@return integer selectedIndex 1-based index of the selected item
---@return string selectedValue Value of the selected item
function PopupInput(options) end

--- Opens a confirmation pop-up dialog. Blocks until user responds.
---
--- Example:
--- ```lua
--- local confirmed = Confirm("Are you sure?", "This will clear all")
--- ```
---@param title? string Title text for the pop-up
---@param message? string Body text for the pop-up
---@param displayIndex? integer Display index
---@param showCancel? boolean If true, shows a Cancel button instead of No
---@return boolean result True if user confirmed
function Confirm(title, message, displayIndex, showCancel) end

--- Creates a pop-up message box. Can be simple or complex with multiple input options.
---
--- Example:
--- ```lua
--- local result = MessageBox({
---   title = "Warning",
---   message = "This will delete everything",
---   commands = { {value = 1, name = "OK"}, {value = 0, name = "Cancel"} }
--- })
--- ```
---@param options table Options table defining title, message, commands, inputs, states, selectors
---@return table result Table with success, result, inputs, states, selectors fields
function MessageBox(options) end
