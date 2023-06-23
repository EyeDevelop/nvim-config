require('indent-o-matic').setup {
    -- Number of lines without indentation before giving up.
    max_lines = 2048,

    -- Space indentation defaults.
    standard_widths = { 2, 4, 8 },

    -- Skip multi line comments and strings.
    skip_multiline = true,
}
