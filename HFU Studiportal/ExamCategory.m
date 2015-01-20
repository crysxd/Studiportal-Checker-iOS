//
//  ExamCategory.cpp
//  HFU Studiportal
//
//  Created by Christian Würthner on 16.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#include "ExamCategory.h"

@implementation ExamCategory

-(instancetype)init {
    self.examList = [[NSMutableArray alloc] init];
    return [super init];
    
}

-(id)initWithCategoryName:(NSString *)categoryName {

    self.categoryName = [categoryName stringByReplacingOccurrencesOfString:@"*" withString:@""];
    self.categoryName = [self.categoryName stringByReplacingOccurrencesOfString:@":" withString:@""];
    self.categoryName = [self.categoryName stringByReplacingOccurrencesOfString:@"Module/Teilmodule" withString:@"Module"];
    self.categoryName = [self.categoryName stringByReplacingOccurrencesOfString:@"(ECTS) " withString:@""];
    self.categoryName = [self.categoryName stringByReplacingOccurrencesOfString:@"Bestandene Module" withString:@"Bestanden"];
    self.categoryName = [self.categoryName stringByTrimmingCharactersInSet:
                         [NSCharacterSet whitespaceCharacterSet]];
    return [self init];
    
}

-(void)addExam:(id)exam {
    [self.examList addObject:exam];
    
}

-(void)removeExam:(id)exam {
    [self.examList removeObject:exam];
    
}

-(NSUInteger)examCount {
    return [self.examList count];
    
}

-(id)exam:(NSUInteger)index {
    return [self.examList objectAtIndex:index];
    
}

-(NSArray *)allExams {
    return [self.examList copy];
    
}

@end