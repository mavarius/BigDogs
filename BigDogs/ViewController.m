//
//  ViewController.m
//  BigDogs
//
//  Created by Daniel Campbell on 1/24/16.
//  Copyright © 2016 Daniel Campbell. All rights reserved.
//

#import "ViewController.h"
#import "BNROrder.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize totalLabel;
@synthesize itemsTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.itemsTable.dataSource = [BNROrder currentOrder];
}

-(void)viewDidUnload {
    [self setTotalLabel:nil];
    [self setItemsTable:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return (toInterfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.totalLabel.text = [NSString stringWithFormat:@"Total $%4.02f", [[BNROrder currentOrder] totalPrice]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
