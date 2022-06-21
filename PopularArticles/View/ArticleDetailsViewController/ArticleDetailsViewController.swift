//
//  ArticleDetailsViewController.swift
//  PopularArticles
//
//  Created by Asad on 22/06/22.
//

import UIKit
import WebKit
class ArticleDetailsViewController: UIViewController {

    let m_viewModel = ArticleDetailsViewModel()
    @IBOutlet weak var m_webView: WKWebView!

    override func viewDidLoad() {
        super.viewDidLoad()
        m_webView.navigationDelegate = self

        // Do any additional setup after loading the view.
    }


    override func viewDidAppear(_ animated: Bool) {
        if let request = m_viewModel.getRequest(){
            showHUD(message: "pleaseWait".localized())

            m_webView.load(request)
        }
    }

}
extension ArticleDetailsViewController:WKNavigationDelegate{
//
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {

            hideHUD()
        }
    
}
