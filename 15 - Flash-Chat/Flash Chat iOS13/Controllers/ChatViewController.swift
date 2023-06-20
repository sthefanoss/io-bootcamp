//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    let db = Firestore.firestore()
    
    
    var messages : [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        title = Constants.appName
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(
            UINib(nibName: Constants.cellNibName, bundle: nil),
            forCellReuseIdentifier: Constants.cellIdentifier
        )
        loadMessages()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        db.collection(Constants.FStore.collectionName).addDocument(data: [
            Constants.FStore.senderField: Auth.auth().currentUser!.email!,
            Constants.FStore.bodyField: messageTextfield.text!,
            Constants.FStore.dateField: Date.now.ISO8601Format(),
        ]) { (error) in
            if(error != nil) { print(error!) }
        }
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        print("logout")
        do {
            try Auth.auth().signOut()
            
            navigationController?.popToRootViewController(animated: true)
            
        }
        catch let err {
            print(err.localizedDescription)
        }
    }
    
    func loadMessages() {
        db.collection(Constants.FStore.collectionName)
            .order(by: Constants.FStore.dateField)
            .addSnapshotListener()
        { query, error in
            if let error = error {
                print(error)
                return
            }
            self.messages = []
            if let documents = query?.documents {
                for doc in documents {
                    do {
                        var timeString = doc[Constants.FStore.dateField] as! String
                        if( timeString.last != "Z" ) {
                            timeString = timeString.split(separator: ".", omittingEmptySubsequences: false).first! + "Z"
                        }
                        let newMessage =  try Message(
                            sender: doc[Constants.FStore.senderField] as! String,
                            content: doc[Constants.FStore.bodyField] as! String,
                            date: Date.init(timeString, strategy: .iso8601)
                        )
                        print(newMessage)
                        self.messages.append(newMessage)
                        DispatchQueue.main.async {
                            self.messageTextfield.text = ""
                            self.tableView.reloadData()
                            let index = IndexPath(row: self.messages.count - 1 , section:  0)
                            self.tableView.scrollToRow(at: index, at: .top, animated: false)
                        }
                    } catch let error {
                        print("On ", doc, " catch ", error)
                    }
                }
            }
        }
    }
}

extension ChatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(
            withIdentifier: Constants.cellIdentifier,
            for: indexPath
        ) as! MessageCell
        
        cell.label.text = message.content
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.rightAvatarImage.isHidden = false
            cell.leftAvatarImage.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.lightPurple)
            cell.label.textColor = UIColor(named: Constants.BrandColors.purple)
        } else {
            cell.rightAvatarImage.isHidden = true
            cell.leftAvatarImage.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: Constants.BrandColors.blue)
            cell.label.textColor = UIColor(named: Constants.BrandColors.lightBlue)
        }
        
        return cell
    }
}

extension ChatViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
}
