<plugin>
<name>Slatwall Plugin</name>
<package>Slatwall</package>
<version>0.4</version>
<provider>Slatwall</provider>
<providerURL>https://github.com/gregmoser/Slatwall/wiki/</providerURL>
<category>Application</category>
<settings>
	<setting>
		<name>Integration</name>  
		<label>Integration Type</label>  
		<hint>If you would like Slatwall to Integrate with another System, select it here</hint>  
		<type>select</type>
		<required>true</required>
		<validation></validation>  
		<regex></regex>
		<message></message>
		<defaultvalue></defaultvalue>  
		<optionlist>Internal^Celerant</optionlist>  
		<optionlabellist>None (Internal)^Celerant</optionlabellist>  
	</setting>
	<setting>  
		<name>IntegrationDSN</name>  
		<label>Integration Datasource</label>  
		<hint>Datasource of your integration type</hint>  
		<type>text</type>
		<required>false</required>
		<validation></validation>  
		<regex></regex>
		<message></message>
		<defaultvalue></defaultvalue>  
		<optionlist></optionlist>  
		<optionlabellist></optionlabellist>  
	</setting>
	<setting>  
		<name>IntegrationDBUsername</name>  
		<label>Integration DB Username</label>  
		<hint>Username for the Integration Datasource</hint>  
		<type>text</type>
		<required>false</required>
		<validation></validation>  
		<regex></regex>
		<message></message>
		<defaultvalue></defaultvalue>  
		<optionlist></optionlist>  
		<optionlabellist></optionlabellist>  
	</setting>
	<setting>  
		<name>IntegrationDBPassword</name>  
		<label>Integration DB Password</label>  
		<hint>Password for the Integration Datasource</hint>  
		<type>text</type>
		<required>false</required>
		<validation></validation>  
		<regex></regex>
		<message></message>
		<defaultvalue></defaultvalue>  
		<optionlist></optionlist>  
		<optionlabellist></optionlabellist>  
	</setting>
</settings>

<eventHandlers>
	<eventHandler event="onApplicationLoad" component="fw1EventAdapter" persist="false"/>	
</eventHandlers>
<displayobjects location="global">
	<displayobject name="Content Product List" displaymethod="contentproductlist" component="fw1DisplayAdapter" persist="false"/>
</displayobjects>
</plugin>