//
//  NoticiasServico.swift
//  TreinamentoLG
//
//  Created by Pablo Ruan R Silva on 16/04/19.
//  Copyright © 2019 LG Lugar de Gente. All rights reserved.
//

import Foundation


class NoticiaService {
    private init(){}
    
    class func ConsultaNoticias(pagina:Int = 1, completion:@escaping ([Noticia])->Void){
        APIClient.request("https://cfc.parciaisfc.com.br/noticias/pagina/"+pagina.description) { (response) in
            var noticiasRetorno : [Noticia] = []
            switch response {
            case .sucess(let dados):
                if let result = dados as? Dictionary<String,Any>, let noticias = result["noticias"] as? Array<Dictionary<String,Any>> {
                    for noticia in noticias {
                        let noticiaNew = Noticia(json: noticia)
                        noticiasRetorno.append(noticiaNew)
                    }
                }
                completion(noticiasRetorno)
            case .erro(let err, let msg):
                NSLog(err?.localizedDescription ?? "")
                print(msg)
                
                completion(noticiasRetorno)
            }
        }
    }
}
