//
//  Exam.cpp
//  HFU Studiportal
//
//  Created by Christian Würthner on 15.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#include "Exam.h"

@implementation Exam

-(id) initWithExamNo:(NSString*) examNo {
    self.examNo = examNo;
    self.name = @"-";
    self.bonus = @"-";
    self.malus = @"-";
    self.ects = @"-";
    self.semester = @"-";
    self.kind = @"-";
    self.tryCount = @"-";
    self.grade = @"-";
    self.state = @"-";
    self.comment = @"-";
    self.resignation = @"-";
    self.note = @"-";
    return self;
    
}

-(BOOL) isResignated {
    return [self.resignation isEqualToString:@"1"];
    
}

-(ExamKind) kindEnum {
    if([[self kind] isEqualToString:@"PL"]) {
        return ExamKindPL;
        
    } else if([[self kind] isEqualToString:@"VL"]) {
        return ExamKindVL;
        
    } else if([[self kind] isEqualToString:@"P"]) {
        return ExamKindP;
        
    } else if([[self kind] isEqualToString:@"G"]) {
        return ExamKindG;
        
    } else if([[self kind] isEqualToString:@"KO"]) {
        return ExamKindKO;
        
    } else {
        return ExamKindUndefined;
        
    }
}

-(ExamState) stateEnum {
    if([[self state] isEqualToString:@"AN"]) {
        return ExamStateAN;
        
    } else if([[self state] isEqualToString:@"BE"]) {
        return ExamStateBE;
        
    } else if([[self state] isEqualToString:@"NB"]) {
        return ExamStateNB;
        
    } else if([[self state] isEqualToString:@"EN"]) {
        return ExamStateEN;
        
    } else {
        return ExamStateUndefined;
        
    }
}

-(ExamNote) noteEnum {
    if([[self note] isEqualToString:@"GR"]) {
        return ExamNoteGR;
        
    } else if([[self note] isEqualToString:@"K"]) {
        return ExamNoteK;
        
    } else if([[self note] isEqualToString:@"SA"]) {
        return ExamNoteSA;
        
    } else if([[self note] isEqualToString:@"U"]) {
        return ExamNoteU;
        
    } else if([[self note] isEqualToString:@"VF"]) {
        return ExamNoteVF;
        
    } else {
        return ExamNoteUndefined;
        
    }
}

-(NSString*) stateName {
    switch ([self stateEnum]) {
        case ExamStateBE: return NSLocalizedString(@"exam.state.be", nil); break;
        case ExamStateAN: return NSLocalizedString(@"exam.state.an", nil); break;
        case ExamStateNB: return NSLocalizedString(@"exam.state.nb", nil); break;
        case ExamStateEN: return NSLocalizedString(@"exam.state.en", nil); break;
        default: return @"Undefined";
            
    }
}

-(NSString*) noteName {
    switch ([self noteEnum]) {
        case ExamNoteGR: return NSLocalizedString(@"exam.note.gr", nil); break;
        case ExamNoteU: return NSLocalizedString(@"exam.note.u", nil); break;
        case ExamNoteVF: return NSLocalizedString(@"exam.note.vl", nil); break;
        case ExamNoteK: return NSLocalizedString(@"exam.note.k", nil); break;
        case ExamNoteSA: return NSLocalizedString(@"exam.note.sa", nil); break;
        default: return @"Undefined";
            
    }
}

@end