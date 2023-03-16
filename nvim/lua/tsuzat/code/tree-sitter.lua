return {
  ensure_installed = {
    "bash",
    "c",
    -- "cmake",
    "comment",
    "c_sharp",
    "cpp",
    "css",
    "dart",
    -- "dockerfile",
    "go",
    "html",
    "javascript",
    "json",
    "jsonc",
    "lua",
    "markdown",
    "markdown_inline",
    "python",
    "typescript",
    "vim",
    "yaml",
  },                       -- one of "all" or a list of languages
  ignore_install = { "" }, -- List of parsers to ignore installing
  matchup = {
    enable = false,        -- mandatory, false will disable the whole extension
    -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
  },
  highlight = {
    enable = true,           -- false will disable the whole extension
    use_languagetree = true, -- use this to enable language injection
    disable = { "css" },     -- list of language that will be disabled
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = {
      -- Languages that have a single comment style
      typescript = "// %s",
      css = "/* %s */",
      scss = "/* %s */",
      html = "<!-- %s -->",
      svelte = "<!-- %s -->",
      vue = "<!-- %s -->",
      json = "",
    },
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil,  -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
