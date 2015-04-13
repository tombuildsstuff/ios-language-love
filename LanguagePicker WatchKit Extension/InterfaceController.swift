//
//  InterfaceController.swift
//  LanguagePicker WatchKit Extension
//
//  Created by Tom Harvey on 13/04/2015.
//  Copyright (c) 2015 Tom Harvey. All rights reserved.
//

import WatchKit
import Foundation
import LanguagePickerCore

class InterfaceController: WKInterfaceController {
    
    @IBOutlet weak var table : WKInterfaceTable?;
    let languages : [String];
    
    override init() {
        self.languages = RepositoryFactory.languages().getAll();
        super.init();
    }

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        var sortedLanguages = self.languages;
        
        sortedLanguages.sort { (first: String, second: String) -> Bool in
            return first.localizedCaseInsensitiveCompare(second) == NSComparisonResult.OrderedAscending;
        };
        
        self.table?.setNumberOfRows(self.languages.count, withRowType: "LanguageRow");
        
        for (index, language) in enumerate(sortedLanguages) {
            self.configureLanguageAtIndex(index, language: language);
        }
    }
    
    // MARK: Private methods
    private func configureLanguageAtIndex(index: Int, language: String) {
        if let table = self.table {
            if let languageRow = table.rowControllerAtIndex(index) as? LanguageRow {
                languageRow.configureLanguage(language);
            }
        }
    }

}
