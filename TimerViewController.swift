//
//  TimerViewController.swift
//  Timer
//
//  Created by Michael Wilkowski on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var choiceView: UIStackView!

    @IBOutlet weak var countDownView: UIView!
    @IBOutlet weak var minutePickerView: UIPickerView!
    @IBOutlet weak var hourPickerView: UIPickerView!
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBAction func pauseButton(sender: AnyObject) {
        countDownView.hidden = true
        choiceView.hidden = false
        print("Pause Button Hit")
    }
    
    
    @IBAction func startButton(sender: AnyObject) {
        choiceView.hidden = true
        countDownView.hidden = false
        print("Start Button Hit")
    }
    
    var timer = CountTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func updateProgressBar(){
        let secondsElapsed = timer.totalSeconds - timer.seconds
        
        let progress = Float(secondsElapsed) / Float(timer.totalSeconds)
        
        progressBar.setProgress(progress, animated: true)
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == hourPickerView {
            return 24
        }else{
            return 60
        }
    }
    
//    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if pickerView == hourPickerView {
//            return "\(row)"?
//        }
//    }
}
