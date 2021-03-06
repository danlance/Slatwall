<cfoutput>
	<div class="svoadminproductlist">
		<form method="post">
			<input name="Keyword" value="#rc.Keyword#" /><button type="submit">Search</button>
		</form>
		<div style="float:right;"><a href="#buildURL(action='admin:product.edit')#">Create Product</a></div>
		<table class="listtable">
			<tr>
				<th>Search Score</th>
				<th>Brand Name</th>
				<th>Year</th>
				<th>Product Name</th>
				<th>Product Code</th>
				<th>Administration</th>
			</tr>
			
			<cfloop array="#rc.ProductSmartList.getEntityArray()#" index="Local.Product">
				<tr>
					<td>#Local.Product.getSearchScore()#</td>
					<td>
						<a href="#buildURL(action='admin:brand.detail', queryString='brandID=#Local.Product.getBrand().getBrandID()#')#">
						#Local.Product.getBrand().getBrandName()#
						</a>
					</td>
					<td>#Local.Product.getProductYear()#</td>
					<td><a href="#buildURL(action='admin:product.detail', queryString='productID=#Local.Product.getProductID()#')#">#Local.Product.getProductName()#</a></td>
					<td><a href="#buildURL(action='admin:product.detail', queryString='productID=#Local.Product.getProductID()#')#">#Local.Product.getProductCode()#</a></td>
					<td><a href="#buildURL(action='admin:product.edit', queryString='productID=#Local.Product.getProductID()#')#">Edit</a></td>
				</tr>
			</cfloop>
		</table>
		
		<strong>Entitie Start:</strong> #rc.ProductSmartList.getEntityStart()#<br />
		<strong>Entitie End:</strong> #rc.ProductSmartList.getEntityEnd()#<br />
		<strong>Entities Per Page:</strong> #rc.ProductSmartList.getEntityShow()#<br />
		<strong>Total Entities:</strong> #rc.ProductSmartList.getTotalEntities()#<br />
		<strong>Current Page:</strong> #rc.ProductSmartList.getCurrentPage()#<br />
		<strong>Total Pages:</strong> #rc.ProductSmartList.getTotalPages()#<br />
		<strong>List Fill Time:</strong> #rc.ProductSmartList.getFillTime()# ms <br />
		<cfif arrayLen(rc.ProductSmartList.getKeywords())>
			<strong>List Search Time:</strong> #rc.ProductSmartList.getSearchTime()# ms<br />
		</cfif>
	</div>
</cfoutput>
