
component name="TimbaktooFramework.modulesincharge.TestModuleInCharge" output=false {
    private(name="TimbaktooFramework.modulesincharge.TestModuleInCharge") {
        this.modules = "Root,Welcome,Login,Empty";
        this.Root = createObject("component", "module.Module").init(name="root", files="", submodulenames="Welcome");
        this.Welcome = createObject("component", "module.Module").init(name="Welcome", files="welcome.cfm", submodulenames="Login");S
        this.Login = createObject("component", "module.Module").init(name="Login", files="login.cfm", submodulenames="Empty");
        this.Empty = createObject("component", "module.EmptyModule").init();
    }
    public TimbaktooFramework.modulesincharge.TestModuleInCharge function init() {
        return this;
    }
    package
}