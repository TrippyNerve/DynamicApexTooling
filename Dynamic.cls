public class Dynamic {
    public class IntentionalException extends Exception{}

    public static boolean eval(String toEval){
        boolean result = false;
        if(!toEval.startsWith('if')) {
            toEval = 'if(' + toEval + ') {throw new Dynamic.IntentionalException(\'true\');} else {throw new Dynamic.IntentionalException(\'false\');}';
        }
        ToolingAPI x = new ToolingAPI();
        try{
            ToolingAPI.ExecuteAnonymousResult toolingResult = x.executeAnonymousUnencoded(toEval);
        } catch (IntentionalException ie) {
            result = (ie.getMessage() == 'true') ? True : False;
        }
        return result;
    }
}