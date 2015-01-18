//
//  Exam.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 15.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#include <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, ExamKind) {
    ExamKindPL,
    ExamKindVL,
    ExamKindP,
    ExamKindG,
    ExamKindKO,
    ExamKindUndefined
};

typedef NS_ENUM(NSInteger, ExamState) {
    ExamStateAN,
    ExamStateBE,
    ExamStateNB,
    ExamStateEN,
    ExamStateUndefined
};

typedef NS_ENUM(NSInteger, ExamNote) {
    ExamNoteGR,
    ExamNoteK,
    ExamNoteSA,
    ExamNoteU,
    ExamNoteVF,
    ExamNoteUndefined
};

@interface Exam : NSObject

@property (readonly) NSNumber *id;
@property NSString *examNo;
@property NSString *name;
@property NSString *bonus;
@property NSString *malus;
@property NSString *ects;
@property NSString *semester;
@property NSString *kind;
@property NSString *tryCount;
@property NSString *grade;
@property NSString *state;
@property NSString *comment;
@property NSString *resignation;
@property NSString *note;

-(id) initWithExamNo:(NSString*) examNo;
-(BOOL) isResignated;
-(ExamKind) kindEnum;
-(ExamState) stateEnum;
-(ExamNote) noteEnum;
-(NSString*) stateName;
-(NSString*) noteName;

@end
