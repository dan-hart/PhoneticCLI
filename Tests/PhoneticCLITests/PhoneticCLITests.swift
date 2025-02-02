import XCTest
@testable import PhoneticCLI

final class PhoneticCLITests: XCTestCase {
    
    /// Tests the default conversion command.
    func testConvertDefault() {
        // Simulate CLI arguments: [executable, "convert", "<input string>"]
        let args = ["phonetic", "convert", "xCBDeDe93;dDsQ"]
        let output = processCLI(arguments: args)
        
        // Verify some expected substrings from the default conversion.
        XCTAssertTrue(output.contains("x: lowercase xray"))
        XCTAssertTrue(output.contains("C: Capital Charlie"))
        XCTAssertTrue(output.contains("9: Nine"))
        XCTAssertTrue(output.contains("; Semicolon"))
        XCTAssertTrue(output.contains("STOP"))
    }
    
    /// Tests the default reverse command.
    func testReverseDefault() {
        // Simulate CLI arguments for reverse.
        let phoneticInput = "SPACE\nA: Capital Alpha\nb: lowercase bravo\nSPACE\nSTOP"
        let args = ["phonetic", "reverse", phoneticInput]
        let output = processCLI(arguments: args)
        
        let expected = " Ab "
        XCTAssertEqual(output, expected)
    }
    
    /// Tests that usage information is printed when insufficient arguments are provided.
    func testUsagePrinted() {
        let args = ["phonetic", "convert"]
        let output = processCLI(arguments: args)
        XCTAssertTrue(output.contains("Usage:"))
    }
    
    /// Tests the conversion command with optional flags overriding defaults.
    func testConvertWithOptionalFlags() {
        let args = ["phonetic", "convert", "TestString", "--casePrefix", "false", "--delimiter", ",", "--newLineOutput", "false"]
        let output = processCLI(arguments: args)
        // Since case prefixing is disabled, expect output without any "Capital" or "lowercase" prefixes.
        XCTAssertFalse(output.contains("Capital"))
        XCTAssertFalse(output.contains("lowercase"))
        // Expect the delimiter to be a comma.
        XCTAssertTrue(output.contains(","))
        XCTAssertTrue(output.contains("STOP"))
    }
    
    /// Tests the reverse command with optional flags.
    func testReverseWithOptionalFlags() {
        let phoneticInput = "SPACE,A: Capital Alpha,b: lowercase bravo,SPACE,STOP"
        let args = ["phonetic", "reverse", phoneticInput, "--casePrefixed", "true", "--delimiter", ","]
        let output = processCLI(arguments: args)
        // Check that the reversed string matches expectations.
        // This test assumes the reverse conversion produces " Ab." for this input.
        XCTAssertEqual(output, " Ab ")
    }
}
