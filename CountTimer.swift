//
//  CountTimer.swift
//  Timer
//
//  Created by Michael Wilkowski on 10/20/15.
//  Copyright © 2015 DevMountain. All rights reserved.
//

import Foundation

class CountTimer: NSObject{
    
    static let kTimerSecondTickNotification = "timerSecondTickNotification"
    static let kTimerCompleteNotification = "timerCompleteNotification"
    
    var seconds = NSTimeInterval(0)
    var totalSeconds = NSTimeInterval(0)
    var timer: NSTimer?
    var isOn: Bool{
        get{
            if timer != nil {
                return true
            }else{
                return false
            }//else
        }//get
    }//isOn
    
    func setTime(seconds: NSTimeInterval, totalSeconds: NSTimeInterval){
            self.seconds = seconds
            self.totalSeconds = totalSeconds
    }
    
    func startTimer(){
        timer = NSTimer.scheduledTimerWithTimeInterval(NSTimeInterval(1.0) , target: self, selector: "secondTick", userInfo: nil, repeats: true)
    }
    
    func stopTimer(){
        timer?.invalidate()
        timer = nil
    }
    
    func secondTick(){
        seconds--
        NSNotificationCenter.defaultCenter().postNotificationName(CountTimer.kTimerSecondTickNotification, object: self)
        
        if seconds <= 0 {
            stopTimer()
            NSNotificationCenter.defaultCenter().postNotificationName(CountTimer.kTimerCompleteNotification, object: self)
        }
    }
    
    func timerString(seconds: NSTimeInterval) -> String {
        let totalSeconds = Int(self.seconds)
        
        let minutes =  totalSeconds/60
        let seconds = totalSeconds%60
        return "\(minutes):\(seconds)"
    }
    
    
}