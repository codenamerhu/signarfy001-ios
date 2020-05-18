//
//  CustomEditTextField.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/14.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpField()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder: aDecoder )
        setUpField()
    }
    
    
    private func setUpField() {
        tintColor             = .white
        textColor             = .darkGray
        font                  = UIFont(name: "avenirNextCondensedDemiBold", size: 18)
        backgroundColor       = UIColor(white: 1.0, alpha: 0.5)
        autocorrectionType    = .no
        layer.cornerRadius    = 25.0
        clipsToBounds         = true
        
        //var _placeholder_       = "Password"
        let place             = self.placeholder != nil ? self.placeholder : ""
        placeholder           = place
        
        
        /*
        let placeholderFont   = UIFont(name: "avenirNextCondensedDemiBold", size: 18)!*/
        attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "", attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.lightGray/*,
             NSAttributedString.Key.font: placeholderFont*/])
        
        let indentView        = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        
        
        leftView              = indentView
        leftViewMode          = .always
    }
}
