return {
  "xeluxee/competitest.nvim",
  lazy = true,
  event = "VeryLazy",
  cmd = "ComptiTest",
  config = function()
    local status_ok, competitest = pcall(require, "competitest")

    if not status_ok then
      return
    end

    competitest.setup {
      local_config_file_name = ".competitest.lua",

      floating_border = "rounded",
      floating_border_highlight = "FloatBorder",
      picker_ui = {
        width = 0.2,
        height = 0.3,
        mappings = {
          focus_next = { "j", "<down>", "<Tab>" },
          focus_prev = { "k", "<up>", "<S-Tab>" },
          close = { "<esc>", "<C-c>", "q", "Q" },
          submit = { "<cr>" },
        },
      },
      editor_ui = {
        popup_width = 0.4,
        popup_height = 0.6,
        show_nu = true,
        show_rnu = false,
        normal_mode_mappings = {
          switch_window = { "<C-h>", "<C-l>", "<C-i>" },
          save_and_close = "<C-s>",
          cancel = { "q", "Q" },
        },
        insert_mode_mappings = {
          switch_window = { "<C-h>", "<C-l>", "<C-i>" },
          save_and_close = "<C-s>",
          cancel = "<C-q>",
        },
      },
      runner_ui = {
        interface = "popup",
        selector_show_nu = false,
        selector_show_rnu = false,
        show_nu = true,
        show_rnu = false,
        mappings = {
          run_again = "R",
          run_all_again = "<C-r>",
          kill = "K",
          kill_all = "<C-k>",
          view_input = { "i", "I" },
          view_output = { "a", "A" },
          view_stdout = { "o", "O" },
          view_stderr = { "e", "E" },
          close = { "q", "Q" },
        },
        viewer = {
          width = 0.5,
          height = 0.5,
          show_nu = true,
          show_rnu = false,
        },
      },
      popup_ui = {
        total_width = 0.8,
        total_height = 0.8,
        layout = {
          { 4, "tc" },
          { 5, { { 1, "so" }, { 1, "si" } } },
          { 5, { { 1, "eo" }, { 1, "se" } } },
        },
      },
      split_ui = {
        position = "right",
        relative_to_editor = true,
        total_width = 0.3,
        vertical_layout = {
          { 1, "tc" },
          { 1, { { 1, "so" }, { 1, "eo" } } },
          { 1, { { 1, "si" }, { 1, "se" } } },
        },
        total_height = 0.4,
        horizontal_layout = {
          { 2, "tc" },
          { 3, { { 1, "so" }, { 1, "si" } } },
          { 3, { { 1, "eo" }, { 1, "se" } } },
        },
      },

      save_current_file = true,
      save_all_files = false,
      compile_directory = ".",
      compile_command = {
        c = { exec = "gcc", args = { "-std=c11", "-O3", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
        cpp = { exec = "g++", args = { "-std=c++14", "-O3", "-Wall", "$(FNAME)", "-o", "$(FNOEXT)" } },
        go = { exec = "go", args = { "build", "$(FNAME)" } },
        rust = { exec = "rustc", args = { "$(FNAME)" } },
      },
      running_directory = ".",
      run_command = {
        c = { exec = "./$(FNOEXT)" },
        cpp = { exec = "./$(FNOEXT)" },
        go = { exec = "./$(FNOEXT)" },
        rust = { exec = "./$(FNOEXT)" },
        python = { exec = "python", args = { "$(FNAME)" } },
      },
      multiple_testing = -1,
      maximum_time = 2000,
      output_compare_method = "squish",

      testcases_directory = ".",
      testcases_use_single_file = true,
      testcases_auto_detect_storage = true,
      testcases_single_file_format = "$(FNOEXT).testcases",
      testcases_input_file_format = "$(FNOEXT)_input$(TCNUM).txt",
      testcases_output_file_format = "$(FNOEXT)_output$(TCNUM).txt",

      companion_port = 27121,
      receive_print_message = true,
    }
  end
}
