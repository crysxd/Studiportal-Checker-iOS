//
//  StudiportalData.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 18.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ExamCategory.h"
#import "TFHpple.h"
#import "Seperator.h"

#define USER_DEFAULTS_KEY_STUDIPORTAL_DATA @"studiportal.data.html"

@interface StudiportalData : NSObject

@property NSMutableArray *categoryList;
@property NSString *html;

-(id) initWithHtmlTable:(NSString*)html;
-(id) initFromDisk;
-(NSArray*) findChangedExams:(StudiportalData*)otherInstance;
-(ExamCategory*) searchExams:(NSString*)query;
-(void) save;
-(NSMutableArray*) parseTable:(NSString*)html;
-(Exam*) createExam:(TFHppleElement*)element;
-(ExamCategory*) createExamCategory:(TFHppleElement*)element currentExamCategory:(ExamCategory*)current;
-(NSArray*) allExams;
-(void) addCategory:(ExamCategory*)category;
-(void) removeCategory:(ExamCategory*)category;
-(void) removeCategoryWithIndex:(NSUInteger)index;
-(NSUInteger) categoryCount;
-(ExamCategory*) category:(NSUInteger)index;
-(Exam*)findExamWithExamNo:(NSString*) examNo;
-(BOOL)doesList:(NSArray*) list containSubject:(NSString*) name;

@end
