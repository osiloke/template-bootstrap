<div class="page-header">
	<h1>{$LANG.navopenticket}</h1>
</div>

<p>{$LANG.supportticketsheader}</p>

<div class="row">
	<div class="span10 offset1">
		<ul class="thumbnails">
		{foreach from=$departments item=department}
			<li class="span5">
				<h3><img src="images/emails.gif" alt="email icon"> <a href="{$smarty.server.PHP_SELF}?step=2&amp;deptid={$department.id}" title="{$department.name}">{$department.name}</a></h3>
				{if $department.description}<p>{$department.description}</p>{/if}
			</li>
		{/foreach}
		</ul>
	</div>
</div>
