//
//  ExamCategory.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 16.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Exam.h"

@interface ExamCategory : NSObject

@property NSString *categoryName;
@property NSMutableArray *examList;

-(id) initWithCategoryName:(NSString*) categoryName;
-(void) addExam:(Exam*) exam;
-(void) removeExam:(Exam*) exam;
-(NSUInteger) examCount;
-(Exam*) exam:(NSUInteger) index;
-(NSArray*) allExams;

@end
