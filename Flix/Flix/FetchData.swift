//
//  FetchData.swift
//  Flix
//
//  Created by Chao Jiang on 2/13/22.
//

import UIKit

struct Fetch {
    
    static func fetchData(urlStr: String, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let url = URL(string: urlStr)!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request, completionHandler: completionHandler)
        task.resume()
    }
    
}
