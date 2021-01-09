//
//  ViewController.swift
//  Milestone_25-27
//
//  Created by Баир Надцалов on 06.01.2021.
//

import UIKit
import AVFoundation

protocol MainViewProtocol: class {
    
    func importImage(sender: UIButton)
    func setTopText(sender: UIButton)
    func setBottomText(sender: UIButton)
}

class ViewController: UIViewController, MainViewProtocol, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    private var mainView: MainView!
    
    private let clickSoundID: SystemSoundID = 1123
    
    private var memeImage: UIImage? {
        didSet {
            drawMeme()
        }
    }
    private var memeTopText: String? {
        didSet {
            drawMeme()
        }
    }
    private var memeBtnText: String? {
        didSet {
            drawMeme()
        }
    }
    
    private var mainImageSize: CGSize = .zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView = MainView()
        mainView.delegate = self
        
        view.addSubview(mainView)
        mainView.autoPinEdgesToSuperviewEdges()
    }
    
    override func viewDidLayoutSubviews() {
        mainImageSize = mainView.frame.size
    }

    func importImage(sender: UIButton) {
        
        animateAndPlaySound(with: sender)
        
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true, completion: nil)

    }
    
    func setTopText(sender: UIButton) {
        
        animateAndPlaySound(with: sender)
        let ac = UIAlertController(title: "Type a text", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self, weak ac] _ in
            guard let text = ac?.textFields?[0].text else { return }
            self?.memeTopText = text
        }))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    
    func setBottomText(sender: UIButton) {
        
        animateAndPlaySound(with: sender)
        
        let ac = UIAlertController(title: "Type a text", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "Ok", style: .default, handler: { [weak self, weak ac] _ in
            guard let text = ac?.textFields?[0].text else { return }
            self?.memeBtnText = text
        }))
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(ac, animated: true, completion: nil)
    }
    
    private func drawMeme() {
        
        let renderer = UIGraphicsImageRenderer(size: mainImageSize)

        let img = renderer.image { ctx in
            
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = .center

            let attrs: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: 36),
                .paragraphStyle: paragraphStyle,
                .foregroundColor: UIColor.white
            ]

            if let string = memeTopText {
                let attributedString = NSAttributedString(string: string, attributes: attrs)
                attributedString.draw(with: CGRect(x: 0, y: 0, width: mainImageSize.width, height: 50), options: .usesLineFragmentOrigin, context: nil)
            }
            
            if let string = memeBtnText {
                let attributedString = NSAttributedString(string: string, attributes: attrs)
                attributedString.draw(with: CGRect(x: 0, y: mainImageSize.height - 50, width: mainImageSize.width, height: 50), options: .usesLineFragmentOrigin, context: nil)
            }
            
            let image = memeImage
            image?.draw(in: CGRect(x: 0, y: 50, width: mainImageSize.width, height: mainImageSize.height - 100))
            
        }

        mainView.imageFrame.image = img
    }
    
    //MARK: - UIImagePickerControllerDelegate & UINavigationControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let image = info[.editedImage] as? UIImage else { return }
        
        dismiss(animated: true, completion: nil)
        
        memeImage = image
    }
    
    //MARK: - Support functions
        
    private func animateAndPlaySound(with btn: UIButton) {
        
        UIView.animate(withDuration: 0.1,
                       animations: {
                        btn.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
                       },
                       completion: { _ in
                        UIView.animate(withDuration: 0.1) {
                            btn.transform = CGAffineTransform.identity
                        }
                       })
        
        AudioServicesPlaySystemSound(clickSoundID)
    }
}

