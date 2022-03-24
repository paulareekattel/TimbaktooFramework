component name="TimbaktooFramework.modulecontrollers.ModuleController" output=false {
    private(name="TimbaktooFramework.modulecontrollers.ModuleController") {
        this.currentModule = createObject("component", "TimbaktooFramework.modulecontrollers.EmptyModule").init();
        this.previousModule = createObject("component", "TimbaktooFramework.modulecontrollers.EmptyModule").init();
        this.nextModule = createObject("component", "TimbaktooFramework.modulecontrollers.EmptyModule").init();
    }
    
    public(name="TimbaktooFramework.modulecontrollers.ModuleController") {
        TimbaktooFramework.modulecontrollers.ModuleController function init() {
            this.modules = "Root,Welcome,Login,Empty";
            this['Empty'] = createObject("component", "TimbaktooFramework.modulecontrollers.EmptyModule").init();
            this.subModuleArray = arrayNew(1);
            this.subModuleArray[1] = this['Empty'];
            this['Login'] = createObject("component", "TimbaktooFramework.modulecontrollers.Module").init(
                parentmodulename="Welcome",
                modulename="Login",
                files="login.cfm",
                modulePath="/TimbaktooFramework/Login/",
                moduleViewPath="/TimbaktooFramework/Login/views/",
                moduleController="LoginController",
                moduleControllerPath="/TimbaktooFramework/Login/",
                submodulenames="Empty",
                submodules=duplicate(this.subModuleArray)
            );
            structDelete(this, "subModuleArray");
            this.subModuleArray = arrayNew(1);
            this.subModuleArray[1] = this['Login'];
            this['Welcome'] = createObject("component", "TimbaktooFramework.modulecontrollers.Module").init(
                parentmodulename="Root",
                modulename="Welcome",
                files="welcome.cfm",
                modulePath="/TimbaktooFramework/Welcome/",
                moduleViewPath="/TimbaktooFramework/Welcome/views/",
                moduleController="WelcomeController",
                moduleControllerPath="/TimbaktooFramework/Welcome/",
                submodulenames="Login",
                submodules=duplicate(this.subModuleArray)
            );

            structDelete(this, "subModuleArray");
            this.subModuleArray = arrayNew(1);
            this.subModuleArray[1] = this['Wecome'];
            this['Root'] = createObject("component", "TimbaktooFramework.modulecontrollers.Module").init(
                parentmodulename="",
                modulename="Root",
                files="",
                modulePath="/TimbaktooFramework/",
                moduleViewPath="/TimbaktooFramework/globalview/",
                moduleController="",
                moduleControllerPath="",
                submodulenames="Welcome",
                submodules=duplicate(this.subModuleArray)
            );
            structDelete(this, "subModuleArray");
            return this;
        }

        TimbaktooFramework.modulecontrollers.Module function getRootModule() {
            return this['Root'];
        }

        void function setCurrentModule(TimbaktooFramework.modulecontrollers.Module module) {
            var currentModulePosition=0;
            if(listFindNoCase(this.modules, arguments.module, ",")) {
                this.currentModule = arguments.module;
                currentModulePosition = getCurrentModulePosition(this.currentModule);
                setPreviousAndNextModules(currentModulePosition);
            }
        }

        function setPreviousAndNextModules(currentModulePosition) {
            var emptyModuleObject = createObject("component","TimbaktooFramework.modulecontrollers.EmptyModule").init();
            if(arguments.currentModulePosition == 0) {
                setPreviousModule(emptyModuleObject);
            } else {
                moduleName = listGetAt(this.modules, arguments.currentModulePosition-1, ",");
                setPreviousModule(this["#moduleName#"]);
            }
            if(currentModulePosition == listLen(this.modules,",")) {
                setNextModule(emptyModuleObject);
            } else {
                moduleName = listGetAt(this.modules, arguments.currentModulePosition+1, ",");
                setPreviousModule(this["#moduleName#"]);
            }
        }

        function getCurrentModulePosition(TimbaktooFramework.modulecontrollers.Module module) {
            return listFindNoCase(this.modules, arguments.module, ",");
        }

        void function setPreviousModule(TimbaktooFramework.modulecontrollers.Module module) {
            this.previousModule = arguments.module;
        }

        void function setNextModule(TimbaktooFramework.modulecontrollers.Module module) {
            this.nextModule = arguments.module;
        }

        TimbaktooFramework.modulecontrollers.Module function getCurrentModule() {
            this.currentModule;
        }

        TimbaktooFramework.modulecontrollers.Module function getPreviousModule() {
            this.previousModule;
        }

        TimbaktooFramework.modulecontrollers.Module function getNextModule() {
            this.nextModule;
        }

        string function getModules() {
            return this.modules;
        }
    }
}