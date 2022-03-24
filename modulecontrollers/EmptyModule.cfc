component 
    name="TimbaktooFramework.emptymodule.EmptyModule" 
    output="false" 
    displayname="EmptyModule" 
    hint="This Component is a place holder for empty module" 
    {
        private(name="TimbaktooFramework.emptymodule.EmptyModule")
        {
            this.parentmodulename = "root";
            this.modulename = "empty";
            this.files = "empty.cfm";
            this.viewPath = "/TimbaktooFramework/emptymodule/view/";
            this.submodulenames = "";
            this.submodules = arrayNew(1); 
        }

        private(name="TimbaktooFramework.modulecontroller.ModuleController") {
            TimbaktooFramework.emptymodule.EmptyModule function init() 
            {
                return this;
            }

            string function getParentModuleName() {
                return this.parentmodulename;
            }

            string function getModuleName() {
                return this.modulename;
            }

            string function getFiles() {
                return this.files;
            }

            string function getViewPath() {
                return this.viewPath;
            }

            string function getSubModuleNames() {
                return this.submodulenames;
            }

            array function getSubModules() {
                return this.submodules;
            }
        }
    }