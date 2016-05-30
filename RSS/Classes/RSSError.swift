//
//  RSSError.swift
//  Pods
//
//  Created by Kilian Költzsch on 30/05/16.
//
//

import Foundation

/**
 Error that can be thrown when parsing RSS data

 - FileNotFound: Failed to locate specified file or URL
 - ParseError:   Failed to parse RSS data
 */
public enum RSSError: ErrorType {
    case FileNotFound
    case ParseError
}
