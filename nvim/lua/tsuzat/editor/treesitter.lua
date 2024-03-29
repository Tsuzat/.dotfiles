return {
  ensure_installed = {
    "c",
    "comment",
    "cpp",
    "css",
    "html",
    "javascript",
    "json",
    "java",
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
    enable = true,               -- false will disable the whole extension
    use_languagetree = true,     -- use this to enable language injection
    disable = { "css", "dart" }, -- list of language that will be disabled
  },
  autopairs = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  indent = { enable = true },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil,  -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
