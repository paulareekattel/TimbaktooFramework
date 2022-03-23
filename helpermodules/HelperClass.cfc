
component {
    
    function init() {
        return this;
    }

    function sendErrorEMail(string from, string to, string subject, 
                                string type, string body, string attachment, string cc, string bcc) {
        // Create an instance of the mail object
        var mail=new mail();
        
        // Set it's properties
        mail.setSubject( subject );
        mail.setTo( to );
        mail.setFrom( from );
        mail.setCC( cc );
        mail.setBCC( bcc );
        
        // Add an attachment
        mail.addParam( file=attachment );
        
        // Add email body content in text and HTML formats
        mail.addPart( type="text", charset="utf-8", wraptext="72", body="This is a test message." );
        mail.addPart( type=type, charset="utf-8", body=body );
        
        // Send the email
        mail.send();
    }

    function errorLoggingAndMessaging(exception error, string getFunctionCalledName) {
        writeLog(text="#error.message# - #error.detail#", file=getFunctionCalledName);
    
        savecontent variable="errortext" {
            writeOutput("An error occurred: http://#cgi.server_name##cgi.script_name#?#cgi.query_string#<br />Time: #dateFormat(now(), 'short')# #timeFormat(now(), 'short')#<br />", "html");
            writeDump(var=error,label='Error');
            writeDump(var=form,label='Form');
            writeDump(var=url,label='URL');
        }
        //sendErrorEMail(from="pareekattel@gmail.com", to="pareekattel@gmail.com", subject="Error: #error.message#", type= "html", body=errorText, file=getFunctionCalledName);
    }

    

    

    

    
}