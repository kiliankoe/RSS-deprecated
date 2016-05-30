//
//  RSSTextInput.swift
//  Pods
//
//  Created by Kilian Költzsch on 30/05/16.
//
//

import Foundation

/**
 *  Values for a text input field, that can be displayed with the channel.
 */
public struct RSSTextInput {
    /// Label of the submit button
    public let title: String

    /// Explains the text input area
    public let descr: String

    /// Name of the text object
    public let name: String

    /// URL of the CGI script that processes text input requests
    public let link: NSURL
}
