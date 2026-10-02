<#import "footer.ftl" as loginFooter>
<#import "theme-resources.ftl" as themeResourceTags>
<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
<!DOCTYPE html>
<html class="${properties.kcHtmlClass!}" lang="${lang}"<#if realm.internationalizationEnabled> dir="${(locale.rtl)?then('rtl','ltr')}"</#if>>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${title!}</title>
    <#if themeResources?? && themeResources.favicons?has_content>
        <@themeResourceTags.renderFavicons themeResources.favicons url.resourcesPath />
    </#if>
    <#if themeResources?? && themeResources.stylesCommon?has_content>
        <@themeResourceTags.renderStyles themeResources.stylesCommon url.resourcesCommonPath />
    <#elseif properties.stylesCommon?has_content>
        <#list properties.stylesCommon?split(' ') as style>
            <link href="${url.resourcesCommonPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if themeResources?? && themeResources.styles?has_content>
        <@themeResourceTags.renderStyles themeResources.styles url.resourcesPath />
    <#elseif properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if themeResources?? && themeResources.scripts?has_content>
        <@themeResourceTags.renderScripts themeResources.scripts url.resourcesPath "text/javascript" />
    <#elseif properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>
<body class="flience-auth-page ${properties.kcBodyClass!} ${bodyClass}" data-page-id="login-${pageId}" data-show-password-label="${msg('showPassword')}" data-hide-password-label="${msg('hidePassword')}" data-validation-required="${msg('validationRequired')}" data-validation-email="${msg('validationEmail')}" data-validation-too-short="${msg('validationTooShort')}" data-validation-generic="${msg('validationGeneric')}" data-validation-password-mismatch="${msg('validationPasswordMismatch')}" data-validation-nip="${msg('validationNip')}" data-validation-regon="${msg('validationRegon')}">
    <div class="flience-auth-shell">
        <aside class="flience-auth-sky" aria-hidden="true">
            <img class="flience-auth-logo" src="${url.resourcesPath}/img/branding_logo-flience.svg" alt="" />
            <img class="flience-auth-cloud flience-auth-cloud--top" src="${url.resourcesPath}/img/cloud.svg" alt="" />
            <img class="flience-auth-cloud flience-auth-cloud--middle" src="${url.resourcesPath}/img/cloud.svg" alt="" />
            <div
                class="flience-auth-kiwi"
                data-kiwi-animation
                data-lottie-animation="${url.resourcesPath}/lottie/kiwi.json"
                aria-hidden="true"
            ></div>
            <img class="flience-auth-cloud flience-auth-cloud--bottom" src="${url.resourcesPath}/img/cloud.svg" alt="" />
            <div class="flience-auth-sky-copy">
                <p class="flience-auth-sky-title">${msg("authSkyTitle")}</p>
                <p class="flience-auth-sky-description">${msg("authSkyDescription")}</p>
            </div>
        </aside>
        <main class="flience-auth-content">
            <div class="${properties.kcLoginClass!}">
                <div id="kc-header" class="${properties.kcHeaderClass!} flience-auth-intro">
                    <div id="kc-header-wrapper" class="${properties.kcHeaderWrapperClass!}">${kcSanitize(msg("loginTitleHtml",(realm.displayNameHtml!'')))?no_esc}</div>
                    <#if realm.internationalizationEnabled && locale.supported?size gt 1>
                        <details class="${properties.kcLocaleMainClass!} flience-locale-selector" id="kc-locale">
                            <summary id="kc-current-locale-link" aria-label="${msg('languageSelector')}">
                                <span class="flience-locale-selector-value">${lang?upper_case}</span>
                                <img class="flience-locale-selector-chevron" src="${url.resourcesPath}/img/icon_ui_arrow_down.svg" alt="" />
                            </summary>
                            <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                                <div id="kc-locale-dropdown" class="${properties.kcLocaleDropDownClass!} flience-locale-selector-options">
                                    <#list locale.supported as l>
                                        <#assign localeCode = l.url?keep_after("kc_locale=")?keep_before("&")?upper_case>
                                        <a href="${l.url}" title="${l.label}"<#if l.label == locale.current> aria-current="true"</#if>>${localeCode}</a>
                                    </#list>
                                </div>
                            </div>
                        </details>
                    </#if>
                    <h1 id="kc-page-title"><#nested "header"></h1>
                    <div class="flience-auth-subtitle"><#nested "subtitle"></div>
                    <div class="flience-auth-context"><#nested "context"></div>
                </div>
                <div class="${properties.kcFormCardClass!}">
                    <div id="kc-content"><div id="kc-content-wrapper">
                        <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                            <div class="alert-${message.type} ${properties.kcAlertClass!}" role="alert">
                                <span class="${properties.kcAlertTitleClass!}">${kcSanitize(message.summary)?no_esc}</span>
                            </div>
                        </#if>
                        <#nested "form">
                        <#nested "socialProviders">
                        <#if displayInfo><div id="kc-info" class="${properties.kcSignUpClass!}"><#nested "info"></div></#if>
                    </div></div>
                    <@loginFooter.content/>
                </div>
            </div>
        </main>
    </div>
</body>
</html>
</#macro>
