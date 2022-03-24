component name="TimbaktooFramework.modulecontrollers.SubModule" extends="TimbaktooFramework.module.Module" output=false  {
    private(name="TimbaktooFramework.modulecontrollers.ModuleController") {
        TimbaktooFramework.modulecontrollers.SubModule function init
        (
            parentmodulename="",
            modulename="",
            files="",
            modulePath = "",
            moduleViewPath = "",
            moduleController = "",
            moduleControllerPath = "",
            submodulenames="",
            submodules=arrayNew(1)
        ) {
            this.parentmodulename=arguments.parentmodulename;
            this.modulename=arguments.modulename;
            this.files=arguments.files;
            this.modulePath = arguments.modulePath;
            this.moduleViewPath = arguments.moduleViewPath;
            this.moduleController = arguments.moduleController;
            this.moduleControllerPath = arguments.moduleControllerPath;
            this.submodulenames=arguments.submodulenames;
            this.submodules=arguments.submodules;
            return this;
        }

        void function setParentModuleName(parentmodulename="") {
            this.parentmodulename = arguments.parentmodulename;
        }

        void function setModuleName(modulename="") {
            this.modulename = arguments.modulename;
        }
    
        void function setFiles(files="") {
            this.files = arguments.files;
        }

        void function setModulePath(modulePath="") {
            this.modulePath = arguments.modulePath;
        }
    
        void function setModuleViewPath(moduleViewPath="") {
            this.moduleViewPath = arguments.moduleViewPath;
        }

        void function setModuleController(moduleController="") {
            this.moduleController = arguments.moduleController;
        }
    
        void function setModuleControllerPath(moduleControllerPath="") {
            this.moduleControllerPath = arguments.moduleControllerPath;
        }
    
        void function setSubModuleNames(submodulenames="") {
            this.submodulenames = arguments.submodulenames;
        }
    
        void function setSubmodules(submodules=arrayNew(1)) {
            this.submodules = arguments.submodules;
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

    public(name="TimbakTooFramework") {        
        string function getParentModuleName() {
            return this.parentmodulename;
        }

        string function getModuleName() {
            return this.modulename;
        }
    }
}