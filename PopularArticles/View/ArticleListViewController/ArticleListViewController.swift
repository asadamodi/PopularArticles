//
//  ArticleListViewController.swift
//  PopularArticles
//
//  Created by Asad on 22/06/22.
//

import UIKit
import SDWebImage
class ArticleListViewController: UIViewController {

    @IBOutlet weak var m_tableView: UITableView!
    
    let m_viewModel = ArticleListViewModel()

    let m_reuseIdentifier = "ArticleListTableViewCell"
    var m_dataIsLoaded = false
    let refreshControl = UIRefreshControl()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        m_viewModel.delegate = self
        m_tableView.register(UINib(nibName: m_reuseIdentifier, bundle: nil), forCellReuseIdentifier: m_reuseIdentifier)
        refreshControl.attributedTitle = NSAttributedString(string: "pullToRefresh".localized())
        refreshControl.addTarget(self, action: #selector(fetchArticles), for: .valueChanged)
        m_tableView.addSubview(refreshControl)
        self.title = "articles".localized();
    }

    override func viewDidAppear(_ animated: Bool) {
        if(!m_dataIsLoaded){
            fetchArticles()
        }
    }
    @objc func fetchArticles(){
        showHUD(message: "pleaseWait".localized())
        m_viewModel.fetchPopularArticles()
    }
   

}

extension ArticleListViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print( m_viewModel.m_popularArticleArray?.results?.count ?? 0);
        return m_viewModel.m_popularArticleArray?.results?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: m_reuseIdentifier, for: indexPath) as! ArticleListTableViewCell
        if let article = m_viewModel.m_popularArticleArray?.results?[indexPath.row]{
            cell.m_titleLabel.text = article.title
            cell.m_subTitleLabel.text = article.byline
            cell.m_dateLabel.text = article.publishedDate
            if let thumbURL = article.media?.first?.mediaMetadata?.first?.url{
                cell.m_thumbnailImageView.sd_setImage(with: URL(string: thumbURL), placeholderImage: UIImage(systemName: "pencil.circle"))
            }

        }
        return cell
    }
    
    
}
extension ArticleListViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(isConnectedToInternet()){
        guard let url = m_viewModel.m_popularArticleArray?.results?[indexPath.row].url else {return}
        let detailsViewController = ArticleDetailsViewController()
        detailsViewController.m_viewModel.m_articleLink = url
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(detailsViewController, animated: true)
        }
        else{
            displayActivityAlert(title: "noInternetAlert".localized())
        }
    }
}
extension ArticleListViewController:PopularArticleProtocol{
    func fetchTaskFinished() {
        DispatchQueue.main.async { [unowned self]in
            self.m_dataIsLoaded = true
            refreshControl.endRefreshing()
            hideHUD()
            self.m_tableView.reloadData()
            
        }
    }
}
