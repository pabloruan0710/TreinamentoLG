//
//  Enumeradores.swift
//  TreinamentoLG
//
//  Created by Pablo Ruan R Silva on 16/04/19.
//  Copyright © 2019 LG Lugar de Gente. All rights reserved.
//

import Foundation



// Cria enumeradores de Metodo de requisição
enum HTTPMethod : String {
    case get = "GET"
    case post = "POST"
}


enum ResultRequest : Any {
    case sucess(Any)
    case erro(Error?, String)
}
