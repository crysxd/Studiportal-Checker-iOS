//
//  Exam.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 15.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#include <stdint.h>
#include "LocalStrings.h"

#ifndef HFU_Studiportal_Exam_h
#define HFU_Studiportal_Exam_h

enum Kind {KIND_PL, KIND_VL, KIND_P, KIND_G, KIND_KO, KIND_UNDEFINED};
enum State{STATE_AN, STATE_BE, STATE_NB, STATE_EN, STATE_UNDEFINED};
enum Note {NOTE_GR, NOTE_K, NOTE_SA, NOTE_U, NOTE_VF, NOTE_UNDEFINED};

class Exam {
    uint32_t id;
    std::string examNo      = "-";
    std::string name        = "-";
    std::string bonus       = "-";
    std::string malus       = "-";
    std::string ects        = "-";
    std::string sws         = "-";
    std::string semester    = "-";
    std::string kind        = "-";
    std::string tryCount    = "-";
    std::string grade       = "-";
    std::string state       = "-";
    std::string comment     = "-";
    std::string resignation = "-";
    std::string note        = "-";
    
public:
    Exam(std::string examNo):examNo(examNo) {}
    bool isResignated();
    Kind getKindEnum();
    State getStateEnum();
    Note getNoteEnum();
    std::string getStateName();
    std::string getNoteName();
    uint32_t getId();
    std::string getExamNo();
    std::string getName();
    std::string getBonus();
    std::string getMalus();
    std::string getECTS();
    std::string getSWS();
    std::string getSemster();
    std::string getKind();
    std::string getTryCount();
    std::string getGrade();
    std::string getState();
    std::string getComment();
    std::string getResignation();
    std::string getNote();
    void setExamNo(std::string value);
    void setName(std::string value);
    void setBonus(std::string value);
    void setMalus(std::string value);
    void setECTS(std::string value);
    void setSWS(std::string value);
    void setSemester(std::string value);
    void setKind(std::string value);
    void setTryCount(std::string value);
    void setGrade(std::string value);
    void setState(std::string value);
    void setComment(std::string value);
    void setResignation(std::string value);
    void setNote(std::string value);
    
};

#endif
