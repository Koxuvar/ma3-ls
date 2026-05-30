---@meta

--grandMA3 Lua API - Type Definitions
--All shared types, classes and aliases used across the grandMA3 Lua API.
--Created based on the official Dump of all Lua API objects with the command \HelpLua

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
--System sample / show file types
--------------------------------------------------------------------------------

---@alias SampleKey
---| "MEMORY" #RAM usage percentage
------| "CPU"      # CPU usage percentage
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

--------------------------------------------------------------------------------
-- AddFixtures
--------------------------------------------------------------------------------

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
-- BuildDetails
--------------------------------------------------------------------------------

---@class BuildDetailsTable
---@field GitDate string Date of the repository branch
---@field GitHead string Branch name of the repository
---@field GitHash string Hash of the repository commit
---@field CompileDate string Date the software was compiled
---@field CompileTime string Time the software was compiled
---@field BigVersion string Full software version string
---@field SmallVersion string Small version number

--------------------------------------------------------------------------------
-- ObjectList options
--------------------------------------------------------------------------------

---@class ObjectListOptions
---@field reverse_order? boolean If true, returns the list in reverse order
---@field selected_as_default? boolean If true, returns only the selected object when no other match

--------------------------------------------------------------------------------
-- DirList entry
--------------------------------------------------------------------------------

---@class DirListEntry
---@field name string File name
---@field size integer File size in bytes
---@field time integer File timestamp

--------------------------------------------------------------------------------
-- UI position
--------------------------------------------------------------------------------

---@class PositionTable
---@field x integer X position on the display
---@field y integer Y position on the display

--------------------------------------------------------------------------------
-- RT channel result
--------------------------------------------------------------------------------

---@class GetRTChannelResult
---@field fixture MAHandle Handle to the fixture
---@field subfixture MAHandle Handle to the subfixture
---@field dmx_channel MAHandle Handle to the DMX channel

--------------------------------------------------------------------------------
-- Phaser types
--------------------------------------------------------------------------------

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
-- List API appearance types
--------------------------------------------------------------------------------

---@class AppearanceData
---@field icon? string Icon name
---@field color? string Color string
---@field textColor? string Text color string

---@class ListItemAppearance
---@field left? AppearanceData Left side appearance
---@field right? AppearanceData Right side appearance

--------------------------------------------------------------------------------
-- Grid API types
--------------------------------------------------------------------------------

---@class GridCell
---@field r integer Row index
---@field c integer Column index

---@class GridCellExtended
---@field r integer Row index
---@field c integer Column index
---@field r_UniqueId integer Row unique ID
---@field r_GroupId integer Row group ID
---@field c_UniqueId integer Column unique ID
---@field c_GroupId integer Column group ID

---@class GridScrollOffset
---@field v {index: integer, offset: integer} Vertical scroll info
---@field h {index: integer, offset: integer} Horizontal scroll info

---@class GridScrollInfo
---@field index integer Current scroll index (1-based)
---@field offset integer Current scroll offset
---@field visibleArea integer Visible area size
---@field totalArea integer Total area size
---@field itemsCount integer Total number of items
---@field itemsOnPage integer Number of items visible on one page
