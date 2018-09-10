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
    
    //MARK: Function to clear the web cache, in case the user wants to logout.
    @IBAction func clearWebCache(_ sender: UIButton) {
        
        //This part is for removing cookies
        HTTPCookieStorage.shared.removeCookies(since: Date.distantPast)
        
        //This part is for removing cache
        WKWebsiteDataStore.default().fetchDataRecords(ofTypes: WKWebsiteDataStore.allWebsiteDataTypes()) { records in
            records.forEach { record in
                WKWebsiteDataStore.default().removeData(ofTypes: record.dataTypes, for: [record], completionHandler: {})

                //After it's done, reload the web page
                self.mainWebView.reload()
            }
        }
    }
    
}

