//
//  Noticia.swift
//  TreinamentoLG
//
//  Created by Pablo Ruan R Silva on 16/04/19.
//  Copyright © 2019 LG Lugar de Gente. All rights reserved.
//

import Foundation

class Noticia : APIClient {
    
    var ID : Int = 0
    var TITULO : String = ""
    var DESCRICAO : String?
    var URL_IMAGEM : String?
    var FONTE : String = "goal.com"
    
    // construtor
    init(json:Dictionary<String,Any>){
        
        // validação se existe propriedade do objeto
        if let value = json["ID"] as? Int {
            self.ID = value
        }
        
        if let value = json["TITULO"] as? String {
            self.TITULO = value
        }
        
        if let value = json["DESCRICAO"] as? String {
            self.DESCRICAO = value
        }
        
        if let value = json["URL_IMAGEM"] as? String {
            self.URL_IMAGEM = value
        }
    }
    
    /**
     Podemos criar varios constructors
     - Parametros opcionais
     - Parametros com valores padrão
     
     */
    init(id:Int, titulo:String, descricao:String, url_imagem:String? = nil, fonte:String = "goal.com"){
        self.ID = id
        self.TITULO = titulo
        self.DESCRICAO = descricao
        self.URL_IMAGEM = url_imagem
        self.FONTE = fonte
    }
    
}
