//
//  ViewController.swift
//  Project1
//
//  Created by yulun wu on 23/10/20.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //large titles
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        //a series of looking for files from content folder
        let fm = FileManager.default //for looking for files
        let path = Bundle.main.resourcePath! //bundle is the directory contains compiled files and assets
        let items = try!fm.contentsOfDirectory(atPath: path) //the constant of collection of all files under path
        
        for item in items{
            if item.hasPrefix("nssl"){
                // this is a picture to load
                pictures.append(item)
            }
            
        }
        //default sorting method
        pictures.sort()
        print(pictures)
    }

    //set the number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    //set the textlabel of each cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
   
    //jump into detail view
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = pictures[indexPath.row]
            vc.selectedPictureNumber = indexPath.row + 1
            vc.totalPictures = pictures.count
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    
}

