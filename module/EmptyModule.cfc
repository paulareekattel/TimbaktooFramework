
component name="emptymodule"{
    init() {
        this.name='empty';
        this.files='empty.cfm';
        this['submodules']=arrayNew(1);
        return this;
    }
}