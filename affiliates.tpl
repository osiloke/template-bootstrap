{if $inactive}
<div class="page-header">
	<h1>{$LANG.affiliatestitle}</h1>
</div>

<div class="alert alert-warning">
	{$LANG.affiliatesdisabled}
</div>
{else}

<div class="page-header">
	<h1>{$LANG.affiliatestitle} <small>{$LANG.affiliatesrealtime}</small></h1>
</div>

<div class="row">
	<div class="span10 offset1">
		<div class="textcenter">
			<h3>{$LANG.affiliatesreferallink}</h3>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th class="lead textcenter">{$referrallink}</th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
</div>

<div class="row textcenter">
	<div class="span10 offset1">
		<div class="row-fluid">
			<div class="span4">
				<div class="well">
					<h3>{$LANG.affiliatesvisitorsreferred}</h3>
					<span class="lead">{$visitors}</span>
				</div>
			</div>
			<div class="span4">
				<div class="well">
					<h3>{$LANG.affiliatessignups}</h3>
					<span class="lead">{$signups}</span>
				</div>
			</div>
			<div class="span4">
				<div class="well">
					<h3>{$LANG.affiliatesconversionrate}</h3>
				 	<span class="lead">{$conversionrate}%</span>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="row">
	<div class="span6 offset3">
		<table class="table table-striped table-bordered">
			<tbody>
				<tr>
					<td>{$LANG.affiliatescommissionspending}</td>
					<td class="textcenter"><strong>{$pendingcommissions}</strong></td>
				</tr>
				<tr>
					<td>{$LANG.affiliatescommissionsavailable}</td>
					<td class="textcenter"><strong>{$balance}</strong></td>
				</tr>
				<tr>
					<td>{$LANG.affiliateswithdrawn}:</td>
					<td class="textcenter"><strong>{$withdrawn}</strong></td>
				</tr>
			</tbody>
		</table>
	</div>
</div>

{if $withdrawrequestsent}
<div class="alert alert-success fade in">
	<button class="close" data-dismiss="alert">&times;</button>
	{$LANG.affiliateswithdrawalrequestsuccessful}
</div>
{elseif $withdrawlevel}
<div class="textcenter">
	<a href="{$smarty.server.PHP_SELF}?action=withdrawrequest" class="btn btn-large btn-primary" title="{$LANG.affiliatesrequestwithdrawal}">{$LANG.affiliatesrequestwithdrawal}</a>
</div>
{/if}

<div class="page-header">
	<h2>{$LANG.affiliatesreferals}</h2>
</div>

<p>{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</p>

<table class="table table-striped table-bordered table-sorted">
	<thead>
		<tr>
			<th{if $orderby eq "date"} class="sort-{$sort}"{/if}><a href="affiliates.php?orderby=date">{$LANG.affiliatessignupdate}</a></th>
			<th{if $orderby eq "product"} class="sort-{$sort}"{/if}><a href="affiliates.php?orderby=product">{$LANG.orderproduct}</a></th>
			<th{if $orderby eq "amount"} class="sort-{$sort}"{/if}><a href="affiliates.php?orderby=amount">{$LANG.affiliatesamount}</a></th>
			<th>{$LANG.affiliatescommission}</th>
			<th{if $orderby eq "status"} class="sort-{$sort}"{/if}><a href="affiliates.php?orderby=status">{$LANG.affiliatesstatus}</a></th>
		</tr>
	</thead>
	<tbody>
	{foreach key=num item=referral from=$referrals}
		<tr>
			<td>{$referral.date}</td>
			<td>{$referral.service}</td>
			<td>{$referral.amountdesc}</td>
			<td>{$referral.commission}</td>
			<td>{$referral.status}</td>
		</tr>
	{foreachelse}
		<tr>
			<td colspan="6" class="textcenter">{$LANG.norecordsfound}</td>
		</tr>
	{/foreach}
	</tbody>
</table>

<div class="pagination">
	<ul>
		<li{if !$prevpage} class="disabled"{/if}><a href="{if $prevpage}affiliates.php?page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
		<li{if !$nextpage} class="disabled"{/if}><a href="{if $nextpage}affiliates.php?page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
	</ul>
</div>

{if $affiliatelinkscode}
<div class="page-header">
	<h2>{$LANG.affiliateslinktous}</h2>
</div>

<div class="textcenter">
	{$affiliatelinkscode}
</div>
{/if}


{/if}
