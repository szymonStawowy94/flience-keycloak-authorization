<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <span data-i18n="loginTitle">Zaloguj się</span>
    <#elseif section = "form">
        <script>
            window.API_URL = "${properties['api.url']!''}";
        </script>

        <a class="skip-link" href="#main-content" data-i18n="skipToMain">Przejdź do treści głównej</a>

        <div
            class="wyborek-login is-loading"
            data-has-message="<#if message?has_content>true<#else>false</#if>"
            data-message-type="<#if message?has_content>${message.type}</#if>"
        >
            <div class="logo-container">
                <img src="${url.resourcesPath}/img/branding_logo-flience.svg" alt="Flience" class="logo">
            </div>

            <#if message?has_content && message.type != 'error' && (message.type != 'warning' || !isAppInitiatedAction??)>
                <div class="toast toast-${message.type}" role="alert" data-toast>
                    <#if message.type = 'success'>
                        <svg width="20" height="20" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" viewBox="0 0 24 24" aria-hidden="true">
                            <path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path>
                            <polyline points="22 4 12 14.01 9 11.01"></polyline>
                        </svg>
                    </#if>
                    <span>${kcSanitize(message.summary)?no_esc}</span>
                </div>
            </#if>

            <main id="main-content" class="wyborek-container" tabindex="-1">
                <section class="welcome-section" aria-labelledby="welcome-heading">
                    <img src="${url.resourcesPath}/img/branding_logo-flience.svg" alt="" class="illustration">
                    <h2 id="welcome-heading" data-i18n="welcomeTitle">Masz już konto?</h2>
                    <p><span data-i18n="welcomeText">Zaloguj się, aby</span> <span class="highlight" data-i18n="welcomeHighlight">dołączyć do wydarzenia.</span></p>
                </section>

                <section class="login-card" aria-labelledby="login-heading">
                    <div id="login-heading" class="card-title" data-i18n="loginTitle" data-card-title>Zaloguj się</div>
                    <p class="card-subtitle" data-login-description>Wpisz swój adres email i hasło.</p>

                    <form id="kc-form-login" class="login-form" action="${url.loginAction}" method="post" novalidate>
                        <div class="method-switcher" data-method-switcher>
                            <button type="button" class="method-option active" data-login-mode="email" aria-pressed="true">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true">
                                    <path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                    <polyline points="22,6 12,13 2,6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                                <span data-i18n="emailTab">adres email</span>
                            </button>
                            <button type="button" class="method-option" data-login-mode="phone" aria-pressed="false">
                                <svg width="16" height="16" viewBox="0 0 24 24" fill="none" aria-hidden="true">
                                    <path d="M22 16.92v3a2 2 0 0 1-2.18 2 19.79 19.79 0 0 1-8.63-3.07A19.5 19.5 0 0 1 4.69 12a19.79 19.79 0 0 1-3.07-8.67A2 2 0 0 1 3.6 1.27h3a2 2 0 0 1 2 1.72c.127.96.361 1.903.7 2.81a2 2 0 0 1-.45 2.11L7.91 8.91a16 16 0 0 0 6 6l.91-.91a2 2 0 0 1 2.11-.45c.907.339 1.85.573 2.81.7A2 2 0 0 1 22 16.92z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                                <span data-i18n="phoneTab">numer telefonu</span>
                            </button>
                        </div>

                        <div class="login-fields" data-login-fields>
                            <div class="input-row hidden" data-field-group="phone">
                                <div class="phone-prefix-selector" data-phone-prefix-selector>
                                    <button
                                        class="phone-prefix-control"
                                        type="button"
                                        aria-label="Wybierz prefiks telefonu"
                                        aria-haspopup="listbox"
                                        aria-expanded="false"
                                        aria-controls="phone-prefix-listbox"
                                        data-i18n-aria-label="prefixTrigger"
                                        data-phone-prefix-control
                                    >
                                        <span class="phone-prefix-value" data-phone-prefix-value>+48</span>
                                        <svg class="phone-prefix-chevron" width="20" height="20" viewBox="0 0 24 24" fill="none" aria-hidden="true">
                                            <path d="M6 9l6 6 6-6" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                        </svg>
                                    </button>

                                    <div class="phone-prefix-menu hidden" data-phone-prefix-menu>
                                        <div class="phone-prefix-search-wrap">
                                            <input
                                                class="phone-prefix-search"
                                                type="search"
                                                inputmode="search"
                                                autocomplete="off"
                                                aria-label="Szukaj kraju lub prefiksu"
                                                placeholder="Szukaj"
                                                data-i18n-aria-label="prefixSearchLabel"
                                                data-i18n-placeholder="prefixSearch"
                                                data-phone-prefix-search
                                            />
                                        </div>
                                        <div id="phone-prefix-listbox" class="phone-prefix-options" role="listbox" aria-label="Lista prefiksów telefonu" data-i18n-aria-label="prefixList" data-phone-prefix-options></div>
                                    </div>

                                    <input type="hidden" id="phone-prefix" value="48" data-phone-prefix-input>
                                </div>

                                <div class="floating-field">
                                    <input
                                        id="phone-number"
                                        class="kc-input"
                                        type="tel"
                                        inputmode="tel"
                                        autocomplete="tel"
                                        value=""
                                    />
                                    <label for="phone-number" data-i18n="phoneLabel">Numer telefonu</label>
                                    <span id="phone-number-error" class="field-error hidden" data-field-error></span>
                                </div>
                            </div>

                            <div class="input-row" data-field-group="email">
                                <div class="floating-field">
                                    <input
                                        id="email-address"
                                        class="kc-input"
                                        type="email"
                                        autocomplete="username"
                                        value=""
                                    />
                                    <label for="email-address" data-i18n="emailLabel">Adres email</label>
                                    <span id="email-address-error" class="field-error hidden" data-field-error></span>
                                </div>
                            </div>

                            <input type="hidden" id="resolved-username" name="username" value="">

                            <div class="input-row password-row">
                                <div class="floating-field">
                                    <input
                                        id="password"
                                        class="kc-input"
                                        name="password"
                                        type="password" 
                                        autocomplete="current-password"
                                        required
                                    />
                                    <label for="password" data-i18n="passwordLabel">Hasło</label>
                                    <span id="password-error" class="field-error hidden" data-field-error></span>
                                    <button class="password-toggle" type="button" aria-label="Pokaż hasło" data-i18n-aria-label="showPassword" data-password-toggle>
                                        <svg class="icon-eye" width="26" height="26" viewBox="0 0 26 26" fill="none" aria-hidden="true">
                                            <path d="M13.0001 20.1066C8.63206 20.1066 4.42873 17.6418 1.46819 13.3466C1.39712 13.245 1.35901 13.124 1.35901 13C1.35901 12.876 1.39712 12.7549 1.46819 12.6533C4.42873 8.35811 8.63206 5.89331 13.0001 5.89331C17.3681 5.89331 21.5714 8.35811 24.5319 12.6533C24.603 12.7549 24.6411 12.876 24.6411 13C24.6411 13.124 24.603 13.245 24.5319 13.3466C21.5714 17.6418 17.3681 20.1066 13.0001 20.1066ZM2.70926 13C5.42366 16.7509 9.15379 18.8933 13.0001 18.8933C16.8463 18.8933 20.5765 16.7509 23.2909 13C20.5765 9.24904 16.8463 7.10664 13.0001 7.10664C9.15379 7.10664 5.42366 9.24904 2.70926 13Z" fill="currentColor"/>
                                            <path d="M13.0001 16.9433C12.2201 16.9433 11.4577 16.712 10.8093 16.2787C10.1608 15.8454 9.65536 15.2296 9.35689 14.509C9.05843 13.7885 8.98034 12.9956 9.1325 12.2307C9.28465 11.4657 9.66022 10.7631 10.2117 10.2116C10.7632 9.66013 11.4658 9.28457 12.2308 9.13241C12.9957 8.98026 13.7886 9.05835 14.5091 9.35681C15.2297 9.65527 15.8455 10.1607 16.2788 10.8092C16.7121 11.4577 16.9434 12.2201 16.9434 13C16.942 14.0454 16.5261 15.0476 15.7869 15.7868C15.0477 16.526 14.0455 16.9419 13.0001 16.9433ZM13.0001 10.27C12.4601 10.27 11.9323 10.4301 11.4834 10.7301C11.0344 11.03 10.6845 11.4564 10.4779 11.9553C10.2712 12.4541 10.2172 13.003 10.3225 13.5326C10.4279 14.0621 10.6879 14.5486 11.0697 14.9304C11.4515 15.3122 11.9379 15.5722 12.4675 15.6775C12.997 15.7829 13.5459 15.7288 14.0448 15.5222C14.5436 15.3155 14.97 14.9656 15.27 14.5167C15.5699 14.0677 15.7301 13.5399 15.7301 13C15.7291 12.2762 15.4412 11.5824 14.9294 11.0706C14.4177 10.5588 13.7238 10.2709 13.0001 10.27Z" fill="currentColor"/>
                                            <path d="M13.0001 14.3C13.718 14.3 14.3001 13.7179 14.3001 13C14.3001 12.282 13.718 11.7 13.0001 11.7C12.2821 11.7 11.7001 12.282 11.7001 13C11.7001 13.7179 12.2821 14.3 13.0001 14.3Z" fill="currentColor"/>
                                        </svg>
                                        <svg class="icon-eye-off hidden" width="26" height="26" viewBox="0 0 26 26" fill="none" aria-hidden="true">
                                            <path d="M19.0562 7.88665L24.6064 2.33652C24.8438 2.09905 24.8438 1.71598 24.6064 1.47852C24.3689 1.24105 23.9858 1.24105 23.7484 1.47852L17.8741 7.35278C16.3124 6.73225 14.6674 6.40465 13 6.40465C8.60077 6.40465 4.36277 8.67531 1.37104 12.636C1.20811 12.8526 1.20811 13.1508 1.37104 13.3674C2.96571 15.4786 4.91571 17.1097 7.05464 18.1722L1.56171 23.6652C1.32424 23.9026 1.32424 24.2857 1.56171 24.5232C1.67957 24.641 1.83557 24.7 1.99157 24.7C2.14757 24.7 2.30184 24.641 2.42144 24.5232L8.24891 18.6957C9.77424 19.285 11.3776 19.597 13.0017 19.597C17.4009 19.597 21.6389 17.3264 24.6306 13.3657C24.7936 13.149 24.7936 12.8509 24.6306 12.6342C23.0637 10.5594 21.1536 8.94918 19.058 7.88665H19.0562ZM2.62424 13C5.36291 9.57318 9.12077 7.61625 13 7.61625C14.3381 7.61625 15.6606 7.84852 16.9312 8.29398L15.3226 9.90252C14.6744 9.41545 13.8701 9.12598 12.9982 9.12598C10.8628 9.12598 9.12424 10.8645 9.12424 13C9.12424 13.8718 9.41371 14.6761 9.90077 15.3244L7.96464 17.2605C5.97304 16.347 4.14091 14.8997 2.62251 13H2.62424ZM15.6606 13C15.6606 14.4664 14.4664 15.6606 13 15.6606C12.5077 15.6606 12.0484 15.5237 11.6532 15.2897L15.2914 11.6514C15.5254 12.0466 15.6624 12.5077 15.6624 12.9982L15.6606 13ZM10.3393 13C10.3393 11.5336 11.5336 10.3393 13 10.3393C13.5356 10.3393 14.0348 10.5005 14.4525 10.7744L10.7744 14.4525C10.5005 14.0348 10.3393 13.5356 10.3393 13ZM13 18.3837C11.7069 18.3837 10.4277 18.1653 9.19531 17.7493L10.7744 16.1702C11.4053 16.614 12.1714 16.8757 13 16.8757C15.1354 16.8757 16.874 15.1372 16.874 13.0017C16.874 12.1732 16.6122 11.407 16.1685 10.7761L18.1497 8.79492C20.098 9.71012 21.8885 11.1384 23.3774 13.0017C20.6388 16.4285 16.8809 18.3854 13.0017 18.3854L13 18.3837Z" fill="currentColor"/>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>

                        <div class="access-code-view hidden" data-access-code-view>
                            <div class="segmented-input" aria-label="Kod dostępu">
                                <input class="segmented-input-cell" type="text" inputmode="numeric" autocomplete="one-time-code" maxlength="6" aria-label="Cyfra 1 z 6" data-access-code-input>
                                <input class="segmented-input-cell" type="text" inputmode="numeric" autocomplete="one-time-code" maxlength="6" aria-label="Cyfra 2 z 6" data-access-code-input>
                                <input class="segmented-input-cell" type="text" inputmode="numeric" autocomplete="one-time-code" maxlength="6" aria-label="Cyfra 3 z 6" data-access-code-input>
                                <input class="segmented-input-cell" type="text" inputmode="numeric" autocomplete="one-time-code" maxlength="6" aria-label="Cyfra 4 z 6" data-access-code-input>
                                <input class="segmented-input-cell" type="text" inputmode="numeric" autocomplete="one-time-code" maxlength="6" aria-label="Cyfra 5 z 6" data-access-code-input>
                                <input class="segmented-input-cell" type="text" inputmode="numeric" autocomplete="one-time-code" maxlength="6" aria-label="Cyfra 6 z 6" data-access-code-input>
                            </div>
                            <div id="access-code-error" class="access-code-error hidden" role="alert" data-access-code-error></div>
                        </div>

                        <div
                            id="login-credentials-error"
                            class="login-error hidden"
                            role="alert"
                            data-login-error
                            data-i18n="invalidCredentials"
                        >
                            Błędne dane logowania.
                        </div>

                        <div class="forgot-password" data-forgot-password>
                            <a href="${properties['resetPassword.url']!'/authorize?step=RESET_PASSWORD'}" data-i18n="forgotPassword">Nie pamiętasz hasła?</a>
                        </div>

                        <div class="submit-group">
                            <button class="btn-submit" name="login" id="kc-login" type="submit">
                                <span data-i18n="submit">Zaloguj się</span>
                            </button>
                        </div>
                    </form>
                </section>
            </main>
        </div>
    </#if>
</@layout.registrationLayout>
