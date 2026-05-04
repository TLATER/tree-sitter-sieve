/**
 * @file Tree-sitter grammar for the Sieve e-mail filtering language
 * @author Tristan Daniel Maat
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

module.exports = grammar({
  name: "sieve",

  rules: {
    source_file: $ => repeat($.statement),

    statement: $ => seq(
      $.test,
      choice(";", $.block)
    ),

    block: $ => seq("{", repeat($.statement), "}"),

    test: $ => seq(
      field("name", $.identifier),
      field("arguments", repeat($.argument)),
      optional(field("test", choice($.test, $.testList)))
    ),
    testList: $ => seq("(", $.test, repeat(seq(",", $.test)), ")"),

    argument: $ => choice($.string, $.stringList, $.number, $.tag),

    identifier: $ => /[[:alpha:]_][[:alnum:]_]*/,
    number: $ => /[[:digit:]]+[KMG]?/,
    tag: $ => seq(":", field("name", $.identifier)),
    stringList: $ => seq("[", seq($.string, repeat(seq(",", $.string))), "]"),

    string: $ => token(seq('"', repeat(choice(/[^"\\]/, /\\./)), '"')),

    // TODO: Add multi-line literals

    comment: $ => token(choice(
      seq("/*", /[^*]*\*+([^/*][^*]*\*+)*/, "/"),
      /#[^\r\n]*/
    )),
    _whitespace: $ => /\s+/
  },

  extras: $ => [$.comment, $._whitespace]
});
