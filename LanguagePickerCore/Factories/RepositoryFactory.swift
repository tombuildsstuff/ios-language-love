//
//  RepositoryFactory.swift
//  LanguagePicker
//
//  Created by Tom Harvey on 13/04/2015.
//  Copyright (c) 2015 Tom Harvey. All rights reserved.
//

import UIKit

public class RepositoryFactory: NSObject {
   
    public class func languages() -> ILanguagesRepository {
        return LanguagesRepository();
    }
    
}
