//
//  RSSItem.swift
//  Pods
//
//  Created by Kilian Költzsch on 30/05/16.
//
//

import Foundation

/**
 *  A single item, representing a "story", of an RSS feed.
 */
public struct RSSItem {
    /// Title of the item
    public let title: String?

    /// URL of the item
    public let link: NSURL?

    /// Item synopsis
    public let descr: String?

    /// E-Mail address of the author
    public let author: String?

    /// List of categories
    public let category: [String]?

    /// URL for a comments page relating to the item
    public let comments: NSURL?

    /// Media object attached to the item
    public let enclosure: RSSItemEnclosure?

    /// Unique identifier for the item
    public let guid: String?

    /// If `true` the item's guid is a URL
    public let guidIsPermaLink: Bool?

    /// Date when the item was published
    public let pubDate: NSDate?

    /// RSS channel the item came from, with optional title
    public let source: (String?, NSURL)?
}
