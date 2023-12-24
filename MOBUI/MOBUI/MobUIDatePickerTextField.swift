//
//  MobUIDatePickerTextField.swift
//

import UIKit

class MobUIDatePickerTextField: UITextField {
    private let datePicker = UIDatePicker()
    
    var datePickerMode: UIDatePicker.Mode = .dateAndTime
    
    var initialDate = Date()

    var preferredDatePickerStyle: UIDatePickerStyle = .wheels
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        configure()
    }
}

private extension MobUIDatePickerTextField {
    func configure() {
        // Set date picker mode and any other configurations
        datePicker.datePickerMode = datePickerMode
        datePicker.preferredDatePickerStyle = preferredDatePickerStyle
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)

        // Set input view of the text field to the date picker
        self.inputView = datePicker
        
        // Set initial date
        datePicker.date = initialDate
        
        setupInputAccessoryView()
    }
    
    @objc
    func doneButtonTapped() {
        self.resignFirstResponder()
    }
    
    @objc
    func datePickerValueChanged() {
        // Handle date picker value changed event
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        self.text = dateFormatter.string(from: datePicker.date)
    }
    
    func setupInputAccessoryView() {
        // Create a toolbar with a done button to dismiss the date picker
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: true)
        
        self.inputAccessoryView = toolbar
    }
}
