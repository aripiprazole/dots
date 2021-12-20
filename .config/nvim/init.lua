local execute = vim.api.nvim_command
local g = vim.g
local fn = vim.fn

local pack_path = fn.stdpath('data') .. '/site/pack'
local fmt = string.format

function ensure(user, repo)
  local path = fmt('%s/packer/start/%s', pack_path, repo)

  if fn.empty(fn.glob(path)) > 0 then
    execute(fmt('!git clone git@github.com:%s/%s %s', user, repo, path))
    execute(fmt('packadd %s', repo))
  end
end

ensure('wbthomason', 'packer.nvim')
ensure('Olical', 'aniseed')

g['aniseed#env'] = {
  module = 'bootstrap',
  compile = true
}