//
//  ViewController.swift
//  tipCalculator
//
//  Created by Mayuresh Rao on 2/26/17.
//  Copyright © 2017 Mayuresh Rao. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    @IBOutlet weak var patchOulet: UIView!
    
    @IBOutlet weak var defaultUISelector: UISegmentedControl!
    @IBOutlet weak var third: UITextField!
    @IBOutlet weak var second: UITextField!
    @IBOutlet weak var first: UITextField!
    var numbers = ["1","2","3","4","5","6","7","8","9","10",
                   "11","12","13","14","15","16","17","18","19","20",
                   "21","22","23","24","25","26","27","28","29","30",
                   "31","32","33","34","35","36","37","38","39","40",
                   "41","42","43","44","45","46","47","48","49","50",
                   "51","52","53","54","55","56","57","58","59","60",
                   "61","62","63","64","65","66","67","68","69","70",
                   "71","72","73","74","75","76","77","78","79","80",
                   "81","82","83","84","85","86","87","88","89","90",
                   "91","92","93","94","95","96","97","98","99","100",]
    var myStringValue1:Double?
    var myStringValue2:Double?
    var myStringValue3:Double?
    var tipPercentages:[Double] = [18,20,25]

    
    
    @IBOutlet weak var crossButton: UIButton!
    @IBOutlet weak var settingViewOutlet: UIView!
    @IBOutlet weak var tipPercentageController: UISegmentedControl!
    @IBOutlet weak var billText: UITextField!
    @IBOutlet weak var totalOutlet: UILabel!
    @IBOutlet weak var tipOutlet: UILabel!
    
    @IBAction func tipPercentageActionButton(_ sender: Any) {
        var tip: Double = 0
        var total : Double = 0
        var bill : Double = 0
        print("INDEX SLECTED = \(tipPercentageController.selectedSegmentIndex)")
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        bill = Double(billText.text!) ?? 0
        tip = bill * (0.01) * Double(tipPercentages[tipPercentageController.selectedSegmentIndex])
        total = tip + bill
        let formattedNum1 = formatter.string(from: NSNumber(value : tip))
        //tipOutlet.sizeToFit()
        
        tipOutlet.text = formattedNum1
        let formattedNum2 = formatter.string(from: NSNumber(value : total))
        //totalOutlet.sizeToFit()
        totalOutlet.text = formattedNum2
        tipOutlet.adjustsFontSizeToFitWidth = false;
        tipOutlet.lineBreakMode = .byTruncatingTail
        
        totalOutlet.adjustsFontSizeToFitWidth = false;
        totalOutlet.lineBreakMode = .byTruncatingTail
        

    }
    var myString:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        billText.layer.cornerRadius = 10
        billText.layer.borderWidth = 2
        crossButton.layer.cornerRadius = 10
        crossButton.layer.borderWidth = 2
        crossButton.layer.borderColor = UIColor.white.cgColor
        settingViewOutlet.layer.cornerRadius = 10
        settingViewOutlet.isHidden = true
        settingViewOutlet.layer.borderWidth = 2
        settingViewOutlet.layer.borderColor = UIColor.white.cgColor

        patchOulet.isHidden = true
        //create a new button
       let button: UIButton = UIButton(type: .custom)
        button.addTarget(self, action: #selector(self.addTapped), for: .touchUpInside)
        button.setImage(UIImage(named: "gear.png"), for: UIControlState.normal)
        button.frame = CGRect(x:0,y:0,width:30,height:30)
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
        let rightNavItem = UIBarButtonItem()
        rightNavItem.action = Selector(("addTapped"))
        first.text = ("\(tipPercentages[0])")
        second.text = ("\(tipPercentages[1])")
        third.text = ("\(tipPercentages[2])")
      //  first.sizeToFit()
        //second.sizeToFit()
        //third.sizeToFit()
        let picker: UIPickerView
        picker = UIPickerView( frame:CGRect(x:0, y:200, width:400, height:200))
        picker.backgroundColor = .white
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.blue
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(donePicker))
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        first.inputView = picker
        first.inputAccessoryView = toolBar
        second.inputView = picker
        second.inputAccessoryView = toolBar
        third.inputView = picker
        third.inputAccessoryView = toolBar

        
  
    }
    override func viewWillAppear(_ animated: Bool) {
        print("I appeeared\(myString)")
    }
    
    
    func donePicker()
    {
        
        if(first.isFirstResponder)
        {
            first.resignFirstResponder()
        }
        else
        if(second.isFirstResponder)
        {
                second.resignFirstResponder()
            }
            else
            {
                third.resignFirstResponder()
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    @IBAction func crossButtonActionButton(_ sender: Any)
    {
        tipPercentageController.setTitle("\(first.text!)%", forSegmentAt:0)
        tipPercentageController.setTitle("\(second.text!)%", forSegmentAt:1)
        tipPercentageController.setTitle("\(third.text!)%", forSegmentAt:2)
        //tipPercentages[0] = first.text!
        //tipPercentages[1] = second.text!
        //tipPercentages[2] = thi.text!
        print("My First Index = \(first.text!)")
        settingViewOutlet.isHidden = true
        patchOulet.isHidden = true
        //firstViewController.tipPercentageController.setTitle("\(first.text!)", forSegmentAt: 0)
        // firstViewController.tipPercentageController.setTitle(second.text!, forSegmentAt: 1)
        //firstViewController.tipPercentageController.setTitle(third.text!, forSegmentAt: 2)
        self.tipPercentageController.selectedSegmentIndex = defaultUISelector.selectedSegmentIndex
        self.removeAnimate()
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numbers.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?
    {
        return numbers[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        let a = Double(numbers[row])
        if(first.isFirstResponder)
        {
            tipPercentages[0] = a!
            first.text=("\(a!)")
        }
        else if(second.isFirstResponder)
        {
            second.text=("\(a!)")
        }
        else
        {
            third.text=("\(a!)")
        }
        
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        
    }

    func addTapped(sender: UIBarButtonItem)
    {

        if (settingViewOutlet.isHidden == true)
        {
            //self.showAnimate()

            settingViewOutlet.isHidden = false
            patchOulet.isHidden = false

        } else {
            settingViewOutlet.isHidden = true
            patchOulet.isHidden = true

        }

            myStringValue1 = tipPercentages[0]
            myStringValue2 = tipPercentages[1]
            myStringValue3 = tipPercentages[2]
    }
    
    @IBAction func onTap(_ sender: Any)
    {
        view.endEditing(true)
    }

    @IBAction func calculateTip2(_ sender: Any)
    {
        
        
            var tip: Double = 0
            var total : Double = 0
            var bill : Double = 0

        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
         bill = Double(billText.text!) ?? 0
         tip = bill * (0.01) * Double(tipPercentages[tipPercentageController.selectedSegmentIndex])
         total = tip + bill
        let formattedNum1 = formatter.string(from: NSNumber(value : tip))
        //tipOutlet.sizeToFit()
        
        tipOutlet.text = formattedNum1
        let formattedNum2 = formatter.string(from: NSNumber(value : total))
        //totalOutlet.sizeToFit()
        totalOutlet.text = formattedNum2
        tipOutlet.adjustsFontSizeToFitWidth = false;
        tipOutlet.lineBreakMode = .byTruncatingTail

        totalOutlet.adjustsFontSizeToFitWidth = false;
        totalOutlet.lineBreakMode = .byTruncatingTail

    }
    
}

