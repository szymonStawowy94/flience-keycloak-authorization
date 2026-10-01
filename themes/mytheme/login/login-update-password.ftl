<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('password','password-confirm'); section>
    <#if section = "header">
        Ustaw nowe hasło
    <#elseif section = "subtitle">
        Wybierz hasło, którego użyjesz przy kolejnym logowaniu.
    <#elseif section = "form">
        <form id="kc-passwd-update-form" class="flience-login-form" action="${url.loginAction}" method="post" novalidate="novalidate">
            <div class="flience-field">
                <label for="password-new">Nowe hasło</label>
                <div class="flience-password-control">
                    <input id="password-new" class="flience-input" name="password-new" type="password" autocomplete="new-password" autofocus required aria-invalid="<#if messagesPerField.existsError('password')>true<#else>false</#if>" />
                    <button class="flience-password-toggle" type="button" aria-label="Pokaż hasło" aria-controls="password-new" data-password-toggle>
                        <img data-password-toggle-icon data-visible-src="${url.resourcesPath}/img/icon_ui_eye.svg" data-hidden-src="${url.resourcesPath}/img/icon_ui_invisible.svg" src="${url.resourcesPath}/img/icon_ui_invisible.svg" alt="" />
                    </button>
                </div>
                <p class="flience-form-hint">Minimum 8 znaków, litera i cyfra.</p>
                <#if messagesPerField.existsError('password')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('password'))?no_esc}</span></#if>
            </div>
            <div class="flience-field">
                <label for="password-confirm">Powtórz nowe hasło</label>
                <div class="flience-password-control">
                    <input id="password-confirm" class="flience-input" name="password-confirm" type="password" autocomplete="new-password" required aria-invalid="<#if messagesPerField.existsError('password-confirm')>true<#else>false</#if>" />
                    <button class="flience-password-toggle" type="button" aria-label="Pokaż hasło" aria-controls="password-confirm" data-password-toggle>
                        <img data-password-toggle-icon data-visible-src="${url.resourcesPath}/img/icon_ui_eye.svg" data-hidden-src="${url.resourcesPath}/img/icon_ui_invisible.svg" src="${url.resourcesPath}/img/icon_ui_invisible.svg" alt="" />
                    </button>
                </div>
                <#if messagesPerField.existsError('password-confirm')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</span></#if>
            </div>
            <label class="flience-remember-me" for="logout-sessions">
                <input id="logout-sessions" name="logout-sessions" type="checkbox" value="on" checked />
                <span>Wyloguj mnie z pozostałych urządzeń</span>
            </label>
            <button id="kc-submit" class="flience-submit" name="login" type="submit">Zapisz hasło</button>
        </form>
    </#if>
</@layout.registrationLayout>
