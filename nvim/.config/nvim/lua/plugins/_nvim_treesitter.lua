return {
  "nvim-treesitter/nvim-treesitter",

  version = "*",

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },

  build = ":TSUpdate",

  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = "all",
      ignore_install = {

        "ada",
        "agda",
        "angular",
        "awk",
        "clojure",
        "commonlisp",
        "dart",
        "elixir",
        "elm",
        "erlang",
        "fennel",
        "forth",
        "fortran",
        "fsharp",
        "groovy",
        "hack",
        "just",
        "meson",
        "nim",
        "nim_format_string",
        "objc",
        "ocaml",
        "ocaml_interface",
        "ocamllex",
        "pascal",
        "phpdoc",
        "powershell",
        "prolog",
        "purescript",
        "r",
        "racket",
        "scala",
        "scheme",
        "swift",
        "tcl",
        "verilog",
        "vhdl",

        "apex",
        "arduino",
        "astro",
        "authzed",
        "bass",
        "beancount",
        "bicep",
        "bitbake",
        "blueprint",
        "bp",
        "cairo",
        "capnp",
        "chatito",
        "cooklang",
        "corn",
        "cpon",
        "cue",
        "devicetree",
        "dhall",
        "djot",
        "dot",
        "dtd",
        "earthfile",
        "ebnf",
        "eds",
        "eex",
        "elsa",
        "elvish",
        "embedded_template",
        "facility",
        "faust",
        "fidl",
        "firrtl",
        "fish",
        "foam",
        "fsh",
        "func",
        "fusion",
        "gap",
        "gaptst",
        "gdscript",
        "gdshader",
        "gleam",
        "glimmer",
        "glimmer_javascript",
        "glimmer_typescript",
        "gn",
        "gnuplot",
        "goctl",
        "godot_resource",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",
        "gren",
        "hare",
        "haskell_persistent",
        "hcl",
        "heex",
        "helm",
        "hlsplaylist",
        "hocon",
        "hoon",
        "hurl",
        "hyprlang",
        "idl",
        "inko",
        "ispc",
        "janet_simple",
        "kconfig",
        "kdl",
        "koto",
        "kusto",
        "lalrpop",
        "ledger",
        "leo",
        "linkerscript",
        "liquid",
        "liquidsoap",
        "luau",
        "m68k",
        "menhir",
        "muttrc",
        "nasm",
        "nginx",
        "nickel",
        "ninja",
        "norg",
        "nqc",
        "odin",
        "org",
        "passwd",
        "pem",
        "pioasm",
        "po",
        "pod",
        "poe_filter",
        "pony",
        "prisma",
        "problog",
        "promql",
        "properties",
        "prql",
        "psv",
        "pug",
        "puppet",
        "pymanifest",
        "ql",
        "qmldir",
        "qmljs",
        "ralph",
        "rasi",
        "rbs",
        "re2c",
        "readline",
        "rego",
        "rescript",
        "rnoweb",
        "robot",
        "robots",
        "roc",
        "ron",
        "scfg",
        "sflog",
        "slang",
        "slint",
        "smali",
        "smithy",
        "snakemake",
        "solidity",
        "soql",
        "sosl",
        "sourcepawn",
        "sparql",
        "squirrel",
        "starlark",
        "styled",
        "supercollider",
        "superhtml",
        "surface",
        "swift",
        "sxhkdrc",
        "systemtap",
        "t32",
        "tablegen",
        "tact",
        "teal",
        "templ",
        "terraform",
        "textproto",
        "thrift",
        "tiger",
        "tlaplus",
        "todotxt",
        "turtle",
        "twig",
        "typespec",
        "typoscript",
        "typst",
        "ungrammar",
        "unison",
        "usd",
        "uxntal",
        "v",
        "vala",
        "vento",
        "vhs",
        "vrl",
        "wgsl",
        "wgsl_bevy",
        "wing",
        "wit",
        "xcompose",
        "xresources",
        "yang",
        "yuck",
        "zig",
        "ziggy",
        "ziggy_schema",

      },
      highlight = {
        enable = true,
        disable = { "latex" },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      indent = {
        enable = not _G.plugin_loaded("nvim-yati"),
        disable = {
          -- "javascript",
          "python",
        },
      },
      yati = {
        enable = _G.plugin_loaded("nvim-yati"),
        disable = {
          -- "python",
        },

        -- Lazy mode (recommended if bad indent happens frequently).
        default_lazy = true,

        -- Fallback for if tree-sitter insufficent.
        --   "auto": fallback to vim auto indent
        --   "asis": use current indent as-is
        --   "cindent": see `:h cindent()`
        -- Or a custom function return the final indent result.
        default_fallback = "auto",
      },
      textobjects = {
        enable = true,
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
        select = {
          enable = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["g>>"] = "@parameter.inner",
            ["g>f"] = "@function.outer",
          },
          swap_previous = {
            ["g<<"] = "@parameter.inner",
            ["g<f"] = "@function.outer",
          },
        },
      },
    }

    -- vim.cmd [[set foldmethod=expr]]
    -- vim.cmd [[set foldexpr=nvim_treesitter#foldexpr()]]
  end,
}
