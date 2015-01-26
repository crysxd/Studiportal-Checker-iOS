//
//  StudiportalData.m
//  HFU Studiportal
//
//  Created by Christian Würthner on 18.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#import "StudiportalData.h"

@implementation StudiportalData
@synthesize categoryList = _categoryList;

-(id) initWithHtmlTable:(NSString*)html {
    self = [self init];
    _categoryList = [self parseTable:html];
    return self;
    
}

-(id) initFromDisk {
    NSString *html = [[NSUserDefaults standardUserDefaults] stringForKey:USER_DEFAULTS_KEY_STUDIPORTAL_DATA];
    _categoryList = [self parseTable:html];
    return [self init];
    
}

-(NSArray*) findChangedExams:(StudiportalData*)otherInstance {
    NSArray *all = [self allExams];
    NSMutableArray *changed = [[NSMutableArray alloc] init];
    
    for (Exam *e in all) {
        if(e.class != [Seperator class]) {
            Exam *other = [otherInstance findExamWithExamNo:e.examNo];
            
            if(other != nil && other.grade != nil && ![other.grade isEqualToString:e.grade] && ![self doesList:changed containSubject:e.name]) {
                [changed addObject:e];
                
            }
            
            if([e.name isEqualToString:@"Formale Sprachen"])
               [changed addObject:e];
            
        }
    }
    
    return changed;
    
}

-(BOOL)doesList:(NSArray*) list containSubject:(NSString*) name {
    for (Exam *e in list) {
        if([e.name isEqualToString:name]) {
            return YES;
            
        }
    }
    
    return NO;
    
}


-(ExamCategory*) searchExams:(NSString*)query {
    query = query.lowercaseString;
    NSArray *all = [self allExams];
    ExamCategory *result = [[ExamCategory alloc] initWithCategoryName:@"Result"];
    
    for (Exam *e in all) {
        if([e.name.lowercaseString containsString:query]) {
            [result  addExam:e];
            
        }
    }
    
    return result;
    
}

-(void) save {
    [[NSUserDefaults standardUserDefaults] setObject:self.html forKey:USER_DEFAULTS_KEY_STUDIPORTAL_DATA];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(NSMutableArray*) parseTable:(NSString*)html {
    self.html = html;
    
    NSMutableArray* categoryList = [[NSMutableArray alloc] init];
    NSData *data = [html dataUsingEncoding:NSUTF8StringEncoding];
    TFHpple *parser = [TFHpple hppleWithHTMLData:data encoding:@"UTF-8"];

    NSArray *rows = [parser searchWithXPathQuery:@"//tr"];
    ExamCategory *current = [[ExamCategory alloc] initWithCategoryName:@"Unmatched"];
    
    
    for (TFHppleElement* row in rows) {
        NSArray *ths = [row searchWithXPathQuery:@"//th"];
        
        if(ths.count > 0) {
            if(ths.count > 1) {
                continue;
                
            }
            
            ExamCategory* newCategory = [self createExamCategory:row currentExamCategory:current];
            if(newCategory != nil) {
                current = newCategory;
                [categoryList addObject:current];
                
            }
        } else {
            [current addExam:[self createExam:row]];
            
        }
    }
    
    return categoryList;
    
}

-(Exam*) createExam:(TFHppleElement*)element {
    NSArray *cols = [element searchWithXPathQuery:@"//td"];
    
    Exam *e = [[Exam alloc] initWithExamNo:[[cols objectAtIndex:0] content]];
    
    NSUInteger offset = 0;
    
    for (NSUInteger i=0; i<cols.count; i++) {
        TFHppleElement *col = [cols objectAtIndex:i];
        NSString *colspan = [[col attributes] objectForKey:@"colspan"];
        
        NSString *text = [col.content stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        
        switch(i + offset) {
            case 1: e.name = text; break;
            case 2: e.bonus = text; break;
            case 3: e.malus = text; break;
            case 4: e.ects = text; break;
            case 5: e.sws = text; break;
            case 6: e.semester = text; break;
            case 7: e.kind = text; break;
            case 8: e.tryCount = text; break;
            case 9: e.grade = text; break;
            case 10: e.state = text; break;
            case 11: e.comment = text; break;
            case 12: e.resignation = text; break;
            case 13: e.note = text; break;
                
        }
        
        if(colspan != nil && colspan.length > 0) {
            offset += [colspan integerValue] - 1;
            
        }
    }
    
    return e;
    
}

-(ExamCategory*) createExamCategory:(TFHppleElement*)element currentExamCategory:(ExamCategory*)current {
    NSString *name = [element content];
    
    if(name.length == 0) {
        [current addExam:[[Seperator alloc] init]];
        return nil;
        
    }
    
    return [[ExamCategory alloc] initWithCategoryName:name];
    
}

-(NSArray*) allExams {
    NSMutableArray* exams = [[NSMutableArray alloc] init];
    
    for (ExamCategory* c in self.categoryList) {
        [exams addObjectsFromArray:c.examList];
        
    }
    
    return exams;

}

-(Exam*) findExamWithExamNo:(NSString*)examNo {
    for (Exam *e in self.allExams) {
        if([e.examNo isEqualToString:examNo]) {
            return e;
        }
    }
    
    return nil;
    
}

-(void) addCategory:(ExamCategory*)category {
    [self.categoryList addObject:category];
    
}

-(void) removeCategory:(ExamCategory*)category {
    [self.categoryList removeObject:category];
}

-(void) removeCategoryWithIndex:(NSUInteger)index {
    [self.categoryList removeObjectAtIndex:index];
}

-(NSUInteger) categoryCount {
    return self.categoryList.count;
    
}

-(ExamCategory*) category:(NSUInteger)index {
    return [self.categoryList objectAtIndex:index];
    
}

@end