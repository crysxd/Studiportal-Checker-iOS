//
//  ExamCategory.cpp
//  HFU Studiportal
//
//  Created by Christian Würthner on 16.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#include "ExamCategory.h"

@implementation ExamCategory

-(id)initWithCategoryName:(NSString *)categoryName {
    self.categoryName = categoryName;
    return self;
    
}

-(void)addExam:(id)exam {
    [self.examList addObject:exam];
    
}

-(void)removeExam:(id)exam {
    [self.examList removeObject:exam];
    
}

-(NSUInteger)getExamCount {
    return [self.examList count];
    
}

-(id)getExam:(NSUInteger)index {
    return [self.examList objectAtIndex:index];
    
}

-(NSArray *)getAllExams {
    return [self.examList copy];
    
}

@end