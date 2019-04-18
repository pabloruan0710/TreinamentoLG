//
//  ViewController.swift
//  TreinamentoLG
//
//  Created by Pablo Ruan R Silva on 16/04/19.
//  Copyright © 2019 LG Lugar de Gente. All rights reserved.
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    var push : UIRefreshControl!
    var noticias : [Noticia] = []
    var paginaAtual = 0
    var estaConsultando : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 224/256, green: 224/256, blue: 224/256, alpha: 1.0)
        self.configuraTableView()
        self.carregaDados()
    }
}


extension ViewController {
    fileprivate func configuraTableView(){
        tableView.register(NoticiaisTableViewCell.loadNib(), forCellReuseIdentifier: NoticiaisTableViewCell.identifier())
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        
        push = UIRefreshControl()
        push.addTarget(self, action: #selector(carregaDados), for: .valueChanged)
        tableView.addSubview(push)
    }
    
    @objc func carregaDados(){
        if estaConsultando {
            return
        }
        self.estaConsultando = true
        NoticiaService.ConsultaNoticias(pagina: paginaAtual+1) { (noticias) in
            self.paginaAtual = self.paginaAtual+1
            self.estaConsultando = false
            for noticia in noticias {
                self.noticias.append(noticia)
            }
            print(self.noticias)
            DispatchQueue.main.async {
                self.push.endRefreshing()
                self.tableView.reloadData()
            }
        }
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return noticias.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NoticiaisTableViewCell.identifier()) as! NoticiaisTableViewCell
        cell.configuraCell(noticia: noticias[indexPath.row])
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 342
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.noticias.count >= 10 && indexPath.row == self.noticias.count-1 && !self.estaConsultando{
            DispatchQueue.global().async {
                self.carregaDados()
            }
        }
    }
}
