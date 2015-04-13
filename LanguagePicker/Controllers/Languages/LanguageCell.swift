//
//  LanguageCell.swift
//  LanguagePicker
//
//  Created by Tom Harvey on 13/04/2015.
//  Copyright (c) 2015 Tom Harvey. All rights reserved.
//

import UIKit

class LanguageCell: UITableViewCell {
    
    func configure(language: String) {
        self.textLabel?.text = language;
    }
   
}
