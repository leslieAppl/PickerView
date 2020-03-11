//
//  ViewController.swift
//  PickerView
//
//  Created by leslie on 3/10/20.
//  Copyright © 2020 leslie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showYearLbl: UILabel!
    @IBOutlet weak var showCountryLbl: UILabel!
    @IBOutlet weak var pickerYears: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerYears.dataSource = self
        pickerYears.delegate = self
        
        selectInitialValue()
    }
    
    func selectInitialValue() {
        
        let myDate = Date()
        let year = myDate.getDateString()
        
        guard let initRowOfYear = pickerData.years.firstIndex(of: year) else { return }
        guard let initRowOfCountry = pickerData.countriesList.firstIndex(where: { (name, _) -> Bool in
            name == "China"
        }) else { return }
        
        pickerYears.selectRow(initRowOfYear, inComponent: 0, animated: false)
        pickerYears.selectRow(initRowOfCountry, inComponent: 1, animated: false)
        
    }
    

    @IBAction func readValueBtnPressed(_ sender: UIButton) {
        // Component means 'Section' in the Picker View.
        let rowOfYear = pickerYears.selectedRow(inComponent: 0)
        let rowOfCountry = pickerYears.selectedRow(inComponent: 1)
        
        showYearLbl.text = pickerData.years[rowOfYear]
        showCountryLbl.text = pickerData.countriesList[rowOfCountry].name
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
