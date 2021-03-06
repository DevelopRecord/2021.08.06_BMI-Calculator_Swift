//
//  ResultController.swift
//  BMI Calculator
//
//  Created by LeeJaeHyeok on 2021/08/06.
//

import UIKit

// 결과화면 컨트롤러
class ResultController: UIViewController {
    var data: Float!
    
    // MARK: Properties
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "YOUR BMI RESULT"
        label.font = UIFont.systemFont(ofSize: 30, weight: UIFont.Weight.heavy)
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var score: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.heavy)
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var message: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.light)
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var reCalculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("RECALCULATE", for: UIControl.State.normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.addTarget(self, action: #selector(reCalculateTapped), for: UIControl.Event.touchUpInside)
        return button
    }()
    
    // MARK: Selectors
    @objc func reCalculateTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewComponent()
    }
    
    // MARK: Helper
    func configureViewComponent() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(resultLabel)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(score)
        score.translatesAutoresizingMaskIntoConstraints = false
        score.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20).isActive = true
        score.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(message)
        message.translatesAutoresizingMaskIntoConstraints = false
        message.topAnchor.constraint(equalTo: score.bottomAnchor, constant: 20).isActive = true
        message.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(reCalculateButton)
        reCalculateButton.translatesAutoresizingMaskIntoConstraints = false
        reCalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        reCalculateButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
        reCalculateButton.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        reCalculateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
