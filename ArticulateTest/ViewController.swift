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
    
    var gameUrl: String?
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let gurl = gameUrl {
            let request = URLRequest(url: URL(string: gurl)!)
            webView.navigationDelegate = self
            webView.load(request)
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        print("START")
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
        print("FAIL1")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        activityIndicator.stopAnimating()
        print("FAIL2")
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
        print("FINISH")
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        activityIndicator.stopAnimating()
        print("TERMINATE")
    }
    
    @IBAction func onClose(_ sender: Any) {
        print("CLOSE")
        self.navigationController?.popViewController(animated: true)
    }
}

