# grandMA3 Lua Definitions

Do you write Lua plugins for grandMA3? 

Do you hate that the second you open a code editor you're flying completely blind, no completions, no hints, no idea what `ObjectList` actually takes as arguments without alt-tabbing to the manual every five seconds?

Yeah, me too. So I fixed it.(maybe used claude to write the docs cuz that sucks.)

A set of [LuaLS](https://github.com/LuaLS/lua-language-server) type definition stubs for the grandMA3 Lua API. Drop it in your editor config and get completions, hover docs, and signature hints without touching the console.

---

## What's in the box

- **`types.lua`** - All shared types: `MAHandle`, fader tokens, phaser data, grid/list types, everything
- **`object_free.lua`** - All 136+ object-free globals (`Cmd`, `Printf`, `ObjectList`, `SelectedSequence`, etc.)
- **`object_api.lua`** - All methods callable on `MAHandle` (`Addr`, `Children`, `SetFader`, `Create`, etc.)
- **`list_api.lua`** - List UI functions (`AddListStringItem`, `GetListItemName`, etc.)
- **`grid_api.lua`** - Grid UI functions (`GridGetSelectedCells`, `GridScrollCellIntoView`, etc.)
- **`ui_api.lua`** - UI/Overlay/Scroll functions (`WaitInit`, `ScrollDo`, `UIChildren`, etc.)

Generated from the grandMA3 User Manual v2.3 and the official API dump from the console.
You can check that out for yourself if you want with the keyword `HelpLua`. It puts a text file in the library folder somewhere only god knows on your drive or pc or something.


---

## Setup

<details>
<summary><strong>Neovim</strong></summary>

Add the path to this repo to your `lua_ls` workspace library. Make sure it goes in your `on_init` block, not just `settings`, or it'll get overwritten:

```lua
require('lspconfig').lua_ls.setup({
  on_init = function(client)
    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = { version = "LuaJIT" },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          "/path/to/this/repo",
        }
      }
    })
  end,
})
```

</details>

<details>
<summary><strong>VS Code</strong></summary>

Install the [Lua extension by sumneko](https://marketplace.visualstudio.com/items?itemName=sumneko.lua), then add to your `settings.json`:

```json
{
  "Lua.workspace.library": [
    "C:\\path\\to\\this\\repo"
  ]
}
```

Paths need to be absolute.

</details>

<details>
<summary><strong>Any other editor running LuaLS</strong></summary>

Find wherever you configure `workspace.library` and add the absolute path to this repo. Works the same way regardless of editor.

</details>

To be honest if your thing aint above, it probably still works, just ask like claude or gpt how to install a lua_ls add on.

---

## Usage

```lua
-- completions and signature hints on all object-free globals
local result = Cmd("Go+ Sequence 1")
local cues = ObjectList("Sequence 1 Cue 1 Thru 10")

-- full method completions on any handle
local seq = SelectedSequence()
seq:SetFader({ value = 100.0, token = "FaderMaster" })
Printf("Address: " .. seq:Addr())
Printf("Cue count: " .. seq:Count())

-- hover over anything you're not sure about
local cue = seq:Ptr(1)
```

If you have a variable that'll hold a handle at runtime but LuaLS can't infer it statically, cast it:

```lua
---@type MAHandle
local handle = {}
handle:Children()  -- completions work now
```

---

## Notes

MALighting doesn't expose a runtime Lua environment to external tools, so this is static only. No show-file awareness in terms of cool stuff like idk what a light is doing, just the API surface.

`MAHandle` is a flat type representing the `light_userdata` that underpins the MA3 object model. MA3 doesn't expose separate classes per object type, so one class covers everything.

Both call styles are stubbed: `handle:Method()` and `Method(handle, ...)`.

---

## Contributing

If you find a wrong signature, a missing function, or something that changed in a newer version, PRs are welcome. Source of truth is the [grandMA3 User Manual](https://help2.malighting.com/Page/grandMA3/lua_object_free_api/en/) and the API dump you can pull straight from the console with `GetApiDescriptor()` and `GetObjApiDescriptor()`.
