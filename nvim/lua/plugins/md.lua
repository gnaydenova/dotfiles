return {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    lazy = true,
    ft = 'markdown',
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
}
