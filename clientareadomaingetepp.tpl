<div class="page-header">
	<h1>{$LANG.managing} {$domain}</h1>
</div>

<div class="row">
	<div class="span4">
		<h2>{$LANG.domaingeteppcode}</h2>
		<p>{$LANG.domaingeteppcodeexplanation}</p>
	</div>
	<div class="span8">
{if $error}
		<div class="alert alert-error alert-block">
			<h3 class="alert-heading">{$LANG.domaingeteppcodefailure}</h3>
			{$error}
		</div>
{elseif $eppcode}
		<div class="alert alert-warning alert-block">
			<h3 class="alert-heading">{$LANG.domaingeteppcodeis}</h3>
			{$eppcode}
		</div>
{else}
		<div class="alert alert-warning alert-block">
			{$LANG.domaingeteppcodeemailconfirmation}
		</div>
{/if}
	</div>
</div>

<div class="textcenter marginbottom">
	<a href="clientarea.php?action=domaindetails&id={$domainid}" class="btn" title="{$LANG.clientareabacklink}">{$LANG.clientareabacklink}</a>
</div>
