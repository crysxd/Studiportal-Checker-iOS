//
//  ExamCategory.cpp
//  HFU Studiportal
//
//  Created by Christian Würthner on 16.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#include "ExamCategory.h"

void ExamCategory::setCategoryName(std::string categoryName) {
    this->categoryName = categoryName;
    
}

std::string ExamCategory::getCategoryName() {
    return this->categoryName;
    
}

void ExamCategory::addExam(Exam e) {
    this->examList.push_back(e);
    
}

void ExamCategory::removeExam(Exam e) {
    std::vector<Exam>::iterator index = std::find(this->examList.begin(), this->examList.end(), e);
    this->examList.erase(index);
    
}

unsigned long ExamCategory::getExamCount() {
    return this->examList.size();
    
}

Exam ExamCategory::getExam(int index) {
    return this->examList[index];
    
}

std::vector<Exam> ExamCategory::getAllExams() {
    return this->examList;
    
}
