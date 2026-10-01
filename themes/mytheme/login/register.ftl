<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','username','email','password','password-confirm'); section>
    <#if section = "header">
        Utwórz konto
    <#elseif section = "subtitle">
        Zacznij korzystać z materiałów Flience za darmo.
    <#elseif section = "form">
        <form id="kc-register-form" class="flience-login-form flience-register-form" action="${url.registrationAction}" method="post" novalidate="novalidate">
            <div class="flience-form-row">
                <div class="flience-field">
                    <label for="firstName">Imię</label>
                    <input id="firstName" class="flience-input" name="firstName" value="${(register.formData.firstName!'')}" type="text" autocomplete="given-name" required autofocus aria-invalid="<#if messagesPerField.existsError('firstName')>true<#else>false</#if>" />
                    <#if messagesPerField.existsError('firstName')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('firstName'))?no_esc}</span></#if>
                </div>
                <div class="flience-field">
                    <label for="lastName">Nazwisko</label>
                    <input id="lastName" class="flience-input" name="lastName" value="${(register.formData.lastName!'')}" type="text" autocomplete="family-name" required aria-invalid="<#if messagesPerField.existsError('lastName')>true<#else>false</#if>" />
                    <#if messagesPerField.existsError('lastName')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('lastName'))?no_esc}</span></#if>
                </div>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="flience-field">
                    <label for="username">Nazwa użytkownika</label>
                    <input id="username" class="flience-input" name="username" value="${(register.formData.username!'')}" type="text" autocomplete="username" required aria-invalid="<#if messagesPerField.existsError('username')>true<#else>false</#if>" />
                    <#if messagesPerField.existsError('username')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('username'))?no_esc}</span></#if>
                </div>
            </#if>

            <div class="flience-field">
                <label for="email">Adres e-mail</label>
                <input id="email" class="flience-input" name="email" value="${(register.formData.email!'')}" type="email" autocomplete="email" required aria-invalid="<#if messagesPerField.existsError('email')>true<#else>false</#if>" />
                <#if messagesPerField.existsError('email')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('email'))?no_esc}</span></#if>
            </div>

            <#if passwordRequired??>
                <div class="flience-field">
                    <label for="password">Hasło</label>
                    <div class="flience-password-control">
                        <input id="password" class="flience-input" name="password" type="password" autocomplete="new-password" required aria-invalid="<#if messagesPerField.existsError('password')>true<#else>false</#if>" />
                        <button class="flience-password-toggle" type="button" aria-label="Pokaż hasło" aria-controls="password" data-password-toggle>
                            <img data-password-toggle-icon data-visible-src="${url.resourcesPath}/img/icon_ui_eye.svg" data-hidden-src="${url.resourcesPath}/img/icon_ui_invisible.svg" src="${url.resourcesPath}/img/icon_ui_invisible.svg" alt="" />
                        </button>
                    </div>
                    <p class="flience-form-hint">Minimum 8 znaków, litera i cyfra.</p>
                    <#if messagesPerField.existsError('password')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('password'))?no_esc}</span></#if>
                </div>
                <div class="flience-field">
                    <label for="password-confirm">Powtórz hasło</label>
                    <div class="flience-password-control">
                        <input id="password-confirm" class="flience-input" name="password-confirm" type="password" autocomplete="new-password" required aria-invalid="<#if messagesPerField.existsError('password-confirm')>true<#else>false</#if>" />
                        <button class="flience-password-toggle" type="button" aria-label="Pokaż hasło" aria-controls="password-confirm" data-password-toggle>
                            <img data-password-toggle-icon data-visible-src="${url.resourcesPath}/img/icon_ui_eye.svg" data-hidden-src="${url.resourcesPath}/img/icon_ui_invisible.svg" src="${url.resourcesPath}/img/icon_ui_invisible.svg" alt="" />
                        </button>
                    </div>
                    <#if messagesPerField.existsError('password-confirm')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</span></#if>
                </div>
            </#if>

            <button class="flience-submit" name="register" id="kc-register" type="submit">Utwórz konto</button>
            <p class="flience-sign-up">Masz już konto? <a href="${url.loginUrl}">Zaloguj się</a></p>
        </form>
    <#elseif section = "socialProviders">
        <#if social?? && social.providers?? && (social.providers?size > 0)>
            <div class="flience-login-divider" aria-hidden="true"><span>lub</span></div>
            <div class="flience-social-providers">
                <#list social.providers as p>
                    <a id="zocial-${p.alias}" class="flience-social-provider flience-social-provider--${p.alias}" href="${p.loginUrl}">
                        <#if p.iconClasses?has_content><i class="${p.iconClasses}" aria-hidden="true"></i></#if>
                        <span>Kontynuuj z ${kcSanitize(p.displayName)?no_esc}</span>
                    </a>
                </#list>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
