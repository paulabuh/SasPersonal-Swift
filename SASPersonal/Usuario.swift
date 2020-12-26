//
//  User.swift
//  SASListUsers
//
//  Created by Paula Almeida on 01/03/15.
//  Copyright (c) 2015 Paula Almeida. All rights reserved.
//

import UIKit

class Usuario {
   
    var id: Int
    var usuario: String
    var senha: String
    var nome: String
    var excluido: Int
    var email: String
    var idprofessor: Int
    var dataNasc: String
    var sexo: String
    
    init(){
        self.id = 0
        self.usuario = ""
        self.senha = ""
        self.nome = ""
        self.excluido = 0
        self.email = ""
        self.idprofessor = 0
        self.dataNasc = ""
        self.sexo = ""
    }
    
    init (id: Int, usuario: String, senha: String, nome: String, excluido: Int, email: String, idprofessor: Int, dataNasc: String, sexo: String){
        
        self.id = id
        self.usuario = usuario
        self.senha = senha
        self.nome = nome
        self.excluido = excluido
        self.email = email
        self.idprofessor = idprofessor
        self.dataNasc = dataNasc
        self.sexo = sexo
        
    }
    
}
