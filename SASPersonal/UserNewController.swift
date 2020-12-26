//
//  UserNewController.swift
//  SASPersonal
//
//  Created by Paula Almeida on 17/03/15.
//  Copyright (c) 2015 Paula Almeida. All rights reserved.
//

import UIKit

class UserNewController: UIViewController {

    @IBOutlet weak var btnSalvar: UIBarButtonItem!
    @IBOutlet weak var optAlunoProfessor: UISegmentedControl!
    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtSenha: UITextField!
    @IBOutlet weak var txtConfirmeSenha: UITextField!
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews()
    {
       /* let scrollViewBounds = scrollView.bounds
        let containerViewBounds = contentView.bounds
        
        var scrollViewInsets = UIEdgeInsetsZero
        scrollViewInsets.top = scrollViewBounds.size.height/2.0;
        scrollViewInsets.top -= contentView.bounds.size.height/2.0;
        
        scrollViewInsets.bottom = scrollViewBounds.size.height/2.0
        scrollViewInsets.bottom -= contentView.bounds.size.height/2.0;
        scrollViewInsets.bottom -= 100
        
        scrollView.contentInset = scrollViewInsets*/
    }
    
    @IBAction func validar(sender: AnyObject) {
        if (txtNome.text.isEmpty
            || txtEmail.text.isEmpty
            || txtUsuario.text.isEmpty
            || txtSenha.text.isEmpty
            || txtConfirmeSenha.text.isEmpty){
                // alerta preencher todos os campos
                exibeMsg("Todos os campos são obrigatórios!")
                return;
        }
        
        if (txtSenha.text != txtConfirmeSenha.text){
            exibeMsg("Os campos de senha e confirme sua senha devem ser iguais!")
            return;
        }
        
        var usu = UsuarioDB() as UsuarioDB
        var gravou:Bool = usu.gravarUsuario("0", usuario: txtUsuario.text, senha: txtSenha.text, nome: txtNome.text, email: txtEmail.text, idProfessor: "0", dataNasc: "", sexo: "") as Bool
        
        if (gravou){
            if (optAlunoProfessor.selectedSegmentIndex == 0){
                self.performSegueWithIdentifier("userTeacherView", sender: self)
            } else {
                self.performSegueWithIdentifier("loginView", sender: self)
            }
        } else {
            exibeMsg("Não foi possível registrar o usuário. Por favor tente mais tarde ou entre em contato pelo e-mail paula@cosmoead.com.br")
            return;
        }
    }
    
    func exibeMsg(msg: String){
        var alert = UIAlertController(title: "Atenção", message: msg, preferredStyle: UIAlertControllerStyle.Alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
        alert.addAction(okAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func indexChanged(sender: UISegmentedControl) {
        
        // nao funciona
     /*
        switch sender.selectedSegmentIndex{
        case 0:
            self.navigationItem.rightBarButtonItem.title = @"Seguinte"
          //  self.navigationItem.rightBarButtonItem?.title = UIBarButtonItem(title: "Seguinte" as String, style: UIBarButtonItemStyle.Plain, target: nil, action: nil)
       //     break
        case 1:
            self.navigationItem.rightBarButtonItem.title = @"Salvar"
           // break
        default:
            break
            
        }*/
    }
    

    

}
