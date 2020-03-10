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
    @IBOutlet weak var pickerYears: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerYears.dataSource = self
        pickerYears.delegate = self
        
    }

    @IBAction func readValueBtnPressed(_ sender: UIButton) {
        // Component means 'Section' in the Picker View.
        let row = pickerYears.selectedRow(inComponent: 0)
        showYearLbl.text = pickerData.years[row]
    }
    
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    //MARK: - Picker Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.years.count
    }
    
    //MARK: - Picker Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData.years[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let year = pickerData.years[row]
        showYearLbl.text = year
        
    }
}
