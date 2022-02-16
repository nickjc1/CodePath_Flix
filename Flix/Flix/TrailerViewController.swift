//
//  TrailerViewController.swift
//  Flix
//
//  Created by Chao Jiang on 2/15/22.
//

import UIKit
import WebKit

class TrailerViewController: UIViewController {
    
    var key: String?
    let trailerWebView: WKWebView = {
        let wv = WKWebView(frame: .zero, configuration: WKWebViewConfiguration())
        return wv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed
        self.view = trailerWebView
        fetchWebDataAndLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.dismiss(animated: true, completion: nil)
    }
    
}

extension TrailerViewController {
    func fetchWebDataAndLoad() {
        if let trailerYoutubeKey = key {
            let myURL = URL(string: "https://www.youtube.com/watch?v=\(trailerYoutubeKey)")
            let myRequest = URLRequest(url: myURL!)
            trailerWebView.load(myRequest)
        } else {
            let myURL = URL(string: "http://www.youtube.com")
            let myRequest = URLRequest(url: myURL!)
            trailerWebView.load(myRequest)
        }
    }
}
