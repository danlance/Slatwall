<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
	
	<cfset variables.preserveKeyList="context,base,cfcbase,subsystem,subsystembase,section,item,services,action,controllerExecutionStarted,generateses">
	
	<!--- Include FW/1 configuration that is shared between then adapter and the application. --->
	<cfinclude template="fw1Config.cfm">
	
	<!--- this is the plugin hook in for mura --->
	<cffunction name="onSiteRequestStart" output="false">
        <cfargument name="$">
        <!--- put the plugin into the event --->
		<cfset $[variables.framework.applicationKey]= this />
		
		<!--- Call Slatwall Front End Controller /> --->
		<cfset doAction($, 'frontend:event.onsiterequeststart') />
    </cffunction>
	
	<cffunction name="onRenderStart">
		<cfargument name="$" />
		
		<cfset doAction($, "frontend:event.onrenderstart") />
	</cffunction>
	
	<cffunction name="onRenderEnd">
		<cfargument name="$" />
		
		<cfset doAction($, "frontend:event.onrenderend") />
	</cffunction>
	
	<cffunction name="onApplicationLoad" output="false">
		<cfargument name="$">
		<cfset var state=preseveInternalState(request)>
		<cfset request.pluginConfig=variables.pluginConfig>
		<cfinvoke component="#pluginConfig.getPackage()#.Application" method="onApplicationStart" />
		<cfset restoreInternalState(request,state)>
		<cfset variables.pluginConfig.addEventHandler(this)>
	</cffunction>
	
	<cffunction name="onGlobalSessionStart" output="false">
		<cfargument name="$">
		<cfset var state=preseveInternalState(request)>
		<cfinvoke component="#pluginConfig.getPackage()#.Application" method="onSessionStart" />
		<cfset restoreInternalState(request,state)>
	</cffunction>

	<cffunction name="preseveInternalState" output="false">
		<cfargument name="state">
		<cfset var preserveKeys=structNew()>
		<cfset var k="">
		
		<cfloop list="#variables.preserveKeyList#" index="k">
			<cfif isDefined("arguments.state.#k#")>
				<cfset preserveKeys[k]=arguments.state[k]>
				<cfset structDelete(arguments.state,k)>
			</cfif>
		</cfloop>
		
		<cfset structDelete( arguments.state, "serviceExecutionComplete" )>
		
		<cfreturn preserveKeys>
	</cffunction>
	
	<cffunction name="restoreInternalState" output="false">
		<cfargument name="state">
		<cfargument name="restore">
		
		<cfloop list="#variables.preserveKeyList#" index="k">
				<cfset structDelete(arguments.state,k)>
		</cfloop>
		
		<cfset structAppend(state,restore,true)>
		<cfset structDelete( state, "serviceExecutionComplete" )>
	</cffunction>
		
	<cffunction name="doAction" output="false">
		<cfargument name="$">
		<cfargument name="action" type="string" required="false" default="" hint="Optional: If not passed it looks into the event for a defined action, else it uses the default"/>
				
		<cfset var result = "" />
		<cfset var savedEvent = "" />
		<cfset var savedAction = "" />
		<cfset var fw1 = createObject("component","#pluginConfig.getPackage()#.Application") />
		<cfset var local=structNew()>
		<cfset var state=structNew()>
		<!--- Put the event url struct, to be used by FW/1 --->
		<cfset url.$ = $ />
		
		<cfif not len( arguments.action )>
			<cfif len(arguments.$.event(variables.framework.action))>
				<cfset arguments.action=arguments.$.event(variables.framework.action)>
			<cfelse>
				<cfset arguments.action=variables.framework.home>
			</cfif>
		</cfif>
		
		<!--- put the action passed into the url scope, saving any pre-existing value --->
		<cfif StructKeyExists(request, variables.framework.action)>
			<cfset savedEvent = request[variables.framework.action] />
		</cfif>
		<cfif StructKeyExists(url,variables.framework.action)>
			<cfset savedAction = url[variables.framework.action] />
		</cfif>
		
		<cfset url[variables.framework.action] = arguments.action />
		
		<cfset state=preseveInternalState(request)>	
		
		
		<!--- call the frameworks onRequestStart --->
		<cfset fw1.onRequestStart(CGI.SCRIPT_NAME) />
		
		<cfset request.generateses = false />
		<!--- call the frameworks onRequest --->
		<!--- we save the results via cfsavecontent so we can display it in mura --->
		<cfsavecontent variable="result">
			<cfset fw1.onRequest(CGI.SCRIPT_NAME) />
		</cfsavecontent>
		
		<!--- restore the url scope --->
		<cfif structKeyExists(url,variables.framework.action)>
			<cfset structDelete(url,variables.framework.action) />
		</cfif>
		<!--- if there was a passed in action via the url then restore it --->
		<cfif Len(savedAction)>
			<cfset url[variables.framework.action] = savedAction />
		</cfif>
		<!--- if there was a passed in request event then restore it --->
		<cfif Len(savedEvent)>
			<cfset request[variables.framework.action] = savedEvent />
		</cfif>
	
		<cfset restoreInternalState(request,state)>
		
		<!--- return the result --->
		<cfreturn result>
	</cffunction>
	
</cfcomponent>