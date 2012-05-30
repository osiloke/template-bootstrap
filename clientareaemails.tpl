<div class="page-header">
	<h1>{$LANG.clientareaemails} <small>{$LANG.emailstagline}</small></h1>
</div>

<p>{$numitems} {$LANG.recordsfound}, {$LANG.page} {$pagenumber} {$LANG.pageof} {$totalpages}</p>

<table class="table table-striped table-bordered table-sorted">
	<thead>
		<tr>
			<th{if $orderby eq "date"} class="sort-{$sort}"{/if}><a href="clientarea.php?action=emails&amp;orderby=date">{$LANG.clientareaemailsdate}</a></th>
			<th{if $orderby eq "subject"} class="sort-{$sort}"{/if}><a href="clientarea.php?action=emails&amp;orderby=subject">{$LANG.clientareaemailssubject}</a></th>
		</tr>
	</thead>
	<tbody>
	{foreach from=$emails item=email}
		<tr>
			<td>{$email.date}</td>
			<td><a href="viewemail.php?id={$email.id}" onclick="viewEmail({$email.id});return false;" title="{$LANG.emailviewmessage}">{$email.subject}</a></td>
		</tr>
{foreachelse}
		<tr>
			<td colspan="2" class="textcenter">{$LANG.norecordsfound}</td>
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

<div class="modal hide fade in" id="modalviewemail"></div>

<script type="text/javascript">
{literal}
	function viewEmail(id) {
		$('#modalviewemail').html('<p class="textcenter"><img src="images/loadingsml.gif" alt="{$LANG.pleasewait}"></p>');
		$('#modalviewemail').load('viewemail.php?id='+id);
		$('#modalviewemail').modal();
	}
{/literal}
</script>
