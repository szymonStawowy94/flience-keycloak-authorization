<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "header">
        Sprawdź swoją skrzynkę
    <#elseif section = "subtitle">
        Potwierdź swój adres e-mail, aby aktywować konto.
    <#elseif section = "form">
        <div class="flience-info-copy">
            <#if verifyEmail??>
                <p>Wysłaliśmy link aktywacyjny na adres <strong>${kcSanitize(verifyEmail)?no_esc}</strong>.</p>
            <#else>
                <p>Wysłaliśmy link aktywacyjny na Twój adres e-mail.</p>
            </#if>
        </div>
        <#if isAppInitiatedAction??>
            <form id="kc-verify-email-form" class="flience-login-form" action="${url.loginAction}" method="post">
                <button id="kc-submit" class="flience-submit" type="submit">Wyślij link ponownie</button>
                <button class="flience-secondary-action" type="submit" name="cancel-aia" value="true" formnovalidate>Anuluj</button>
            </form>
        </#if>
    <#elseif section = "info">
        <p class="flience-info-copy">Nie widzisz wiadomości? Sprawdź folder SPAM. Możesz także <a href="${url.loginAction}">wysłać link ponownie</a>.</p>
    </#if>
</@layout.registrationLayout>
