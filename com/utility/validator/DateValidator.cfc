/*
Copyright: ten24, LLC
Author: Sumit Verma(sumit.verma@ten24web.com)
$Id: EmailValidator.cfc 16 2010-01-01 18:16:23Z sverma $

Notes:
*/
/**
 * @hint Date validator.
 */
component extends="BaseValidator" {
	
	private boolean function validate(String objectValue){
		var valid = true;
		if(!isnull(arguments.objectValue) && arguments.objectValue != "" && !isDate(arguments.objectValue)){
			valid = false;
		}
		return valid;
	}

}