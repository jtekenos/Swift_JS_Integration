//
//  ViewController.swift
//  w07Browser
//
//  Created by Jessica Tekenos on 2015-11-02.
//  Copyright © 2015 Jessica Tekenos. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, UIWebViewDelegate {
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var searchField: UITextField!
    
    //let url = "https://google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchField.text = "https://"
        let url = NSBundle.mainBundle().URLForResource("index", withExtension:"html")
        let request = NSURLRequest(URL: url!)
        webView.delegate = self
        webView.loadRequest(request)
    }
    
    @IBAction func goButton(sender: AnyObject) {    
        let userRequest = searchField.text;
        let requestURL = NSURL(string:userRequest!)
        let request = NSURLRequest(URL: requestURL!)
        webView.loadRequest(request)
        searchField.resignFirstResponder()
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        webView.stringByEvaluatingJavaScriptFromString("alert('Hello')")
    }

    @IBAction func fieldClicked(sender: AnyObject) {
        searchField.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        let url: NSURL = request.URL!
        if url.scheme == "webbrowserlab" {
            let urlgo = NSURL(string: "https://apple.com")
            let reqgo = NSURLRequest(URL: urlgo!)
            self.webView!.loadRequest(reqgo)
        }
        return true
    }
}

