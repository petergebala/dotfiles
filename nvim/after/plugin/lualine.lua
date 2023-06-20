print(" - LuaLina loaded")

local function remotepair_count()
  local command = "who -a | grep remotepair | wc -l"
  local handle = io.popen(command, 'r')
  local result = handle:read("*a")
  handle:close()
  return [[SSH: ]] .. tonumber(result)
end

require('lualine').setup({
  options = { theme = 'gruvbox' },
  sections = { lualine_z = { 'location', remotepair_count } }
})
