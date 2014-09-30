//
//  imagesTable.m
//  GCD
//
//  Created by pcs20 on 9/30/14.
//  Copyright (c) 2014 Paradigmcreatives. All rights reserved.
//

#import "imagesTable.h"

@interface imagesTable (){

    NSMutableArray *imagesArray;
}

@end

@implementation imagesTable

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    imagesArray=[[NSMutableArray alloc] initWithObjects:@"https://dz1uozffojv6d.cloudfront.net/2014-7-17/server/afec8f10-561a-43f3-b57a-2faeaf461ed8_image01_sky_00001.png",@"https://dz1uozffojv6d.cloudfront.net/2014-7-17/server/35db43c7-7295-48e4-adfd-838a39aea34b_image01_vol_1_00001.png",@" https://dz1uozffojv6d.cloudfront.net/2014-7-14/server/e6dee19d-96c0-4a25-8a3b-81f473803068_image01_man.png",@"https://dz1uozffojv6d.cloudfront.net/2014-7-14/server/5c6dc87f-fd40-4c56-984f-48a064947ecf_image01_man_1.png", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return imagesArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell" forIndexPath:indexPath];
    
    NSString *imageUrlString=[imagesArray objectAtIndex:indexPath.row];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
    
        NSURL *imageUrl=[NSURL URLWithString:imageUrlString];
        
        NSData *imageData=[NSData dataWithContentsOfURL:imageUrl];
        
        dispatch_async(dispatch_get_main_queue(), ^{
        
            [cell.imageView setImage:[UIImage imageWithData:imageData]];
        
        });
    
    });
    
    
    return cell;
}



@end
