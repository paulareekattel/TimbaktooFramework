component name="TimbaktooFramework.module.Module" output="false" {
    private(name="TimbaktooFramework.module.Module") {
        this.parentmodulename="";
        this.modulename="";
        this.files="";
        this.modulePath = "";
        this.moduleViewPath = "";
        this.moduleController = "";
        this.moduleControllerPath = "";
        this.submodulenames="";
        this.submodules=arrayNew(1);
    }
     
    private(name="TimbaktooFramework.modulesincharge.ModulesController") {

        TimbaktooFramework.module.Module function init
        (
            parentmodulename="",
            modulename="",
            files="",
            modulePath="",
            moduleViewPath="",
            moduleController="",
            moduleControllerPath="",
            submodulenames="",
            submodules=arrayNew(1)
        ) 
        {
            this.parentmodulename=arguments.parentmodulename;
            this.modulename=arguments.modulename;
            this.files=arguments.files;
            this.modulePath=arguments.modulePath;
            this.moduleViewPath=arguments.modulePath;
            this.moduleController=arguments.moduleController;
            this.moduleControllerPath=arguments.moduleControllerPath;
            //remove duplicates submodule names, ' char, and keep empty lists
            this.submodulenames=replaceList(listRemoveDuplicates(arguments.submodulenames,","),"'","",",",true);
            this['submodules']=arrayNew(1); var j=1;
            for(i in this.submodulenames; listLen(this.submodulenames) > 0; j++) {
                if(isSimpleValue(i) && (!isBoolean(i) && !isDate(i) && !isNumber(i))) {
                    this.submodules[j] 
                    = 
                    createObject("component", "module.SubModule").init
                    (
                        parentmodulename=arguments.modulename;
                        modulename=i,
                        files="",
                        modulePath = "",
                        moduleViewPath = "",
                        moduleController = "",
                        moduleControllerPath = "",
                        submodulenames="",
                        submodules=arrayNew(1)
                    );
                }                
            }
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
    
        string function setModuleControllerPath() {
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