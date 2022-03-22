
component {

    function init() {
        /*Main Modules Section Start*/
        this['Modules'] = structNew();
        this['Modules']['ModuleNames'] = 'Welcome';
        /*Main Modules Section End*/


        /*Welcome Module Section Start*/
        this['Welcome'] = structNew();
        this['Welcome']['files'] = 'welcome.cfm';

        this['Welcome']['SubModules'] = structNew();
        this['Welcome']['SubModules']['ModuleNames']= 'Login';
        /*Welcome Module Section End*/

        /*Login Module Section Start*/
        this['Login'] = structNew();    
        this['Login']['files'] = 'login.cfm';

        this['Login']['SubModules'] = structNew();
        this['Login']['SubModules']['ModuleNames'] = 'Empty';
        /*Login Module Section End*/

        /*Empty Module Section Start*/
        this['Empty'] = structNew();
        this['Empty']['files'] = 'empty.cfm';
        /*Empty Module Section End*/
        return this;
    }
}