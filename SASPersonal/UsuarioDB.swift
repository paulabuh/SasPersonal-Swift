//
//  UsuarioDB.swift
//  SASPersonal
//
//  Created by Paula Almeida on 06/03/15.
//  Copyright (c) 2015 Paula Almeida. All rights reserved.
//

import UIKit

class UsuarioDB {
   
    
    let id: NSString = "id"
    let usuario: NSString = "usuario"
    let senha: NSString = "senha"
    let nome: NSString = "nome"
    let excluido: NSString = "excluido"
    let email: NSString = "email"
    let sucesso: NSString = "sucesso"
    
    var usuarios = [Usuario]()
    
    func autorizaLogin(p_usuario:String, p_senha:String)->Bool{
        var usuario_ret: String = ""
        let db = WSDB() as WSDB
        db.param1 = p_usuario
        db.param2 = p_senha
        let jsonObjects = db.conectaDB(db.autorizaLogin)
        
        var dataDict: NSDictionary
        
        for dataDict : AnyObject in jsonObjects {
            usuario_ret = dataDict.objectForKey(usuario) as! String
        }
        
        return (usuario_ret == p_usuario)
    }
    
    func alterarSenha(p_usuario:String, p_senha:String, p_novasenha:String)->Bool{
        var ret: Bool = false
        let db = WSDB() as WSDB
        db.param1 = p_usuario
        db.param2 = p_senha
        db.param3 = p_novasenha
        let jsonObjects = db.conectaDB(db.alterarSenha)
        
        var dataDict: NSDictionary
        
        for dataDict : AnyObject in jsonObjects {
            ret = (dataDict.objectForKey(usuario) as! NSString).boolValue
        }
        
        return ret
    }
    
    func obtemTodosUsuarios(){
        
        let db = WSDB() as WSDB
        let jsonObjects = db.conectaDB(db.obtemUsuarios)
        
        var dataDict: NSDictionary
        
        for dataDict : AnyObject in jsonObjects {
            var usu = Usuario()
            usu.id = (dataDict.objectForKey(id) as! NSString).integerValue
            usu.usuario = dataDict.objectForKey(usuario) as! String
            usu.email = dataDict.objectForKey(email) as! String
            usu.nome = dataDict.objectForKey(nome) as! String
            usu.excluido = (dataDict.objectForKey(excluido) as! NSString).integerValue
            
            usuarios.append(usu)
            
        }
    }
    
    func gravarUsuario(idusuario:String, usuario:String, senha:String, nome:String, email:String,idProfessor:String,dataNasc:String,sexo:String)->Bool{
        var ret: NSNumber = 0
        let db = WSDB() as WSDB
        db.param1 = idusuario
        db.param2 = usuario
        db.param3 = senha
        db.param4 = nome
        db.param5 = email
        db.param6 = idProfessor
        db.param7 = dataNasc
        db.param8 = sexo
        
        //print(db.gravarUsuario)
        
        let jsonObjects = db.conectaDB(db.gravarUsuario)
        
        var dataDict: NSDictionary
        
        for dataDict : AnyObject in jsonObjects {
            ret = dataDict.objectForKey(sucesso) as! NSNumber
        }
        
        return (ret == 1)
    }
    
    
    /* func escrevendoJson(){
    
    for (var i = 0; i < conjuntoDados.count ; i++){
    
    var tmpDict: NSDictionary = conjuntoDados[i] as NSDictionary
    
    let descId: NSMutableString = tmpDict.objectForKey(id) as NSMutableString
    let descUsuario: NSMutableString = tmpDict.objectForKey(usuario) as NSMutableString
    let descSenha: NSMutableString = tmpDict.objectForKey(senha) as NSMutableString
    let descNome: NSMutableString = tmpDict.objectForKey(nome) as NSMutableString
    let descExcluido: NSMutableString = tmpDict.objectForKey(excluido) as NSMutableString
    
    println("nome:"+descNome+" usuario:"+descUsuario+"")
    
    
    
    
    }
    
    }*/
    
}
