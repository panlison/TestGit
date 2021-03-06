//
//  ViewController.swift
//  FlowerColorTable
//
//  Created by 潘立新 on 16/10/6.
//  Copyright © 2016年 BangXin_KJ. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let kSectionCount: Int = 2
    let kRedSection: Int = 0
    let kBlueSection: Int = 1
    
    // 刚加的test
    let kGreenSection: Int = 3
    
    
    let redFlowers: [String] = ["ihead_007", "ihead_005", "ihead_006", "ihead_008"]
    let blueFlowers: [String] = ["ihead_005", "ihead_006" ,"ihead_008", "ihead_007", "ihead_005"]
    
    // MARK: ---UITableViewDataSource===
    func numberOfSections(in tableView: UITableView) -> Int {
        return kSectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case kRedSection:
            return redFlowers.count
        case kBlueSection:
            return blueFlowers.count
            
        default:
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case kRedSection:
            return "Red"
        case kBlueSection:
            return "Blue"
        default:
            return "Unknown"
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "flowerCell")! as UITableViewCell
        
        switch ((indexPath as NSIndexPath).section) {
        case kRedSection:
            cell.textLabel!.text = redFlowers[(indexPath as NSIndexPath).row]
        case kBlueSection:
            cell.textLabel!.text = blueFlowers[(indexPath as NSIndexPath).row]
        default:
            cell.textLabel!.text = "Unkown"
        }
        
        let flowerImage: UIImage = UIImage(named: cell.textLabel!.text!)!
        cell.imageView!.image = flowerImage
        
        return cell
    }
    
    
    // MARK: ====UITableViewDelegate===
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var flowerMessage: String
        
        switch (indexPath as NSIndexPath).section {
        case kRedSection:
            flowerMessage = "You chose the red flower - \(redFlowers[(indexPath as NSIndexPath).row])"
        case kRedSection:
            flowerMessage = "hahhahh - \(blueFlowers[(indexPath as NSIndexPath).row])"
        default:
            flowerMessage = "I have no idear what you chose?"
        }
        
        let alertController = UIAlertController(title: "Flower Selected", message: flowerMessage, preferredStyle: UIAlertControllerStyle.alert)
        
        let alertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

