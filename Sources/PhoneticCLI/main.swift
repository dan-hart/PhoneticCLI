import Foundation

/// MARK: - Main Entry Point
/// This is the main entry point for the PhoneticCLI tool. It calls the CLI processor with command-line arguments.
let output = processCLI(arguments: CommandLine.arguments)
print(output)
