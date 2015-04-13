//
//  LanguageRow.swift
//  LanguagePicker
//
//  Created by Tom Harvey on 13/04/2015.
//  Copyright (c) 2015 Tom Harvey. All rights reserved.
//

import WatchKit

class LanguageRow: NSObject {

    @IBOutlet weak var label : WKInterfaceLabel?;
    
    func configureLanguage(language: String) {
        self.label?.setText(language);
    }

}
