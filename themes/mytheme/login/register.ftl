<#import "template.ftl" as layout>
<@layout.registrationLayout bodyClass="flience-registration-page" displayMessage=!messagesPerField.existsError('firstName','lastName','username','email','password','password-confirm'); section>
    <#if section = "header">
        <span data-registration-title>Zarejestruj się</span>
    <#elseif section = "subtitle">
        <span data-registration-subtitle>i pobieraj materiały za darmo!</span>
    <#elseif section = "context">
        <p class="flience-registration-context"><span data-registration-context>Zakładasz konto prywatne.</span> <a href="#" data-registration-switch>Zmień</a></p>
    <#elseif section = "form">
        <form id="kc-register-form" class="flience-register-form" action="${url.registrationAction}" method="post" novalidate="novalidate" data-registration-variant="personal">
            <section class="flience-registration-section flience-organization-section" data-registration-organization hidden>
                <h2>Dane organizacji</h2>
                <div class="flience-field">
                    <label for="organization-name">Nazwa organizacji</label>
                    <input id="organization-name" class="flience-input" name="organizationName" type="text" placeholder="np. Szkoła Podstawowa nr 5 w Gdyni" autocomplete="organization" disabled />
                </div>
                <div class="flience-field flience-field--select">
                    <label id="organization-type-label" for="organization-type">Typ placówki</label>
                    <div class="flience-select" data-select>
                        <select id="organization-type" class="flience-select-native" name="organizationType" disabled data-select-native>
                        <option value="">Wybierz typ placówki</option>
                        <option>Przedszkole</option>
                        <option>Szkoła podstawowa</option>
                        <option>Szkoła ponadpodstawowa</option>
                        <option>Inna organizacja</option>
                        </select>
                        <button class="flience-select-trigger" type="button" aria-labelledby="organization-type-label" aria-controls="organization-type-options" aria-expanded="false" aria-haspopup="listbox" disabled data-select-trigger>
                            <span class="flience-select-value" data-select-value>Wybierz typ placówki</span>
                            <span class="flience-select-chevron" aria-hidden="true"></span>
                        </button>
                        <div id="organization-type-options" class="flience-select-options" role="listbox" aria-labelledby="organization-type-label" hidden data-select-options>
                            <button class="flience-select-option" type="button" role="option" aria-selected="true" data-select-option data-value="">Wybierz typ placówki</button>
                            <button class="flience-select-option" type="button" role="option" aria-selected="false" data-select-option data-value="Przedszkole">Przedszkole</button>
                            <button class="flience-select-option" type="button" role="option" aria-selected="false" data-select-option data-value="Szkoła podstawowa">Szkoła podstawowa</button>
                            <button class="flience-select-option" type="button" role="option" aria-selected="false" data-select-option data-value="Szkoła ponadpodstawowa">Szkoła ponadpodstawowa</button>
                            <button class="flience-select-option" type="button" role="option" aria-selected="false" data-select-option data-value="Inna organizacja">Inna organizacja</button>
                        </div>
                    </div>
                </div>
                <div class="flience-field">
                    <label for="organization-tax-id">NIP <span>(opcjonalnie)</span></label>
                    <input id="organization-tax-id" class="flience-input" name="organizationTaxId" type="text" inputmode="numeric" placeholder="000-000-00-00" disabled />
                </div>
                <p class="flience-organization-hint">Ty zostajesz administratorem organizacji. Członków zaprosisz po rejestracji, w Ustawieniach.</p>
            </section>

            <section class="flience-registration-section flience-person-section">
                <h2>Informacje o Tobie</h2>
                <div class="flience-form-row">
                    <div class="flience-field">
                        <label for="firstName">Imię</label>
                        <input id="firstName" class="flience-input" name="firstName" value="${(register.formData.firstName!'')}" type="text" placeholder="imię" autocomplete="given-name" required autofocus aria-invalid="<#if messagesPerField.existsError('firstName')>true<#else>false</#if>" />
                        <#if messagesPerField.existsError('firstName')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('firstName'))?no_esc}</span></#if>
                    </div>
                    <div class="flience-field">
                        <label for="lastName">Nazwisko</label>
                        <input id="lastName" class="flience-input" name="lastName" value="${(register.formData.lastName!'')}" type="text" placeholder="nazwisko" autocomplete="family-name" required aria-invalid="<#if messagesPerField.existsError('lastName')>true<#else>false</#if>" />
                        <#if messagesPerField.existsError('lastName')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('lastName'))?no_esc}</span></#if>
                    </div>
                </div>
                <#if !realm.registrationEmailAsUsername>
                    <input id="username" name="username" value="${(register.formData.username!'')}" type="hidden" data-registration-username />
                </#if>
                <div class="flience-field">
                    <label for="email">Email</label>
                    <input id="email" class="flience-input" name="email" value="${(register.formData.email!'')}" type="email" placeholder="email" autocomplete="email" required aria-invalid="<#if messagesPerField.existsError('email')>true<#else>false</#if>" data-registration-email />
                    <#if messagesPerField.existsError('email')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('email'))?no_esc}</span></#if>
                </div>
                <#if passwordRequired??>
                    <div class="flience-form-row">
                        <div class="flience-field">
                            <label for="password">Hasło</label>
                            <div class="flience-password-control">
                                <input id="password" class="flience-input" name="password" type="password" placeholder="hasło" autocomplete="new-password" required aria-invalid="<#if messagesPerField.existsError('password')>true<#else>false</#if>" />
                                <button class="flience-password-toggle" type="button" aria-label="Pokaż hasło" aria-controls="password" data-password-toggle><img data-password-toggle-icon data-visible-src="${url.resourcesPath}/img/icon_ui_eye.svg" data-hidden-src="${url.resourcesPath}/img/icon_ui_invisible.svg" src="${url.resourcesPath}/img/icon_ui_invisible.svg" alt="" /></button>
                            </div>
                            <p class="flience-form-hint">Co najmniej 8 znaków</p>
                            <#if messagesPerField.existsError('password')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('password'))?no_esc}</span></#if>
                        </div>
                        <div class="flience-field">
                            <label for="password-confirm">Powtórz hasło</label>
                            <div class="flience-password-control">
                                <input id="password-confirm" class="flience-input" name="password-confirm" type="password" placeholder="powtórz hasło" autocomplete="new-password" required aria-invalid="<#if messagesPerField.existsError('password-confirm')>true<#else>false</#if>" />
                                <button class="flience-password-toggle" type="button" aria-label="Pokaż hasło" aria-controls="password-confirm" data-password-toggle><img data-password-toggle-icon data-visible-src="${url.resourcesPath}/img/icon_ui_eye.svg" data-hidden-src="${url.resourcesPath}/img/icon_ui_invisible.svg" src="${url.resourcesPath}/img/icon_ui_invisible.svg" alt="" /></button>
                            </div>
                            <#if messagesPerField.existsError('password-confirm')><span class="flience-field-error" role="alert">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</span></#if>
                        </div>
                    </div>
                </#if>
                <div class="flience-registration-consents">
                    <label class="flience-consent"><input type="checkbox" name="termsAccepted" required /><span>Oświadczam, że zapoznałem/am się z <a href="#">regulaminem</a> serwisu internetowego i akceptuję jego warunki.</span></label>
                    <label class="flience-consent"><input type="checkbox" name="privacyAccepted" required /><span>Oświadczam, że zapoznałem/am się z <a href="#">polityką prywatności</a>.</span></label>
                </div>
                <button class="flience-submit" name="register" id="kc-register" type="submit"><span data-registration-submit>Utwórz konto</span></button>
                <#if social?? && social.providers?? && (social.providers?size > 0)>
                    <div class="flience-login-divider" aria-hidden="true"><span>lub</span></div>
                    <div class="flience-social-providers">
                        <#list social.providers as p>
                            <a id="zocial-${p.alias}" class="flience-social-provider flience-social-provider--${p.alias}" href="${p.loginUrl}"><#if p.alias == "google"><img class="flience-social-provider-icon" src="${url.resourcesPath}/img/icon_ui_google.svg" alt="" /><#elseif p.iconClasses?has_content><i class="${p.iconClasses}" aria-hidden="true"></i></#if><span>Kontynuuj z ${kcSanitize(p.displayName)?no_esc}</span></a>
                        </#list>
                    </div>
                </#if>
                <p class="flience-sign-up">Masz już konto? <a href="${url.loginUrl}">Zaloguj się</a></p>
            </section>
        </form>
    </#if>
</@layout.registrationLayout>
