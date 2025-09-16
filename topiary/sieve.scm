(_) @allow_blank_line_before

[
 (string)
 (comment)
] @leaf

(comment) @append_hardline

(testList
 "(" @append_empty_softline @append_indent_start
 ((test) "," @append_spaced_softline)*
 ")" @prepend_empty_softline @prepend_indent_end)

(test
 (_) @append_space
 (_)
 .)

(block
 "{" @prepend_hardline @append_hardline @append_indent_start
 (_)*
 "}" @prepend_hardline @append_hardline @prepend_indent_end)

((statement) @append_hardline
 (comment)* @do_nothing)

((_)
 (comment) @prepend_space)

(stringList
 "[" @append_empty_softline @append_indent_start
 (comment)?
 ((string) "," @append_spaced_softline (comment)?)*
 "]" @prepend_empty_softline @prepend_indent_end)
