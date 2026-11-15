# Neovim configuration provenance and migration notes

Audited on 2026-11-14 against local dotfiles commit
`2fe01b2b88675f0d57797cad6f7caab24e4bbbca`.

This records the examples behind the configuration, the local changes layered
on them, and behavior to preserve during upgrades. It covers the Treesitter
migration under discussion, the completed scrollbar v2 migration, and the
Markdown checkbox convention. Pending migrations are distinguished from applied
settings.

## Evidence and status

| Component | Current configuration | Migration status |
| --- | --- | --- |
| Treesitter | `main` with curated parsers, LaTeX exclusion and native selection keys | Customizations applied after the template pass; installed checkout/parser updates remain pending |
| Treesitter textobjects | Separate `main` spec with restored options and buffer-local editing keys | Customizations applied; mapping precedence checked headlessly |
| Yati | Disabled; standard Treesitter indentation is the current trial, including Python | A compatible Yati port or another Python indenter remains an alternative |
| Scrollbar | `refactor/v2`, native named marks and search | Applied in local commit `2fe01b2` |
| hlslens | Independent `opts = {}` setup | Old scrollbar adapter removed in `2fe01b2` |
| render-markdown | Eleven Minimal-style checkbox meanings and custom glyphs | Applied in `05918d9`; retain during Treesitter work |

Concrete replacement examples and their local overlays are saved under
[New templates and intended overlays](#new-templates-and-intended-overlays).
The later decision to retire unused `grc` scope selection is recorded there;
the indentation replacement remains open.

Evidence labels used below:

- **Verified local history:** the setting and its introduction are visible in
  this repository's commits. This establishes adoption here, not original
  authorship of every line.
- **Verified source match:** an upstream snippet or versioned document was
  inspected and compared with the local configuration.
- **Inferred example ancestry:** the configuration matches documented examples,
  but the exact historical document copied has not been established.
- **Date-matched candidate:** an upstream revision selected by commit date;
  the historical document at that revision still needs inspection.
- **Proposal:** discussed migration behavior, not an established preference or
  an applied change.

Dates in the timelines are local Git committer dates, unless noted otherwise.
Commit IDs can be inspected with `git show <id>`. The latest local commit may
not yet be available on the remote.

## Treesitter and textobjects

Configurations: [Treesitter plugin spec](../nvim/.config/nvim/lua/plugins/_nvim_treesitter.lua)
and [textobjects spec](../nvim/.config/nvim/lua/plugins/_nvim_treesitter_textobjects.lua).

### Historical source candidates

Treesitter was introduced in local commit `51e256f` on
2021-02-19 at 01:44:54 -08:00, or `2021-02-19T09:44:54Z`. Its Packer
declarations did not pin either Treesitter repository to a revision. The
original local configuration was 67 lines.

Using the latest commit reachable from each locally cached upstream `master`
whose committer timestamp precedes that adoption time gives these candidates:

| Upstream | Candidate revision | Commit timestamp |
| --- | --- | --- |
| nvim-treesitter | [`5757f8a50d5d26b8c184b3a51713db763cdd9702`](https://github.com/nvim-treesitter/nvim-treesitter/blob/5757f8a50d5d26b8c184b3a51713db763cdd9702/README.md) | 2021-02-17 14:43:32 +01:00 |
| nvim-treesitter-textobjects | [`b0f6d2c91b46faecee8b44f426de4b40d8ec8494`](https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/b0f6d2c91b46faecee8b44f426de4b40d8ec8494/README.md) | 2021-02-14 23:31:21 UTC |

These are **date-matched candidates**, not proven installed versions or proven
copy sources. The local upstream repositories retain commit history but are
blob-filtered partial clones. These historical README blobs were not cached,
and neither the attempted Git fetch nor the web fetch retrieved them during
this audit. Do not describe the reconstruction below as a verbatim comparison
with those 2021 READMEs until that gap is closed.

The inspected [legacy Treesitter README](https://github.com/nvim-treesitter/nvim-treesitter/blob/master/README.md)
and [legacy textobjects README](https://github.com/nvim-treesitter/nvim-treesitter-textobjects/tree/master)
corroborate the example-style selection and movement bindings. Their moving
branch URLs are corroboration, not substitutes for historical snapshots.

### Reconstructed common example layer

This is a comparison model using settings present in the initial local commit
and the documented legacy example patterns. It is not a runnable replacement
for Neovim 0.12 and is not asserted to be one exact upstream template. Textobject
swapping is kept in the personal layer below because the local swap keys already
differed from the later inspected README example.

```lua
local baseline = {
  ensure_installed = "all",
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
}
```

### Local layer and settled behavior before migration

The following expresses the final legacy configuration as changes on that
baseline. `parser_allowlist` denotes the exact list in the appendix, rather than
a new empty list. This is explanatory legacy code, not an upgrade patch.

```lua
baseline.ensure_installed = parser_allowlist
baseline.highlight.disable = { "latex" }

local use_yati = _G.plugin_loaded("nvim-yati")
baseline.indent = {
  enable = not use_yati,
  disable = { "python" },
}
baseline.yati = {
  enable = use_yati,
  default_lazy = true,
  default_fallback = "auto",
}

baseline.textobjects.swap = {
  enable = true,
  swap_next = {
    ["g>>"] = "@parameter.inner",
    ["g>f"] = "@function.outer",
    ["g>c"] = "@class.outer",
  },
  swap_previous = {
    ["g<<"] = "@parameter.inner",
    ["g<f"] = "@function.outer",
    ["g<c"] = "@class.outer",
  },
}
```

The Lua file also has the repository's Lazy plugin wrapper, a textobjects
dependency, `version = "*"`, and `build = ":TSUpdate"`. These are installation
and integration choices rather than additional editing features.

At the initial audit the legacy file had 412 lines, with 86 active parser names
and 217 names under `_ignore_install`. `_ignore_install` and
`_ensure_installed = "all"` are inactive bookkeeping: the prefixed keys do not
configure the normal `ignore_install` and `ensure_installed` options. The fold
settings at the end are comments, not active folding preferences.

### How the local layer evolved

All entries in this table are verified in local history. A commit subject
describes the author's intention at that time; it is not a claim that the same
upstream limitation persists today.

| Date | Local commit | Change |
| --- | --- | --- |
| 2021-02-19 | `51e256f` | Add the initial example-style configuration, including selection, navigation, and parameter/function swap keys |
| 2021-02-25 | `ba0f757` | Disable highlighting and Python indentation |
| 2021-06-15 / 2021-06-18 | `facaee1` / `0e8525f` | Disable JavaScript indentation, then Treesitter indentation generally |
| 2021-08-06 | `75dfb45` | Re-enable Treesitter highlighting |
| 2022-03-14 | `21ac888` | Restrict installation to maintained parsers |
| 2023-07-11 | `5a36771` | Re-enable Treesitter indentation |
| 2023-08-13 | `c13981b` | Exclude Python from that indenter and add `vim-python-pep8-indent`; subject records a preference for its Python indentation |
| 2023-10-22 | `19f7b9a` | Disable LaTeX Treesitter highlighting |
| 2024-08-27 | `b17c26c` | Introduce Yati, conditionally disable the standard Treesitter indenter, and disable `vim-python-pep8-indent` |
| 2025-01-14 / 2025-06-12 | `a243ea6`, `4bb8865`, `95ab1a3` | Maintain parser allow/ignore inventories |
| 2025-10-02 | `b9f91ed` | Add class swapping with `g>c` and `g<c` |
| 2025-10-02 | `4aaa052` | Activate the explicit allowlist and deactivate the old all/ignore strategy using underscored keys |

### Yati's versioned example and the Python distinction

Configuration: [Yati plugin spec](../nvim/.config/nvim/lua/plugins/_nvim_yati.lua).

The lockfile in adoption commit `b17c26c` records Yati revision
`df3dc06076c6fe20a1dcd8643e712af5c252d042`. Its
[README at that revision](https://github.com/yioneko/nvim-yati/blob/df3dc06076c6fe20a1dcd8643e712af5c252d042/README.md)
was successfully read from the local Git object database. This is a **verified
versioned source comparison**, stronger evidence than the unresolved 2021
README candidates.

| Setting | Versioned Yati example | Adopted local setup |
| --- | --- | --- |
| Enable Yati | `true` | Conditional on `_G.plugin_loaded("nvim-yati")` |
| Disable standard Treesitter indentation | Always | When Yati is enabled |
| Yati lazy mode | `true` | `true`, retained from the example |
| Yati fallback | `"auto"` | `"auto"`, retained from the example |
| Yati Python exclusion | `disable = { "python" }` | Python entry commented out; Yati includes Python |

The separate `indent.disable = { "python" }` applies to the standard
Treesitter indenter, not Yati. With that legacy Yati setup enabled, the standard
indenter was disabled altogether. Removing Yati and falling back to Python's
filetype indenter is therefore a behavior change, not a mechanical migration.
The disabled historical alternative is retained in
[vim-python-pep8-indent's spec](../nvim/.config/nvim/lua/plugins/disabled/_vim_python_pep8_indent.lua).

### Treesitter migration: preserve, replace, or decide

Neovim 0.12.6 was observed running with the legacy plugin and its old capture
directives. A fenced Markdown code block reproduced the reported `node:range()`
failure in isolation, without scrollbar, indent-o-matic, render-markdown, or
treesitter-context loaded. See the matching upstream
[issue 8636](https://github.com/nvim-treesitter/nvim-treesitter/issues/8636).

The [new Treesitter API](https://github.com/nvim-treesitter/nvim-treesitter#setup)
and [new textobjects API](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
require a coordinated migration. The conversation's proposed replacement
initially remained a proposal. The user subsequently requested a template-only
first commit, with relevant personal changes to be recovered afterward. That
configuration pass is recorded below, followed by the now-applied relevant
customizations. `grc` is retired as unused; disabling Yati permanently has not
been settled.

| Existing behavior | Migration requirement or pending choice |
| --- | --- |
| 86 selected parsers | Restore 83 listed parser names; JSONC uses JSON; record unavailable tmux/zathurarc instead of silently dropping them |
| Highlight parsed buffers except LaTeX | Restored with native highlighting and the LaTeX exclusion |
| `gnn`, `grn`, `grm` | Native parent/child selection applied; growth/shrink checked headlessly; count forwarded to the native API |
| `grc` scope expansion | Explicitly retire: unused, and only a scope-selection feature; it was not fixing indentation or highlighting |
| `af`, `if`, `ac`, `ic` | Restored with the standalone API as buffer-local mappings |
| Eight function/class navigation keys in the baseline | Restored; Python filetype mapping precedence checked; `set_jumps = true` retained |
| Six swap keys in the local layer | Restored for parameters, functions and classes in both directions |
| Yati, including Python | Yati remains disabled; standard Treesitter indentation is the current trial, not a claim of algorithmic parity |
| Yati lazy mode and `"auto"` fallback | Evaluate replacements rather than assuming the new indenter is identical |
| No active Treesitter folding configuration | Do not enable folding merely because it appears in a new example |
| Parser updates during plugin builds | Retain an update/install workflow compatible with the chosen branch |

The reviewed `main` README requires Neovim 0.12 or later and a tree-sitter CLI
of at least 0.26.1. No `tree-sitter` executable was found on the shell PATH
during this audit.
Disabling each consumer is not the underlying fix. After migration, retest
Markdown with fenced code through indent-o-matic, render-markdown, and
treesitter-context, as well as Python indentation and the mappings above.

## New templates and intended overlays

Templates saved on 2026-11-15. A subsequent request selected a template-only
first commit, followed by a separate pass restoring relevant customizations.
Both configuration passes are now applied. Yati remains disabled while the
standard Treesitter indenter is tried. The scrollbar and hlslens equivalents
were already applied in the earlier migration.

The template snippets combine the relevant upstream examples into smaller
examples; they are not verbatim copies of entire READMEs. The assembled local
configurations below preserve the applied differences. Their headless checks
are recorded separately from the pending full plugin/parser migration checks.

### First pass: template only

The first configuration change deliberately uses the three example languages
`rust`, `javascript`, and `zig`. It carries over neither the old parser
allowlist nor the LaTeX exclusion or incremental-selection mappings.

The separate textobjects spec combines the upstream installation example with
its function/class selection, function/class movement, and parameter-swap
examples. It uses `am` / `im`, `ac` / `ic`, the eight function/class movement
keys, and `<leader>a` / `<leader>A`. Lookahead and linewise function selection
follow the examples. The example's `vim.g.no_plugin_maps = true` prevents
built-in filetype mappings from shadowing the new global mappings. Optional
scope/loop/fold/conditional and repeat-motion examples are not included.

The lockfile now targets Treesitter `04f17886f75416dfdc25374c950a52c63f0e98fe`
and textobjects `5c7b0263797dfd1bd6202f2b219f3b53a80b2187`, matching the
locally cached `origin/main` refs inspected during this audit. This does not
mean the installed plugin checkouts or parsers have already been updated.
The required CLI was not found, so full runtime validation remains pending.

Local commit `ed1d685` contains only the two Treesitter specs, the Yati
disabling, and the lockfile changes. The personal layer, other plugins,
and unrelated working changes remain outside that commit. The old parser
inventory and bindings remain preserved above and in the appendix for later
recovery.

### Second pass: restore relevant customizations

The follow-up restores the curated parser inventory where supported, the LaTeX
highlighting exclusion, `gnn` / `grn` / `grm`, the four original textobject
selection keys, eight movements and six swaps. Selection stays characterwise
without lookahead or extra whitespace. Unused `grc` is retired. Yati stays
disabled because its legacy integration is incompatible with the new API;
standard Treesitter indentation, including Python, is the current trial.

Filetype activation is scheduled after built-in ftplugin/indent scripts.
Textobject mappings are buffer-local, so they take precedence over conflicting
built-in movements without globally disabling unrelated filetype mappings.
Already loaded buffers are also considered when these specs load.

The reviewed [main parser catalog](https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md)
lists 83 of the old 86 names. The exceptions remain commented in the install
list and preserved in full in the historical appendix:

| Old parser name | Migration treatment |
| --- | --- |
| `jsonc` | Use the existing `json` entry; upstream [filetype registration](https://github.com/nvim-treesitter/nvim-treesitter/blob/main/plugin/filetypes.lua) maps JSONC files to JSON |
| `tmux` | Not listed in the reviewed main catalog; leave deferred rather than inventing an unverified parser definition |
| `zathurarc` | Not listed in the reviewed main catalog; leave deferred rather than inventing an unverified parser definition |

Availability was checked against the moving upstream catalog on 2026-11-15.
The installed checkouts still need updating to the pinned revisions; verify the
actual installer results then. No new parser dependencies are added merely to
replace these two unavailable grammars.

Headless validation used real locally installed Lua/Python/LaTeX parsers while
isolating installer and textobjects setup calls. It checked native highlighting,
the LaTeX exclusion, selection growth/shrink, Python indentation precedence,
buffer-local mapping precedence, and unsupported-filetype guards. All plugin
specs passed Lua syntax checks. These checks do not exercise the new installer
or the new textobjects plugin's selection/movement/swap algorithms. Full
end-to-end validation still requires plugin/parser updates and the missing CLI.

### Source snapshots for the new templates

| Component | Inspected reference |
| --- | --- |
| Treesitter installer, highlighting and indentation | [README at `04f17886f75416dfdc25374c950a52c63f0e98fe`](https://github.com/nvim-treesitter/nvim-treesitter/blob/04f17886f75416dfdc25374c950a52c63f0e98fe/README.md), successfully retrieved during this update |
| Textobjects setup and explicit mapping API | [`main` README](https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/main/README.md), inspected on the date above; this URL can move |
| Actual textobjects defaults, as distinct from optional README examples | [Config at `5c7b0263797dfd1bd6202f2b219f3b53a80b2187`](https://github.com/nvim-treesitter/nvim-treesitter-textobjects/blob/5c7b0263797dfd1bd6202f2b219f3b53a80b2187/lua/nvim-treesitter-textobjects/config.lua), successfully retrieved during this update |
| Native node selection | Installed Neovim 0.12.6 `runtime/lua/vim/treesitter.lua`, `vim.treesitter.select(target, count)`; see also [the native API documentation](https://neovim.io/doc/user/treesitter/#vim.treesitter.select()) |
| Scrollbar v2 | [Migration guide at `577c488dc6f30cd0e2faa5eebe6e19f7d343181e`](https://github.com/petertriho/nvim-scrollbar/blob/577c488dc6f30cd0e2faa5eebe6e19f7d343181e/docs/migration.md), also present in the installed checkout |

The source revisions identify the examples inspected. The specs track branches
and the template commit records the target revisions in the lockfile; that is
separate from updating the installed checkouts and parsers.

### Treesitter: new template

This combines the new installer with explicit feature activation. The three
languages are upstream example languages, not our chosen parser inventory.

```lua
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false,
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup({})
    ts.install({ "rust", "javascript", "zig" })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "rust", "javascript", "zig" },
      callback = function(event)
        vim.treesitter.start(event.buf)
        vim.bo[event.buf].indentexpr =
          "v:lua.require'nvim-treesitter'.indentexpr()"
      end,
    })
  end,
}
```

`branch = "main"` and `version = false` explicitly select the rewritten API
instead of our old `version = "*"` policy. `lazy = false` and `:TSUpdate`
follow the installation guidance. No Treesitter folding is enabled.

### Treesitter: applied customizations

The assembled configuration restores the parser inventory subject to the three
recorded catalog exceptions, preserves the LaTeX exclusion, and uses native
selection. Its standard Treesitter indenter, including Python, remains a trial
while alternatives are considered below.

```lua
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false,
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")
    ts.setup({})
    ts.install {
      "asm",
      "bash",
      "bibtex",
      "c",
      "c_sharp",
      "cmake",
      "comment",
      "cpp",
      "css",
      "csv",
      "cuda",
      "d",
      "diff",
      "disassembly",
      "dockerfile",
      "doxygen",
      "editorconfig",
      "git_config",
      "git_rebase",
      "gitattributes",
      "gitcommit",
      "gitignore",
      "glsl",
      "go",
      "gpg",
      "graphql",
      "gstlaunch",
      "haskell",
      "hjson",
      "hlsl",
      "html",
      "htmldjango",
      "http",
      "ini",
      "java",
      "javascript",
      "jq",
      "jsdoc",
      "json",
      "json5",
      -- "jsonc", -- JSONC filetypes use the json parser on main.
      "jsonnet",
      "julia",
      "kotlin",
      "latex",
      "llvm",
      "lua",
      "luadoc",
      "luap",
      "make",
      "markdown",
      "markdown_inline",
      "matlab",
      "mermaid",
      "mlir",
      "nix",
      "objdump",
      "perl",
      "php",
      "php_only",
      "printf",
      "proto",
      "python",
      "query",
      "regex",
      "requirements",
      "rst",
      "ruby",
      "rust",
      "scss",
      "sql",
      "ssh_config",
      "strace",
      "svelte",
      -- "tmux", -- Not in the reviewed main parser catalog.
      "toml",
      "tsv",
      "tsx",
      "typescript",
      "udev",
      "vim",
      "vimdoc",
      "vue",
      "xml",
      "yaml",
      -- "zathurarc", -- Not in the reviewed main parser catalog.
    }

    local function attach(buf)
      if not vim.api.nvim_buf_is_loaded(buf) then
        return
      end
      local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
      if not lang or not vim.treesitter.get_parser(buf, lang) then
        return
      end

      if lang ~= "latex" and vim.treesitter.query.get(lang, "highlights") then
        vim.treesitter.start(buf, lang)
      end
      if vim.treesitter.query.get(lang, "indents") then
        vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
      end
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("DotfilesTreesitter", { clear = true }),
      callback = function(event)
        -- Run after filetype indent scripts have set their defaults.
        vim.schedule(function()
          attach(event.buf)
        end)
      end,
    })
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      vim.schedule(function()
        attach(buf)
      end)
    end

    vim.keymap.set("n", "gnn", function()
      vim.treesitter.select("parent", vim.v.count1)
    end)
    vim.keymap.set("x", "grn", function()
      vim.treesitter.select("parent", vim.v.count1)
    end)
    vim.keymap.set("x", "grm", function()
      vim.treesitter.select("child", vim.v.count1)
    end)
  end,
}
```

Installation is asynchronous. If a parser or query is not yet installed at
attachment time, reopen the buffer after installation. Automatic attachment
immediately after a first install is not provided by this configuration.
Native parent/child selection replaces the old selection module; it is not a
claim of identical node choice in every situation.

### Textobjects: new template and example choices

The new plugin uses its own setup call and explicit mappings. A compact setup
based on its README examples is:

```lua
require("nvim-treesitter-textobjects").setup({
  select = {
    lookahead = true,
    selection_modes = { ["@function.outer"] = "V" },
    include_surrounding_whitespace = false,
  },
  move = { set_jumps = true },
})
```

The mapping API is now `select.select_textobject(capture, "textobjects")`,
`move.goto_next_start(capture, "textobjects")` and its other directions, and
`swap.swap_next(capture)` / `swap.swap_previous(capture)`. These are functions
from `nvim-treesitter-textobjects.select`, `.move`, and `.swap` respectively.

| README example choice | Intended local overlay |
| --- | --- |
| `am` / `im` for functions | Keep `af` / `if` |
| `ac` / `ic` for classes | Keep those keys |
| Optional `lookahead = true` | Keep actual old/default behavior: `false` |
| Example function selection is linewise | Keep actual old/default characterwise behavior: empty `selection_modes` |
| `<leader>a` next inner parameter; `<leader>A` previous outer parameter | Keep `g>>` / `g<<`, both `@parameter.inner` |
| Function/class navigation examples | Keep all eight existing keys |
| Optional scope, loop, fold, conditional and repeat-motion examples | Do not add unused mappings merely because the README demonstrates them |
| Example globally disables built-in ftplugin mappings | Use buffer-local mappings after ftplugins run; preserve unrelated built-in filetype mappings |

The example's lookahead and linewise selection are optional choices, not the
plugin's defaults. Our old configuration did not enable them. The inspected
defaults are `lookahead = false`, `lookbehind = false`, an empty
`selection_modes`, no surrounding whitespace, and `set_jumps = true`.

### Textobjects: applied customizations

This restores four selections, eight movements and six swaps using the
standalone plugin API. Mappings attach only when the buffer has a parser and
textobject queries.

```lua
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/tree/main
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  version = false,

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },

  config = function()
    require("nvim-treesitter-textobjects").setup {
      select = {
        lookahead = false,
        lookbehind = false,
        selection_modes = {},
        include_surrounding_whitespace = false,
      },
      move = {
        set_jumps = true,
      },
    }

    local function attach(buf)
      if not vim.api.nvim_buf_is_loaded(buf) then
        return
      end
      local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)
      if not lang or not vim.treesitter.get_parser(buf, lang) then
        return
      end
      if not vim.treesitter.query.get(lang, "textobjects") then
        return
      end

      local function map(mode, key, callback)
        vim.keymap.set(mode, key, callback, { buffer = buf })
      end

      map({ "x", "o" }, "af", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
      end)
      map({ "x", "o" }, "if", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
      end)
      map({ "x", "o" }, "ac", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
      end)
      map({ "x", "o" }, "ic", function()
        require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
      end)

      map("n", "g>>", function()
        require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
      end)
      map("n", "g<<", function()
        require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
      end)
      map("n", "g>f", function()
        require("nvim-treesitter-textobjects.swap").swap_next("@function.outer")
      end)
      map("n", "g<f", function()
        require("nvim-treesitter-textobjects.swap").swap_previous("@function.outer")
      end)
      map("n", "g>c", function()
        require("nvim-treesitter-textobjects.swap").swap_next("@class.outer")
      end)
      map("n", "g<c", function()
        require("nvim-treesitter-textobjects.swap").swap_previous("@class.outer")
      end)

      map({ "n", "x", "o" }, "]m", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "]]", function()
        require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "]M", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "][", function()
        require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[m", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[[", function()
        require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[M", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects")
      end)
      map({ "n", "x", "o" }, "[]", function()
        require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects")
      end)
    end

    vim.api.nvim_create_autocmd("FileType", {
      group = vim.api.nvim_create_augroup("DotfilesTreesitterTextobjects", { clear = true }),
      callback = function(event)
        -- Buffer-local mappings take precedence after built-in ftplugins run.
        vim.schedule(function()
          attach(event.buf)
        end)
      end,
    })
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      vim.schedule(function()
        attach(buf)
      end)
    end
  end,
}
```

### Indentation: alternatives still under consideration

The applied configuration uses the first path as the current trial. The other
paths remain available if its editing behavior warrants changing it.

| Option | Concrete configuration consequence | Status |
| --- | --- | --- |
| New standard Treesitter indenter, including Python | Set the new `indentexpr`; disable the incompatible Yati plugin | Applied trial; attachment checked, algorithmic comparison with Yati still pending |
| Neovim's built-in Python indenter, Treesitter elsewhere | Add `lang ~= "python"` to the indentation condition and retain the normal Python filetype indenter | Available fallback; also a change from current Yati behavior |
| Dedicated Python indentation plugin | Reconsider the disabled `Vimjas/vim-python-pep8-indent` spec, checking present compatibility and behavior | Historical alternative, not a newly selected dependency |
| Retain Yati's indentation algorithm | Find and verify a maintained compatible port, or adapt its legacy module/config/parser integration | Requires investigation; not a branch-name or setup-call-only change |

For the standard-indenter trial, the companion Yati spec is:

```lua
return {
  "yioneko/nvim-yati",
  enabled = false,
}
```

This disabling is part of the current trial. The installed Yati version
uses the removed module API, so leaving it enabled is not a compatible way to
test the rewritten Treesitter plugin.

For built-in Python indentation instead, the condition in `attach` would become:

```lua
if lang ~= "python" and vim.treesitter.query.get(lang, "indents") then
  vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end
```

Keep the existing `vim.g.python_indent` settings in `config/options.lua` and
the four-space settings in `after/ftplugin/python.vim`. Those global Python
indent settings configure the built-in Python indenter; they do not establish
that Treesitter or Yati will behave identically. Indentation while editing is
also separate from formatter-on-save behavior.

Before settling the choice, compare multiline calls, nested parentheses,
closing delimiters, continuations, and ordinary blocks against current behavior.
The old Yati lazy mode and `"auto"` fallback remain part of the preservation
checklist if a Yati port is pursued.

## Scrollbar and hlslens

Configurations: [scrollbar](../nvim/.config/nvim/lua/plugins/_nvim_scrollbar.lua)
and [hlslens](../nvim/.config/nvim/lua/plugins/_nvim_hlslens.lua).

### Source and local changes before v2

The initial scrollbar setup in `227b5b0` (2022-03-14) was an empty setup call.
No exact external template is established for that boilerplate.

The named-mark handler has a much stronger source match:
[chrisgrieser's Custom Handler: Marks, discussion 65](https://github.com/petertriho/nvim-scrollbar/discussions/65),
posted 2022-11-15. It was added locally in `7fe2c49` on 2025-10-01. The user
also recognized having upvoted that snippet. Even the handler name
`marksmarks` matches the source.

| Detail | Posted snippet | Local handler |
| --- | --- | --- |
| Excluded letters | `"z"` | `""`; no active exclusions |
| Vim function namespace | `fn.getmarklist` | `vim.fn.getmarklist` |
| Empty-result workaround | Inserts a dummy mark | Dummy mark removed |
| `level` | `6` | `0` |
| Collection and labels | Buffer-local letter marks, one letter per emitted mark | Same |
| Marker type | `Info` | `Info` |

Neither snippet joins multiple mark names into one string. `level` is not the
collision priority: the maintainer explains its role in selecting text variants
in [discussion 62](https://github.com/petertriho/nvim-scrollbar/discussions/62).

Other local preferences and their history:

| Committed date | Commit | Preference |
| --- | --- | --- |
| 2022-03-14 | `1acab5e` | Handle color `#5C4561`; commit subject explains the color blend used to derive it |
| 2024-09-13 | `98b2245` | Configure hlslens through scrollbar when enabled, otherwise directly; no substantive lens options |
| 2025-02-21 | `741e064` | Enable scrollbar's Gitsigns integration |
| 2025-08-13 | `205d189` | Hide Info, Hint, and Misc glyphs; author date is 2025-08-01 |
| 2025-10-01 | `f8ca632` | Strengthen handle color to `#6C5571` |
| 2025-10-01 | `7fe2c49` | Add the adapted named-mark handler |

### Applied v2 migration and parity limits

Local commit `2fe01b2` on 2026-11-14 applied the migration and names discussion
65 in its commit message. The lockfile and installed checkout both identify
v2 revision `577c488dc6f30cd0e2faa5eebe6e19f7d343181e`.

The [announcement](https://github.com/petertriho/nvim-scrollbar/issues/121)
and [versioned migration guide](https://github.com/petertriho/nvim-scrollbar/blob/577c488dc6f30cd0e2faa5eebe6e19f7d343181e/docs/migration.md)
describe the upstream transition. As of this audit, the configuration explicitly
selects `refactor/v2`; switching that to `main` remains a follow-up after verifying
the announced upstream merge. Do not use the calendar alone as proof it merged.

| Old local choice | Applied v2 setting |
| --- | --- |
| `handle.color = "#6C5571"` | `scrollbar.thumb.highlight = { bg = "#6C5571" }` |
| Empty text glyphs for Info, Hint, Misc | These marker types set to `false` |
| Custom letters emitted as `Info` | Built-in `marks` provider emits `Mark` |
| Info-colored letters | `marks.Mark.highlight = "DiagnosticVirtualTextInfo"` |
| Gitsigns handler setup call | `providers.gitsigns = true` |
| hlslens-dependent scrollbar search | Native search provider; independent hlslens `opts = {}` |

The useful core of the custom mark handler is covered, but the result is not
identical in every detail. Reading the installed versioned
[marks provider](https://github.com/petertriho/nvim-scrollbar/blob/577c488dc6f30cd0e2faa5eebe6e19f7d343181e/lua/scrollbar/providers/marks.lua)
and its [documentation](https://github.com/petertriho/nvim-scrollbar/blob/577c488dc6f30cd0e2faa5eebe6e19f7d343181e/docs/providers/marks.md)
established these differences:

- The old handler collected only buffer-local marks. v2 includes lowercase
  local marks and uppercase global marks whose target is the current buffer.
  Numbered marks remain off by default. Special marks remain excluded.
- The old handler allowed arbitrary per-letter exclusions, though its list was
  empty. The built-in v2 options expose letter/number categories, not that
  per-letter exclusion string.
- Letter coloring is retained, but the type and collision priority change:
  old letters used `Info` (default priority 4), whereas v2 `Mark` defaults to
  priority 1. No explicit priority override was added during migration.
- v2 emits zero-based line positions. The copied handler passed the mark-list
  row directly. Do not transplant its position arithmetic into the new API.
- v2 supports an expanding `Mark` lane that can display multiple colliding
  names side by side. The applied configuration does not request `max_width`,
  so it retains ordinary collapsed rendering. This was not a feature of the
  old custom function.
- v2 uses floating windows, different refresh machinery, and native search.
  Retaining the old colors is not a claim of identical layout or search
  behavior. hlslens can still provide its own search lenses.

The global-mark and priority differences are recorded for review, not as
separately confirmed user preferences. The v2 handler does not need to be
reimplemented just to preserve local letter labels.

### Saved v2 template and local overlay

The baseline is the ordinary empty setup on the selected v2 branch:

```lua
return {
  "petertriho/nvim-scrollbar",
  branch = "refactor/v2",
  opts = {},
}
```

Our applied overlay replaces that empty `opts` table with:

```lua
local opts = {
  providers = { gitsigns = true },
  marks = {
    Mark = { highlight = "DiagnosticVirtualTextInfo" },
    Info = false,
    Hint = false,
    Misc = false,
  },
  scrollbar = {
    thumb = { highlight = { bg = "#6C5571" } },
  },
}
```

Native search and letter marks are supplied by the v2 baseline; no custom
`marksmarks` function or old handler registration is layered on top. The
global-letter and priority differences remain documented above.

hlslens now uses this entire standalone spec, with no additional local options:

```lua
return {
  "kevinhwang91/nvim-hlslens",
  opts = {},
}
```

## Markdown checkbox convention

Configuration: [render-markdown](../nvim/.config/nvim/lua/plugins/_render_markdown_nvim.lua).

The initial spec (`f75b30a`, 2025-01-09) used default options. No exact external
source for that wrapper is established. Verified local overrides are:

| Date | Commit | Choice |
| --- | --- | --- |
| 2025-03-12 | `3af445e` | Leave HTML comments unconcealed |
| 2025-07-02 | `44669a6` | Show the list bullet before a checkbox; use right padding 2 |
| 2026-10-28 | `05918d9` | Add eleven checkbox meanings, Unicode glyphs, and status highlights |

The selected vocabulary follows the
[Minimal checklist meanings](https://minimal.guide/checklists), with the
Minimal/Things and AnuPpuccin family preferred over the reversed information/idea
meanings in SlRvb/ITS. This is a deliberate convention choice, not a claim that
one collection is universally standard. The Minimal page is a moving reference;
the exact chosen vocabulary is preserved here and in `05918d9`.

| Raw marker | Chosen meaning | Rendered glyph | Highlight |
| --- | --- | --- | --- |
| `[ ]` | To do | ☐ | Plugin's unchecked default |
| `[x]` | Done | ☑ | Plugin's checked default |
| `[/]` | In progress | ◐ | `RenderMarkdownTodo` |
| `[-]` | Cancelled | ⊘ | `Comment` |
| `[>]` | Forwarded or migrated to another list | ➜ | `RenderMarkdownInfo` |
| `[<]` | Scheduled | ◷ | `RenderMarkdownHint` |
| `[?]` | Question | ? | `RenderMarkdownWarn` |
| `[!]` | Important | ‼ | `RenderMarkdownError` |
| `[b]` | Bookmark | ⚑ | `RenderMarkdownHint` |
| `[i]` | Information | ⓘ | `RenderMarkdownInfo` |
| `[I]` | Idea | 💡 | `RenderMarkdownHint` |

Configured glyph strings include trailing spaces. The status inventory is
intentionally smaller than the full theme collections. Using the plugin's
existing custom key `todo` for `[/]` replaces its inherited `[-]` Todo mapping;
simply adding another mapping for `[-]` could leave conflicting meanings after
configuration merging. See the
[checkbox options](https://github.com/MeanderingProgrammer/render-markdown.nvim/wiki/Checkboxes).

The rendering configuration changes presentation, not the text stored in a
Markdown file. GFM formally recognizes space, `x`, and `X` task markers; the
extra states are conventions. Their meaning and any task-query behavior in
other applications must be configured separately. See the
[GFM task-list specification](https://github.github.com/gfm/#task-list-items-extension-).

### Template and overlay retained through the upgrade

No new renderer migration is proposed. Its baseline is the normal plugin spec
with Treesitter and web-devicons dependencies and an empty `opts` table. Keep
the following local options on top of that baseline:

```lua
local opts = {
  checkbox = {
    bullet = true,
    right_pad = 2,
    unchecked = { icon = "☐ " },
    checked = { icon = "☑ " },
    custom = {
      todo = { raw = "[/]", rendered = "◐ ", highlight = "RenderMarkdownTodo" },
      cancelled = { raw = "[-]", rendered = "⊘ ", highlight = "Comment" },
      forwarded = { raw = "[>]", rendered = "➜ ", highlight = "RenderMarkdownInfo" },
      scheduled = { raw = "[<]", rendered = "◷ ", highlight = "RenderMarkdownHint" },
      question = { raw = "[?]", rendered = "? ", highlight = "RenderMarkdownWarn" },
      important = { raw = "[!]", rendered = "‼ ", highlight = "RenderMarkdownError" },
      bookmark = { raw = "[b]", rendered = "⚑ ", highlight = "RenderMarkdownHint" },
      information = { raw = "[i]", rendered = "ⓘ ", highlight = "RenderMarkdownInfo" },
      idea = { raw = "[I]", rendered = "💡 ", highlight = "RenderMarkdownHint" },
    },
  },
  html = { comment = { conceal = false } },
}
```

This records the existing options to preserve, rather than adding the rest of
the theme's optional checkbox vocabulary. Retest rendering after the parser
migration, particularly Markdown containing fenced code.

## Preserved parser allowlist

These are the 86 names active after `4aaa052`, captured from the unchanged
legacy Treesitter configuration during this audit. Preserve the inventory as
intent; availability and names still need checking against a future installer.

```text
asm bash bibtex c c_sharp cmake comment
cpp css csv cuda d diff disassembly
dockerfile doxygen editorconfig git_config git_rebase gitattributes gitcommit
gitignore glsl go gpg graphql gstlaunch haskell
hjson hlsl html htmldjango http ini java
javascript jq jsdoc json json5 jsonc jsonnet
julia kotlin latex llvm lua luadoc luap
make markdown markdown_inline matlab mermaid mlir nix
objdump perl php php_only printf proto python
query regex requirements rst ruby rust scss
sql ssh_config strace svelte tmux toml tsv
tsx typescript udev vim vimdoc vue xml
yaml zathurarc
```

The inactive 217-name ignore inventory remains recoverable in `4aaa052` and the
current legacy spec; it is not a second active install policy.

## Reproducing and extending this provenance record

To inspect local adoption and changes:

```sh
git log --follow --format='%h %cI %s' -- \
  nvim/.config/nvim/lua/plugins/_nvim_treesitter.lua
git show 51e256f:nvim/.config/nvim/lua/plugins/_treesitter.lua
git show b17c26c -- nvim/.config/nvim/lua/plugins/_nvim_treesitter.lua
git show 7fe2c49 -- nvim/.config/nvim/lua/plugins/_nvim_scrollbar.lua
git show 2fe01b2
```

To reproduce the date-based upstream candidate selection:

```sh
git -C ~/.local/share/nvim/lazy/nvim-treesitter log -1 \
  --before='2021-02-19T09:44:54Z' --format='%H %cI %s' master
git -C ~/.local/share/nvim/lazy/nvim-treesitter-textobjects log -1 \
  --before='2021-02-19T09:44:54Z' --format='%H %cI %s' master
```

The selection is limited to the locally available history. A commit timestamp
does not prove the branch tip, installed version, or source page actually used
on that date. Prefer a recorded lockfile revision whenever one exists.

For each future upgrade, append the adoption commit and timestamp, an immutable
upstream source reference if obtainable, the source defaults, local differences,
and a behavior-by-behavior migration decision. Distinguish intended preferences
from historical workarounds. Record removed behavior explicitly, along with
replacement keys or a conscious decision to retire it. Mark proposals as
applied only after the configuration and relevant runtime behavior are checked.
