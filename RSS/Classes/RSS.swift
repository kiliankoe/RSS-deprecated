//
//  RSS.swift
//  Pods
//
//  Created by Kilian Költzsch on 30/05/16.
//
//

import Foundation
import Kanna

/// Read and parse RSS data.
public class RSS {
    /**
     Parse an RSSFeed from given data.

     - parameter data: xml data of the feed

     - throws: RSSError if feed is not valid xml.

     - returns: RSS Feed
     */
    public static func loadData(data: NSData) throws -> RSSFeed {
        guard let xml = XML(xml: data, encoding: NSUTF8StringEncoding) else { throw RSSError.ParseError }
        return try parse(xml)
    }

    /**
     Download and parse an RSSFeed from a given URL.

     - parameter url: url of the feed

     - throws: RSSError if network resource can't be found or file is not valid XML.

     - returns: RSS Feed

     - warning: Blocks while downloading data from URL. Use `loadData` instead and download data yourself beforehand for a non-blocking alternative.
     */
    public static func loadURL(url: NSURL) throws -> RSSFeed {
        guard let data = NSData(contentsOfURL: url) else { throw RSSError.FileNotFound }
        guard let xml = XML(xml: data, encoding: NSUTF8StringEncoding) else { throw RSSError.ParseError }
        return try parse(xml)
    }

    private static func parse(xml: XMLDocument) throws -> RSSFeed {
        guard let title = xml.at_css("channel title")?.text else { throw RSSError.ParseError }
        guard let link = xml.at_css("channel link")?.text else { throw RSSError.ParseError }
        guard let linkURL = NSURL(string: link) else { throw RSSError.ParseError }
        guard let description = xml.at_css("channel description")?.text else { throw RSSError.ParseError }

        let feed = RSSFeed(title: title, link: linkURL, description: description)
        return feed
    }
}
