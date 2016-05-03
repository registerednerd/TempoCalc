//
//  ViewController.swift
//  TempoCalc
//
//  Created by Josh Smith on 10/11/15.
//  Copyright © 2015 Square One Nation, LLC. All rights reserved.
//

import Cocoa

class ViewController: NSViewController
{
    
    var rackNumber : String?

    @IBOutlet weak var rack5Radio: NSButton!
    @IBOutlet weak var rack6Radio: NSButton!
    @IBOutlet weak var rack7Radio: NSButton!
    @IBOutlet weak var rack8Radio: NSButton!
    
    @IBOutlet weak var tempoBox: NSTextField!
    @IBOutlet weak var codeBox: NSTextField!
    
    let standardPrefix = "43 10 3E 12 01 01 00  00 04 00 "
    var tempoHex : String?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        rack5Radio.state = NSOnState
        rack6Radio.state = NSOffState
        rack7Radio.state = NSOffState
        rack8Radio.state = NSOffState
        self.rackNumber = "00 "
        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject?
    {
        didSet
        {
        // Update the view, if already loaded.
        }
    }
    
    func rackCode(rack: Int) -> String
    {
        return "TEST"
    }
    
    func decToHex7(value: Int) -> String
    {
        var firstByte : String
        var secondByte : String
        var workingValue : Int
        
        workingValue = value
        switch value
        {
        case 0...127:
            firstByte = "00"
        case 128...255:
            firstByte = "01"
            workingValue -= 128
        case 256...300:
            firstByte = "02"
            workingValue -= 256
        default:
            firstByte = "ERROR"
            break
        }
        
        secondByte = String(format:"%2X", workingValue)

        if workingValue <= 16
        {
            secondByte.removeAtIndex(secondByte.startIndex)
            return firstByte + " " + "0" + secondByte
        }
        else 
        {
            return firstByte + " " + secondByte
        }
    }

    @IBAction func generateButtonPressed(sender: AnyObject)
    {
        if (self.tempoBox.integerValue < 25 || self.tempoBox.integerValue > 300)
        {
            self.codeBox.stringValue = "Tempo must be between 25 and 300"
        }
        else //input is valid
        {
            self.codeBox.stringValue = standardPrefix + self.rackNumber! + "00 00 00 " + decToHex7(self.tempoBox.integerValue)
        }
    }
    
    @IBAction func rack5Clicked(sender: AnyObject)
    {
        rack5Radio.state = NSOnState
        rack6Radio.state = NSOffState
        rack7Radio.state = NSOffState
        rack8Radio.state = NSOffState
        self.rackNumber = "00 "
    }

    @IBAction func rack6Clicked(sender: AnyObject)
    {
        rack5Radio.state = NSOffState
        rack6Radio.state = NSOnState
        rack7Radio.state = NSOffState
        rack8Radio.state = NSOffState
        self.rackNumber = "01 "
    }
    
    @IBAction func rack7Clicked(sender: AnyObject)
    {
        rack5Radio.state = NSOffState
        rack6Radio.state = NSOffState
        rack7Radio.state = NSOnState
        rack8Radio.state = NSOffState
        self.rackNumber = "02 "
    }
    
    @IBAction func rack8Clicked(sender: AnyObject)
    {
        rack5Radio.state = NSOffState
        rack6Radio.state = NSOffState
        rack7Radio.state = NSOffState
        rack8Radio.state = NSOnState
        self.rackNumber = "03 "
    }
    
}