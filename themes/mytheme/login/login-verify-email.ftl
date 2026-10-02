<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        ${msg("verifyEmailHeading")}
    <#elseif section = "subtitle">
        ${msg("verifyEmailSubtitle")}
    <#elseif section = "form">
        <div class="flience-info-copy">
            <#if verifyEmail??>
                <p>${kcSanitize(msg("verifyEmailSentToAddress", verifyEmail))?no_esc}</p>
            <#else>
                <p>${msg("verifyEmailSent")}</p>
            </#if>
        </div>
        <#if isAppInitiatedAction??>
            <form id="kc-verify-email-form" class="flience-login-form" action="${url.loginAction}" method="post">
                <button id="kc-submit" class="flience-submit" type="submit">${msg("sendLinkAgain")}</button>
                <button class="flience-secondary-action" type="submit" name="cancel-aia" value="true" formnovalidate>${msg("cancel")}</button>
            </form>
        </#if>
    <#elseif section = "info">
        <p class="flience-info-copy">${msg("verifyEmailSpamNote")} <a href="${url.loginAction}">${msg("sendLinkAgainLowercase")}</a>.</p>
    </#if>
</@layout.registrationLayout>
