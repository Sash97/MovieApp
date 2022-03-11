//
//  HomeController.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 09.03.22.
//

import UIKit


class HomeController: UIViewController {
    
    //MARK: - Outlets -
    
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var waitImageView: UIImageView!
    
    
    //MARK: - Properties -
    
    private var isLoading = false
    
    
    
    //MARK: - Dependencies -

    weak var coordinator: HomeCoordinator?
    var movieViewModel: MovieViewModelType!
    
    
    
    
    //MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureNavigationBar()
        self.updateUI()
        self.showErrorAlertIfNeeded()
        self.movieViewModel.getMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    
    
    //MARK: - Methods -
    
    private func configureNavigationBar() {
        self.navigationItem.title = "Movies"
    }
    
    private func updateUI() {
        self.movieViewModel.reloadData = { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.waitImageView.isHidden = true
                self.moviesTableView.isHidden = false
                self.moviesTableView.reloadData()
                self.updateUIHelper(isLoading: false, footer: nil)
            }
        }
    }
    
    private func showErrorAlertIfNeeded() {
        self.movieViewModel.errorMessageCallback = { [weak self] message in
            guard let self = self else { return }
            AlertService.shared.showErrorAlert(title: message, on: self) {}
        }
    }
    
    private func updateUIHelper(isLoading: Bool, footer: UIView?) {
        self.moviesTableView.tableFooterView = footer
        self.isLoading = isLoading
    }
    
    private func createSpinnerForTableViewFooter() -> UIView {
        let footerView = UIView.init(frame: .init(x: 0, y: 0,
                                                  width: view.frame.size.width,
                                                  height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        if #available(iOS 13.0, *) {
            spinner.style = .large
        } else {
            spinner.style = .white
        }
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
}

extension HomeController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.movieViewModel.getMoviesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieCell = tableView.dequeReusableCell()
        cell.setCell(with: self.movieViewModel.getMovie(by: indexPath))
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 260
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.movieViewModel.getMoviesCount() - 1 == indexPath.row && !isLoading {
            self.updateUIHelper(isLoading: true, footer: self.createSpinnerForTableViewFooter())
            self.movieViewModel.getMoreMovies()
        }
    }
}
