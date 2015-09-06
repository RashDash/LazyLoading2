//
//  ViewController.m
//  LazyLoading2
//
//  Created by ok on 9/6/15.
//  Copyright (c) 2015 Choudhary. All rights reserved.
//

#import "ViewController.h"
#import "SDWebImage/UIImageView+WebCache.h"

@interface ViewController ()
{
    NSMutableArray *tableData;
}
@end

@implementation ViewController

#pragma mark - ViewLifeCycle
- (void)viewDidLoad {
    tableData = [[NSMutableArray alloc]init];
    
    //Adding Static Url to the Array
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSString *finalPath = [path stringByAppendingPathComponent:@"ImageURL.plist"];
    tableData =[NSMutableArray arrayWithContentsOfFile:finalPath];
    NSLog(@"%@",tableData);
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


#pragma mark - TableView_DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    //Got the ImageView From Cell ContentView
    UIImageView *imageView = (UIImageView *)[cell viewWithTag:420];
   
    // Here we use the new provided sd_setImageWithURL: method to load the web image
    [imageView sd_setImageWithURL:[NSURL URLWithString:[tableData objectAtIndex:indexPath.row]]];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
