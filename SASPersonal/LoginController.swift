//
//  LoginController.swift
//  SASPersonal
//
//  Created by Paula Almeida on 16/03/15.
//  Copyright (c) 2015 Paula Almeida. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    let storedUsuario = "userUsuario"
    let storedNome = "userNome"
    let storedEmail = "userEmail"
    let storedId = "userId"
    
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        var userStorage = NSUserDefaults.standardUserDefaults().stringForKey(storedId)
        if ((userStorage?.isEmpty) != nil){
            self.performSegueWithIdentifier("menuView", sender: self)
        }
    }
    

    @IBAction func EfetuarLogin(sender: AnyObject) {
        if (txtUsuario.text.isEmpty
            || txtSenha.text.isEmpty){
                // alerta preencher todos os campos
                exibeMsg("Todos os campos são obrigatórios!")
                return;
        }

        var usu = UsuarioDB() as UsuarioDB
        var logou:Bool = usu.autorizaLogin(txtUsuario.text, p_senha: txtSenha.text) as Bool
        
        if (logou){
            gravaDadosUsuario()
            self.performSegueWithIdentifier("menuView", sender: self)
        } else{
            exibeMsg("Não foi possível efetuar o login. Verifique seu usuário e sua senha.")
            return;
        }
    }
    
    func exibeMsg(msg: String){
        var alert = UIAlertController(title: "Atenção", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func gravaDadosUsuario(){
        
        NSUserDefaults.standardUserDefaults().setObject(txtUsuario.text, forKey: storedUsuario)
        NSUserDefaults.standardUserDefaults().setObject(txtUsuario.text, forKey: storedNome)
        NSUserDefaults.standardUserDefaults().setObject(txtUsuario.text, forKey: storedEmail)
        NSUserDefaults.standardUserDefaults().setObject(txtUsuario.text, forKey: storedId)
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
}
