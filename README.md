# grandMA3 Lua API Definitions

LuaLS type definitions for the grandMA3 Lua plugin API. Provides completions, hover documentation, signature hints, and type checking for both the Object-Free and Object APIs — in Neovim, VS Code, or any editor running the [Lua Language Server](https://github.com/LuaLS/lua-language-server).

## What's included

- **`types.lua`** — Core types: `MAHandle`, fader tokens, and all shared table types
- **`object_free.lua`** — All 136 object-free functions (`Cmd`, `Printf`, `ObjectList`, etc.)
- **`object_api.lua`** — All 20 object methods callable on `MAHandle` (`Addr`, `Children`, `SetFader`, etc.)

Based on the grandMA3 User Manual v2.3.

## Setup

### Neovim

Add the path to this repo to your `lua_ls` workspace library. In your LSP config:

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

### VS Code

Install the [Lua extension by sumneko](https://marketplace.visualstudio.com/items?itemName=sumneko.lua), then add to your `settings.json`:

```json
{
  "Lua.workspace.library": [
    "C:\\path\\to\\this\\repo"
  ]
}
```

## Usage

Once configured, you get completions and hover docs on all MA3 globals:

```lua
-- Completions and signature hints on object-free functions
local result = Cmd("Go+ Sequence 1")
local cues = ObjectList("Sequence 1 Cue 1 Thru 10")

-- Full method completions on handles
local seq = SelectedSequence()
seq:SetFader({ value = 100.0, token = "FaderMaster" })
local addr = seq:Addr()

-- Type-cast for variables that come from light_userdata at runtime
---@type MAHandle
local handle = {}
handle:Children()
```

## Notes

- grandMA3 does not expose a runtime Lua environment for external tooling — this is a static API definition only. There is no dynamic show-file awareness.
- `MAHandle` represents the `light_userdata` type used throughout the MA3 API. All object methods are available on any handle regardless of what object it points to — MA3 does not expose distinct classes per object type.
- The `---@type MAHandle` cast shown above is useful when you need completions on a variable that will hold a handle at runtime but can't be typed statically.

## Contributing

If you find missing functions, incorrect signatures, or outdated docs, PRs are welcome. The source of truth is the [grandMA3 User Manual](https://help2.malighting.com/Page/grandMA3/lua_object_free_api/en/).
