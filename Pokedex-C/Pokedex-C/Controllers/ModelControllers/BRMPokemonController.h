//
//  BRMPokemonController.h
//  Pokedex-C
//
//  Created by Bethany Morris on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BRMPokemon.h"

NS_ASSUME_NONNULL_BEGIN

@interface BRMPokemonController : NSObject

+(void)fetchPokemonForSearchTerm:(NSString *)searchTerm
                      completion:(void (^)(BRMPokemon * pokemon))completion; // completion: @escaping (Result<BRMPokemon>) -> Void
/*
 ^^ fetch method:
 1 - type of method
 2 - return type
 3 - method name with first parameter's external name
 4 - type of first parameter
 5 - pointer
 6 - internal name for first parameter
 7 - external name for second parameter (function)
 8 - return type for the completion method
 9 - declares a block - "this is a closure"
 10 - completion type
 11 - pointer
 12 - internal name for second parameter
 13 - GD semi-colon
*/

+(void)fetchImageForPokemon:(BRMPokemon *)pokemon
                 completion:(void (^)(UIImage * image))completion;
 
@end

NS_ASSUME_NONNULL_END
