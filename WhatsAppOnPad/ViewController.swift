//
//  ViewController.swift
//  WhatsAppOnPad
//
//  Created by Peter Leung on 10/9/2018.
//  Copyright © 2018 Peter Leung. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var mainWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWhatsApp()
    }

    //MARK: Main function to load the WhatsApp website
    func loadWhatsApp() {
        let withURL = URL(string: "https://web.whatsapp.com/")
        guard let finalURL = withURL else { return }
        
        //Set the custom user agent to pretend it's from the desktop
        mainWebView.customUserAgent = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.1 Safari/537.36"
        
        mainWebView.load(URLRequest(url: finalURL))
    }
}

