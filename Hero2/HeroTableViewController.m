//
//  MasterViewController.m
//  HeroTracker
//
//  Created by Tom Williamson on 4/22/16.
//  Copyright © 2016 Tom Williamson. All rights reserved.
//

#import "HeroTableViewController.h"
#import "Hero.h"
#import "Type1Cell.h"

@interface HeroTableViewController ()

@property NSMutableArray *objects;
@end

@implementation HeroTableViewController{
    
    NSMutableArray *heros;
}

- (void)viewDidLoad {
    
    self.title = @"Star Wars";
    
    [super viewDidLoad];
    [self loadHeroList];
    
    
}

//
//  build an array of Heros
//
- (void)loadHeroList
{
    
    heros = [[NSMutableArray alloc] init];
    //
    //  get json data
    //
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"StarWars" ofType:@"json"];
    NSArray *newHeros = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfFile:filePath] options:NSJSONReadingAllowFragments error:nil];
    
    //
    //  loop through each hero
    //
    for (NSDictionary * hero in newHeros) {
        Hero *h = [Hero heroWithDictionary:hero];
        [heros addObject:h];
    }
    
    //
    //  sort the list
    //
    NSSortDescriptor *asc = [NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES];
    [heros sortUsingDescriptors:[NSArray arrayWithObject:asc]];

    
    [self.tableView reloadData];
    
    
}



#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return heros.count;
 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Hero *hero = heros[indexPath.row];
    
    Type1Cell *cell = [tableView dequeueReusableCellWithIdentifier:hero.celltype forIndexPath:indexPath];
    
    cell.name.text = hero.name;
    cell.desc.text = hero.desc;
    cell.image.image = [UIImage imageNamed:hero.image];

    
    return cell;
}


@end
