//
//  BNRAddItemTableViewController.m
//  BigDogs
//
//  Created by Daniel Campbell on 1/26/16.
//  Copyright © 2016 Daniel Campbell. All rights reserved.
//

#import "BNRAddItemTableViewController.h"
#import "BNROrder.h"
#import "BNRHotDog.h"
#import "BNRCondimentTableViewController.h"

@interface BNRAddItemTableViewController ()

@end

@implementation BNRAddItemTableViewController

-(id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSLog(@"Add %@ here", segue.identifier);
    if ([segue.identifier isEqualToString:@"AddDrink"]) {
        [[BNROrder currentOrder] addDrink];
        return;
    }
    
    BNRCondimentTableViewController *cvc = (BNRCondimentTableViewController *)segue.destinationViewController;
    BNRHotDog *newDog = [[BNRHotDog alloc] init];
    if ([segue.identifier isEqualToString:@"NewDogRegular"]) {
        newDog.kind = BNRHotDogKindRegular;
    } else if ([segue.identifier isEqualToString:@"NewDogJumbo"]) {
        newDog.kind = BNRHotDogKindJumbo;
    } else {
        newDog.kind = BNRHotDogKindVeggie;
    }
    cvc.dogToEmbellish = newDog;
}

- (void)viewWillAppear:(BOOL)animated {
    // Pop off all other views before returning to the item seleciton screen.
    [self.navigationController popToRootViewControllerAnimated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
