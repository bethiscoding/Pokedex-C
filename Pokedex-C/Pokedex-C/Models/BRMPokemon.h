//
//  BRMPokemon.h
//  Pokedex-C
//
//  Created by Bethany Morris on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BRMPokemon : NSObject

@property (nonatomic, readonly, copy) NSString *name; // let name: String
@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, readonly, copy) NSArray<NSString *> *abilities; // let abilities: [String]
@property (nonatomic, readonly, copy) NSString *spritePath;

// init(name: String, identifier: Int, abilities: [String]) -> BRMPokemon
// (instancetype) is the same as (BRMPokemon)
- (instancetype)initWithPokemonName:(NSString *)name
                         identifier:(NSInteger)identifier
                          abilities:(NSArray<NSString *> *)abilities
                         spritePath:(NSString *)spritePath;
/*
 init method:
 1 - the method type: Class (+) or Instance (-)
 2 - the return type
 3 - method name with first external parameter name
 4 - first parameter type
 5 - pointer to first parameter
 6 - internal name for the first parameter
 7 - second external parameter name
 8 - second parameter type
 9 - third external parameter name
 10 - third parameter type
 11 - generic type-casting for third parameter (<>)
 12 - type for type-casting
 13 - pointer to the type for type-casting
 14 - pointer to third parameter
 15 - internal name for third parameter
 16 - fourth external parameter name
 17 - fourth parameter type
 18 - pointer to fourth parameter
 19 - internal name for fourth parameter
 20 - GD semi-colon
 */

@end

// extension: BRMPokemon {
@interface BRMPokemon (JSONConvertible)

// init(with topLevelDict: [String : Any]) -> BRMPokemon {
- (BRMPokemon *) initWithDictionary:(NSDictionary<NSString *, id> *)topLevelDictionary;

@end

NS_ASSUME_NONNULL_END
