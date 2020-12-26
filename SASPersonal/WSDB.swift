//
//  DBComum.swift
//  SASPersonal
//
//  Created by Paula Almeida on 06/03/15.
//  Copyright (c) 2015 Paula Almeida. All rights reserved.
//

import UIKit

class WSDB {
    
    var param1 = ""
    var param2 = ""
    var param3 = ""
    var param4 = ""
    var param5 = ""
    var param6 = ""
    var param7 = ""
    var param8 = ""
    var param9 = ""
    var param10 = ""
    var param11 = ""
    var param12 = ""
    var param13 = ""
    var param14 = ""
    var param15 = ""
    var param16 = ""
    
    // USUARIOS
    
    let obtemUsuarios:String = "http://cosmoead.com.br/sas/obtemUsuarios.php"
        // return json (id, usuario, nome, excluido, email)
    var autorizaLogin:String {
        var out = "http://cosmoead.com.br/sas/autorizaLogin.php?usuario=\(param1)&senha=\(param2)"
        return out
    } // return json (usuario)
    var alterarSenha:String {
        var out = "http://cosmoead.com.br/sas/alterarSenha.php?usuario=\(param1)&senha=\(param2)&senhanova=\(param3)"
        return out
    } // return json (sucesso)
    var gravarUsuario:String {
        var out = "http://cosmoead.com.br/sas/gravarUsuario.php?idUsuario=\(param1)&usuario=\(param2)&senha=\(param3)&nome=\(param4)&email=\(param5)&idProfessor=\(param6)&dataNasc=\(param7)&sexo=\(param8)"
        return out
    } // return json (sucesso)
    
    //ALUNOS
    
    var obtemAlunosDoProfessor:String {
        var out = "http://cosmoead.com.br/sas/obtemAlunosDoProfessor.php?idProfessor=\(param1)"
        return out
    } // return json (id, nome)
    var obtemAluno:String {
        var out = "http://cosmoead.com.br/sas/obtemAluno.php?idUsuario=\(param1)"
        return out
    } // return json (id, usuario, nome, excluido, idprofessor, email, data_nasc, sexo)
   /* var excluirAluno:String {
        var out = "http://cosmoead.com.br/sas/excluirAluno.php?idUsuario=\(param1)"
        return out
    } */ // return json (sucesso)
    
    //TREINOS
    
    var obtemTreinosAluno:String {
        var out = "http://cosmoead.com.br/sas/obtemTreinosAluno.php?idUsuario=\(param1)"
        return out
    } // return json (id, titulo, inicio, fim)
    var obtemExerciciosTreino:String {
        var out = "http://cosmoead.com.br/sas/obtemExerciciosTreino.php?idTreino=\(param1)"
        return out
    } // return json (IDTREINOEXERC, IDTREINO, IDEXERCICIO, NOME, DESCRICAO, OPTPESO, PESO, OPTREPETICAO, REPETICAO, OPTSERIE, SERIE, OPTTEMPO, TEMPO, TIPOTEMPO, OBSERVACAO, ORDEM)
    var gravarTreino:String {
        var out = "http://cosmoead.com.br/sas/gravarTreino.php?idTreino=\(param1)&idAluno=\(param2)&titulo=\(param3)&inicio=\(param4)&fim=\(param5)"
        return out
    } // return json (sucesso)
    var gravarExercicioTreino:String {
        var out = "http://cosmoead.com.br/sas/gravarExercicioTreino.php?IDTREINOEXERC=\(param1)&IDTREINO=\(param2)&IDEXERCICIO=\(param3)&OPTPESO=\(param4)&PESO=\(param5)&OPTREPETICAO=\(param6)&REPETICAO=\(param7)&OPTSERIE=\(param8)&SERIE=\(param9)&OPTTEMPO=\(param10)&TEMPO=\(param11)&TIPOTEMPO=\(param12)&OBSERVACAO=\(param13)&ORDEM=\(param14)"
        return out
    } // return json (sucesso)
    var excluirTreino:String {
        var out = "http://cosmoead.com.br/sas/excluirTreino.php?idTreino=\(param1)"
        return out
    } // return json (sucesso)
    
    //EXERCICIOS
    
    let obtemExercicios = "http://cosmoead.com.br/sas/obtemExercicios.php"
        // return json (id, nome, descricao)
    var obtemExercicio:String {
        var out = "http://cosmoead.com.br/sas/obtemExercicio.php?idExercicio=\(param1)"
        return out
    } // return json (id, nome, descricao)
    var gravarExercicio:String {
        var out = "http://cosmoead.com.br/sas/gravarExercicio.php?idExercicio=\(param1)&nome=\(param2)&descricao=\(param3)"
        return out
    } // return json (sucesso)
    var excluirExercicio:String {
        var out = "http://cosmoead.com.br/sas/excluirExercicio.php?idExercicio=\(param1)"
        return out
    } // return json (sucesso)
    
   
    func conectaDB(url: String) -> NSMutableArray{
        
        print(url)
        
        var jsonObjects:NSMutableArray = [] as NSMutableArray
        
        
        let myUrl = NSURL(string: "http://cosmoead.com.br/sas/autorizaLogin.php");
        let request = NSMutableURLRequest(URL:myUrl!);
        request.HTTPMethod = "POST";
        
        // Compose a query string
        let postString = "usuario=\(param1)&senha=\(param2)";
        
        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
            data, response, error in
            
            if error != nil
            {
                println("error=\(error)")
                return
            }
            
            // You can print out response object
            println("response = \(response)")
            
            // Print out response body
            let responseString = NSString(data: data, encoding: NSUTF8StringEncoding)
            println("responseString = \(responseString)")
            
            //Let's convert response sent from a server side script to a NSDictionary object:
            
            var err: NSError?
            var myJSON = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error:&err) as! NSMutableArray
            jsonObjects = myJSON
            
        }
        task.resume()
        
        task.
        return jsonObjects =
        /*
        
            if let parseJSON =myJSON {
                // Now we can access value of First Name by its key
                var firstNameValue = parseJSON["firstName"] as? String
                println("firstNameValue: \(firstNameValue)")
            }
            
        }
        
        
        
        
        
        
        
        
        
        
        var jsonURL: NSURL = NSURL(string: url)!
        var URLrequest: NSURLRequest = NSURLRequest(URL: jsonURL)
        var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        
        var jsonSource: NSData =  NSURLConnection.sendSynchronousRequest(URLrequest, returningResponse: response, error:nil)!
        var parseError: NSError?
        
        let jsonObjects = NSJSONSerialization.JSONObjectWithData(jsonSource, options: NSJSONReadingOptions.MutableContainers, error: &parseError) as! NSMutableArray
        
        return jsonObjects*/

        
    }
}
