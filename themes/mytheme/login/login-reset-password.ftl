<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        Nie pamiętasz hasła?
    <#elseif section = "subtitle">
        Podaj adres e-mail, a wyślemy Ci link do ustawienia nowego hasła.
    <#elseif section = "form">
        <form id="kc-reset-password-form" class="flience-login-form" action="${url.loginAction}" method="post">
            <div class="flience-field">
                <label for="username">Adres e-mail</label>
                <input id="username" class="flience-input" name="username" value="${(auth.attemptedUsername!'')}" type="email" autocomplete="username" autofocus required aria-invalid="<#if messagesPerField.existsError('username')>true<#else>false</#if>" />
                <#if messagesPerField.existsError('username')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('username'))?no_esc}</span></#if>
            </div>
            <button id="kc-form-buttons" class="flience-submit" type="submit">Wyślij link</button>
            <p class="flience-sign-up"><a href="${url.loginUrl}">Wróć do logowania</a></p>
        </form>
    <#elseif section = "info">
        <p class="flience-info-copy">Ze względów bezpieczeństwa pokażemy ten sam komunikat niezależnie od tego, czy adres jest zapisany w systemie.</p>
    </#if>
</@layout.registrationLayout>
