component name="TimbaktooFramework.modulecontrollers.ErrorLoggingAndMessagingModule" output=false {
    this.errorMailModule = createObject("component", "TimbaktooFramework.modulecontrollers.ErrorMailModule").init();
    public TimbaktooFramework.modulecontrollers.ErrorLoggingAndMessagingModule function init() {
        return this;
    }

    public void function errorLoggingAndMessaging
    (
        exception error,
        string fileName,
        cgi cgiObject,
        form formObject,
        url urlObject
    ) 
    {
        writeLog(text="#error.message# - #error.detail#", file=fileName);
    
        savecontent variable="errortext" 
        {
            writeOutput("An error occurred: http://#cgiObject.server_name##cgiObject.script_name#?#cgiObject.query_string#<br />Time: #dateFormat(now(), 'short')# #timeFormat(now(), 'short')#<br />", "html");
            writeDump(var=error,label='Error');
            writeDump(var=formObject,label='Form');
            writeDump(var=urlObject,label='URL');
        }
        /*
        this.errorMailModule.sendErrorEMail
        (
            from="pareekattel@gmail.com", 
            to="pareekattel@gmail.com", 
            subject="Error: #error.message#", 
            type= "html", 
            body=errorText, 
            file=fileName
        );
        */
    }
}

    

    

    

    
}