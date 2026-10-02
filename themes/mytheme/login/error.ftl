<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">${msg("errorHeading")}
    <#elseif section = "form">
        <div id="kc-error-message" class="flience-info-copy">
            <p>${kcSanitize(message.summary)?no_esc}</p>
            <#if traceId??><p id="traceId">${msg("traceIdSupportMessage", traceId)}</p></#if>
            <#if !skipLink?? && client?? && client.baseUrl?has_content><a id="backToApplication" class="flience-secondary-action" href="${client.baseUrl}">${msg("backToApplication")}</a></#if>
        </div>
    </#if>
</@layout.registrationLayout>
