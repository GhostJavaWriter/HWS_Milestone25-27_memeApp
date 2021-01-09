//
//  MainView.swift
//  Milestone_25-27
//
//  Created by Баир Надцалов on 06.01.2021.
//

import UIKit

class MainView: UIView {
    
    weak var delegate: MainViewProtocol?
    
    var imageFrame: UIImageView!
    private var importPicBtn: UIButton!
    private var setTopTextBtn: UIButton!
    private var setBottomTextBtn: UIButton!
    
//MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageFrame()
        setupButtons()

    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    
//MARK: - Configuration views
    
    private func setupImageFrame() {
        imageFrame = UIImageView()
        self.addSubview(imageFrame)
        
        imageFrame.layer.borderWidth = 2
        imageFrame.layer.borderColor = UIColor.lightGray.cgColor
        imageFrame.layer.cornerRadius = 5
        imageFrame.backgroundColor = .black
        
        imageFrame.translatesAutoresizingMaskIntoConstraints = false
        imageFrame.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20).isActive = true
        imageFrame.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageFrame.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.85, constant: -10).isActive = true
        imageFrame.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor).isActive = true
    }
    
    private func setupButtons() {
        
        importPicBtn = UIButton()
        setTopTextBtn = UIButton()
        setBottomTextBtn = UIButton()
        
        importPicBtn.setTitle("Pick an image", for: .normal)
        importPicBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        importPicBtn.titleLabel?.lineBreakMode = .byWordWrapping
        
        setBottomTextBtn.setTitle("Set bottom text", for: .normal)
        setBottomTextBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        setBottomTextBtn.titleLabel?.lineBreakMode = .byWordWrapping
        
        setTopTextBtn.setTitle("Set top text", for: .normal)
        setTopTextBtn.titleLabel?.adjustsFontSizeToFitWidth = true
        setTopTextBtn.titleLabel?.lineBreakMode = .byWordWrapping
        
        importPicBtn.translatesAutoresizingMaskIntoConstraints = false
        setTopTextBtn.translatesAutoresizingMaskIntoConstraints = false
        setBottomTextBtn.translatesAutoresizingMaskIntoConstraints = false
        
        importPicBtn.backgroundColor = .lightGray
        importPicBtn.layer.cornerRadius = 5
        
        setTopTextBtn.backgroundColor = .lightGray
        setTopTextBtn.layer.cornerRadius = 5
        
        setBottomTextBtn.backgroundColor = .lightGray
        setBottomTextBtn.layer.cornerRadius = 5
        
        importPicBtn.addTarget(self, action: #selector(importTapped), for: .touchUpInside)
        setTopTextBtn.addTarget(self, action: #selector(setTopBtnTapped), for: .touchUpInside)
        setBottomTextBtn.addTarget(self, action: #selector(setBtmBtnTapped), for: .touchUpInside)
        
        self.addSubview(importPicBtn)
        self.addSubview(setTopTextBtn)
        self.addSubview(setBottomTextBtn)
        
        NSLayoutConstraint.activate([
            
            importPicBtn.topAnchor.constraint(equalTo: imageFrame.bottomAnchor, constant: 5),
            importPicBtn.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            importPicBtn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            importPicBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
            
            setTopTextBtn.topAnchor.constraint(equalTo: imageFrame.bottomAnchor, constant: 5),
            setTopTextBtn.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            setTopTextBtn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            setTopTextBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
            
            setBottomTextBtn.topAnchor.constraint(equalTo: imageFrame.bottomAnchor, constant: 5),
            setBottomTextBtn.trailingAnchor.constraint(equalTo: imageFrame.trailingAnchor),
            setBottomTextBtn.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5),
            setBottomTextBtn.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
        ])
    }
    
//MARK: - Actions
    
    @objc private func importTapped() { delegate?.importImage(sender: importPicBtn) }
    
    @objc private func setTopBtnTapped() { delegate?.setTopText(sender: setTopTextBtn) }
    
    @objc private func setBtmBtnTapped() { delegate?.setBottomText(sender: setBottomTextBtn) }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
//    override func draw(_ rect: CGRect) {
//        // Drawing code
//    }
    

}
