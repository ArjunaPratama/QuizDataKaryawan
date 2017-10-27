//
//  DataDetailViewController.swift
//  QuizDataKaryawan
//
//  Created by DOTS2 on 10/27/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class DataDetailViewController: UIViewController {

    @IBOutlet weak var labelNama: UILabel!
    @IBOutlet weak var labelStaff: UILabel!
    @IBOutlet weak var labelGolongan: UILabel!
    @IBOutlet weak var labelGaji: UILabel!
    @IBOutlet weak var labelID: UILabel!
    
    var passNama:String?
    var passstaff:String?
    var passGolongan:String?
    var passGaji:String?
    var passID:String?
    
    override func viewDidLoad() {
        
        labelNama.text = "Your Username is " + passNama!
        labelStaff.text = "Your Staff is " + passstaff!
        labelGolongan.text = "Your Golongan is " + passGolongan!
        labelGaji.text = "Your Gajiis " + passGaji!
        labelID.text = "Your ID is " + passID!
        
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
