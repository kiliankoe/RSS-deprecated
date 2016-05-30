//
//  ViewController.swift
//  RSS
//
//  Created by Kilian Koeltzsch on 05/30/2016.
//  Copyright (c) 2016 Kilian Koeltzsch. All rights reserved.
//

import UIKit
import RSS

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let feed = try? RSS.loadURL(NSURL(string: "https://xkcd.com/rss.xml")!)
        print(feed)
    }
}
