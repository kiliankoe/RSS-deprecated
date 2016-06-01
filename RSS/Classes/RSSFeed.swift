//
//  RSSFeed.swift
//  Pods
//
//  Created by Kilian Költzsch on 30/05/16.
//
//

import Foundation
import Kanna

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

    /// Channel image - URL to the GIF, JPEG or PNG resource
    public let imageURL: NSURL?

    /// Channel image - description used in the `alt` HTML attribute
    public let imageTitle: String?

    /// Channel image - Link that the image should link to when rendered
    public let imageLink: NSURL?

    /// Channel image - Width, max is 144. Default should be 88.
    public let imageWidth: Int?

    /// Channel image - Height, max is 400. Default should be 31.
    public let imageHeight: Int?

    /// Channel image - Text that should be included in the `title` HTML attribute
    public let imageDescription: String?

//    /// PICS rating for the channel
//    public let rating:

    // Channels can contain a text input box to be rendered when displaying channel info

    /// Title of the submit button in the text input box
    public let textInputTitle: String?

    /// Explains the text input area
    public let textInputDescription: String?

    /// Name of the text input text object
    public let textInputName: String?

    /// URL of the CGI script that processes text input requests
    public let textInputLink: NSURL?

    /// Hint for aggregators which hours they can skip
    public let skipHours: [Int]?

    /// Hint for aggregators which days they can skip
    public let skipDays: [Weekday]?
}

public extension RSSFeed {
    init(withXML xml: XMLDocument) throws {
        // title, link and description are required elements for any RSS feed
        guard let title = xml.at_css("channel title")?.text else { throw RSSError.ParseError }
        self.title = title

        guard let linkText = xml.at_css("channel link")?.text,
            let link = NSURL(string: linkText) else { throw RSSError.ParseError }
        self.link = link

        guard let description = xml.at_css("channel description")?.text else { throw RSSError.ParseError }
        self.descr = description

        self.language = xml.at_css("channel>language")?.text
        self.copyright = xml.at_css("channel>copyright")?.text
        self.managingEditor = xml.at_css("channel>managingEditor")?.text
        self.webMaster = xml.at_css("channel>webMaster")?.text
        self.pubDate = RSS.dateFormatter.dateFromString(xml.at_css("channel>pubDate")?.text ?? "")
        self.lastBuildDate = RSS.dateFormatter.dateFromString(xml.at_css("channel>lastBuildDate")?.text ?? "")
        self.category = nil // TODO
        self.generator = xml.at_css("channel>generator")?.text
        self.docs = NSURL(string: xml.at_css("channel>docs")?.text ?? "")
        self.cloud = nil // TODO
        self.ttl = Int(xml.at_css("channel>ttl")?.text ?? "")
        self.skipHours = nil // TODO
        self.skipDays = nil // TODO

        self.imageURL = NSURL(string: xml.at_css("channel>image>url")?.text ?? "")
        self.imageLink = NSURL(string: xml.at_css("channel>image>link")?.text ?? "")
        self.imageTitle = xml.at_css("channel>image>title")?.text
        self.imageWidth = Int(xml.at_css("channel>image>width")?.text ?? "")
        self.imageHeight = Int(xml.at_css("channel>image>height")?.text ?? "")
        self.imageDescription = xml.at_css("channel>image>description")?.text

        self.textInputTitle = xml.at_css("channel>textInput>title")?.text
        self.textInputLink = NSURL(string: xml.at_css("channel>textInput>link")?.text ?? "")
        self.textInputName = xml.at_css("channel>textInput>name")?.text
        self.textInputDescription = xml.at_css("channel>textInput>description")?.text

        self.items = xml.css("item").map { RSSItem.init(withXML: $0) }
    }
}

/**
 Contains Monday through Sunday for use in a RSSFeed's skipDays property.
 */
public enum Weekday: String {
    case Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
}
