//
//  CLIProcessor.swift
//  PhoneticCLI
//
//  Created by Dan Hart on 2/2/25.
//


import Foundation
import PhoneticTextSwift

/// Processes the CLI arguments and returns the output as a String.
/// This function encapsulates all the logic for the CLI commands.
public func processCLI(arguments: [String]) -> String {
    var output = ""
    func printLine(_ line: String) {
        output.append(line)
        output.append("\n")
    }
    
    func printUsage() {
        printLine("""
        Usage:
          phonetic convert "<input string>"
          phonetic reverse "<phonetic string>"
          
        Options (optional):
          --casePrefix true|false       (default: true for convert)
          --newLineOutput true|false    (default: true for convert)
          --delimiter <delimiter>       (default: "\\n")
          --casePrefixed true|false     (default: true for reverse)
          
        Examples:
          phonetic convert "xCBDeDe93;dDsQ"
          phonetic reverse "SPACE\\nA: Capital Alpha\\nb: lowercase bravoSPACE\\nSTOP"
        """)
    }
    
    guard arguments.count >= 3 else {
        printUsage()
        return output
    }
    
    let command = arguments[1]
    
    switch command {
    case "convert":
        let inputString = arguments[2]
        // Default parameters for convert.
        var includeCasePrefix = true
        var delimiter = "\n"
        var newLineOutput = true
        
        var index = 3
        while index < arguments.count {
            let flag = arguments[index]
            switch flag {
            case "--casePrefix":
                if index + 1 < arguments.count {
                    includeCasePrefix = (arguments[index + 1].lowercased() == "true")
                    index += 2
                } else { index += 1 }
            case "--delimiter":
                if index + 1 < arguments.count {
                    delimiter = arguments[index + 1]
                    index += 2
                } else { index += 1 }
            case "--newLineOutput":
                if index + 1 < arguments.count {
                    newLineOutput = (arguments[index + 1].lowercased() == "true")
                    index += 2
                } else { index += 1 }
            default:
                index += 1
            }
        }
        
        let converter = PhoneticTextSwift(
            includeCasePrefix: includeCasePrefix,
            delimiter: delimiter,
            newLineOutput: newLineOutput
        )
        let converted = converter.convertToPhonetic(inputString)
        printLine(converted)
        return converted
        
    case "reverse":
        let inputPhonetic = arguments[2]
        // Default parameters for reverse.
        var isCasePrefixed = true
        var delimiter = "\n"
        
        var idx = 3
        while idx < arguments.count {
            let flag = arguments[idx]
            switch flag {
            case "--casePrefixed":
                if idx + 1 < arguments.count {
                    isCasePrefixed = (arguments[idx + 1].lowercased() == "true")
                    idx += 2
                } else { idx += 1 }
            case "--delimiter":
                if idx + 1 < arguments.count {
                    delimiter = arguments[idx + 1]
                    idx += 2
                } else { idx += 1 }
            default:
                idx += 1
            }
        }
        
        let converter = PhoneticTextSwift(
            includeCasePrefix: isCasePrefixed,
            delimiter: delimiter,
            newLineOutput: delimiter == "\n" ? true : false
        )
        let original = converter.reversePhonetic(inputPhonetic)
        printLine(original)
        return original
        
    default:
        printUsage()
    }
    
    return output
}
