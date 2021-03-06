component displayname="Vendor Phone" entityname="SlatwallVendorPhone" table="SlatwallVendorPhone" persistent="true" extends="slatwall.com.entity.BaseEntity" {
	property name="VendorPhoneID" fieldtype="id" generator="increment";
	property name="PhoneNumber" type="string" persistent="true";
	
	property name="Vendor" cfc="vendor" fieldtype="many-to-one" fkcolumn="VendorID";
	property name="PhoneType" cfc="type" fieldtype="many-to-one" fkcolumn="TypeID";
}