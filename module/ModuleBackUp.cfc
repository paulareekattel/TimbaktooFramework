
component name="module"{
    function init(name="", files="", submodulenames="") {
        var i="",j=1;
        this.name=arguments.name;
        this.files=argumemts.files;
        this.submodulenames=arguments.submodulenames;
        this['submodules']=arrayNew(1);

        for(i in this.submodulenames) {
            this.submodules[j++]= createObject("component", "module.SubModule").init(name=i, files="");
        }
        return this;
    }

    function getName() {
        return this.name;
    }

    function getFiles() {
        return this.files;
    }

    function getSubModuleNames() {
        return this.submodulenames;
    }

    function getSubmodules() {
        this.submodules;
    }

    function setName(name="") {
        this.name = arguments.name;
    }

    function setFiles(files="") {
        this.files = arguments.files;
    }

    function setSubModuleNames(submodulenames="") {
        this.submodulenames = arguments.submodulenames;
    }

    function setSubmodules(submodules=arrayNew(1)) {
        this.submodules = arguments.submodules;
    }
}