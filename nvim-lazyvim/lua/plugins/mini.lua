return {
  'nvim-mini/mini.nvim',
  config = function()
    -- Add/delete/replace surroundings (brackets, quotes, etc.)
    --
    -- - saiw)  - [S]urround [A]dd [I]nner [W]ord [)]Paren
    -- - sd'    - [S]urround [D]elete [']quotes
    -- - sr)'   - [S]urround [R]eplace [)] [']
    require('mini.surround').setup({
      mappings = {
        add = 'gza',
        delete = 'gzd',
        find = 'gzf',
        find_left = 'gzF',
        highlight = 'gzh',
        replace = 'gzr',
        update_n_lines = 'gzn',
      },
    })
  end,
}
