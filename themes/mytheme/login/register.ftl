<#import "template.ftl" as layout>
<@layout.registrationLayout bodyClass="flience-registration-page" displayMessage=!messagesPerField.existsError('firstName','lastName','username','email','password','password-confirm'); section>
    <#if section = "header">
        <span data-registration-title>${msg("registerHeading")}</span>
    <#elseif section = "subtitle">
        <span data-registration-subtitle>${msg("registerSubtitle")}</span>
    <#elseif section = "context">
        <p class="flience-registration-context"><span data-registration-context>${msg("registrationPersonalContext")}</span> <a href="#" data-registration-switch>${msg("change")}</a></p>
    <#elseif section = "form">
        <form id="kc-register-form" class="flience-register-form" action="${url.registrationAction}" method="post" novalidate="novalidate" data-registration-variant="personal" data-registration-personal-context="${msg('registrationPersonalContext')}" data-registration-organization-context="${msg('registrationOrganizationContext')}" data-registration-personal-submit="${msg('createAccount')}" data-registration-organization-submit="${msg('createOrganization')}">
            <section class="flience-registration-section flience-organization-section" data-registration-organization hidden>
                <h2>${msg("organizationDetails")}</h2>
                <div class="flience-field">
                    <label for="organization-name">${msg("organizationName")}</label>
                    <input id="organization-name" class="flience-input" name="organizationName" type="text" placeholder="${msg('organizationNamePlaceholder')}" autocomplete="organization" disabled />
                </div>
                <div class="flience-field flience-field--select">
                    <label id="organization-type-label" for="organization-type">${msg("organizationType")}</label>
                    <div class="flience-select" data-select>
                        <select id="organization-type" class="flience-select-native" name="organizationType" disabled data-select-native>
                        <option value="">${msg("organizationTypePlaceholder")}</option>
                        <option value="Przedszkole">${msg("organizationTypeKindergarten")}</option>
                        <option value="Szkoła podstawowa">${msg("organizationTypePrimarySchool")}</option>
                        <option value="Szkoła ponadpodstawowa">${msg("organizationTypeSecondarySchool")}</option>
                        <option value="Inna organizacja">${msg("organizationTypeOther")}</option>
                        </select>
                        <button class="flience-select-trigger" type="button" aria-labelledby="organization-type-label" aria-controls="organization-type-options" aria-expanded="false" aria-haspopup="listbox" disabled data-select-trigger>
                            <span class="flience-select-value" data-select-value>${msg("organizationTypePlaceholder")}</span>
                            <span class="flience-select-chevron" aria-hidden="true"></span>
                        </button>
                        <div id="organization-type-options" class="flience-select-options" role="listbox" aria-labelledby="organization-type-label" hidden data-select-options>
                            <button class="flience-select-option" type="button" role="option" aria-selected="true" data-select-option data-value="">${msg("organizationTypePlaceholder")}</button>
                            <button class="flience-select-option" type="button" role="option" aria-selected="false" data-select-option data-value="Przedszkole">${msg("organizationTypeKindergarten")}</button>
                            <button class="flience-select-option" type="button" role="option" aria-selected="false" data-select-option data-value="Szkoła podstawowa">${msg("organizationTypePrimarySchool")}</button>
                            <button class="flience-select-option" type="button" role="option" aria-selected="false" data-select-option data-value="Szkoła ponadpodstawowa">${msg("organizationTypeSecondarySchool")}</button>
                            <button class="flience-select-option" type="button" role="option" aria-selected="false" data-select-option data-value="Inna organizacja">${msg("organizationTypeOther")}</button>
                        </div>
                    </div>
                </div>
                <div class="flience-form-row flience-form-row--organization-identifiers">
                    <div class="flience-field">
                        <label for="organization-tax-id">NIP <span>${msg("optional")}</span></label>
                        <input id="organization-tax-id" class="flience-input" name="organizationTaxId" type="text" inputmode="numeric" placeholder="000-000-00-00" disabled />
                    </div>
                    <div class="flience-field">
                        <label for="organization-regon">${msg("regon")}</label>
                        <input id="organization-regon" class="flience-input" name="organizationRegon" type="text" inputmode="numeric" placeholder="${msg('regonPlaceholder')}" disabled />
                    </div>
                </div>
                <p class="flience-organization-hint">${msg("organizationAdministratorHint")}</p>
            </section>

            <section class="flience-registration-section flience-person-section">
                <h2>${msg("personalDetails")}</h2>
                <div class="flience-form-row">
                    <div class="flience-field">
                        <label for="firstName">${msg("firstName")}</label>
                        <input id="firstName" class="flience-input" name="firstName" value="${(register.formData.firstName!'')}" type="text" placeholder="${msg('firstNamePlaceholder')}" autocomplete="given-name" required autofocus aria-invalid="<#if messagesPerField.existsError('firstName')>true<#else>false</#if>" />
                        <#if messagesPerField.existsError('firstName')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('firstName'))?no_esc}</span></#if>
                    </div>
                    <div class="flience-field">
                        <label for="lastName">${msg("lastName")}</label>
                        <input id="lastName" class="flience-input" name="lastName" value="${(register.formData.lastName!'')}" type="text" placeholder="${msg('lastNamePlaceholder')}" autocomplete="family-name" required aria-invalid="<#if messagesPerField.existsError('lastName')>true<#else>false</#if>" />
                        <#if messagesPerField.existsError('lastName')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('lastName'))?no_esc}</span></#if>
                    </div>
                </div>
                <#if !realm.registrationEmailAsUsername>
                    <input id="username" name="username" value="${(register.formData.username!'')}" type="hidden" data-registration-username />
                </#if>
                <div class="flience-field">
                    <label for="email">${msg("emailAddress")}</label>
                    <input id="email" class="flience-input" name="email" value="${(register.formData.email!'')}" type="email" placeholder="${msg('emailPlaceholder')}" autocomplete="email" required aria-invalid="<#if messagesPerField.existsError('email')>true<#else>false</#if>" data-registration-email />
                    <#if messagesPerField.existsError('email')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('email'))?no_esc}</span></#if>
                </div>
                <#if passwordRequired??>
                    <div class="flience-form-row">
                        <div class="flience-field">
                            <label for="password">${msg("password")}</label>
                            <div class="flience-password-control">
                                <input id="password" class="flience-input" name="password" type="password" placeholder="${msg('passwordPlaceholder')}" autocomplete="new-password" required aria-invalid="<#if messagesPerField.existsError('password')>true<#else>false</#if>" />
                                <button class="flience-password-toggle" type="button" aria-label="${msg('showPassword')}" aria-controls="password" data-password-toggle><img data-password-toggle-icon data-visible-src="${url.resourcesPath}/img/icon_ui_eye.svg" data-hidden-src="${url.resourcesPath}/img/icon_ui_invisible.svg" src="${url.resourcesPath}/img/icon_ui_invisible.svg" alt="" /></button>
                            </div>
                            <p class="flience-form-hint flience-password-length-hint">${msg("passwordMinLength")}</p>
                            <#if messagesPerField.existsError('password')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('password'))?no_esc}</span></#if>
                        </div>
                        <div class="flience-field">
                            <label for="password-confirm">${msg("confirmPassword")}</label>
                            <div class="flience-password-control">
                                <input id="password-confirm" class="flience-input" name="password-confirm" type="password" placeholder="${msg('confirmPasswordPlaceholder')}" autocomplete="new-password" required aria-invalid="<#if messagesPerField.existsError('password-confirm')>true<#else>false</#if>" />
                                <button class="flience-password-toggle" type="button" aria-label="${msg('showPassword')}" aria-controls="password-confirm" data-password-toggle><img data-password-toggle-icon data-visible-src="${url.resourcesPath}/img/icon_ui_eye.svg" data-hidden-src="${url.resourcesPath}/img/icon_ui_invisible.svg" src="${url.resourcesPath}/img/icon_ui_invisible.svg" alt="" /></button>
                            </div>
                            <#if messagesPerField.existsError('password-confirm')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</span></#if>
                        </div>
                    </div>
                </#if>
                <div class="flience-registration-consents">
                    <label class="flience-consent"><input type="checkbox" name="termsAccepted" required /><span>${msg("termsConsentPrefix")}<a href="#">${msg("termsOfService")}</a>${msg("termsConsentSuffix")}</span></label>
                    <label class="flience-consent"><input type="checkbox" name="privacyAccepted" required /><span>${msg("privacyConsentPrefix")}<a href="#">${msg("privacyPolicy")}</a>${msg("privacyConsentSuffix")}</span></label>
                </div>
                <button class="flience-submit" name="register" id="kc-register" type="submit"><span data-registration-submit>${msg("createAccount")}</span></button>
                <#if social?? && social.providers?? && (social.providers?size > 0)>
                    <div class="flience-login-divider" aria-hidden="true"><span>${msg("or")}</span></div>
                    <div class="flience-social-providers">
                        <#list social.providers as p>
                            <a id="zocial-${p.alias}" class="flience-social-provider flience-social-provider--${p.alias}" href="${p.loginUrl}"><#if p.alias == "google"><img class="flience-social-provider-icon" src="${url.resourcesPath}/img/icon_ui_google.svg" alt="" /><#elseif p.iconClasses?has_content><i class="${p.iconClasses}" aria-hidden="true"></i></#if><span>${kcSanitize(msg("continueWith", p.displayName))?no_esc}</span></a>
                        </#list>
                    </div>
                </#if>
                <p class="flience-sign-up">${msg("registerHasAccount")} <a href="${url.loginUrl}">${msg("loginAction")}</a></p>
            </section>
        </form>
    </#if>
</@layout.registrationLayout>
