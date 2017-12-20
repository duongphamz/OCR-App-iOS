//
//  HistoryViewController.swift
//  OCR-App
//
//  Created by MacOS on 11/6/17.
//  Copyright © 2017 MacOS. All rights reserved.
//  TEST

import UIKit

class HistoryViewController: UIViewController {
    @IBOutlet weak var navigaterBar: UINavigationItem!
    @IBOutlet weak var tbView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        tbView.dataSource = self
        tbView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onBtnBackAction(_ sender: UIButton) {
    self.navigationController?.popViewController(animated: true)
    }
    
    

}

extension HistoryViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as UITableViewCell
        
        cell.textLabel?.text = "Sometimes a simple text that shows someone is thinking about you can change your whole day"
        return cell
    }
}

extension HistoryViewController: UITableViewDelegate {
    
}
