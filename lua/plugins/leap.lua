return {
    "ggandor/leap.nvim",
    opts = function()
        -- uncomment next line to remap 's' and 'S' which can be problematic
        -- require('leap').create_default_mappings()
        -- additional equivalence classes
        require('leap').opts.equivalence_classes = { ' \t\r\n', '([{', ')]}', '\'"`' }
        -- use the traversal keys to repeat the previous motion
        require('leap.user').set_repeat_keys('<enter>', '<backspace>')
    end,
}
