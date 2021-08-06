//
//  BMIController.swift
//  BMI Calculator
//
//  Created by LeeJaeHyeok on 2021/08/06.
//

import UIKit

class BMIController: UIViewController {
    
    // MARK: Properties
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "BMI \nCALCULATOR"
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 36, weight: UIFont.Weight.heavy)
        label.textColor = .systemBlue
        return label
    }()
    
    lazy var heightLabel: UILabel = {
        let label = UILabel()
        label.text = "HEIGHT"
        return label
    }()
    
    lazy var heightValueLabel: UILabel = {
        let label = UILabel()
        label.text = "100"
        return label
    }()
    
    lazy var heightSliderBar: UISlider = {
        let slide = UISlider()
        slide.minimumValue = 0
        slide.maximumValue = 200
        slide.tintColor = UIColor.systemBlue
        slide.setValue(100, animated: true)
        slide.addTarget(self, action: #selector(heightSliderValueDidChanged), for: UIControl.Event.touchUpInside)
        return slide
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.text = "WEIGHT"
        return label
    }()
    
    lazy var weightValueLabel: UILabel = {
        let label = UILabel()
        label.text = "75"
        return label
    }()
    
    lazy var weightSliderBar: UISlider = {
        let slide = UISlider()
        slide.minimumValue = 0
        slide.maximumValue = 150
        slide.tintColor = UIColor.systemBlue
        slide.setValue(75, animated: true)
        slide.addTarget(self, action: #selector(weightSlideValueDidChanged), for: UIControl.Event.touchUpInside)
        return slide
    }()
    
    lazy var calculateButton: UIButton = {
        let button = UIButton(type: UIButton.ButtonType.custom)
        button.setTitle("CALCULATE", for: UIControl.State.normal)
        button.backgroundColor = .systemBlue
        button.titleLabel?.font = .systemFont(ofSize: 22)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.addTarget(self, action: #selector(calculateButtonTapped), for: UIControl.Event.touchUpInside)
        return button
        
        
    }()
    
    // MARK: Selectors
    @objc func heightSliderValueDidChanged() {
        print("height slider value did changed!!")
        
        let current = heightValueLabel
        
        heightValueLabel.text = "\(current)"
    }
    
    @objc func weightSlideValueDidChanged() {
        print("weight slider value changed!!!")
    }
    
    @objc func calculateButtonTapped(){
        print("calculate button tapped!")
    }
    
    // MARK: Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configuresViewComponent()
    }
    
    // MARK: Helper
    func configuresViewComponent() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        
        view.addSubview(heightLabel)
        heightLabel.translatesAutoresizingMaskIntoConstraints = false
        heightLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 330).isActive = true
        heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(heightValueLabel)
        heightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        heightValueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 330).isActive = true
        heightValueLabel.leadingAnchor.constraint(equalTo: heightLabel.leadingAnchor, constant: 355).isActive = true
        
        view.addSubview(heightSliderBar)
        heightSliderBar.translatesAutoresizingMaskIntoConstraints = false
        heightSliderBar.topAnchor.constraint(equalTo: heightLabel.bottomAnchor, constant: 25).isActive = true
        heightSliderBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        heightSliderBar.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        heightSliderBar.heightAnchor.constraint(equalToConstant: 20).isActive = true

        view.addSubview(weightLabel)
        weightLabel.translatesAutoresizingMaskIntoConstraints = false
        weightLabel.topAnchor.constraint(equalTo: heightSliderBar.bottomAnchor, constant: 20).isActive = true
        weightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(weightValueLabel)
        weightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        weightValueLabel.topAnchor.constraint(equalTo: heightSliderBar.bottomAnchor, constant: 20).isActive = true
        weightValueLabel.leadingAnchor.constraint(equalTo: weightLabel.leadingAnchor, constant: 355).isActive = true
        
        view.addSubview(weightSliderBar)
        weightSliderBar.translatesAutoresizingMaskIntoConstraints = false
        weightSliderBar.topAnchor.constraint(equalTo: weightLabel.bottomAnchor, constant: 25).isActive = true
        weightSliderBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weightSliderBar.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        weightSliderBar.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(calculateButton)
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.topAnchor.constraint(equalTo: weightSliderBar.bottomAnchor, constant: 40).isActive = true
        calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        calculateButton.widthAnchor.constraint(equalToConstant: view.frame.width - 40).isActive = true
        calculateButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
}
