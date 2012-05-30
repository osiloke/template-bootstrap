{if $update eq "nameservers"}
	{include file="bulkdomainmanagementnameservers.tpl"}
{elseif $update eq "autorenew"}
	{include file="bulkdomainmanagementautorenew.tpl"}
{elseif $update eq "reglock"}
	{include file="bulkdomainmanagementreglock.tpl"}
{elseif $update eq "contactinfo"}
	{include file="bulkdomainmanagementcontactinfo.tpl"}
{/if}
