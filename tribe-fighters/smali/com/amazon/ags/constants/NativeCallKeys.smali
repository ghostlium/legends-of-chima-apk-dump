.class public Lcom/amazon/ags/constants/NativeCallKeys;
.super Ljava/lang/Object;
.source "NativeCallKeys.java"


# static fields
.field public static final AUTHENTICATE:Ljava/lang/String; = "authenticate"

.field public static final BODY:Ljava/lang/String; = "body"

.field public static final CACHE_REQUEST:Ljava/lang/String; = "cacheRequest"

.field public static final CACHE_REQUESTS:Ljava/lang/String; = "cacheRequests"

.field public static final CONNECTED:Ljava/lang/String; = "connected"

.field public static final COUNTRY_CODE:Ljava/lang/String; = "countryCode"

.field public static final COUNTRY_SUPPORT:Ljava/lang/String; = "countrySupport"

.field public static final DEV_FEATURES:Ljava/lang/String; = "devFeatures"

.field public static final END_POINT:Ljava/lang/String; = "endPoint"

.field public static final EVENT_ATTRIBUTES:Ljava/lang/String; = "eventAttributes"

.field public static final EVENT_COUNT_METRICS:Ljava/lang/String; = "eventCountMetrics"

.field public static final EVENT_NAME:Ljava/lang/String;

.field public static final EVENT_TIME_METRICS:Ljava/lang/String; = "eventTimeMetrics"

.field public static final GUEST_MODE:Ljava/lang/String; = "guestMode"

.field public static final HAS_OPTED_IN:Ljava/lang/String; = "hasOptedIn"

.field public static final HIDDEN_FLAG:Ljava/lang/String; = "hidden"

.field public static final HTTP_HEADERS:Ljava/lang/String; = "httpHeaders"

.field public static final HTTP_METHOD:Ljava/lang/String; = "httpMethod"

.field public static final HTTP_PAYLOAD:Ljava/lang/String; = "httpPayload"

.field public static final JAVASCRIPT_EVENT_TYPE:Ljava/lang/String; = "javascriptEventType"

.field public static final JSON_DATA:Ljava/lang/String; = "jsonData"

.field public static final LANGUAGE_CODE:Ljava/lang/String; = "languageCode"

.field public static final LOGGED_IN_STATUS:Ljava/lang/String; = "loggedInStatus"

.field public static final MAIL_TO:Ljava/lang/String; = "mailTo"

.field public static final METHOD:Ljava/lang/String; = "method"

.field public static final NATIVE_CALL:Ljava/lang/String; = "nativeCall"

.field public static final PARAMETERS:Ljava/lang/String; = "parameters"

.field public static final PLAYER_ID:Ljava/lang/String; = "playerId"

.field public static final PRIMARY_KEY:Ljava/lang/String; = "primaryKey"

.field public static final REQUEST_ID:Ljava/lang/String; = "rid"

.field public static final ROAMING:Ljava/lang/String; = "roaming"

.field public static final SECONDARY_KEY:Ljava/lang/String; = "secondaryKey"

.field public static final SUBJECT:Ljava/lang/String; = "subject"

.field public static final TARGET:Ljava/lang/String; = "target"

.field public static final URL:Ljava/lang/String; = "url"

.field public static final VALUE:Ljava/lang/String; = "value"

.field public static final VARIATION:Ljava/lang/String; = "variation"

.field public static final VARIATION_VARIABLE:Ljava/lang/String; = "variationVariable"

.field public static final VARIATION_VARIABLE_DEFAULT_VALUE:Ljava/lang/String; = "variationVariableDefaultValue"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 58
    sget-object v0, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;->EVENT_NAME:Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;

    invoke-virtual {v0}, Lcom/amazon/ags/constants/metrics/MetricConstants$MetricRestrictedStringValueAttributeKeys;->name()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/ags/constants/NativeCallKeys;->EVENT_NAME:Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method
