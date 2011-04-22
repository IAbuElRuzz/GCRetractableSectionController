//
//  RootViewController.m
//  Demo
//
//  Created by Guillaume Campagna on 11-04-21.
//  Copyright 2011 LittleKiwi. All rights reserved.
//

#import "RootViewController.h"
#import "GCSimpleSectionController.h"
#import "GCCustomSectionController.h"
#import "GCEmptySectionController.h"

@interface RootViewController ()

@property (nonatomic, retain) NSArray* retractableControllers;

@end

@implementation RootViewController

@synthesize retractableControllers;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = NSLocalizedString(@"Demo",);
    
    GCSimpleSectionController* simpleController = [[GCSimpleSectionController alloc] initWithViewController:self];
    GCCustomSectionController* customController = [[GCCustomSectionController alloc] initWithViewController:self];
    GCEmptySectionController* emptyController = [[GCEmptySectionController alloc] initWithViewController:self];
    self.retractableControllers = [NSArray arrayWithObjects:simpleController, customController, emptyController, nil];
    [simpleController release];
    [customController release];
    [emptyController release];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    GCRetractableSectionController* sectionController = [self.retractableControllers objectAtIndex:section];
    return sectionController.numberOfRow;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    GCRetractableSectionController* sectionController = [self.retractableControllers objectAtIndex:indexPath.section];
    return [sectionController cellForRow:indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    GCRetractableSectionController* sectionController = [self.retractableControllers objectAtIndex:indexPath.section];
    return [sectionController didSelectCellAtRow:indexPath.row];
}

- (void)dealloc
{
    self.retractableControllers = nil;
    
    [super dealloc];
}

@end
