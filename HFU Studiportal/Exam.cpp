//
//  Exam.cpp
//  HFU Studiportal
//
//  Created by Christian Würthner on 15.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#include "Exam.h"

bool Exam::isResignated() {
    return this->getResignation() == "1";
    
}

Kind Exam::getKindEnum() {
    if(this->getKind() == "PL") {
        return KIND_PL;
        
    } else if(this->getKind() == "VL") {
        return KIND_VL;
        
    } else if(this->getKind() == "P") {
        return KIND_P;
        
    } else if(this->getKind() == "G") {
        return KIND_G;
        
    } else if(this->getKind() == "KO") {
        return KIND_KO;
        
    } else {
        return KIND_UNDEFINED;
        
    }
}

State Exam::getStateEnum() {
    if(this->getState() == "AN") {
        return STATE_AN;
        
    } else if(this->getState() == "BE") {
        return STATE_BE;
        
    } else if(this->getState() == "NB") {
        return STATE_NB;
        
    } else if(this->getState() == "EN") {
        return STATE_EN;
        
    } else {
        return STATE_UNDEFINED;
        
    }
}

Note Exam::getNoteEnum() {
    if(this->getNote() == "GR") {
        return NOTE_GR;
        
    } else if(this->getNote() == "K") {
        return NOTE_K;
        
    } else if(this->getNote() == "SA") {
        return NOTE_SA;
        
    } else if(this->getNote() == "U") {
        return NOTE_U;
        
    } else if(this->getNote() == "VF") {
        return NOTE_VF;
        
    } else {
        return NOTE_UNDEFINED;
        
    }
}

std::string Exam::getStateName() {
    switch (this->getStateEnum()) {
        case STATE_BE: return localizeString("exam.state.be"); break;
        case STATE_AN: return localizeString("exam.state.an"); break;
        case STATE_NB: return localizeString("exam.state.nb"); break;
        case STATE_EN: return localizeString("exam.state.en"); break;
        default: return "Undefined";
            
    }
}

std::string Exam::getNoteName() {
    switch (this->getNoteEnum()) {
        case NOTE_GR: return localizeString("exam.note.gr"); break;
        case NOTE_U: return localizeString("exam.note.u"); break;
        case NOTE_VF: return localizeString("exam.note.vl"); break;
        case NOTE_K: return localizeString("exam.note.k"); break;
        case NOTE_SA: return localizeString("exam.note.sa"); break;
        default: return "Undefined";
            
    }
}

uint32_t Exam::getId() {
    return this->id;
    
}

std::string Exam::getExamNo() {
    return this-> examNo;
    
}

std::string Exam::getName() {
    return this->name;
    
}

std::string Exam::getBonus() {
    return this->bonus;
    
}

std::string Exam::getMalus() {
    return this->malus;
    
}

std::string Exam::getECTS() {
    return this->ects;
    
}

std::string Exam::getSWS() {
    return this->sws;
    
}

std::string Exam::getSemster() {
    return this->semester;
    
}

std::string Exam::getKind() {
    return this->kind;
    
}

std::string Exam::getTryCount() {
    return this->tryCount;
    
}

std::string Exam::getGrade() {
    return this->grade;
    
}

std::string Exam::getState() {
    return this->state;
    
}

std::string Exam::getComment() {
    return this->comment;
    
}

std::string Exam::getResignation() {
    return this->resignation;
    
}

std::string Exam::getNote() {
    return this->note;
    
}

void Exam::setExamNo(std::string value) {
    this->examNo = value;
    
}

void Exam::setName(std::string value) {
    this->name = value;
    
}

void Exam::setBonus(std::string value) {
    this->bonus = value;
    
}

void Exam::setMalus(std::string value) {
    this->malus = value;
    
}

void Exam::setECTS(std::string value) {
    this->ects = value;
    
}

void Exam::setSWS(std::string value) {
    this->sws = value;
    
}

void Exam::setSemester(std::string value) {
    this->semester = value;
    
}

void Exam::setKind(std::string value) {
    this->kind = value;
    
}

void Exam::setTryCount(std::string value) {
    this->tryCount = value;
    
}

void Exam::setGrade(std::string value) {
    this->grade = value;
    
}

void Exam::setState(std::string value) {
    this->state = value;
    
}

void Exam::setComment(std::string value) {
    this->comment = value;
    
}

void Exam::setResignation(std::string value) {
    this->resignation = value;
    
}

void Exam::setNote(std::string value) {
    this->note = value;
    
}