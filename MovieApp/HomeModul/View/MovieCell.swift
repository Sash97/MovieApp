//
//  MovieCell.swift
//  MovieApp
//
//  Created by Aleksandr Bagdasaryan on 10.03.22.
//

import UIKit



class MovieCell: UITableViewCell {
    //MARK: - Outlets -
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieTitlesBackView: UIView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    
    
    //MARK: - Init -
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureCell()
    }
    
    
    
    //MARK: - Methods -
    
    private func configureCell() {
        self.backView.layer.cornerRadius = 8
        self.backView.layer.masksToBounds = true
        self.contentView.setShadow(color: UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.45).cgColor,
                                    offset: .init(width: 0, height: 4),
                                    radius: 4,
                                    opacity: 1)
        self.addGradientToMovieTitlesBackView()
    }
    
    private func addGradientToMovieTitlesBackView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = CGRect(x: 0, y: -30, width: self.frame.width, height: 130)
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        self.movieTitlesBackView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func setCell(with viewModel: MovieViewModelRepresentableType) {
        self.movieTitleLabel.text = viewModel.title
        self.releaseDateLabel.text = viewModel.dateOfRelease
        self.rateLabel.text = viewModel.rate
        self.movieImageView.retrieveImage(with: viewModel.imagePath)
    }
}
