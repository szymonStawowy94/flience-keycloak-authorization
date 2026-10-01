<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <#if messageHeader??>${kcSanitize(msg(messageHeader))?no_esc}<#else>${kcSanitize(message.summary)?no_esc}</#if>
    <#elseif section = "form">
        <div id="kc-info-message" class="flience-info-copy">
            <p>${kcSanitize(message.summary)?no_esc}</p>
            <#if !skipLink??>
                <#if pageRedirectUri?has_content><a class="flience-secondary-action" href="${pageRedirectUri}">${msg("backToApplication")}</a>
                <#elseif actionUri?has_content><a class="flience-secondary-action" href="${actionUri}">${msg("proceedWithAction")}</a>
                <#elseif (client.baseUrl)?has_content><a class="flience-secondary-action" href="${client.baseUrl}">${msg("backToApplication")}</a></#if>
            </#if>
        </div>
    </#if>
</@layout.registrationLayout>
