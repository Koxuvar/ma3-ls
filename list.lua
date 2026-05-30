---@meta

-- grandMA3 List API
-- Functions for interacting with grandMA3 list UI objects.
-- Types (AppearanceData, ListItemAppearance) are defined in types.lua.

--- Adds a string item to a list UI object.
---@param handle MAHandle Handle to the list UI object
---@param name string Display name of the item
---@param value string Value of the item
---@param appearance? ListItemAppearance Optional appearance table
---@return nil
function AddListStringItem(handle, name, value, appearance) end

--- Adds a property item to a list UI object, bound to a target handle's property.
---@param handle MAHandle Handle to the list UI object
---@param name string Display name of the item
---@param value string Property name string
---@param targetHandle MAHandle Handle to the target object whose property this binds to
---@param appearance? ListItemAppearance Optional appearance table
---@return nil
function AddListPropertyItem(handle, name, value, targetHandle, appearance) end

--- Adds a numeric item to a list UI object.
---@param handle MAHandle Handle to the list UI object
---@param name string Display name of the item
---@param value number Numeric value
---@param baseHandle? MAHandle Optional base handle
---@param appearance? ListItemAppearance Optional appearance table
---@return nil
function AddListNumericItem(handle, name, value, baseHandle, appearance) end

--- Adds a Lua callback item to a list UI object.
---@param handle MAHandle Handle to the list UI object
---@param name string Display name of the item
---@param value string Value string or function name
---@param callback function Callback function reference
---@param callbackArg? any Optional argument passed to the callback
---@param appearance? ListItemAppearance Optional appearance table
---@return nil
function AddListLuaItem(handle, name, value, callback, callbackArg, appearance) end

--- Adds an object item to a list UI object.
---@param handle MAHandle Handle to the list UI object
---@param targetObject MAHandle Handle to the target object
---@param nameOrRole? string|integer Explicit name string or Enums.Roles role integer
---@param appearance? ListItemAppearance|boolean Optional appearance or extended name flag
---@return nil
function AddListObjectItem(handle, targetObject, nameOrRole, appearance) end

--- Adds multiple string items to a list UI object in a single call.
---@param handle MAHandle Handle to the list UI object
---@param items table Array of {name, value} tables
---@return nil
function AddListStringItems(handle, items) end

--- Adds multiple property items to a list UI object in a single call.
---@param handle MAHandle Handle to the list UI object
---@param items table Array of {name, propertyName, targetHandle} tables
---@return nil
function AddListPropertyItems(handle, items) end

--- Adds multiple numeric items to a list UI object in a single call.
---@param handle MAHandle Handle to the list UI object
---@param items table Array of {name, value} tables
---@return nil
function AddListNumericItems(handle, items) end

--- Adds multiple Lua callback items to a list UI object in a single call.
---@param handle MAHandle Handle to the list UI object
---@param items table Array of {name, value, callbackRef[, callbackArg]} tables
---@return nil
function AddListLuaItems(handle, items) end

--- Adds all children of a parent object as items to a list UI object.
---@param handle MAHandle Handle to the list UI object
---@param parent MAHandle Handle to the parent object
---@param role? integer Optional Enums.Roles role integer for display
---@return nil
function AddListChildren(handle, parent, role) end

--- Adds the names of all children of a parent object as items to a list UI object.
---@param handle MAHandle Handle to the list UI object
---@param parent MAHandle Handle to the parent object
---@param role? integer Optional Enums.Roles role integer for display
---@return nil
function AddListChildrenNames(handle, parent, role) end

--- Adds the names of all children recursively to a list UI object.
---@param handle MAHandle Handle to the list UI object
---@param parent MAHandle Handle to the parent object
---@param role? integer Optional Enums.Roles role integer for display
---@return nil
function AddListRecursiveNames(handle, parent, role) end

--- Removes a list item by name.
---@param handle MAHandle Handle to the list UI object
---@param name string Name of the item to remove
---@return nil
function RemoveListItem(handle, name) end

--- Removes all items from a list UI object.
---@param handle MAHandle Handle to the list UI object
---@return nil
function ClearList(handle) end

--- Selects a list item by its name value.
---@param handle MAHandle Handle to the list UI object
---@param nameValue string Name value to select
---@return nil
function SelectListItemByName(handle, nameValue) end

--- Selects a list item by its value string.
---@param handle MAHandle Handle to the list UI object
---@param value string Value to select
---@return nil
function SelectListItemByValue(handle, value) end

--- Selects a list item by its 1-based index.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item to select
---@return nil
function SelectListItemByIndex(handle, index) end

--- Returns whether the list item at the given index is enabled.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@return boolean enabled True if the item is enabled
function IsListItemEnabled(handle, index) end

--- Enables or disables the list item at the given index.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@param enable? boolean True to enable, false to disable (default: true)
---@return nil
function SetEnabledListItem(handle, index, enable) end

--- Returns whether the list item at the given index is empty.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@return boolean empty True if the item is empty
function IsListItemEmpty(handle, index) end

--- Sets the empty state of the list item at the given index.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@param empty? boolean True to mark empty (default: true)
---@return nil
function SetEmptyListItem(handle, index, empty) end

--- Returns the value string of the list item at the given index.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@return string value Value string of the item
function GetListItemValueStr(handle, index) end

--- Sets the value string of the list item at the given index.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@param value string New value string
---@return nil
function SetListItemValueStr(handle, index, value) end

--- Returns the integer value of the list item at the given index.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@return integer value Integer value of the item
function GetListItemValueI64(handle, index) end

--- Returns the display name of the list item at the given index.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@return string name Display name of the item
function GetListItemName(handle, index) end

--- Sets the display name of the list item at the given index.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@param name string New display name
---@return nil
function SetListItemName(handle, index, name) end

--- Returns the appearance table for the list item at the given index.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@return ListItemAppearance appearance Appearance table with left and right fields
function GetListItemAppearance(handle, index) end

--- Sets the appearance of the list item at the given index.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@param appearance ListItemAppearance Appearance table with optional left and right fields
---@return nil
function SetListItemAppearance(handle, index, appearance) end

--- Returns the additional info string for the list item at the given index.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@return string value Additional info string
function GetListItemAdditionalInfo(handle, index) end

--- Sets the additional info string for the list item at the given index.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@param value string New additional info string
---@return nil
function SetListItemAdditionalInfo(handle, index, value) end

--- Returns the button handle for the list item at the given index, or nil if not visible.
---@param handle MAHandle Handle to the list UI object
---@param index integer 1-based index of the item
---@return MAHandle|nil button Handle to the button, or nil if not visible
function GetListItemButton(handle, index) end

--- Returns the 1-based index of the currently selected list item.
---@param handle MAHandle Handle to the list UI object
---@return integer index 1-based index of the selected item
function GetListSelectedItemIndex(handle) end

--- Returns the total number of items in the list.
---@param handle MAHandle Handle to the list UI object
---@return integer count Number of items in the list
function GetListItemsCount(handle) end

--- Finds the 1-based index of the first item with the matching value string.
---@param handle MAHandle Handle to the list UI object
---@param value string Value string to search for
---@return integer index 1-based index of the found item
function FindListItemByValueStr(handle, value) end

--- Finds the 1-based index of the first item with the matching name.
---@param handle MAHandle Handle to the list UI object
---@param name string Name to search for
---@return integer index 1-based index of the found item
function FindListItemByName(handle, name) end

--- Sets the maximum character length for a list input field.
---@param handle MAHandle Handle to the input UI object
---@param length integer Maximum character length
---@return nil
function InputSetMaxLength(handle, length) end
