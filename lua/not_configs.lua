local C = {}

function C.nvim_comment()
    require 'nvim_comment'.setup {
        create_mappings = false,
        marker_padding = true,
    }
end

function C.neoscroll()
    require 'neoscroll'.setup {
        mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
        hide_cursor = false,
        stop_eof = true,
        respect_scrolloff = false,
        cursor_scrolls_alone = true,
    }
end

 function C.gitsigns()
     require 'gitsigns'.setup()
 end


     -- properties
     new_prop('force_inactive', 'filetypes', 'packer')
     new_prop('force_inactive', 'buftypes', 'terminal')

     -- components
     new_comp('left', get_curr_mode, { hl = comp_hl(cols.fg, cols.bg, 'bold') })
     new_comp('left', "file_info", { hl = comp_hl(cols.fg, cols.bg, 'bold') })
     new_comp('left', "git_branch", { hl = comp_hl(cols.red, cols.bg, 'bold'), icon = ' ' })
     new_comp('left', "git_diff_added", { hl = comp_hl(cols.green, cols.bg, nil), icon = '+' })
     new_comp('left', "git_diff_removed", { hl = comp_hl(cols.red, cols.bg, nil), icon = '-' })
     new_comp('left', "git_diff_changed", { hl = comp_hl(cols.blue, cols.bg, nil), icon = '~' })

     new_comp('right', "position")
     new_comp('right', "file_type", { hl = comp_hl(cols.blue, cols.bg, nil) })
     new_comp('right', "file_size", { hl = comp_hl(cols.fg, cols.bg, nil), enabled = function() return vim.fn.getfsize(vim.fn.expand('%:p')) > 0 end })
     -- new_comp('right', "file_encoding")
     -- new_comp("right", "lsp_client_names")
     -- new_comp("right", "diagnostic_errors")
     -- new_comp("right", "diagnostic_warnings")
     -- new_comp("right", "diagnostic_hints")
     -- new_comp("right", "diagnostic_info")

     -- padding the bar on both sides
     comps['left']['active'][1].left_sep = ' '
     comps['right']['active'][#comps['right']['active']].right_sep = ' '
     -- comps['left']['inactive'][1].left_sep = ' '
     -- comps['right']['inactive'][1].right_sep = ' '

     require 'feline'.setup {
         components = comps,
         properties = props,
         fg = get_col("Normal", "fg"),
         bg = get_col("Normal", "bg"),
     }


for _, config in pairs(Configs) do C[config]() end
