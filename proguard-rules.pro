# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

#https://github.com/pwittchen/ReactiveNetwork
-dontwarn com.github.pwittchen.reactivenetwork.library.rx2.ReactiveNetwork
-dontwarn io.reactivex.functions.Function
-dontwarn rx.internal.util.**
-dontwarn sun.misc.Unsafe

# Twilio Programmable Voice
-keep class com.twilio.** { *; }

-dontwarn com.google.errorprone.annotations.*

#Okhttp
# A resource is loaded with a relative path so the package of this class must be preserved.
-keepnames class okhttp3.internal.publicsuffix.PublicSuffixDatabase
# Animal Sniffer compileOnly dependency to ensure APIs are compatible with older versions of Java.
-dontwarn org.codehaus.mojo.animal_sniffer.*
# OkHttp platform used only on JVM and when Conscrypt dependency is available.
-dontwarn okhttp3.internal.platform.ConscryptPlatform

#nofo data classes
-keep class pl.predica.nofo.adddevice.data.** { *; }
-keep class pl.predica.nofo.home.data.model.** { *; }
-keep class pl.predica.nofo.common.data.model.** { *; }
-keep class pl.predica.nofo.settings.data.model.** { *; }
-keep class pl.predica.nofo.share.data.** { *; }
-keep class pl.predica.nofo.security.data.**{*;}
-keep class pl.predica.nofo.security.data.model.** { *; }

#software update data classes and dfu classes
-keep class pl.predica.nofo.softwareUpdate.domain.model.** { *; }
-keep class pl.predica.nofo.softwareUpdate.data.model.** { *; }
-keep class pl.predica.nofo.softwareUpdate.presentation.model.** { *; }
-keep class no.nordicsemi.android.dfu.** { *; }

-keep public class * extends java.lang.Error
-keep public class * extends java.lang.Exception

-keep @kotlinx.android.parcel.Parcelize class *


# Retain service method parameters when optimizing.
-keepclassmembers,allowshrinking,allowobfuscation interface * {
    @retrofit2.http.* <methods>;
}

# Ignore annotation used for build tooling.
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement

# Ignore JSR 305 annotations for embedding nullability information.
-dontwarn javax.annotation.**

# Guarded by a NoClassDefFoundError try/catch and only used when on the classpath.
-dontwarn kotlin.Unit

# Top-level functions that can only be used by Kotlin.
-dontwarn retrofit2.-KotlinExtensions

-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.module.AppGlideModule
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
  **[] $VALUES;
  public *;
}

# Realm auto migrate
-keepnames public class * extends io.realm.RealmModel
-keep public class * extends io.realm.RealmModel { *; }
-keepnames public class * extends io.realm.RealmObject
-keep public class * extends io.realm.RealmObject { *; }
-keepattributes *Annotation*

#LockDetailsFragment crash fix
-keep class org.xmlpull.** { *; }
-dontwarn android.content.res.XmlResourceParser

### greenDAO 3
-keepclassmembers class * extends org.greenrobot.greendao.AbstractDao {
public static java.lang.String TABLENAME;
}
-keep class **$Properties

# If you do not use SQLCipher:
-dontwarn org.greenrobot.greendao.database.**

# Crashlytics
-keepattributes *Annotation*
-keepattributes SourceFile,LineNumberTable
-keep public class * extends java.lang.Exception

-keep class com.crashlytics.** { *; }
-dontwarn com.crashlytics.**

### greenDAO 3
-keepclassmembers class * extends org.greenrobot.greendao.AbstractDao {
public static java.lang.String TABLENAME;
}
-keep class **$Properties {*;}

# If you do not use SQLCipher:
-dontwarn net.sqlcipher.database.**
# If you do not use RxJava:
#-dontwarn rx.**

### greenDAO 2
-keepclassmembers class * extends de.greenrobot.dao.AbstractDao {
public static java.lang.String TABLENAME;
}
-keep class **$Properties

##---------------Begin: proguard configuration for Gson  ----------
# Gson uses generic type information stored in a class file when working with fields. Proguard
# removes such information by default, so configure it to keep all of it.
-keepattributes Signature

# For using GSON @Expose annotation
-keepattributes *Annotation*

# Gson specific classes
-dontwarn sun.misc.**
#-keep class com.google.gson.stream.** { *; }

# Application classes that will be serialized/deserialized over Gson
-keep class com.google.gson.examples.android.model.** { <fields>; }

# Prevent proguard from stripping interface information from TypeAdapter, TypeAdapterFactory,
# JsonSerializer, JsonDeserializer instances (so they can be used in @JsonAdapter)
-keep class * implements com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# Prevent R8 from leaving Data object members always null
-keepclassmembers,allowobfuscation class * {
  @com.google.gson.annotations.SerializedName <fields>;
}

##---------------End: proguard configuration for Gson  ----------

### msal
-keep class com.microsoft.identity.client.** { *; }
-keep class com.microsoft.identity.common.internal.ui.** { *; }
-keep class com.microsoft.identity.common.internal.authorities.** { *; }
-keep class com.microsoft.identity.client.PublicClientApplicationConfigurationFactory { *; }
-keep public enum com.microsoft.identity.common.internal.ui.AuthorizationAgent { *; }
-keep public enum com.microsoft.identity.common.internal.authorities.Environment { *; }
-keep public enum com.microsoft.identity.common.internal.providers.oauth2.OpenIdConnectPromptParameter { *; }
-keep public class com.microsoft.identity.common.internal.request.AcquireTokenOperationParameters { *; }
-keep public enum com.microsoft.identity.common.internal.request.SdkType { *; }
-keep public class com.microsoft.identity.common.internal.providers.microsoft.microsoftsts.MicrosoftStsAuthorizationResponse { *; }
-keep public class com.microsoft.identity.common.internal.providers.microsoft.microsoftsts.MicrosoftStsTokenResponse { *; }
-keep class com.microsoft.identity.common.exception.** { *; }
-keep class **$Properties
