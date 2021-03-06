component displayname="Vendor Email" entityname="SlatwallVendorEmail" table="SlatwallVendorEmail" persistent="true" accessors="true" output="false" extends="slatwall.com.entity.baseEntity" {

	property name="vendorEmailID" fieldtype="id" generator="increment";
	property name="emailAddress" type="string";
	
	property name="vendor" cfc="vendor" fieldtype="many-to-one" fkcolumn="vendorID";
	property name="emailType" cfc="type" fieldtype="many-to-one" fkcolumn="typeID";
	
}