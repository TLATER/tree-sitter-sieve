package tree_sitter_sieve_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_sieve "github.com/tree-sitter/tree-sitter-sieve/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_sieve.Language())
	if language == nil {
		t.Errorf("Error loading Sieve grammar")
	}
}
