//
//  TeamTableViewCell.swift
//  premiereLeagueApp
//
//  Created by Kaua Miguel on 18/09/23.
//

import UIKit

protocol TeamTableViewCellDelegate : AnyObject{
    func didTapPlayback (team : Team)
}

class TeamTableViewCell: UITableViewCell {

    static let cellId = "TeamTableViewCell"
    
    private lazy var containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var contentStackView : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var foundedLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .white
        return label
    }()
    
    private lazy var jobLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 10, weight: .light)
        label.textColor = .white
        return label
    }()
    
    private lazy var infoLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .white
        return label
    }()
    
    private lazy var badge : UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var playButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tintColor = .white
        return button
    }()
    
    private weak var delegate : TeamTableViewCellDelegate?
    private var team : Team?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.cornerRadius = 10
    }
    
    
    func configure(_ item: Team, delegate : TeamTableViewCellDelegate){
        
        self.delegate = delegate
        self.team = item
        
        playButton.addTarget(self, action: #selector(didTapPlayBack), for: .touchUpInside)
        
        containerView.backgroundColor = item.id.background
        
        nameLabel.text = item.name
        foundedLabel.text = item.founded
        jobLabel.text = "Current \(item.manager.job.rawValue) : \(item.manager.name)"
        infoLabel.text = item.info
        
        
        badge.image = item.id.badge
        playButton.setImage(item.isPlaying ? Assets.pause : Assets.play, for: .normal)
        
        self.contentView.addSubview(containerView)
        
        containerView.addSubview(contentStackView)
        containerView.addSubview(badge)
        containerView.addSubview(playButton)
        
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(foundedLabel)
        contentStackView.addArrangedSubview(jobLabel)
        contentStackView.addArrangedSubview(infoLabel)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8),
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8),
            
            badge.heightAnchor.constraint(equalToConstant: 50),
            badge.widthAnchor.constraint(equalToConstant: 50),
            badge.topAnchor.constraint(equalTo: contentStackView.topAnchor),
            badge.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8),
            
            
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),
            contentStackView.leadingAnchor.constraint(equalTo: badge.trailingAnchor, constant: 8),
            contentStackView.trailingAnchor.constraint(equalTo: playButton.leadingAnchor, constant: -8),

            playButton.heightAnchor.constraint(equalToConstant: 44),
            playButton.widthAnchor.constraint(equalToConstant: 44),
            playButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            playButton.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
            
        ])
    }
    
    
    @objc func didTapPlayBack() {
        delegate?.didTapPlayback(team: team!)
    }
}
