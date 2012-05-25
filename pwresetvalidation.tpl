<div class="row">
	<div class="span6 offset3">
		<div class="page-header">
			<h1>{$LANG.pwreset}</h1>
		</div>
		{if $errormessage}
		<div class="alert alert-error">
			{$errormessage}
		</div>
	{else}
		<div class="alert alert-success">
			{$LANG.pwresetvalidationsuccess}
		</div>
		<p>{$LANG.pwresetvalidationsuccessdesc}
	{/if}
	</div>
</div>
