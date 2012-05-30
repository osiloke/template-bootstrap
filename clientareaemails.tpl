<div class="page-header">
	<h1>{$LANG.clientareaemails} <small>{$LANG.emailstagline}</small></h1>
</div>

<p>{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</p>

<table class="table table-striped table-bordered table-sorted">
	<thead>
		<tr>
			<th{if $orderby eq "date"} class="sort-{$sort}"{/if}><a href="clientarea.php?action=emails&orderby=date">{$LANG.clientareaemailsdate}</a></th>
			<th{if $orderby eq "subject"} class="sort-{$sort}"{/if}><a href="clientarea.php?action=emails&orderby=subject">{$LANG.clientareaemailssubject}</a></th>
		</tr>
	</thead>
	<tbody>
	{foreach from=$emails item=email}
		<tr>
			<td>{$email.date}</td>
			<td><a href="viewemail.php?id={$email.id}" title="{$LANG.emailviewmessage}">{$email.subject}</a></td>
		</tr>
{foreachelse}
		<tr>
			<td colspan="3" class="textcenter">{$LANG.norecordsfound}</td>
		</tr>
{/foreach}
	</tbody>
</table>

<div class="pagination">
	<ul>
		<li{if !$prevpage} class="disabled"{/if}><a href="{if $prevpage}clientarea.php?action={$clientareaaction}&amp;page={$prevpage}{else}javascript:return false;{/if}">&larr; {$LANG.previouspage}</a></li>
		<li{if !$nextpage} class="disabled"{/if}><a href="{if $nextpage}clientarea.php?action={$clientareaaction}&amp;page={$nextpage}{else}javascript:return false;{/if}">{$LANG.nextpage} &rarr;</a></li>
	</ul>
</div>
