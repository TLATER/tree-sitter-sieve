import XCTest
import SwiftTreeSitter
import TreeSitterSieve

final class TreeSitterSieveTests: XCTestCase {
    func testCanLoadGrammar() throws {
        let parser = Parser()
        let language = Language(language: tree_sitter_sieve())
        XCTAssertNoThrow(try parser.setLanguage(language),
                         "Error loading Sieve grammar")
    }
}
