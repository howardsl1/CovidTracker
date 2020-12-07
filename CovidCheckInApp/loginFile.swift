//
//  loginFile.swift
//  CovidCheckInApp
//
//  Created by Sam Howard on 11/2/20.
//

import UIKit
import RealmSwift

class loginFile: UIViewController {
    
    @IBOutlet var studentIDtextfield: UITextField!
    @IBOutlet var studentEmailtextfield: UITextField!
    @IBOutlet var studentPWtextfield: UITextField!
    
    var idTemp: String?
    var emailTemp: String?
    var pwTemp: String?
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Realm.Configuration.defaultConfiguration.fileURL)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func goTapped(_ sender: UIButton) {
        idTemp = studentIDtextfield.text
        emailTemp = studentEmailtextfield.text
        pwTemp = studentPWtextfield.text
        print(idTemp!)
        print(emailTemp!)
        print(pwTemp!)
        save()
    }
    
    
    func save() {
        let loginEntry = Login()
        loginEntry.studentID = idTemp!
        loginEntry.email = emailTemp!
        loginEntry.pw = pwTemp!
        realm.beginWrite()
        realm.add(loginEntry)
        try! realm.commitWrite()
    }
    

}
