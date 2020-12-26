//
//  ViewController.swift
//  SASPersonal
//
//  Created by Paula Almeida on 01/03/15.
//  Copyright (c) 2015 Paula Almeida. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    let dados = UsuarioDB() as UsuarioDB
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dados.obtemTodosUsuarios()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dados.usuarios.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("userCell") as! UITableViewCell
        
        var usu: Usuario = dados.usuarios[indexPath.row] as Usuario
        cell.textLabel?.text =  usu.nome
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            dados.usuarios.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
}
