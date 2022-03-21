
component {
    this.name = "TIMBAKTOO";
    this.sessionmanagement =  true;
    this.clientmanagement = true;
    this.sessionTimeout = createTimespan(0,0,20,0);
    this.loginstorage = "session";
    this.applicationTimeout = createTimespan(2,0,0,0);

    /*  Below is the empty module object which has a Welcome module only    */
    this.modulesObject = CreateObject("component", "emptymoduleclass").init();
    this.helperClassObject = createObject("component", "helperclass").init();

    /*
        To restrict depth the below regex is used. It only allows 
        module, 
        submodule, 
        subsubmodule,
        subsubsubmodule,
        subsubsubsubmodule    
    */
    this.moduleDepthValidatorRegex = "\^((sub)?|(sub){1,4})module$\";
    
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
        request.key = variables.helperClassObject.readKey("request");
        return application.VALID;
    }

    function onRequest(string targetPage) {
        if(structKeyExists(url, "reloadApp") && listCompare(url.reloadApp, request.key) == 0) {
            reloadAppModuleAndAppKey();
        }
        include targetPage;
    }

    function onRequestEnd() {
        return application.VALID;
    }

    function onError(struct exception, string eventname) {
        writeLog(text="#exception.message# - #exception.diagnostics# - #eventname#", type="#exception.information#", file=eventname);
    }

    function getAppModulesObject(struct object, string prefix) {
        var subPrefix = "";
        
        if(prefix == 'module') {
            subPrefix = 'submodule';
        } else {
            subPrefix = 'sub' & prefix;
        }
        if(validateModuleDepth(prefix) != application.VALID) {
            return object;
        }
        /*
        for(var i in object) {
            if(isObject(object[i])) {
                application[prefix][object[i]] = structNew();
                application[prefix][object[i]] = getAppModuleObject(object[i], subPrefix);
            } else {
                application[prefix][object[i]] = "";
                application[prefix][object[i]] = object[i];
            }
        }*/
        return application[prefix];
    }

    function reloadAppModuleAndAppKey() {
        try {
            this.modulesObject = CreateObject("component", "modulesclass").init();
            this['modules'] = getAppModulesObject(this.modulesObject, 'module');
            this.key = readKey("application");
        } catch(any error) {
            this.helperClassObject.errorLoggingAndMessaging(error, getFunctionCalledName());
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
            this.helperClassObject.errorLoggingAndMessaging(error, getFunctionCalledName());
            rethrow;
        }
        return returnKey;                
    }

    function getKeyFromServer(string keyType) {
        var returnKey = "";
        try {
            returnKey = makeSecureCallToServer(keyType);
        } catch(any error) {
            this.helperClassObject.errorLoggingAndMessaging(error, getFunctionCalledName());
            rethrow;
        }
        return returnKey;
    }

    function readKey(string keyType) {
        var returnKey = "";
        try {
            returnKey = getKeyFromServer(keyType);
        } catch(any error) {
            this.helperClassObject.errorLoggingAndMessaging(error, getFunctionCalledName());
            rethrow;
        }
        return returnKey;
    }

    function validateModuleDepth(string stringToValidateModuleDepth) {
        try {
            var test = reMatch(this.moduleDepthValidatorRegex, stringToValidateModuleDepth);
            if(test.length > 0) {
                return !application.VALID;
            }
        } catch(any error) {
            this.helperClassObject.errorLoggingAndMessaging(error, getFunctionCalledName());
            rethrow;
        }
        return application.VALID;
    }
}