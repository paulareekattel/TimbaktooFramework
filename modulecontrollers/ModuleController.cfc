component name="TimbaktooFramework.modulecontrollers.ModuleController" output=false {
    private(name="TimbaktooFramework.modulecontrollers.ModuleController") {
        this.modules = "Root,Welcome,Login,Empty";
        this['Empty'] = createObject("component", "TimbaktooFramework.modulecontrollers.EmptyModule").init();
        this.subModuleArray = arrayNew(1);
        this.subModuleArray[1] = this['Empty'];
        this['Login'] = createObject("component", "TimbaktooFramework.modulecontrollers.Module").init(
            parentmodulename="Welcome",
            modulename="Login",
            files="login.cfm",
            modulePath="",
            moduleViewPath="",
            moduleController="",
            moduleControllerPath="",
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
            modulePath="",
            moduleViewPath="",
            moduleController="",
            moduleControllerPath="",
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
            modulePath="",
            moduleViewPath="",
            moduleController="",
            moduleControllerPath="",
            submodulenames="Welcome",
            submodules=duplicate(this.subModuleArray)
        );
        structDelete(this, "subModuleArray");
    }
}