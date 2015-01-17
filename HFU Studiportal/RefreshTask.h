//
//  RefreshTask.h
//  HFU Studiportal
//
//  Created by Christian Würthner on 17.01.15.
//  Copyright (c) 2015 Hochschule Furtwangen University. All rights reserved.
//

#include <string>
#include "DialogHost.h"
#include "NotificationHost.h"

#ifndef HFU_Studiportal_RefreshTask_h
#define HFU_Studiportal_RefreshTask_h

#define URL_LOGIN   "https://studi-portal.hs-furtwangen.de/qisserver/rds?state=user&type=1&category=auth.login&startpage=portal.vm&breadCrumbSource=portal"
#define URL_LOGOUT  "https://studi-portal.hs-furtwangen.de/qisserver/rds?state=user&type=4&re=last&category=auth.logout&breadCrumbSource=portal"
#define URL_OBSERVE "https://studi-portal.hs-furtwangen.de/qisserver/rds?state=htmlbesch&moduleParameter=Student&menuid=notenspiegel&breadcrumb=notenspiegel&breadCrumbSource=menu&asi=%s"

class RefreshTask {
    std::string userName;
    std::string password;
    DialogHost *dialogHost;
    NotificationHost *notificationhost;
    
    void onPreExecute();
    void doInBackground();
    void onPostExecute();
    void login();
    void logout();
    void checkDataChange();
    std::string sendPost(std::string url, std::string params);
    std::string sendGet(std::string url);
    
public:
    RefreshTask(std::string user, std::string password, DialogHost* dialogHost, NotificationHost* notificationHost) :
        userName(user), password(password), dialogHost(dialogHost), notificationhost(notificationHost) {}
    void start();
    
};

#endif
