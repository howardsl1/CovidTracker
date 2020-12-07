//
//  Data.swift
//  CovidCheckInApp
//
//  Created by Sam Howard on 10/26/20.
//

import Foundation
import RealmSwift

class Data: Object {
    @objc dynamic var textFieldData: String = ""
    @objc dynamic var textViewData: String = ""
    @objc dynamic var segData: String = ""
    @objc dynamic var sliderData: String = ""
    //
    
}

class Date: Object {
    @objc dynamic var dateData: String = ""
}

class Login: Object {
    @objc dynamic var studentID: String = ""
    @objc dynamic var email: String = ""
    @objc dynamic var pw: String = ""
}
