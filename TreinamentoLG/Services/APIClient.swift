//
//  APIClient.swift
//  TreinamentoLG
//
//  Created by Pablo Ruan R Silva on 16/04/19.
//  Copyright © 2019 LG Lugar de Gente. All rights reserved.
//

import Foundation




typealias completionResult = (ResultRequest)->Void

class APIClient {
    
    // funçao para requisição de dados
    class func request(_ endpoint: String, metodo:HTTPMethod = .get, parametros:[String:Any] = [:], handler:@escaping completionResult){
        
        let session = URLSession.shared
        
        guard let url = URL(string: endpoint) else {
            handler(.erro(nil, "Url não definiada ou formato inválido"))
            return
        }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if (error != nil){
                handler(.erro(error, error?.localizedDescription ?? "Erro na requisição da url: "+url.absoluteString))
            }else{
                guard let _data = data else {
                    handler(.erro(nil, "Dados não retornados!"))
                    return
                }
                // parse do json
                do {
                    let json = try JSONSerialization.jsonObject(with: _data, options: .allowFragments)
                    handler(.sucess(json))
                    
                }catch (let er){
                    handler(.erro(er, er.localizedDescription))
                }
            }
        }
        task.resume()
    }
}
