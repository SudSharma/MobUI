//
//  ViewController.swift
//  MOBUI
//
//  Created by Sudarshan Sharma on 12/23/23.
//

import UIKit

class ViewController: UIViewController {

    let dateTextField = MobUIDatePickerTextField()
    let datePicker = MobUIDatePickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize the text field as needed
        dateTextField.placeholder = "Select Date and Time"
        dateTextField.borderStyle = .roundedRect
        
        // Add the text field to the view
        view.addSubview(datePicker)
        
        setupConstraints()
        
    }

    func setupConstraints() {
        // Add constraints to pin the view to its superview
        NSLayoutConstraint.activate([
            datePicker.topAnchor.constraint(equalTo: view.topAnchor, constant: 100.0),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15.0),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15.0),
            datePicker.heightAnchor.constraint(equalToConstant: 40.0)
        ])
    }
}

