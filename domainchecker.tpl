<div class="page-header">
	<h1>{$LANG.domaintitle} <small>{$LANG.domaincheckerintro}</small></h1>
</div>

{if $inccode}
<div class="alert alert-error fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.captchaverifyincorrect}
</div>
{/if}

{if $bulkdomainsearchenabled}
<div class="tabbable">
	<ul class="nav nav-tabs">
		<li class="active"><a href="domainchecker.php">{$LANG.domainsimplesearch}</a></li>
		<li><a href="domainchecker.php?search=bulkregister">{$LANG.domainbulksearch}</a></li>
		<li><a href="domainchecker.php?search=bulktransfer">{$LANG.domainbulktransfersearch}</a></li>
	</ul>
</div>
{/if}

<div class="well textcenter">
	<form method="post" action="domainchecker.php">
		<p>{$LANG.domaincheckerenterdomain}</p>
		<div class="input-append textcenter">
			<input class="span8 input-large" name="domain" type="text" value="{if $domain}{$domain}{/if}" placeholder="{$LANG.domaincheckerdomainexample}"><button class="btn btn-large" type="button" onclick="jQuery('#mtlds').slideToggle();">{$LANG.searchmultipletlds}</button>
		</div>
		<div id="mtlds" class="hide">
		{foreach from=$tldslist key=num item=listtld}
			<label class="checkbox inline"><input type="checkbox" name="tlds[]" value="{$listtld}"{if in_array($listtld,$tlds) || !$tlds && $num==1} checked="checked"{/if}> {$listtld}</label>
		{/foreach}
			<hr>
		</div>
	{if $capatacha}
			<p>{$LANG.captchaverify}</p>
		{if $capatacha eq "recaptcha"}
			<p>{$recapatchahtml}</p>
		{else}
			<img src="includes/verifyimage.php" alt="captcha"> <input type="text" name="code" class="span1" style="margin-bottom:0" maxlength="5">
		{/if}
		<hr>
	{/if}
		<div>
			<input type="submit" value="{$LANG.checkavailability}" class="btn btn-primary btn-large" onclick="$('#modalpleasewait').modal();">
			<input type="submit" name="transfer" value="{$LANG.domainstransfer}" class="btn btn-success btn-large" onclick="$('#modalpleasewait').modal();">
			<input type="submit" name="hosting" value="{$LANG.domaincheckerhostingonly}" class="btn btn-large">
		</div>
	</form>
</div>

{if $lookup}
<div class="row">
	<div class="span10 offset1">
	{if $available}
		<div class="alert alert-success textcenter">{$LANG.domainavailable1} {$sld}{$ext} {$LANG.domainavailable2}</div>
	{elseif $invalidtld}
		<div class="alert alert-error textcenter">
			<h4>{$invalidtld|strtoupper} {$LANG.domaincheckerinvalidtld}</h4>
		</div>
	{elseif $invalid}
		<div class="alert alert-error textcenter">
			<h4>{$LANG.ordererrordomaininvalid}</h4>
		</div>
	{elseif $error}
		<div class="alert alert-error textcenter">
			<h4>{$LANG.domainerror}</h4>
		</div>
	{else}
		<div class="alert alert-error textcenter">
			<h4>{$LANG.domainunavailable1} {$sld}{$ext} {$LANG.domainunavailable2}</h4>
		</div>
	{/if}

	{if !$invalid}
		<form method="post" action="{$systemsslurl}cart.php?a=add&domain=register" class="form-horizontal">
			<table class="table table-striped table-bordered">
				<tbody>
				{foreach from=$availabilityresults key=num item=result}
					<tr>
						<td class="textcenter">
						{if $result.status eq "available"}
							<input type="checkbox" name="domains[]" value="{$result.domain}"{if $num eq "0" && $available} checked="checked"{/if}>
							<input type="hidden" name="domainsregperiod[{$result.domain}]" value="{$result.period}">
						{else}
							&times;
						{/if}
						</td>
						<td class="textcenter">{$result.domain}</td>
						<td class="textcenter">
						{if $result.status eq "available"}
							<span class="badge badge-success">{$LANG.domainavailable}</span>
						{else}
							<span class="badge badge-important">{$LANG.domainunavailable}</span>
						{/if}
						</td>
						<td class="textcenter">
						{if $result.status eq "unavailable"}
							<a href="http://{$result.domain}" target="_blank">www</a> 
							 | 
							<a href="#" onclick="showWhois('{$result.domain}');return false;">whois</a>
						{else}
							<select name="domainsregperiod[{$result.domain}]">
							{foreach key=period item=regoption from=$result.regoptions}
								<option value="{$period}">{$period} {$LANG.orderyears} @ {$regoption.register}</option>
							{/foreach}
							</select>
						{/if}
						</td>
					</tr>
				{/foreach}
				</tbody>
				<tfoot>
					<tr>
						<td colspan="4" class="textright">
							<input type="submit" value="{$LANG.ordernowbutton}" class="btn btn-large btn-danger">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	{/if}
	</div>
</div>

{else}

<div class="page-header">
	<h2>{$LANG.domainspricing}</h2>
</div>

<div class="row">
	<div class="span10 offset1">
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th class="textcenter">{$LANG.domaintld}</th>
					<th class="textcenter">{$LANG.domainminyears}</th>
					<th class="textcenter">{$LANG.domainsregister}</th>
					<th class="textcenter">{$LANG.domainstransfer}</th>
					<th class="textcenter">{$LANG.domainsrenew}</th>
				</tr>
			</thead>
			<tbody>
			{foreach from=$tldpricelist item=tldpricelist}
				<tr>
					<td class="textcenter">{$tldpricelist.tld}</td>
					<td class="textcenter">{$tldpricelist.period}</td>
					<td class="textcenter">{if $tldpricelist.register}{$tldpricelist.register}{else}{$LANG.domainregnotavailable}{/if}</td>
					<td class="textcenter">{if $tldpricelist.transfer}{$tldpricelist.transfer}{else}{$LANG.domainregnotavailable}{/if}</td>
					<td class="textcenter">{if $tldpricelist.renew}{$tldpricelist.renew}{else}{$LANG.domainregnotavailable}{/if}</td>
				</tr>
			{/foreach}
			</tbody>
		</table>

	{if !$loggedin && $currencies}
		<form method="post" action="domainchecker.php" class="textright">
			{$LANG.choosecurrency}: <select name="currency" onchange="submit()">
			{foreach from=$currencies item=curr}
				<option value="{$curr.id}"{if $curr.id eq $currency.id} selected="selected"{/if}>{$curr.code}</option>
			{/foreach}
			</select>
		</form>
	{/if}
	</div>
</div>

{/if}

<div class="modal hide fade in" id="modalpleasewait">
   <div class="modal-header textcenter">
      <h3><img src="images/loadingsml.gif" alt="{$LANG.pleasewait}" class="valignbaseline"> {$LANG.pleasewait}</h3>
   </div>
</div>

<div class="modal hide fade in" id="modalwhois">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">&times;</button>
		<h3>{$LANG.whoisresults} <span><img src="images/loadingsml.gif" alt="{$LANG.pleasewait}" class="valignbaseline"></span></h3>
	</div>
	<div class="modal-body"></div>
	<div class="modal-footer">
		<button class="close" data-dismiss="modal">Close</button>
	</div>
</div>

<script type="text/javascript">
{literal}
	function showWhois(domain) {
		$('#modalwhois .modal-body').html('<div class="textcenter"><img src="images/loadingsml.gif" alt="{$LANG.pleasewait}"></div>');
		$('#modalwhois .modal-header h3 span').html(domain);
		$('#modalwhois .modal-body').load('whois.php?domain='+domain);
		$('#modalwhois').modal();
	}
{/literal}
</script>
