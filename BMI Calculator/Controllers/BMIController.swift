//
//  BMIController.swift
//  BMI Calculator
//
//  Created by LeeJaeHyeok on 2021/08/06.
//
//Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>

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
        label.text = "1.0M"
        return label
    }()
    
    lazy var heightSliderBar: UISlider = {
        let slide = UISlider()
        slide.minimumValue = 0
        slide.maximumValue = 2
        slide.tintColor = UIColor.systemBlue
        slide.setValue(1, animated: true)
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
        label.text = "75KG"
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
    @objc func heightSliderValueDidChanged(_ sender: UISlider) {
        
        let current = sender.value
        heightValueLabel.text = "\(String(format: "%.2f", current))M"
    }
    
    @objc func weightSlideValueDidChanged(_ sender: UISlider) {

        let current = sender.value
        weightValueLabel.text = "\(String(format: "%.0f", current))KG"
    }
    
    @objc func calculateButtonTapped() {
        let resultVC = ResultController()
        self.present(resultVC, animated: true, completion: nil)
        let score = weightSliderBar.value / (pow(heightSliderBar.value, 2))
        resultVC.score.text = "\(String(format: "%.2f", score))"
        
        if score >= 25 {
            resultVC.message.text = "You're obese! Go to the gym right now!!"
            resultVC.score.textColor = .systemRed
        } else if score >= 23 {
            resultVC.message.text = "You're overweight. Be careful!"
            resultVC.score.textColor = .systemOrange
        } else if score >= 18.5 {
            resultVC.message.text = "You're normal. It's very good!"
        } else {
            resultVC.message.numberOfLines = 2
            resultVC.message.textAlignment = .center
            resultVC.message.text = "You're underweight.\nMeal and exercise at the same time!!"
            resultVC.score.textColor = .systemRed
        }
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
        heightLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 230).isActive = true
        heightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        view.addSubview(heightValueLabel)
        heightValueLabel.translatesAutoresizingMaskIntoConstraints = false
        heightValueLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 230).isActive = true
        heightValueLabel.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -20).isActive = true
        
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
        weightValueLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        
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
