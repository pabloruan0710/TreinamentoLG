//
//  ViewController.swift
//  TreinamentoLG
//
//  Created by Pablo Ruan R Silva on 16/04/19.
//  Copyright © 2019 LG Lugar de Gente. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        NoticiaService.ConsultaNoticias { (noticias) in
            print(noticias)
        }
    }


}






