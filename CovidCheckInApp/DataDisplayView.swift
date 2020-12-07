//
//  DataDisplayView.swift
//  CovidCheckInApp
//
//  Created by Sam Howard on 10/26/20.
//

import UIKit
import RealmSwift

class DataDisplayView: UIViewController {

    @IBOutlet var genWell: UILabel!
    @IBOutlet var sliderLabel: UILabel!
    @IBOutlet var textFieldDisplay: UITextField!
    @IBOutlet var pickerDisplay: UILabel!
    @IBOutlet var textViewDisplay: UITextField!
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        render1()
        render2()
        // Do any additional setup after loading the view.
    }
    
    func render1() {
        let data = try! realm.objects(Data.self)
        for entry in data {
            genWell.text = entry.segData
            sliderLabel.text = entry.sliderData
            textFieldDisplay.text = entry.textFieldData
            textViewDisplay.text = entry.textViewData
        }
    }
    
    func render2() {
        let date = try! realm.objects(Date.self)
        for entry in date {
            pickerDisplay.text = entry.dateData
        }
    }

}
