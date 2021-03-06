component displayname="Brand" entityname="SlatwallBrand" table="SlatwallBrand" persistent=true output=false accessors=true extends="slatwall.com.entity.BaseEntity" {
	
	// Persistant Properties
	property name="brandID" type="string" fieldtype="id" generator="guid";
	property name="brandName" type="string" default="" displayname="Brand Name" persistent="true" hint="This is the common name that the brand goes by.";
	property name="brandWebsite" type="string" default="" displayname="Brand Website" persistent="true" hint="This is the Website of the brand";
	
	// Related Object Properties
	property name="brandVendors" cfc="vendorbrand" fieldtype="one-to-many" fkcolumn="BrandID";

}