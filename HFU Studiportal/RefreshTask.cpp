//
//  RefreshTask.cpp
//  HFU Studiportal
//
//  Created by Christian Würthner on 17.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#include "RefreshTask.h"

void RefreshTask::onPreExecute() {
    if(this->dialogHost != NULL) {
        this->dialogHost->showIndeterminateProgressDialog("Überprüfe Studiportal", "Einloggen...");
        
    }
}

void RefreshTask::doInBackground() {
    
}

void RefreshTask::onPostExecute() {
    
}

void RefreshTask::login(){

}

void RefreshTask::logout(){

}

void RefreshTask::checkDataChange(){

}

std::string RefreshTask::sendPost(std::string url, std::string params){
    return "";
}

std::string RefreshTask::sendGet(std::string url){
    return "";
}

void RefreshTask::start() {
    onPreExecute();
    

}