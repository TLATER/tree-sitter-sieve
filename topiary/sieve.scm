(_) @allow_blank_line_before

[
 (string)
 (comment)
] @leaf

(comment) @append_hardline

(test
 (_) @append_space
 (_)
 .)

(block
 "{" @prepend_hardline @append_hardline @append_indent_start
 (_)*
 "}" @prepend_hardline @append_hardline @prepend_indent_end)

(
 (statement) @append_hardline
 (comment)* @do_nothing)

(stringList
 "," (string) @prepend_space)
