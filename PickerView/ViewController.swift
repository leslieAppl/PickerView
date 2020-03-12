//
//  ViewController.swift
//  PickerView
//
//  Created by leslie on 3/10/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let datePicker = UIDatePicker(frame: CGRect(x: 65, y: 0, width: 250, height: 200))
    @IBOutlet weak var picker: UIDatePicker!
    
    @IBOutlet weak var showYearLbl: UILabel!
    @IBOutlet weak var showCountryLbl: UILabel!
    @IBOutlet weak var pickerYears: UIPickerView!
    
    @IBOutlet weak var showDateLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        pickerYears.dataSource = self
        pickerYears.delegate = self
        
        selectInitialValue()
        
        initDatePicker()
        
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updatePicker(sender:)), userInfo: nil, repeats: true)
    }
    
    @objc func updatePicker(sender: Timer) {
        picker.date = Date()
    }
    
    func selectInitialValue() {
        
        let myDate = Date()
        let year = myDate.getCurrentYearString()
        
        guard let initRowOfYear = pickerData.years.firstIndex(of: year) else { return }
        guard let initRowOfCountry = pickerData.countriesList.firstIndex(where: { (name, _) -> Bool in
            name == "China"
        }) else { return }
        
        pickerYears.selectRow(initRowOfYear, inComponent: 0, animated: false)
        pickerYears.selectRow(initRowOfCountry, inComponent: 1, animated: false)
        
    }
    
    func initDatePicker() {
        
//        datePicker.datePickerMode = .date
        datePicker.datePickerMode = .dateAndTime
//        datePicker.calendar = .current
        
        selectInitialDate()
        
        self.view.addSubview(datePicker)
        
    }
    
    func selectInitialDate() {
                
        let selectedDate = pickerData.getDate(from: 1980, mm: 02, dd: 14)
        print(selectedDate)
//        datePicker.date = selectedDate
        datePicker.setDate(selectedDate, animated: true)
        
    }
    
    @IBAction func readValueBtnPressed(_ sender: UIButton) {
        // Component means 'Section' in the Picker View.
        let rowOfYear = pickerYears.selectedRow(inComponent: 0)
        let rowOfCountry = pickerYears.selectedRow(inComponent: 1)
        
        showYearLbl.text = pickerData.years[rowOfYear]
        showCountryLbl.text = pickerData.countriesList[rowOfCountry].name
    }
    
    @IBAction func getDateBtnPressed(_ sender: UIButton) {
        
        let selectedDate = datePicker.date
        let format = DateFormatter()
        format.dateStyle = .medium
        
        showDateLbl.text = "Date: \(format.string(from: selectedDate))"
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    //MARK: - Picker Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if component == 1 {
            return pickerData.countriesList.count
        } else {
            return pickerData.years.count
        }
    }
    
    //MARK: - Picker Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if component == 1 {
            return pickerData.countriesList[row].name
        } else {
            return pickerData.years[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if component == 0 {
            let year = pickerData.years[row]
            showYearLbl.text = year
        } else {
            let country = pickerData.countriesList[row].name
            showCountryLbl.text = country
        }
        
    }
}
