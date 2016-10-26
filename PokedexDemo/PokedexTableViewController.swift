//
//  PokedexTableViewController.swift
//  PokedexDemo
//
//  Created by Ilmira Estil on 10/20/16.
//  Copyright © 2016 Jason Wang. All rights reserved.
//

import UIKit

class PokedexTableViewController: UITableViewController {
    
    var pokemons = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PKAPIHelper.instance.fetchAllPokemons { (jsonDicts, response, err) in
            guard let pkJSONDicts = jsonDicts else { return }
            for jsonDict in pkJSONDicts {
                print("DICT:\(jsonDict)")
                //convert this dictionary to real pokemon object
                guard let pokemon = Pokemon(withDict: jsonDict) else { continue }
                //or if let -> want to go to next pokemon, if current pokemon is not there?
                
                //append to pokemons variable
                self.pokemons.append(pokemon)
                
            }
            self.tableView.reloadData()
        }
    }
    
    
    //MARK: - ANIMATIONS
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.animateTableView()
    }
    
    func animateTableView() {
        let cells = tableView.visibleCells
        for (index, cell) in cells.enumerated() {
            cell.transform = CGAffineTransform(translationX: 0, y: tableView.bounds.height + 100)
            let delay = Double(index) * 0.1
            UIView.animate(withDuration: 0.5, delay: delay , usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseOut], animations: {
                cell.transform = .identity
                }, completion: nil)
        }
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonDetail", for: indexPath) as! PokemonTableViewCell
        //cast as pokemon tableviewcell - then can acess all the properties
        
        let thisPokemon = pokemons[indexPath.row] //now this takes each indiivdual pokemon and label an index so can access this
        print("THIS POKEMON:\(thisPokemon)")
        // Configure the cell...
        cell.pokeName.text = thisPokemon.name
        
        //img
        let pokemonIdentifier = thisPokemon.imageURL
        cell.pokeImage.image = UIImage(named: pokemonIdentifier)
        
        //img of types
        let types = thisPokemon.type
        if thisPokemon.type.count > 1 {
            cell.pokeTypeOne.image = UIImage(named: types[0])
            cell.pokeTypeTwo.image = UIImage(named: types[1])
        } else {
            cell.pokeTypeOne.image = UIImage(named: types[0])
        }
        
        //id #
        cell.pokeID.text = pokemonIdentifier //same id number, you can recast still if wanted
        
        return cell
    }
    
    
    //MARK: - SEGUE, for animation and sound
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifer ==
    }
    */
}
