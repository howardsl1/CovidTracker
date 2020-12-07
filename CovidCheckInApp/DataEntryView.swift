//
//  DataEntryView.swift
//  CovidCheckInApp
//
//  Created by Sam Howard on 10/26/20.
//

import UIKit
import RealmSwift

class DataEntryView: UIViewController {

    @IBOutlet var setControl: UISegmentedControl!
    @IBOutlet var sliderValue: UISlider!
    @IBOutlet var textField: UITextField!
    @IBOutlet var textViewTemp: UITextView!
    @IBOutlet var datePicker: UIDatePicker!
    
    let dateFormatter: DateFormatter = DateFormatter()
    
    var sliderTemp: String?
    var segTemp: String?
    var textFieldTemp: String?
    var textviewtemp: String?
    var tempDate: String?
    
    let realm = try! Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        print(Realm.Configuration.defaultConfiguration.fileURL)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        switch setControl.selectedSegmentIndex {
        case 0:
            segTemp = "Great"
        case 1:
            segTemp = "Good"
        case 2:
            segTemp = "Neutral"
        case 3:
            segTemp = "Bad"
        case 4:
            segTemp = "Horrible"
        default:
            segTemp = "Good"
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderTemp = "\(sliderValue.value)"
    }
    
    @IBAction func submitData(_ sender: UIButton) {
        textFieldTemp = textField.text
        textviewtemp = textViewTemp.text
        let selectedDate: String = dateFormatter.string(from: datePicker.date)
        tempDate = selectedDate
        save()
    }
    
    func save() {
        let dataEntry = Data()
        let dateEntry = Date()
        dataEntry.textFieldData = textFieldTemp!
        dataEntry.textViewData = textviewtemp!
        dataEntry.sliderData = sliderTemp!
        dataEntry.segData = segTemp!
        dateEntry.dateData = tempDate!
        realm.beginWrite()
        realm.add(dataEntry)
        realm.add(dateEntry)
        try! realm.commitWrite()
    }
}
