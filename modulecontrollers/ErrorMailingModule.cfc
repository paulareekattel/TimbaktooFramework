component name="TimbaktooFramework.modulecontrollers.ErrorMailModule" output=false {
    
    public(name="TimbaktooFramework") {
        TimbaktooFramework.modulecontrollers.ErrorMailModule function init() {
            return this;
        }

        void function sendErrorEMail(string from, string to, string subject, 
                                string type, string body, string attachment, string cc, string bcc) {
            var mail=new mail();
            
            mail.setSubject( subject );
            mail.setTo( to );
            mail.setFrom( from );
            mail.setCC( cc );
            mail.setBCC( bcc );
            
            mail.addParam( file=attachment );
            
            mail.addPart( type="text", charset="utf-8", wraptext="72", body="This is a test message." );
            mail.addPart( type=type, charset="utf-8", body=body );
            
            mail.send();
        }
    }    
}

    

    

    

    
}