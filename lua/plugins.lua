local packer = require("packer")
packer.startup({
  function(use) 
  -- Packer可以管理自身
    use("wbthomason/packer.nvim")
  end,
  config = {
    max_jobs = 16,
    display = {
        open_fn = function() 
          return require("packer.util").float({border = "single"})
        end,
    },
  },

   pcall(
      vim.cmd,
      [[
          augroup packer_user_config
          autocmd!
          autocmd BufWritePost plugins.lua source <afile> | PackerSync
          augroup end
      ]]
  ) 
})