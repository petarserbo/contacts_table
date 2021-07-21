//
//  ViewController.swift
//  contacts_table
//
//  Created by Petar Perich on 21.07.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var contacts = [Contacts(name: "Jack", phoneNumber: "1234567"), Contacts(name: "Bob", phoneNumber: "456789"), Contacts(name: "Marry", phoneNumber: "956235")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func callNumber(phone: String){
        if let url = URL(string: "tel://\(phone)"){
            UIApplication.shared.open(url)
        }
    }
}




extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let contactsItem = contacts[indexPath.row]
        cell.textLabel?.text = contactsItem.name
        cell.detailTextLabel?.text = String(contactsItem.phoneNumber)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let number = contacts[indexPath.row]
        callNumber(phone: number.phoneNumber)
    }
    
    
}

