//
//  ViewController.swift
//  ArticulateTest
//
//  Created by Jacopo Mangiavacchi on 1/9/18.
//  Copyright © 2018 Jacopo Mangiavacchi. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://articulatehosting.mybluemix.net/game1/story_html5.html")
        let request = URLRequest(url: url!)
        
        // init and load request in webview.
        webView.navigationDelegate = self
        webView.load(request)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("START")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("FAIL1")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        print("FAIL2")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("FINISH")
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        print("TERMINATE")
    }
}

