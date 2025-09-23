-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
-- Complete Harpoon2 Setup for ~/.config/nvim/lua/custom/plugins/init.lua
return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- REQUIRED - this is essential for harpoon to work
      harpoon:setup()

      -- Basic keybindings (you can customize these)
      -- <leader>a = Add current file to harpoon list
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Add file to harpoon' })

      -- <C-e> = Toggle harpoon quick menu
      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Toggle harpoon menu' })

      -- Quick navigation to first 4 files (adjust these keys as you prefer)
      vim.keymap.set('n', '<C-h>', function()
        harpoon:list():select(1)
      end, { desc = 'Go to harpoon file 1' })
      vim.keymap.set('n', '<C-j>', function()
        harpoon:list():select(2)
      end, { desc = 'Go to harpoon file 2' })
      vim.keymap.set('n', '<C-k>', function()
        harpoon:list():select(3)
      end, { desc = 'Go to harpoon file 3' })
      vim.keymap.set('n', '<C-l>', function()
        harpoon:list():select(4)
      end, { desc = 'Go to harpoon file 4' })

      -- Navigate between harpoon files
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end, { desc = 'Previous harpoon file' })
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end, { desc = 'Next harpoon file' })

      -- Optional: Add split/tab support in the harpoon menu
      harpoon:extend {
        UI_CREATE = function(cx)
          -- Open file in vertical split
          vim.keymap.set('n', '<C-v>', function()
            harpoon.ui:select_menu_item { vsplit = true }
          end, { buffer = cx.bufnr, desc = 'Open in vsplit' })

          -- Open file in horizontal split
          vim.keymap.set('n', '<C-x>', function()
            harpoon.ui:select_menu_item { split = true }
          end, { buffer = cx.bufnr, desc = 'Open in split' })

          -- Open file in new tab
          vim.keymap.set('n', '<C-t>', function()
            harpoon.ui:select_menu_item { tabedit = true }
          end, { buffer = cx.bufnr, desc = 'Open in new tab' })
        end,
      }
    end,
  },
}
