//
//  RSSItemEnclosure.swift
//  Pods
//
//  Created by Kilian Költzsch on 30/05/16.
//
//

import Foundation

/**
 *  Media object that can be attached to an RSSItem.
 */
public struct RSSItemEnclosure {
    /// Link to the media object
    public let url: NSURL

    /// Length of the object in bytes
    public let length: UInt

    /// MIME type of the object
    public let type: String
}
