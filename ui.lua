---@meta

-- grandMA3 UI / Overlay / Scroll API
-- Functions for interacting with grandMA3 UI objects, overlays, and scroll containers.
-- Types are defined in types.lua.

--------------------------------------------------------------------------------
-- UI Object functions
--------------------------------------------------------------------------------

--- Returns the overlay handle associated with a UI object.
---@param handle MAHandle Handle to a UI object
---@return MAHandle overlay Handle to the overlay
function GetOverlay(handle) end

--- Returns the display handle containing a UI object.
---@param handle MAHandle Handle to a UI object
---@return MAHandle display Handle to the display
function GetDisplay(handle) end

--- Returns the display index of the display containing a UI object.
---@param handle MAHandle Handle to a UI object
---@return integer displayIndex Display index integer
function GetDisplayIndex(handle) end

--- Returns the screen handle containing a UI object.
---@param handle MAHandle Handle to a UI object
---@return MAHandle screen Handle to the screen
function GetScreen(handle) end

--- Returns the number of UI children of a UI object.
---@param handle MAHandle Handle to a UI object
---@return integer count Number of UI children
function GetUIChildrenCount(handle) end

--- Removes all UI children from a UI object.
---@param handle MAHandle Handle to a UI object
---@return nil
function ClearUIChildren(handle) end

--- Returns the UI child at the given 1-based index.
---@param handle MAHandle Handle to a UI object
---@param index integer 1-based child index
---@return MAHandle child Handle to the child UI object
function GetUIChild(handle, index) end

--- Returns a table of all UI child handles for a UI object.
---@param handle MAHandle Handle to a UI object
---@return MAHandle[] children Table of child UI object handles
function UIChildren(handle) end

--- Waits for a UI object to initialize, blocking until ready or timeout.
---@param handle MAHandle Handle to a UI object
---@param timeout? number Seconds to wait (default: indefinite)
---@param forceReinit? boolean If true, forces re-initialization (default: false)
---@return boolean|nil result True on success, nil on timeout or if object doesn't exist
function WaitInit(handle, timeout, forceReinit) end

--- Waits for a UI object to have the expected number of children.
---@param handle MAHandle Handle to a UI object
---@param expectedCount integer Expected number of children
---@param timeout? number Seconds to wait (default: indefinite)
---@return boolean|nil result True on success, nil on timeout
function WaitChildren(handle, expectedCount, timeout) end

--- Registers a callback that fires when a UI object is deleted.
---@param handle MAHandle Handle to a UI object
---@param callback function Callback function to invoke on deletion
---@param arg? any Optional argument passed to the callback
---@return boolean|nil result True on success, nil on failure
function HookDelete(handle, callback, arg) end

--- Returns whether a UI object is currently visible.
---@param handle MAHandle Handle to a UI object
---@return boolean visible True if the object is visible
function IsVisible(handle) end

--- Returns whether a UI object is currently enabled.
---@param handle MAHandle Handle to a UI object
---@return boolean enabled True if the object is enabled
function IsEnabled(handle) end

--- Shows a modal overlay and calls the callback when it closes.
---@param handle MAHandle Handle to the overlay to show
---@param callback function Function called when the modal closes
---@return nil
function ShowModal(handle, callback) end

--- Sets a position hint for a UI object.
---@param handle MAHandle Handle to a UI object
---@param x integer X position hint
---@param y integer Y position hint
---@return nil
function SetPositionHint(handle, x, y) end

--- Sets the context-sensitive help link topic for a UI object.
---@param handle MAHandle Handle to a UI object
---@param topicName string Help topic name string
---@return nil
function SetContextSensHelpLink(handle, topicName) end

--------------------------------------------------------------------------------
-- Overlay
--------------------------------------------------------------------------------

--- Sets a callback function that fires when the overlay is closed.
---@param handle MAHandle Handle to the overlay
---@param callbackName string Name of the callback function
---@param ctx? any Optional context argument passed to the callback
---@return nil
function OverlaySetCloseCallback(handle, callbackName, ctx) end

--------------------------------------------------------------------------------
-- Scroll
--------------------------------------------------------------------------------

--- Returns whether scrolling of the given type is needed for a UI object.
---@param handle MAHandle Handle to a scrollable UI object
---@param scrollType integer Scroll type enum value (ScrollType)
---@return boolean needed True if scroll of the requested type is needed
function ScrollIsNeeded(handle, scrollType) end

--- Performs a scroll operation on a UI object.
---@param handle MAHandle Handle to a scrollable UI object
---@param scrollType integer Scroll type enum (ScrollType)
---@param entity integer Scroll entity enum (ScrollParamEntity) — item or area
---@param valueType integer Value type enum (ScrollParamValueType) — absolute or relative
---@param value number Value to scroll to (items are 1-based)
---@param updateOpposite boolean Whether to update the opposite scroll axis
---@return boolean success True if the scroll was performed
function ScrollDo(handle, scrollType, entity, valueType, value, updateOpposite) end

--- Returns scroll state information for a UI object.
---@param handle MAHandle Handle to a scrollable UI object
---@param scrollType integer Scroll type enum (ScrollType)
---@return GridScrollInfo|nil info Scroll info table, or nil if not scrollable
function ScrollGetInfo(handle, scrollType) end

--- Returns the pixel size of a scroll item at the given 1-based index.
---@param handle MAHandle Handle to a scrollable UI object
---@param scrollType integer Scroll type enum (ScrollType)
---@param itemIndex integer 1-based item index
---@return integer|nil size Size in pixels, or nil if not available
function ScrollGetItemSize(handle, scrollType, itemIndex) end

--- Returns the pixel offset of a scroll item at the given 1-based index.
---@param handle MAHandle Handle to a scrollable UI object
---@param scrollType integer Scroll type enum (ScrollType)
---@param itemIndex integer 1-based item index
---@return integer|nil offset Offset in pixels, or nil if not available
function ScrollGetItemOffset(handle, scrollType, itemIndex) end

--- Returns the 1-based item index at the given pixel offset.
---@param handle MAHandle Handle to a scrollable UI object
---@param scrollType integer Scroll type enum (ScrollType)
---@param offset integer Pixel offset to look up
---@return integer itemIndex 1-based index of the item at that offset
function ScrollGetItemByOffset(handle, scrollType, offset) end

--------------------------------------------------------------------------------
-- UILayoutGrid
--------------------------------------------------------------------------------

--- Returns the pixel width of a column in a UILayoutGrid.
---@param handle MAHandle Handle to a UILayoutGrid
---@param index integer Column index
---@return integer width Column width in pixels
function UILGGetColumnWidth(handle, index) end

--- Returns the pixel height of a row in a UILayoutGrid.
---@param handle MAHandle Handle to a UILayoutGrid
---@param index integer Row index
---@return integer height Row height in pixels
function UILGGetRowHeight(handle, index) end

--- Returns the absolute left X position of a column in a UILayoutGrid.
---@param handle MAHandle Handle to a UILayoutGrid
---@param index integer Column index
---@return integer x Left X position in pixels
function UILGGetColumnAbsXLeft(handle, index) end

--- Returns the absolute right X position of a column in a UILayoutGrid.
---@param handle MAHandle Handle to a UILayoutGrid
---@param index integer Column index
---@return integer x Right X position in pixels
function UILGGetColumnAbsXRight(handle, index) end

--- Returns the absolute top Y position of a row in a UILayoutGrid.
---@param handle MAHandle Handle to a UILayoutGrid
---@param index integer Row index
---@return integer y Top Y position in pixels
function UILGGetRowAbsYTop(handle, index) end

--- Returns the absolute bottom Y position of a row in a UILayoutGrid.
---@param handle MAHandle Handle to a UILayoutGrid
---@param index integer Row index
---@return integer y Bottom Y position in pixels
function UILGGetRowAbsYBottom(handle, index) end
