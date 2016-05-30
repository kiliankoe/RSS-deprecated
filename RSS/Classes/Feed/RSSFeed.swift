//
//  RSSFeed.swift
//  Pods
//
//  Created by Kilian Költzsch on 30/05/16.
//
//

import Foundation

/**
 *  A channel contains metadata regarding the channel and a list of items.
 */
public struct RSSFeed {
    // MARK: Required channel elements

    /// Name of the channel
    public let title: String

    /// URL of the HTML website
    public let link: NSURL

    /// Short description of the channel
    public let descr: String

    /// List of all items
    public let items: [RSSItem]

    // MARK: Optional channel elements

    /// Language the channel is written in
    public let language: String?

    /// Copyright notice for content in the channel
    public let copyright: String?

    /// E-Mail address for person responsible for editorial content
    public let managingEditor: String?

    /// E-Mail address for person responsible for technical issues relating to channel
    public let webMaster: String?

    /// Publication date for content in the channel
    public let pubDate: NSDate?

    /// Last time the content of the channel changed
    public let lastBuildDate: NSDate?

    /// List of categories that the channel belongs to
    public let category: [String]?

    /// Identifier of the program used to generate the channel
    public let generator: String?

    /// URL pointing to the documentation for the RSS format used
    public let docs: NSURL?

    /// Information for a cloud service to register with with a lightweight publish-subscribe protocol
    public let cloud: String?

    /// Time to live for channel contents
    public let ttl: Int?

    /// Channel image
    public let image: RSSImage?

//    /// PICS rating for the channel
//    public let rating:

    /// Info for a text input box that can be displayed with the channel
    public let textInput: RSSTextInput?

    /// Hint for aggregators which hours they can skip
    public let skipHours: [Int]?

    /// Hint for aggregators which days they can skip
    public let skipDays: [Weekday]?
}

public extension RSSFeed {
    init(title: String, link: NSURL, description: String) {
        self.title = title
        self.link = link
        self.descr = description
        self.items = []

        language = nil
        copyright = nil
        managingEditor = nil
        webMaster = nil
        pubDate = nil
        lastBuildDate = nil
        category = nil
        generator = nil
        docs = nil
        cloud = nil
        ttl = nil
        image = nil
        textInput = nil
        skipHours = nil
        skipDays = nil
    }
}

/**
 Contains Monday through Sunday for use in a RSSFeed's skipDays property.
 */
public enum Weekday: String {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}
