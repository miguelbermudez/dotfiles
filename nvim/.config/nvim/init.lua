require('user')


-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- Credit: https://github.com/MeirKriheli/dotneovim/blob/5728f528f275bd075fe0d246fdfe25d9db1d20b1/lua/user/plugins.lua#L23
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

