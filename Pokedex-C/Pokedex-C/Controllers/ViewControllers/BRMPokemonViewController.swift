//
//  BRMPokemonViewController.swift
//  Pokedex-C
//
//  Created by Bethany Morris on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class BRMPokemonViewController: UIViewController {

    @IBOutlet weak var pokemonSearchBar: UISearchBar!
    @IBOutlet weak var pokemonSpriteImageView: UIImageView!
    @IBOutlet weak var pokemonNameLabel: UILabel!
    @IBOutlet weak var pokemonIDLabel: UILabel!
    @IBOutlet weak var pokemonAbilitiesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonSearchBar.delegate = self
    }

}

extension BRMPokemonViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        BRMPokemonController.fetchPokemon(forSearchTerm: searchText) { (pokemon) in
            //this is where we know we have a pokemon
            BRMPokemonController.fetchImage(for: pokemon) { (image) in
                DispatchQueue.main.async {
                    self.pokemonSpriteImageView.image = image
                    self.pokemonNameLabel.text = pokemon.name
                    self.pokemonIDLabel.text = "ID: \(pokemon.identifier)"
                    self.pokemonAbilitiesLabel.text = "Abilities: " + (pokemon.abilities.joined(separator: ", "))
                }
            }
        }
    }
    
}
