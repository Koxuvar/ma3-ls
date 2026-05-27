---@meta

--------------------------------------------------------------------------------
-- MAHandle
-- The core handle type used throughout the grandMA3 Lua API.
-- A handle is a unique identifier referring to a grandMA3 object such as a
-- sequence, cue, preset, fixture, or any other show data object.
-- Every object always has Name, Class, and Path properties.
-- The Path is the same as an address identifying where the object exists
-- in the structure of the show file.
--------------------------------------------------------------------------------

---@class MAHandle
---@field Name string The name of the object
---@field Class string The class type of the object
---@field Path string The address path of the object in the show file

---@type MAHandle
local MAHandle = {}

--------------------------------------------------------------------------------
-- Fader types
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
---@field token FaderToken Which fader to query
---@field index? integer Optional fader index

---@class SetFaderOptions
---@field value? number Fader value to set
---@field token? FaderToken Which fader to target
---@field faderEnabled? boolean Enable or disable the fader

--------------------------------------------------------------------------------
-- AddFixtures types
--------------------------------------------------------------------------------

--- Table argument for AddFixtures(). Defines fixture data to add to the patch.
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

--------------------------------------------------------------------------------
-- BuildDetails types
--------------------------------------------------------------------------------

--- Return type for BuildDetails()
---@class BuildDetailsTable
---@field GitDate string Date of the repository branch
---@field GitHead string Branch name of the repository
---@field GitHash string Hash of the repository commit
---@field CompileDate string Date the software was compiled
---@field CompileTime string Time the software was compiled
---@field BigVersion string Full software version string
---@field SmallVersion string Small version number

--------------------------------------------------------------------------------
-- ObjectList types
--------------------------------------------------------------------------------

--- Optional argument for ObjectList()
---@class ObjectListOptions
---@field reverse_order? boolean If true, returns the list in reverse order
---@field selected_as_default? boolean If true, returns only the selected object when no other match

--------------------------------------------------------------------------------
-- DirList types
--------------------------------------------------------------------------------

--- A single entry in the table returned by DirList()
---@class DirListEntry
---@field name string File name
---@field size number File size in bytes
---@field time number File timestamp

--------------------------------------------------------------------------------
-- Position types
--------------------------------------------------------------------------------

--- A 2D position on a display, used by DrawPointer() and GetUIObjectAtPosition()
---@class PositionTable
---@field x number X position on the display
---@field y number Y position on the display

--------------------------------------------------------------------------------
-- RT Channel types
--------------------------------------------------------------------------------

--- Return type for GetRTChannel()
---@class GetRTChannelResult
---@field fixture MAHandle Handle to the fixture
---@field subfixture MAHandle Handle to the subfixture
---@field dmx_channel MAHandle Handle to the DMX channel

--------------------------------------------------------------------------------
-- System sample keys
--------------------------------------------------------------------------------

--- Valid string keys for GetSample()
---@alias SampleKey
---| "MEMORY"   # RAM usage percentage
---| "CPU"      # CPU usage percentage
---| "CPUTEMP"  # CPU temperature percentage
---| "GPUTEMP"  # GPU temperature percentage
---| "SYSTEMP"  # System temperature percentage
---| "FANRPM"   # Fan RPM percentage

--------------------------------------------------------------------------------
-- Show file status
--------------------------------------------------------------------------------

--- Valid return values for GetShowFileStatus()
---@alias ShowFileStatus
---| "NoShow"
---| "ShowLoaded"
---| "ShowDownloaded"
---| "ShowSaving"
---| "DataNegotiationActive"
