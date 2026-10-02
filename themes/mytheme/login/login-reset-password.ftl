<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("resetPasswordHeading")}
    <#elseif section = "subtitle">
        ${msg("resetPasswordSubtitle")}
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="flience-login-form" action="${url.loginAction}" method="post">
            <div class="flience-field">
                <label for="username">${msg("emailAddress")}</label>
                <input id="username" class="flience-input" name="username" value="${(auth.attemptedUsername!'')}" type="email" autocomplete="username" autofocus required aria-invalid="<#if messagesPerField.existsError('username')>true<#else>false</#if>" />
                <#if messagesPerField.existsError('username')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('username'))?no_esc}</span></#if>
            </div>
            <button id="kc-form-buttons" class="flience-submit" type="submit">${msg("sendLink")}</button>
            <p class="flience-sign-up"><a href="${url.loginUrl}">${msg("backToLogin")}</a></p>
        </form>
    <#elseif section = "info">
        <p class="flience-info-copy">${msg("resetPasswordSecurityNote")}</p>
    </#if>
</@layout.registrationLayout>
