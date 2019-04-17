//
//  NoticiaisTableViewCell.swift
//  TreinamentoLG
//
//  Created by Pablo Ruan R Silva on 17/04/19.
//  Copyright © 2019 LG Lugar de Gente. All rights reserved.
//

import UIKit

class NoticiaisTableViewCell: UITableViewCell {

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var cardView: UIView!
    @IBOutlet var lbnFonte: UILabel!
    @IBOutlet var lbnTitulo: UILabel!
    class func identifier()->String {
        return String(describing: self)
    }
    
    class func loadNib()->UINib{
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func prepareForReuse() {
        imgView.image = UIImage(named: "sem-imagem")
    }
    
    func configuraCell(noticia:Noticia){
        lbnFonte.text = noticia.FONTE
        lbnTitulo.text = noticia.TITULO
        
        if let urlImagem = noticia.URL_IMAGEM, let url = URL(string: urlImagem) {
            DispatchQueue.global().async {
                URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                    if let d = data {
                        DispatchQueue.main.async {
                            self.imgView.image = UIImage(data: d)
                        }
                    }
                }).resume()
            }
        }else{
            imgView.image = UIImage(named: "sem-imagem")
        }
    }
}
