"Usage
"    :Goyo
"        Toggle Goyo
"    :Goyo [dimension]
"        Turn on or resize Goyo
"    :Goyo!
"        Turn Goyo off
"
""The window can be resized with the usual [count]<CTRL-W> + >, <, +, - keys, and <CTRL-W> + = will resize it back to the initial size.
"Dimension expression
"
"The expected format of a dimension expression is [WIDTH][XOFFSET][x[HEIGHT][YOFFSET]]. XOFFSET and YOFFSET should be prefixed by + or -. Each component can be given in percentage.
"
"" Width
"Goyo 120
"
"" Height
"Goyo x30
"
"" Both
"Goyo 120x30
"
"" In percentage
"Goyo 120x50%
"
"" With offsets
"Goyo 50%+25%x50%-25%
"
"Configuration
"    g:goyo_width (default: 80)
"    g:goyo_height (default: 85%)
"    g:goyo_linenr (default: 0)

