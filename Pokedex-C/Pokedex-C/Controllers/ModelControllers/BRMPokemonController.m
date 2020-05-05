//
//  BRMPokemonController.m
//  Pokedex-C
//
//  Created by Bethany Morris on 5/5/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

#import "BRMPokemonController.h"

static NSString * const baseURLString = @"https://pokeapi.co/api/v2/pokemon"; //privately static because it's not in header file

@implementation BRMPokemonController

+ (void)fetchPokemonForSearchTerm:(NSString *)searchTerm completion:(void (^)(BRMPokemon * _Nullable pokemon))completion //changed to Nullable
{
    // Step one: URL
    NSURL *baseURL = [NSURL URLWithString:baseURLString]; // let baseURL = URL(string: "")
    NSURL *finalURL = [baseURL URLByAppendingPathComponent:[searchTerm lowercaseString]];
    NSLog(@"%@", finalURL);
    
    // Step two - start the datatask
    [[[NSURLSession sharedSession] dataTaskWithURL:finalURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        //handle the error
        if (error)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        
        //handle the response
        if (response)
        {
            NSLog(@"%@", response);
        }
        
        //handle the data
        if (data) // 110101011011010001 -> JSON
        {
            NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
            
            if (!topLevelDictionary)
            {
                NSLog(@"Error parsing the JSON: %@", error);
                completion(nil);
                return;
            }
            
            BRMPokemon *pokemon = [[BRMPokemon alloc] initWithDictionary:topLevelDictionary];
            completion(pokemon);
        }
    }]resume];
}

+ (void)fetchImageForPokemon:(BRMPokemon *)pokemon completion:(void (^)(UIImage * _Nullable image))completion
{
    // Step one: URL
    NSURL *imageUrl = [NSURL URLWithString:pokemon.spritePath];
    NSLog(@"%@", imageUrl);

    // Step Two: handle the datatask
    [[NSURLSession.sharedSession dataTaskWithURL:imageUrl completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        // check for error
        if (error != nil)
        {
            NSLog(@"There was an error in %s: %@, %@", __PRETTY_FUNCTION__, error, [error localizedDescription]);
            completion(nil);
            return;
        }
        // handle the response

        // handle the data
        if (!data)
        {
            NSLog(@"%@", error);
            completion(nil);
            return;
        }
        // Now we have data
        UIImage *image = [UIImage imageWithData:data];
        completion(image);
    }]resume];
}

@end
