component name="TimbaktooFramework.helpermodules.ErrorLoggingAndMessagingModule" output=false {
    
    public TimbaktooFramework.helpermodules.ErrorLoggingAndMessagingModule function init() {
        this.errorMailModule = createObject("component", "TimbaktooFramework.helpermodules.ErrorMailModule").init();
        return this;
    }

    public void function errorLoggingAndMessaging
    (
        exception error,
        string getFunctionCalledName,
        cgi cgiObject,
        form formObject,
        url urlObject
    ) 
    {
        writeLog(text="#error.message# - #error.detail#", file=getFunctionCalledName);
    
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
            file=getFunctionCalledName
        );
        */
    }
}

    

    

    

    
}