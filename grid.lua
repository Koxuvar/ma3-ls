---@meta

-- grandMA3 Grid API
-- Functions for interacting with grandMA3 UIGrid objects and derived types.
-- Types (GridCell, GridCellExtended, GridScrollOffset, GridScrollInfo) are defined in types.lua.

--- Returns the GridBase handle for a UIGrid.
---@param handle MAHandle Handle to a UIGrid or derived object
---@return MAHandle base Handle to the GridBase
function GridGetBase(handle) end

--- Returns the GridData handle for a UIGrid.
---@param handle MAHandle Handle to a UIGrid or derived object
---@return MAHandle data Handle to the GridData
function GridGetData(handle) end

--- Returns the GridSelection handle for a UIGrid.
---@param handle MAHandle Handle to a UIGrid or derived object
---@return MAHandle selection Handle to the GridSelection
function GridGetSelection(handle) end

--- Moves the current selection in the grid by the given x and y delta.
---@param handle MAHandle Handle to a UIGrid or derived object
---@param x integer Horizontal delta
---@param y integer Vertical delta
---@return nil
function GridMoveSelection(handle, x, y) end

--- Returns an array of all currently selected cells with their row/column IDs.
---@param handle MAHandle Handle to a UIGrid or derived object
---@return GridCellExtended[] cells Array of selected cell descriptors
function GridGetSelectedCells(handle) end

--- Returns the GridSettings handle for a UIGrid.
---@param handle MAHandle Handle to a UIGrid or derived object
---@return MAHandle settings Handle to the GridSettings
function GridGetSettings(handle) end

--- Returns the total row and column dimensions of the grid.
---@param handle MAHandle Handle to a UIGrid or derived object
---@return {r: integer, c: integer} dimensions Table with r (rows) and c (columns) fields
function GridGetDimensions(handle) end

--- Returns the current scroll offset for both axes.
---@param handle MAHandle Handle to a UIGrid or derived object
---@return GridScrollOffset offset Table with v and h scroll info
function GridGetScrollOffset(handle) end

--- Sets the pixel width of a column by its column ID.
---@param handle MAHandle Handle to a UIGrid or derived object
---@param columnId integer Column ID
---@param size integer Width in pixels
---@return nil
function GridSetColumnSize(handle, columnId, size) end

--- Returns the currently scrolled-to cell position.
---@param handle MAHandle Handle to a UIGrid or derived object
---@return GridCell cell Table with r and c fields
function GridGetScrollCell(handle) end

--- Returns the text and color data for a specific cell.
---@param handle MAHandle Handle to a UIGrid or derived object
---@param cell GridCell Table with r and c fields
---@return {text: string, color: {text: string, back: string}} data Cell data table
function GridGetCellData(handle, cell) end

--- Returns whether the specified cell is currently visible.
---@param handle MAHandle Handle to a UIGrid or derived object
---@param cell GridCell Table with r and c fields
---@return boolean visible True if the cell is visible
function GridIsCellVisible(handle, cell) end

--- Returns whether the specified cell exists in the grid.
---@param handle MAHandle Handle to a UIGrid or derived object
---@param cell GridCell Table with r and c fields
---@return boolean exists True if the cell exists
function GridCellExists(handle, cell) end

--- Returns whether the specified cell is read-only.
---@param handle MAHandle Handle to a UIGrid or derived object
---@param cell GridCell Table with r and c fields
---@return boolean readOnly True if the cell is read-only
function GridIsCellReadOnly(handle, cell) end

--- Scrolls the grid to make the specified cell visible.
---@param handle MAHandle Handle to a UIGrid or derived object
---@param cell GridCell Table with r and c fields
---@return nil
function GridScrollCellIntoView(handle, cell) end

--- Returns the pixel dimensions and position of a specific cell.
---@param handle MAHandle Handle to a UIGrid or derived object
---@param cell GridCell Table with r and c fields
---@return {x: integer, y: integer, w: integer, h: integer} dimensions Cell position and size
function GridGetCellDimensions(handle, cell) end

--- Returns the parent row ID of the given row, or nil if the row has no parent.
---@param handle MAHandle Handle to a UIGrid or derived object
---@param rowId integer Row ID to find the parent of
---@return integer|nil parentRowId Parent row ID, or nil if no parent
function GridGetParentRowId(handle, rowId) end

--- Returns the expand header cell position, or nil if there is none.
---@param handle MAHandle Handle to a UIGrid or derived object
---@return GridCell|nil cell Expand header cell position, or nil
function GridsGetExpandHeaderCell(handle) end

--- Returns the state of the expand header cell, or nil if there is none.
---@param handle MAHandle Handle to a UIGrid or derived object
---@return boolean|nil state Expand header cell state, or nil
function GridsGetExpandHeaderCellState(handle) end

--- Returns the level button width for the specified cell in pixels, or nil if not applicable.
---@param handle MAHandle Handle to a UIGrid or derived object
---@param cell GridCell Table with r and c fields
---@return integer|nil width Width in pixels, or nil
function GridsGetLevelButtonWidth(handle, cell) end

--- Returns the visible column index for a given column ID, or nil if not visible.
---@param handle MAHandle Handle to a UIGrid or derived object
---@param columnId integer Column ID to look up
---@return integer|nil columnIndex Visible column index, or nil if not visible
function GridsGetColumnById(handle, columnId) end

--- Returns the visible row index for a given row ID, or nil if not visible.
---@param handle MAHandle Handle to a UIGrid or derived object
---@param rowId integer Row ID to look up
---@return integer|nil rowIndex Visible row index, or nil if not visible
function GridsGetRowById(handle, rowId) end

--- Returns whether the specified cell has extended mode dots.
---@param handle MAHandle Handle to a UIGrid or derived object
---@param cell GridCell Table with r and c fields
---@return boolean hasDots True if the cell has extended mode dots
function FSExtendedModeHasDots(handle, cell) end
