-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/thewildgander/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/thewildgander/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/thewildgander/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/thewildgander/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/thewildgander/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Catppuccino.nvim"] = {
    config = { "require('configs.catppuccino')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/Catppuccino.nvim"
  },
  LuaSnip = {
    config = { "require('configs.luasnip')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["TrueZen.nvim"] = {
    config = { "require('configs.truezen')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/TrueZen.nvim"
  },
  ["barbar.nvim"] = {
    config = { "require('configs.barbar')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["cheatsheet.nvim"] = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/Users/thewildgander/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/opt/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    after_files = { "/Users/thewildgander/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/opt/cmp_luasnip"
  },
  ["diffview.nvim"] = {
    config = { "require('configs.diffview')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/diffview.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "require('configs.gitsigns')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "require('configs.indent-blankline')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  ["lightspeed.nvim"] = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/lightspeed.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lualine.nvim"] = {
    config = { "require('configs.lualine')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["neoscroll.nvim"] = {
    config = { "require('configs.neoscroll')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "require('configs.autopairs')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-buffer", "cmp_luasnip" },
    loaded = true,
    only_config = true
  },
  ["nvim-colorizer.lua"] = {
    config = { "require('configs.colorizer')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "require('configs.lspconfig')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-lsputils"] = {
    config = { "require('configs.lsputils')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/nvim-lsputils"
  },
  ["nvim-tree.lua"] = {
    config = { "require('configs.tree')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "require('configs.treesitter')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "require('configs.ts-autotag')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-ts-rainbow"] = {
    config = { "require('configs.treesitter')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  popfix = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/popfix"
  },
  ["spellsitter.nvim"] = {
    config = { "require('configs.spellsitter')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/spellsitter.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/sqlite.lua"
  },
  ["telescope-frecency.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-frecency.nvim" },
    loaded = true,
    only_config = true
  },
  ["toggleterm.nvim"] = {
    config = { "require('configs.toggleterm')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/toggleterm.nvim"
  },
  ["trouble.nvim"] = {
    config = { "require('configs.trouble')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/trouble.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["which-key.nvim"] = {
    config = { "require('configs.which-key')" },
    loaded = true,
    path = "/Users/thewildgander/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
require('configs.treesitter')
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
require('configs.ts-autotag')
time([[Config for nvim-ts-autotag]], false)
-- Config for: diffview.nvim
time([[Config for diffview.nvim]], true)
require('configs.diffview')
time([[Config for diffview.nvim]], false)
-- Config for: nvim-ts-rainbow
time([[Config for nvim-ts-rainbow]], true)
require('configs.treesitter')
time([[Config for nvim-ts-rainbow]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
require('configs.gitsigns')
time([[Config for gitsigns.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
require('configs.indent-blankline')
time([[Config for indent-blankline.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
require('configs.cmp')
time([[Config for nvim-cmp]], false)
-- Config for: Catppuccino.nvim
time([[Config for Catppuccino.nvim]], true)
require('configs.catppuccino')
time([[Config for Catppuccino.nvim]], false)
-- Config for: spellsitter.nvim
time([[Config for spellsitter.nvim]], true)
require('configs.spellsitter')
time([[Config for spellsitter.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
require('configs.luasnip')
time([[Config for LuaSnip]], false)
-- Config for: neoscroll.nvim
time([[Config for neoscroll.nvim]], true)
require('configs.neoscroll')
time([[Config for neoscroll.nvim]], false)
-- Config for: TrueZen.nvim
time([[Config for TrueZen.nvim]], true)
require('configs.truezen')
time([[Config for TrueZen.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
require('configs.autopairs')
time([[Config for nvim-autopairs]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
require('configs.barbar')
time([[Config for barbar.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
require('configs.toggleterm')
time([[Config for toggleterm.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
require('configs.colorizer')
time([[Config for nvim-colorizer.lua]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
require('configs.trouble')
time([[Config for trouble.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
require('configs.lspconfig')
time([[Config for nvim-lspconfig]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
require('configs.lualine')
time([[Config for lualine.nvim]], false)
-- Config for: nvim-lsputils
time([[Config for nvim-lsputils]], true)
require('configs.lsputils')
time([[Config for nvim-lsputils]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
require('configs.which-key')
time([[Config for which-key.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
require('configs.tree')
time([[Config for nvim-tree.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
require('configs.telescope')
time([[Config for telescope.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd telescope-frecency.nvim ]]
vim.cmd [[ packadd cmp_luasnip ]]
vim.cmd [[ packadd cmp-buffer ]]
time([[Sequenced loading]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
