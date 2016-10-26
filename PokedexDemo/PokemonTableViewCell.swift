//
//  PokemonTableViewCell.swift
//  PokedexDemo
//
//  Created by Ilmira Estil on 10/20/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {
    @IBOutlet weak var pokeID: UILabel!
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeName: UILabel!
    @IBOutlet weak var pokeTypeOne: UIImageView!
    @IBOutlet weak var pokeTypeTwo: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    
    //to fix the bug with the one vs. two icon picture -- when first shows charmander, the right icon is there, but then it loads another type(incorrect) when you scroll down and back up
    override func prepareForReuse() {
        pokeTypeOne.image = nil
        pokeTypeTwo.image = nil
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
        
    }

}
