//
//  ResultController.swift
//  BMI Calculator
//
//  Created by LeeJaeHyeok on 2021/08/06.
//

import UIKit

class ResultController: UIViewController {
    
    // MARK: Properties
    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.text = "결과값"
        return label
    }()
    
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
        resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        resultLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
    }
}
