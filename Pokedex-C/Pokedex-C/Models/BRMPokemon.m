//
//  BRMPokemon.m
//  Pokedex-C
//
//  Created by Bethany Morris on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import "BRMPokemon.h"

@implementation BRMPokemon

- (instancetype)initWithPokemonName:(NSString *)name identifier:(NSInteger)identifier abilities:(NSArray<NSString *> *)abilities spritePath:(NSString *)spritePath
{
    // Create the parent(superclass) before we can create the child(subclass)
    self = [super init];
    
    if (self) // if (self != nil)
    {
        _name = name;
        _identifier = identifier;
        _abilities = abilities;
        _spritePath = spritePath;
    }
    return self;
}

@end

@implementation BRMPokemon (JSONConvertible)

- (BRMPokemon *)initWithDictionary:(NSDictionary<NSString *,id> *)topLevelDictionary
{
    // name, id, abilities, sprite
    NSString *name = topLevelDictionary[@"name"]; // let name = tld["name]
    NSInteger identifier = [topLevelDictionary[@"id"] integerValue]; // let identifier = topLevelDictionary["id"] as? Int **Assessment**
    
    NSArray *abilitiesDict = topLevelDictionary[@"abilities"];
    NSMutableArray<NSString *> *abilities = [NSMutableArray new]; // let abilities: [String] = []
    
    if ([name isKindOfClass:[NSNull class]] || ![abilitiesDict isKindOfClass:[NSArray class]]) { return nil; } // **Assessment** nil is different from NSNull
    
    for (NSDictionary *dictionary in abilitiesDict)
    {
        NSDictionary *abilityDict = dictionary[@"ability"];
        NSString *name = abilityDict[@"name"];
        [abilities addObject:name];
    }
    
    NSString *spritePath = topLevelDictionary[@"sprites"][@"front_shiny"]; // accessing on one line of code
    
    
    return self initWithPokemonName:name identifier:identifier abilities:abilities spritePath:spritePath
}

@end
