//
//  BNRCondimentTableViewController.m
//  BigDogs
//
//  Created by Daniel Campbell on 1/28/16.
//  Copyright © 2016 Daniel Campbell. All rights reserved.
//

#import "BNRCondimentTableViewController.h"
#import "BNRHotDog.h"
#import "BNROrder.h"

@interface BNRCondimentTableViewController ()

@end

@implementation BNRCondimentTableViewController

@synthesize dogToEmbellish = _dogToEmbellish;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Adding dog");
    NSArray *condimentRows = [self.tableView indexPathsForSelectedRows];
    for (NSIndexPath *condimentRow in condimentRows) {
        if ([condimentRow indexAtPosition:0] == 0) {
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:condimentRow];
            NSLog(@"Has %@", cell.textLabel.text);
            [self.dogToEmbellish.condiments addObject:cell.textLabel.text];
        }
    }
    
          [[BNROrder currentOrder] addDog:self.dogToEmbellish];
     
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
