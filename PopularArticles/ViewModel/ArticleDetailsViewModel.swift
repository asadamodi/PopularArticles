//
//  ArticleDetailsViewModel.swift
//  PopularArticles
//
//  Created by Asad on 22/06/22.
//

import UIKit

class ArticleDetailsViewModel: NSObject {
    var m_articleLink :String = ""
    func getRequest()->URLRequest?{
        if let url = URL(string: m_articleLink) {
            let  request = URLRequest(url: url)
            
            return request
            
        }
        return nil
        
    }
}
