<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginHeading")}
    <#elseif section = "subtitle">
        ${msg("loginSubtitle")}
    <#elseif section = "form">
        <#if realm.password>
            <form id="kc-form-login" class="flience-login-form" action="${url.loginAction}" method="post">
                <div class="flience-field">
                    <label for="username">${msg("emailAddress")}</label>
                    <input tabindex="1" id="username" class="flience-input" name="username" value="${(login.username!'')}" type="email" placeholder="${msg('emailPlaceholder')}" autocomplete="username" autofocus required aria-invalid="<#if messagesPerField.existsError('username')>true<#else>false</#if>" />
                    <#if messagesPerField.existsError('username')>
                        <span class="flience-field-error" id="input-error-username" role="alert">${kcSanitize(messagesPerField.get('username'))?no_esc}</span>
                    </#if>
                </div>

                <div class="flience-field">
                    <label for="password">${msg("password")}</label>
                    <div class="flience-password-control">
                        <input tabindex="2" id="password" class="flience-input" name="password" type="password" placeholder="${msg('passwordPlaceholder')}" autocomplete="current-password" required aria-invalid="<#if messagesPerField.existsError('password')>true<#else>false</#if>" />
                        <button class="flience-password-toggle" type="button" aria-label="${msg('showPassword')}" aria-controls="password" data-password-toggle>
                            <img
                                data-password-toggle-icon
                                data-visible-src="${url.resourcesPath}/img/icon_ui_eye.svg"
                                data-hidden-src="${url.resourcesPath}/img/icon_ui_invisible.svg"
                                src="${url.resourcesPath}/img/icon_ui_invisible.svg"
                                alt=""
                            />
                        </button>
                    </div>
                    <#if messagesPerField.existsError('password')>
                        <span class="flience-field-error" id="input-error-password" role="alert">${kcSanitize(messagesPerField.get('password'))?no_esc}</span>
                    </#if>
                    <#if realm.resetPasswordAllowed>
                        <a class="flience-forgot-password" tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("forgotPassword")}</a>
                    </#if>
                </div>

                <#if realm.rememberMe && !usernameHidden??>
                    <label class="flience-remember-me" for="rememberMe">
                        <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" <#if login.rememberMe??>checked</#if> />
                        <span>${msg("rememberMe")}</span>
                    </label>
                </#if>

                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if> />
                <button tabindex="4" class="flience-submit" name="login" id="kc-login" type="submit">${msg("loginAction")}</button>
            </form>
        </#if>
    <#elseif section = "socialProviders">
        <#if realm.password && social.providers?? && (social.providers?size > 0)>
            <div class="flience-login-divider" aria-hidden="true"><span>${msg("or")}</span></div>
            <div class="flience-social-providers">
                <#list social.providers as p>
                    <a id="zocial-${p.alias}" class="flience-social-provider flience-social-provider--${p.alias}" href="${p.loginUrl}">
                        <#if p.alias == "google">
                            <img class="flience-social-provider-icon" src="${url.resourcesPath}/img/icon_ui_google.svg" alt="" />
                        <#elseif p.iconClasses?has_content>
                            <i class="${p.iconClasses}" aria-hidden="true"></i>
                        </#if>
                        <span>${kcSanitize(msg("continueWith", p.displayName))?no_esc}</span>
                    </a>
                </#list>
            </div>
        </#if>
    <#elseif section = "info">
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <p class="flience-sign-up">${msg("loginNoAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("loginCreateFree")}</a></p>
        </#if>
    </#if>
</@layout.registrationLayout>
