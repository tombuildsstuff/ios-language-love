//
//  LanguageViewController.swift
//  LanguagePicker
//
//  Created by Tom Harvey on 13/04/2015.
//  Copyright (c) 2015 Tom Harvey. All rights reserved.
//

import UIKit
import LanguagePickerCore
import Social

class LanguageViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView : UITableView?;
    
    let cellIdentifier = "LanguageCell";
    let languagesRepository : ILanguagesRepository = RepositoryFactory.languages();
    
    var languages : [String]?;
    
    // MARK: Initialisers
    required init() {
        super.init(nibName: "Languages", bundle: nil);
    }
    
    convenience required init(coder: NSCoder) {
        fatalError("NSCoding not supported")
    }
    
    // MARK: UIViewController
    override func viewDidLoad() {
        self.languages = self.languagesRepository.getAll();
        self.tableView?.registerNib(UINib(nibName: self.cellIdentifier, bundle: nil), forCellReuseIdentifier: self.cellIdentifier);
        
        super.viewDidLoad();
    }
    
    // MARK: UITableViewDataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(self.cellIdentifier, forIndexPath: indexPath) as! UITableViewCell;
        
        if let languageCell = cell as? LanguageCell {
            if let language = self.languageAtIndexPath(indexPath) {
                languageCell.configure(language);
            }
        }
        
        return cell;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.languages?.count ?? 0;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    // MARK: UITableViewDelegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true);
        
        if let language = self.languageAtIndexPath(indexPath) {
            let viewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter);
            viewController.setInitialText("Have I ever mentioned how much I *love* \(language)");
            self.navigationController?.presentViewController(viewController, animated: true, completion: nil);
        }
    }
    
    // MARK: Private methods
    private func languageAtIndexPath(indexPath: NSIndexPath) -> String? {
        if let languages = self.languages {
            if languages.count >= indexPath.row {
                return languages[indexPath.row];
            }
        }
        
        return nil;
    }
}
