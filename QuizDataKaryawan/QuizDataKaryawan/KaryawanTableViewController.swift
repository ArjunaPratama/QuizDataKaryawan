//
//  KaryawanTableViewController.swift
//  QuizDataKaryawan
//
//  Created by DOTS2 on 10/27/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class KaryawanTableViewController: UITableViewController {
    //
    var datak : [Karyawan] = []
    
    var namaSelected:String?
    var staffSelected:String?
    var golonganSelected:String?
    var gajiSelected:String?
    var idSelected:String?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return datak.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellData", for: indexPath) as! GajiTableViewCell

        // Configure the cell...
        //deklarasi dataTask sebagai Index dari tasks
        let dataKaryawan = datak[indexPath.row]
        //mengambildata dengan attribute name_Task
        if let myDataKaryawan = dataKaryawan.nama_karyawan{
            //menampilkan data ke label
            cell.labelNama.text = myDataKaryawan
        }
        if let myDataKaryawan1 = dataKaryawan.nama_staff{
            cell.labelStafff.text = myDataKaryawan1
        }
        if let myDataKarayawan2 = dataKaryawan.golongan{
            cell.labelGolong.text = myDataKarayawan2
        }
    
        if let myDataKarayawan3 = dataKaryawan.gaji{
            cell.labelGajiii.text = myDataKarayawan3
    }
       
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        //memanggil method getData
        getData()
        //memanggil reloadData
        tableView.reloadData()
    }
    
    //method getData
    func getData() {
        //mengecek apakah ada error atau tidak
        do{
            //kondisi kalau tidak ada error
            //maka akan request download data
            datak = try context.fetch(Karyawan.fetchRequest())
        }
        catch{
            //kondisi apabila error fetch data
            print("Fetching Failed")
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //mengece menu swipe bila edit data
        if editingStyle == .delete {
            let task = datak[indexPath.row]
            context.delete(task)
            //Delete data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                //retrieve data
                datak = try context.fetch(Karyawan.fetchRequest())
            }
            catch{
                print("Fetching Failed")
            }
        }
        //load data lagi
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let task = datak[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        namaSelected = task.nama_karyawan
        staffSelected = task.nama_staff
        golonganSelected = task.golongan
        gajiSelected = task.gaji
        idSelected = task.id_karyawan
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "passData", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "passData"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let kirimData = segue.destination as! DataDetailViewController
            //mengirimkan data ke masing2 variable
            //mengirimkan nama wisata
            kirimData.passNama = namaSelected
            //mengirimkan data gambar wisata
            kirimData.passstaff = staffSelected
            kirimData.passGolongan = golonganSelected
            kirimData.passGaji = gajiSelected
            kirimData.passID = idSelected
            
           
            
            
            
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
