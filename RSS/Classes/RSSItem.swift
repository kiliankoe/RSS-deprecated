//
//  RSSItem.swift
//  Pods
//
//  Created by Kilian Költzsch on 30/05/16.
//
//

import Foundation
import Kanna

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

    /// Unique identifier for the item
    public let guid: String?

    /// If `true` the item's guid can be interpreted as a URL
    public let guidIsPermaLink: Bool?

    /// Date when the item was published
    public let pubDate: NSDate?

    /// RSS channel the item came from, with optional title
    public let source: (String?, NSURL)?

    // Items can contain a media object

    /// Media object URL
    public let enclosureURL: NSURL?

    /// Media object length in bytes
    public let enclosureLength: UInt?

    /// Media object MIME type
    public let enclosureMIMEType: String?
}

extension RSSItem {
    /**
     Initialize an RSSItem with a fitting XMLElement

     - parameter xml: xml element

     - returns: new RSSItem
     */
    init(withXML xml: XMLElement) {
        self.title = xml.at_css("title")?.text
        self.link = NSURL(string: xml.at_css("link")?.text ?? "")
        self.descr = xml.at_css("description")?.text
        self.author = xml.at_css("author")?.text
        self.category = nil // TODO
        self.comments = NSURL(string: xml.at_css("comments")?.text ?? "")
        self.guid = xml.at_css("guid")?.text
        self.guidIsPermaLink = NSURL(string: self.guid ?? "") != nil
        self.pubDate = RSS.dateFormatter.dateFromString(xml.at_css("pubDate")?.text ?? "")
        self.source = nil // TODO

        // TODO
        self.enclosureURL = nil
        self.enclosureLength = nil
        self.enclosureMIMEType = nil
    }
}
