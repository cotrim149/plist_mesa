//
//  main.m
//  desafio2
//
//  Created by ALS on 07/05/14.
//  Copyright (c) 2014 Cotrim. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, char *argv[])
{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *erro;
    
    NSArray *desktops = NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES);
    NSMutableString *dir = [[NSMutableString alloc] init];
    [dir appendString:[desktops objectAtIndex:0]];
    [dir appendString:@"/Listas/"];
    
    NSLog(@"%@",dir);
    if(![fileManager fileExistsAtPath:dir]){
        if (![fileManager createDirectoryAtPath:dir withIntermediateDirectories:NO attributes:nil error:&erro]) {
            NSLog(@"%@",[erro localizedDescription]);
        }else{
            NSLog(@"Pasta criada com sucesso");
        }
    }

    NSMutableArray *plist1 = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *plistString = [[NSMutableDictionary alloc] init];
    
    [plistString setValue:@"Victor" forKey:@"nome"];
    
    [plist1 addObject:plistString];
    
    NSMutableString *path1 = [NSMutableString stringWithString:dir];
    [path1 appendString:@"plistString.plist"];
    [plist1 writeToFile:path1 atomically:YES];

    
    
    NSMutableArray *plist2 = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *plistNumber = [[NSMutableDictionary alloc] init];
    
    [plistNumber setValue:[NSNumber numberWithInt:23] forKey:@"idade"];
    
    [plist2 addObject:plistNumber];
    
    NSMutableString *path2 = [NSMutableString stringWithString:dir];
    [path2 appendString:@"plistNumber.plist"];
    [plist2 writeToFile:path2 atomically:YES];
    
    NSMutableArray *plist3 = [[NSMutableArray alloc] init];
    
    NSMutableDictionary *plistDate = [[NSMutableDictionary alloc] init];
    
    [plistDate setValue:[NSDate dateWithNaturalLanguageString:@"01/01/2014"] forKey:@"data"];
    
    [plist3 addObject:plistDate];
    
    NSMutableString *path3 = [NSMutableString stringWithString:dir];
    [path3 appendString:@"plistDate.plist"];
    [plist3 writeToFile:path3 atomically:YES];
    
    
    
    return NSApplicationMain(argc, (const char **)argv);
}
