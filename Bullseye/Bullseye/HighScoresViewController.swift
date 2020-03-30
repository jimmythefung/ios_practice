//
//  HighScoresViewController.swift
//  Bullseye
//
//  Created by Jimmy Fung on 3/22/20.
//  Copyright © 2020 Jimmy Fung. All rights reserved.
//

import UIKit

class HighScoresViewController: UITableViewController, EditHighScoreViewControllerDelegate {
    func editHighScoreViewControllerDidCancel(_ controller: EditHighScoreViewController) {
        navigationController?.popViewController(animated:true)
    }
    
    func editHighScoreViewController(_ controller: EditHighScoreViewController, didFinishEditing item: HighScoreItem) {
        if let index = items.firstIndex(of: item) {
            let indexPath = IndexPath(row: index, section: 0)
            let indexPaths = [indexPath]
            tableView.reloadRows(at: indexPaths, with: .automatic)
        }
        PersistencyHelper.saveHighScores(items)
        navigationController?.popViewController(animated: true)
    }
    
    var items = [HighScoreItem]()

    override func viewDidLoad() {
        super.viewDidLoad()
        items = PersistencyHelper.loadHighScores()
        if (items.count == 0){
            resetHighScores()
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK:- Table View Data Source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreItem", for: indexPath)
        let item = items[indexPath.row]
        let nameLabel = cell.viewWithTag(1000) as! UILabel
        let scoreLabel = cell.viewWithTag(2000) as! UILabel
        nameLabel.text = item.name
        scoreLabel.text = String(item.score)
//        if indexPath.row == 0 {
//            nameLabel.text = "The reader of this book"
//            scoreLabel.text = "50000"
//        } else if indexPath.row == 1 {
//            nameLabel.text = "Manda"
//            scoreLabel.text = "10000"
//        } else if indexPath.row == 2 {
//            nameLabel.text = "Joey"
//            scoreLabel.text = "5000"
//        } else if indexPath.row == 3 {
//            nameLabel.text = "Adam"
//            scoreLabel.text = "1000"
//        } else if indexPath.row == 4 {
//            nameLabel.text = "Eli"
//            scoreLabel.text = "500"
//        }
        return cell
    }
    
    // MARK:- Table View Delagate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        // 1
        items.remove(at: indexPath.row)
        
        // 2
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
        PersistencyHelper.saveHighScores(items)
    }
    
    // MARK:- Actions
    @IBAction func resetHighScores(){
        items = [HighScoreItem]() // clear the array
        let i1 = HighScoreItem(name:"The reader of this book", score:50000)
        let i2 = HighScoreItem(name:"Manda", score:10000)
        items.append(i1)
        items.append(i2)
        PersistencyHelper.saveHighScores(items)
        tableView.reloadData()
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        let controller = segue.destination as! EditHighScoreViewController
        controller.delegate = self
        if let indexPath = tableView.indexPath(for: sender as! UITableViewCell){
            controller.highScoreItem = items[indexPath.row]
        }
    }

    
}
