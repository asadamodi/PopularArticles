//
//  ArticleListViewModel.swift
//  PopularArticles
//
//  Created by Asad on 22/06/22.
//

import UIKit

class ArticleListViewModel: NSObject {
    
    weak var delegate:PopularArticleProtocol?
    var m_popularArticleArray : MostPopularResponse?

    func fetchPopularArticles()
    {
        WebserviceManager.sharedInstance.executeGetRequest(url: baseURL) {[unowned self] data, response, error, status in
            if let data = data{
                self.m_popularArticleArray = convertDataToModel(data, type: MostPopularResponse.self)
                
                
            }
            self.delegate?.fetchTaskFinished()
        }
    }

}
