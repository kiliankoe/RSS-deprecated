//
//  RSSImage.swift
//  Pods
//
//  Created by Kilian Költzsch on 30/05/16.
//
//

import Foundation

/**
 *  An image contained in a channel's metadata
 */
public struct RSSImage {
    // MARK: Required elements

    /// URL of the GIF, JPEG or PNG image that represents the channel
    public let url: NSURL

    /// description of the image, used in the ALT HTML attribute
    public let title: String

    /// Link that the image should link to when rendered
    public let link: String

    // MARK: Optional elements

    /// Width of the image, max is 144 pixels. Default is 88.
    public let width: Int?

    /// Height of the image, max is 400. Default is 31.
    public let height: Int?

    /// Contains text that is included in the TITLE HTML attribute
    public let descr: String?
}
