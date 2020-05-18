//
//  CustomButton.swift
//  signarfy001
//
//  Created by SBI Admin on 2020/05/14.
//  Copyright © 2020 Rhulani ndhlovu. All rights reserved.
//

import UIKit

class CustomButtonWhite: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        backgroundColor     = UIColor.white
        titleLabel?.font    = UIFont(name: "AvenirLTStd-Book", size: 22)
        setTitleColor(UIColor.black, for: .normal)
        layer.cornerRadius  = frame.size.height/2
    }
}



class CustomButtonN: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        backgroundColor     = .white
        titleLabel?.font    = UIFont(name: "AvenirLTStd-Book", size: 22)
        setTitleColor(UIColor.black, for: .normal)
        layer.cornerRadius  = frame.size.height/2
    }
}




class CustomButtonClear: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    private func setupButton() {
        backgroundColor     = UIColor.clear
        titleLabel?.font    = UIFont(name: "AvenirLTStd-Book", size: 22)
        setTitleColor(UIColor.white, for: .normal)
        layer.cornerRadius  = frame.size.height/2
    }
}


let grayBeaut = UIColor(hex: "#A2B1C6ff")
let whiteBeaut = UIColor(hex: "#E1E6ECff")
let menuBack = UIColor(hex: "#242633")
let menuBackDark = UIColor(hex: "#1D1E27")


extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }

        return nil
    }
}
