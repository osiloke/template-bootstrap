		</div>
		<div id="whmcsfooterdivider" class="container">
			<div class="navbar-inner"></div>
		</div>
		<div id="whmcsfooter" class="container">
			<div class="pull-right">Copyright &copy; {$smarty.now|date_format:"%Y"} {$companyname}. All Rights Reserved.</div>
			{if $langchange}<div id="languagechooser">{$setlanguage}</div>{/if}
		</div>
		{$footeroutput}
	</body>
</html>
