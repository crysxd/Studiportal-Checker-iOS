//
//  SideMenuController.m
//  HFU Studiportal
//
//  Created by Christian Würthner on 19.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import  "CategoryMenuController.h"

@implementation CategoryMenuController
@synthesize data = _data;

-(UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
    
}

-(void)loadView {
    [super loadView];
    
    CGRect baseFrame = self.view.frame;
    baseFrame.size.width -= 45;

    self.table = [[UITableView alloc] initWithFrame:baseFrame];
    self.table.delegate = self;
    self.table.dataSource = self;
    self.table.contentInset = UIEdgeInsetsMake(50,0,0,0);
    self.table.backgroundColor = [UIColor clearColor];
    self.table.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.table];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return self.data != nil ? self.data.categoryCount : 0;
            
        case 1:
            return 3;
            
        default:
            return 0;

    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.backgroundColor = [UIColor clearColor];
        UIView *selectedBackgroundView = [[UIView alloc] init];
        selectedBackgroundView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.05];
        cell.selectedBackgroundView = selectedBackgroundView;
        
    }
    
    cell.imageView.image = [UIImage imageNamed:@"none"];
    
    if(indexPath.section == 0) {
        cell.textLabel.text = [self.data category:indexPath.row].categoryName;
  
    } else {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = NSLocalizedString(@"button.text.reload", nil);
                cell.imageView.image = [UIImage imageNamed:@"Reload"];
                break;
                
            case 1:
                cell.textLabel.text = NSLocalizedString(@"button.text.online", nil);
                cell.imageView.image = [UIImage imageNamed:@"Online"];
                break;
                
            case 2:
                cell.textLabel.text = NSLocalizedString(@"button.text.logout", nil);
                cell.imageView.image = [UIImage imageNamed:@"Logout"];
                break;
                
            default:
                cell.textLabel.text = NSLocalizedString(@"@undefined", nil);
                break;
                
        }
    }
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section > 0 ? 20 : 0;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc] init];
    header.backgroundColor = [UIColor clearColor];
    return header;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.section == 0) {
        if(self.delegate != nil) {
            [self.delegate categorySelected:[self.data category:indexPath.row]];
        
        }
    } else {
        switch (indexPath.row) {
            case 0:
                if(self.delegate != nil) [self.delegate reloadPressed];
                break;
                
            case 1:
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://studi-portal.hs-furtwangen.de/"]];
                break;
                
            case 2:
                [[[LoginStorage alloc] init] deleteUserAndPassword];
                if(self.delegate != nil) [self.delegate logoutPressed];
                break;

        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

-(void)setData:(StudiportalData *)data {
    if(data != self.data) {
        _data = data;
        [self.table reloadData];
        
    }
}

@end
