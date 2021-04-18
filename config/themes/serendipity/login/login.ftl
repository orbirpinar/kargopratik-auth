<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
        <div class="authincation">
        <div class="container h-100">
          <div class="row justify-content-center h-100 align-items-center">
            <div class="col-xl-5 col-md-6">
              <div class="mini-logo text-center">
                  <img src="../resources/img/kargopratik-logo.png" alt="logo" />
              </div>
              <div class="auth-form card">
                <div class="card-header justify-content-center">
                  <h4 class="card-title">Giriş Yap</h4>
                </div>
                <#if realm.password>
                   <div class="card-body">
                    <form class="signin_validate" id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">

                        <#--
                        <div class="${properties.kcFormGroupClass!}">
                            <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>

                            <#if usernameEditDisabled??>
                                <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                            <#else>
                                <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}"  type="text" autofocus autocomplete="off" />
                            </#if>
                        </div>
                        -->

                        <div class="form-group">
                                    <label for="username" class="">
                                    <#if !realm.loginWithEmailAllowed>
                                       Kullanici Adi
                                    <#elseif !realm.registrationEmailAsUsername>
                                        Kullani Adi veya E-posta
                                    <#else>
                                        E-posta
                                    </#if>
                                </label>
                                <input  
                                required 
                                id="username" 
                                class="form-control" 
                                name="username" 
                                value="${(login.username!'')}" 
                                type="text" autofocus autocomplete="off" 
                                <#if usernameEditDisabled??>disabled</#if>>
                        </div>

                        <#--
                        <div class="${properties.kcFormGroupClass!}">
                            <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                            <input tabindex="2" id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="off" />
                        </div>
                        -->

                        <div class="form-group">
                                <label for="password">Parola</label>
                                <input tabindex="0" 
                                required id="password" 
                                class="form-control" name="password" type="password" autocomplete="off">
                        </div>

                        <#--
                        <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                           <div id="kc-form-options">
                               <#if realm.rememberMe && !usernameEditDisabled??>
                                   <div class="checkbox">
                                       <label>
                                           <#if login.rememberMe??>
                                               <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" checked> ${msg("rememberMe")}
                                           <#else>
                                               <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"> ${msg("rememberMe")}
                                           </#if>
                                       </label>
                                   </div>
                               </#if>
                           </div>
                           <div class="${properties.kcFormOptionsWrapperClass!}">
                               <#if realm.resetPasswordAllowed>
                                   <span><a tabindex="5" href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                               </#if>
                           </div>
                        </div>
                        -->

                        <div class="form-row d-flex justify-content-between mt-4 mb-2">
                            <div id="kc-form-options">
                                <#if realm.rememberMe && !usernameEditDisabled??>

                                         <div class="form-group mb-0">
                        <label class="toggle">
                          <input class="toggle-checkbox" type="checkbox" />
                          <span class="toggle-switch"></span>
                          <span class="toggle-label">Beni Hatırla</span>
                        </label>
                      </div>

                                </#if>
                            </div>
                            <div class="form-group mb-0">
                                <#if realm.resetPasswordAllowed>
                                    <span><a tabindex="0" href="${url.loginResetCredentialsUrl}">Sifremi Unuttum</a></span>
                                </#if>
                            </div>
                        </div>

                        <#--
                        <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <input tabindex="4" class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        </div>
                        -->

                        
                            <div class="text-center">
                                <button tabindex="0" name="login" id="kc-login" type="submit"     class="btn btn-primary btn-block">
                                   Giris Yap
                                </button>
                            </div>

                    </form>
                    </div>
                </#if>
            </div>
            <#if realm.password && social.providers??>
                <div id="kc-social-providers" class="${properties.kcFormSocialAccountContentClass!} ${properties.kcFormSocialAccountClass!}">
                    <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 4>${properties.kcFormSocialAccountDoubleListClass!}</#if>">
                        <#list social.providers as p>
                            <li class="${properties.kcFormSocialAccountListLinkClass!}"><a href="${p.loginUrl}" id="zocial-${p.alias}" class="zocial ${p.providerId}"> <span>${p.displayName}</span></a></li>
                        </#list>
                    </ul>
                </div>
            </#if>
 
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>

            

            <hr class="mdc-list-divider divider-mdc">

           <div class="new-account caption mt-3">
                <span> Hesabınız yok mu? <a tabindex="0" href="${url.registrationUrl}"> Üyelik Talebi Oluştur.</a></span>
            </div>
        </#if>
    </#if>
       </div>
        </div>
        </div>
        </div>
        </div>
</@layout.registrationLayout>
