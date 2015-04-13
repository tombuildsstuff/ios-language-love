//
//  LanguagesRepository.swift
//  LanguagePicker
//
//  Created by Tom Harvey on 13/04/2015.
//  Copyright (c) 2015 Tom Harvey. All rights reserved.
//

import Foundation

public class LanguagesRepository: NSObject, ILanguagesRepository {
    
    // MARK: ILanguagesRepository
    public func getAll() -> [String] {
        return [ "C#", "JavaScript", "CoffeeScript", "Erlang", "Clojure", "Ruby" ];
    }
   
}
