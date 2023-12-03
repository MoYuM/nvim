local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local toggleterm = require("toggleterm")
local conf = require("telescope.config").values

local M = {}

local commad_list = {
  {
    cmd = "def p -d",
    desc = '发布预发',
  },
}

local function moc(opts)
  opts = opts or {}

  local function exec(cmd)
    toggleterm.exec(cmd)
  end

  pickers.new(opts, {
    finder = finders.new_table {
      results = commad_list,
      entry_maker = function(entry)
        return {
          value = entry.cmd,
          display = entry.cmd,
          ordinal = entry.cmd,
          cmd = entry.cmd,
          desc = entry.desc,
        }
      end,
    },
    sorter = conf.file_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        exec(selection.cmd)
      end)
      return true
    end,
  })
    :find()
end

M.moc = moc

return M
