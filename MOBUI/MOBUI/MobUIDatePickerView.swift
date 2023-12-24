//
//  MobUIDatePickerView.swift
//

import UIKit

class MobUIDatePickerView: UIView {
    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 10.0
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    private lazy var caretView: UIButton = {
        let caretView = UIButton()
        caretView.setImage(UIImage.init(systemName: "chevron.down"), for: .normal)
        caretView.addTarget(self,
                            action: #selector(buttonTapped),
                            for: .touchUpInside)

        return caretView
    }()
    
    private lazy var textField: MobUIDatePickerTextField = {
        let textField = MobUIDatePickerTextField()
        textField.placeholder = "Select Date and Time"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    init() {
        super.init(frame: .zero)
        
        commonSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

private extension MobUIDatePickerView {
    
    @objc
    func buttonTapped() {
        if textField.isFirstResponder {
            textField.resignFirstResponder()
            UIView.transition(with: caretView,
                              duration: 0.3,
                              options: .transitionFlipFromTop,
                              animations: {
                self.caretView.setImage(UIImage.init(systemName: "chevron.down"), for: .normal)
                    }, completion: nil)
            
        }
        else {
            textField.becomeFirstResponder()
            UIView.transition(with: caretView,
                              duration: 0.3,
                              options: .transitionFlipFromBottom,
                              animations: {
                self.caretView.setImage(UIImage.init(systemName: "chevron.up"), for: .normal)
                    }, completion: nil)
        }
    }
    
    func commonSetup() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(containerStackView)
        setupConstraints()
        containerStackView.addArrangedSubview(textField)
        
        caretView.setContentCompressionResistancePriority(.required, for: .vertical)
        caretView.setContentHuggingPriority(.required, for: .vertical)
                
        containerStackView.addArrangedSubview(caretView)
        
    }
    
    func setupConstraints() {
        // Add constraints to pin the view to its superview
        NSLayoutConstraint.activate([
            containerStackView.topAnchor.constraint(equalTo: topAnchor),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

extension MobUIDatePickerView: UITextFieldDelegate {
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        false
    }
}
