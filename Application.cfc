
component {
    this.name = "TIMBAKTOOFRAMEWORK";
    this.sessionmanagement =  true;
    this.clientmanagement = true;
    this.sessionTimeout = createTimespan(0,0,20,0);
    this.loginstorage = session;
    this.applicationTimeout = createTimespan(2,0,0,0);

    this.errorLoggingAndMessagingModuleObject = createObject("component", "TimbaktooFramework.modulecontrollers.ErrorLoggingAndMessagingModule").init();
        
    application.VALID = 1;
    
    function onApplicationStart() {
        reloadAppModuleAndAppKey();
        return application.VALID;
    }

    function onApplicationEnd() {
        return application.VALID;
    }

    function onSessionStart() {
        return application.VALID;
    }

    function onSessionEnd() {
        return application.VALID;
    }

    function onRequestStart() {
        if(!structKeyExists(request, "key")) {
            request.key = readKey("request");
        }
        return application.VALID;
    }

    function setCurrentModule() {

    }

    function onRequest(string targetPage) {
        if(structKeyExists(url, "reloadApp") && listCompare(url.reloadApp, request.key) === 0) {
            reloadAppModuleAndAppKey();
        }
        if
        (listFindNoCase
            (
                application.moduleController.getModules(),
                application.moduleController.getCurrentModule().getModuleName(), 
                ","
            ) > 0 && listFindNoCase
                    (
                        application.moduleController.getCurrentModule().getFiles(),
                        arguments.targetPage,
                        ","
                    ) > 0
        ) 
        {
            saveContent variable = "request.requestedContent" {
                include targetPage;
            }
        } else {
            saveContent variable = "request.requestedContent" {
                include "/globalview/error.cfm";
            }
            
        }
        include "index.cfm";
    }

    function onRequestEnd() {
        return application.VALID;
    }

    function onError(exception, eventname) {
        writeLog(text="#exception.message# - #exception.detail# - #eventname#", file=eventname);
    }

    function reloadAppModuleAndAppKey() {
        try {
            application.moduleController = CreateObject("component", "TimbaktooFramework.modulecontrollers.ModuleController").init();
            application.rootModule = application.moduleController.getRootModule();
            application.moduleController.setCurrentModule(application.rootModule);
        } catch(any error) {
            this.errorLoggingAndMessagingModuleObject.errorLoggingAndMessaging(error, getFunctionCalledName());
            rethrow;
        }
        return application.VALID;
    }

    function makeSecureCallToServer(string keyType) {
        var returnKey = "";
        try {
            switch(keyType) {
                case "application": returnKey = hash("IamPaulAreekattelApplication","SHA-512", "UTF-8", 10);
                case "session": returnKey = hash("IamPaulAreekattelSession","SHA-512", "UTF-8", 10);
                case "request": returnKey = hash("IamPaulAreekattelRequest","SHA-512", "UTF-8", 10);
                default: returnKey = hash("IamPaulAreekattelDefault","SHA-512", "UTF-8", 10);
            }
        } catch(any error) {
            this.errorLoggingAndMessagingModuleObject.errorLoggingAndMessaging(error, getFunctionCalledName());
            rethrow;
        }
        return returnKey;                
    }

    function getKeyFromServer(string keyType) {
        var returnKey = "";
        try {
            returnKey = makeSecureCallToServer(keyType);
        } catch(any error) {
            this.errorLoggingAndMessagingModuleObject.errorLoggingAndMessaging(error, getFunctionCalledName());
            rethrow;
        }
        return returnKey;
    }

    function readKey(string keyType) {
        var returnKey = "";
        try {
            returnKey = getKeyFromServer(keyType);
        } catch(any error) {
            this.errorLoggingAndMessagingModuleObject.errorLoggingAndMessaging(error, getFunctionCalledName());
            rethrow;
        }
        return returnKey;
    }
}