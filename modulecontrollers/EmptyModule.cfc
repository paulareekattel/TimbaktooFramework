component 
    name="TimbaktooFramework.modulecontrollers.EmptyModule" 
    output="false" 
    displayname="EmptyModule" 
    hint="This Component is a place holder for empty module" 
    {
        private(name="TimbaktooFramework.modulecontrollers.EmptyModule")
        {
            this.parentmodulename="root";
            this.modulename="empty";
            this.files="empty.cfm";
            this.modulePath = "/TimbaktooFramework/modulecontrollers/";
            this.moduleViewPath = "/TimbaktooFramework/globalview/";
            this.moduleController = "ModuleController";
            this.moduleControllerPath = "/TimbaktooFramework/modulecontrollers/";
            this.submodulenames="";
            this.submodules=arrayNew(1);
        }

        private(name="TimbaktooFramework.modulecontrollers.ModuleController") {
            TimbaktooFramework.modulecontrollers.EmptyModule function init() 
            {
                return this;
            }
        }

        public(name="TimbakTooFramework") {        
            string function getModuleName() {
                return this.modulename;
            }
        
            string function getFiles() {
                return this.files;
            }
    
            string function getModulePath() {
                return this.modulePath;
            }
        
            string function getModuleViewPath() {
                return this.moduleViewPath;
            }
    
            any function getModuleController() {
                return this.moduleController;
            }
        
            string function getModuleControllerPath() {
                return this.moduleControllerPath;
            }
        
            string function getSubModuleNames() {
                return this.submodulenames;
            }
        
            array function getSubmodules() {
                return this.submodules;
            }
        }
    }