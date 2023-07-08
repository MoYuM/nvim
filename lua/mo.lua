local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local toggleterm = require("toggleterm")
local conf = require("telescope.config").values

local M = {}

local commad_list = {
  {
    cmd = "git s",
    desc = "查看 git 状态",
  },
  {
    cmd = "git push",
    desc = "提交！！",
  },
  {
    cmd = "def p -d",
    desc = '发布预发',
  },
  {
    cmd = "tnpm update",
    desc = "更新依赖",
  },
  {
    cmd = "clam dev --remote",
    desc = "H5 启动本地服务",
  },
  {
    cmd = "clam cr",
    desc = "打开 CR"
  }
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
