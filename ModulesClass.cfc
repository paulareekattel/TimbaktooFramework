
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
        this['Welcome']['SubModules']['SubModuleNames']= 'Login';
        /*Welcome Module Section End*/

        /*Login Module Section Start*/
        this['Login'] = structNew();    
        this['Login']['files'] = 'login.cfm';

        this['Login']['SubModules'] = structNew();
        this['Login']['SubModules']['SubModuleNames'] = 'Verification';
        /*Login Module Section End*/

    
        /*Verification Module Section Start*/
        this['Verification'] = structNew();
        this['Verification']['files']= 'verification.cfm';

        this['Verification']['SubModules'] = structNew();
        this['Verification']['SubModules']['SubModuleNames'] = 'Acknowledgement';
        /*Verification Module Section End*/

        /*Acknowledgement Module Section Start*/
        this['Acknowledgement'] = structNew();
        this['Acknowledgement']['files'] = 'acknowledgement.cfm';


        this['Acknowledgement']['SubModules'] = structNew();
        this['Acknowledgement']['SubModules']['SubModuleNames'] = 'Empty';
        /*Acknowledgement Module Section End*/

        /*Empty Module Section Start*/
        this['Empty'] = structNew();
        this['Empty']['files'] = 'empty.cfm';
        /*Empty Module Section End*/
        return this;
    }
}