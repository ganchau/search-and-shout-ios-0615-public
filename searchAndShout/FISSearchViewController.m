//
//  FISSearchViewController.m
//  searchAndShout
//
//  Created by Joe Burgess on 7/2/14.
//  Copyright (c) 2014 Joe Burgess. All rights reserved.
//

#import "FISSearchViewController.h"
#import "FISSearchResultTableViewController.h"
#import "FISDanceMove.h"

@interface FISSearchViewController ()

@property (weak, nonatomic) IBOutlet UISegmentedControl *searchSegmentedControl;
@property (weak, nonatomic) IBOutlet UITextField *searchTextField;

@end

@implementation FISSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    [self.searchTextField becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    [self.searchTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    FISSearchResultTableViewController *searchResultDVC = segue.destinationViewController;
    NSString *searchKey = self.searchTextField.text;
    
    if (self.searchSegmentedControl.selectedSegmentIndex == 0) {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"name MATCHES[c] %@", searchKey];
        searchResultDVC.danceMoves = [self.dances filteredArrayUsingPredicate:searchPredicate];
        if (searchResultDVC.danceMoves.count > 0) {
            FISDanceMove *danceMove = [searchResultDVC.danceMoves firstObject];
            searchResultDVC.danceSteps = @[danceMove.step1, danceMove.step2, danceMove.step3, danceMove.step4];
        }
        
    } else if (self.searchSegmentedControl.selectedSegmentIndex == 1) {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"step1 CONTAINS[c] %@", searchKey];
        searchResultDVC.danceMoves = [self.dances filteredArrayUsingPredicate:searchPredicate];
        if (searchResultDVC.danceMoves.count > 0) {
            NSMutableArray *danceSteps = [@[] mutableCopy];
            for (FISDanceMove *danceMove in searchResultDVC.danceMoves) {
                [danceSteps addObject:danceMove.step1];
            }
            searchResultDVC.danceSteps = [danceSteps copy];
        }
        
    } else if (self.searchSegmentedControl.selectedSegmentIndex == 2) {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"step2 CONTAINS[c] %@", searchKey];
        searchResultDVC.danceMoves = [self.dances filteredArrayUsingPredicate:searchPredicate];
        if (searchResultDVC.danceMoves.count > 0) {
            NSMutableArray *danceSteps = [@[] mutableCopy];
            for (FISDanceMove *danceMove in searchResultDVC.danceMoves) {
                [danceSteps addObject:danceMove.step2];
            }
            searchResultDVC.danceSteps = [danceSteps copy];
        }

    } else if (self.searchSegmentedControl.selectedSegmentIndex == 3) {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"step3 CONTAINS[c] %@", searchKey];
        searchResultDVC.danceMoves = [self.dances filteredArrayUsingPredicate:searchPredicate];
        if (searchResultDVC.danceMoves.count > 0) {
            NSMutableArray *danceSteps = [@[] mutableCopy];
            for (FISDanceMove *danceMove in searchResultDVC.danceMoves) {
                [danceSteps addObject:danceMove.step3];
            }
            searchResultDVC.danceSteps = [danceSteps copy];
        }

    } else if (self.searchSegmentedControl.selectedSegmentIndex == 4) {
        NSPredicate *searchPredicate = [NSPredicate predicateWithFormat:@"step4 CONTAINS[c] %@", searchKey];
        searchResultDVC.danceMoves = [self.dances filteredArrayUsingPredicate:searchPredicate];
        if (searchResultDVC.danceMoves.count > 0) {
            NSMutableArray *danceSteps = [@[] mutableCopy];
            for (FISDanceMove *danceMove in searchResultDVC.danceMoves) {
                [danceSteps addObject:danceMove.step4];
            }
            searchResultDVC.danceSteps = [danceSteps copy];
        }
    }
}


@end
