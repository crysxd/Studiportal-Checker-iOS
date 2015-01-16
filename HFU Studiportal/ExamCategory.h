//
//  ExamCategory.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 16.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#ifndef HFU_Studiportal_ExamCategory_h
#define HFU_Studiportal_ExamCategory_h

#include <string>
#include <vector>
#include <algorithm> 
#include "Exam.h"
#include "stdint.h"

class ExamCategory {
    std::string categoryName;
    std::vector<Exam> examList;
    
public:
    ExamCategory(std::string categoryName) : categoryName(categoryName) {}
    void setCategoryName(std::string categoryName);
    std::string getCategoryName();
    void addExam(const Exam e);
    void removeExam(const Exam e);
    unsigned long getExamCount();
    Exam getExam(int index);
    std::vector<Exam> getAllExams();
    
};


#endif
