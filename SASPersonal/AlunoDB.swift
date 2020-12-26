//
//  AlunoDB.swift
//  SASPersonal
//
//  Created by Paula Almeida on 06/03/15.
//  Copyright (c) 2015 Paula Almeida. All rights reserved.
//

import UIKit

class AlunoDB {
    
    let id: NSString = "id"
    let usuario: NSString = "usuario"
    let nome: NSString = "nome"
    let excluido: NSString = "excluido"
    let email: NSString = "email"
    let idProfessor: NSString = "idprofessor"
    let dataNasc: NSString = "data_nasc"
    let sexo: NSString = "sexo"
    
    func obtemAlunosDoProfessor(idProfessor:NSString) -> [Usuario]{
        
        let db = WSDB() as WSDB
        let jsonObjects = db.conectaDB(db.obtemAlunosDoProfessor)
        
        var dataDict: NSDictionary
        var alunos = [Usuario]()
        
        for dataDict : AnyObject in jsonObjects {
            var usu = Usuario()
        //    usu.id = (dataDict.objectForKey(id) as NSString).integerValue
       //     usu.nome = dataDict.objectForKey(nome) as String
            
            alunos.append(usu)
        }
        return alunos
    }
    
    func obtemAluno(idUsuario:NSString) -> Usuario{
        
        let db = WSDB() as WSDB
        let jsonObjects = db.conectaDB(db.obtemAluno)
        
        var dataDict: NSDictionary
        var usu = Usuario()
        
        for dataDict : AnyObject in jsonObjects {
            /*
            usu.id = (dataDict.objectForKey(id) as NSString).integerValue
            usu.usuario = dataDict.objectForKey(usuario) as String
            usu.email = dataDict.objectForKey(email) as String
            usu.nome = dataDict.objectForKey(nome) as String
            usu.excluido = (dataDict.objectForKey(excluido) as NSString).integerValue
            usu.idprofessor = (dataDict.objectForKey(idProfessor) as NSString).integerValue
            usu.dataNasc = dataDict.objectForKey(dataNasc) as String
            usu.sexo = dataDict.objectForKey(sexo) as String
            */
        }
        
        return usu
    }
    
}
