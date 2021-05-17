.class Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;
.super Ljava/lang/Object;
.source "AuthorizationResponseParser.java"


# static fields
.field private static final ACCESS_NOT_PERMITTED:Ljava/lang/String; = "Access not permitted."

.field private static final ACCESS_NOT_PERMITTED_ALT:Ljava/lang/String; = "Access+not+permitted."

.field public static final CLIENT_ID_STATE:Ljava/lang/String; = "clientId"

.field public static final CLIENT_REQUEST_ID_STATE:Ljava/lang/String; = "clientRequestId"

.field public static final CODE:Ljava/lang/String; = "code"

.field private static final ERROR:Ljava/lang/String; = "error"

.field private static final ERROR_DESCRIPTION:Ljava/lang/String; = "error_description"

.field private static final LOG_TAG:Ljava/lang/String;

.field public static final REDIRECT_URI_STATE:Ljava/lang/String; = "redirectUri"

.field public static final SCOPE:Ljava/lang/String; = "scope"

.field public static final STATE:Ljava/lang/String; = "state"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lcom/amazon/identity/auth/device/authorization/MAPAuthzDialog;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;->LOG_TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    return-void
.end method

.method private constructErrorBundle(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 3
    .param p1, "bundle"    # Landroid/os/Bundle;
    .param p2, "error"    # Ljava/lang/String;
    .param p3, "errorDescription"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 109
    const-string v0, "access_denied"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "Access not permitted."

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Access+not+permitted."

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 111
    :cond_0
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->CAUSE_ID:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v0, v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 112
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->ON_CANCEL_TYPE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v0, v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    invoke-virtual {p1, v0, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->ON_CANCEL_DESCRIPTION:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v0, v0, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    invoke-virtual {p1, v0, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    return-object p1

    .line 118
    :cond_1
    new-instance v0, Lcom/amazon/identity/auth/device/AuthError;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "error_description="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_SERVER_REPSONSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v0, v1, v2}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v0
.end method

.method private constructSuccessBundle(Landroid/os/Bundle;Ljava/util/Map;Ljava/lang/String;[Ljava/lang/String;)Landroid/os/Bundle;
    .locals 4
    .param p1, "bundle"    # Landroid/os/Bundle;
    .param p3, "scopes"    # Ljava/lang/String;
    .param p4, "requestedScopes"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Bundle;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Landroid/os/Bundle;"
        }
    .end annotation

    .prologue
    .line 123
    .local p2, "stateValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "clientId"

    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 124
    .local v0, "clientId":Ljava/lang/String;
    const-string v2, "clientId"

    invoke-virtual {p1, v2, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    const-string v2, "redirectUri"

    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 126
    .local v1, "redirectUri":Ljava/lang/String;
    const-string v2, "redirectUri"

    invoke-virtual {p1, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    if-eqz p3, :cond_0

    .line 129
    const-string v2, "scope"

    invoke-static {p3}, Lcom/amazon/identity/auth/device/authorization/ScopesHelper;->getScopesFromString(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1, v2, v3}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    .line 139
    :goto_0
    return-object p1

    .line 135
    :cond_0
    sget-object v2, Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;->LOG_TAG:Ljava/lang/String;

    const-string v3, "No scopes from OAuth2 response, using requested scopes"

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    const-string v2, "scope"

    invoke-virtual {p1, v2, p4}, Landroid/os/Bundle;->putStringArray(Ljava/lang/String;[Ljava/lang/String;)V

    goto :goto_0
.end method

.method static getCallbackInfo(Ljava/lang/String;)Lcom/amazon/identity/auth/device/authorization/CallbackInfo;
    .locals 5
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 38
    .local v3, "uri":Landroid/net/Uri;
    invoke-static {v3}, Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;->getStateValuesFromUri(Landroid/net/Uri;)Ljava/util/Map;

    move-result-object v2

    .line 39
    .local v2, "stateValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "clientRequestId"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 40
    .local v1, "clientRequestId":Ljava/lang/String;
    invoke-static {v1}, Lcom/amazon/identity/auth/device/authorization/CallbackInfo;->getCallbackInfo(Ljava/lang/String;)Lcom/amazon/identity/auth/device/authorization/CallbackInfo;

    move-result-object v0

    .line 41
    .local v0, "callbackInfo":Lcom/amazon/identity/auth/device/authorization/CallbackInfo;
    return-object v0
.end method

.method public static getStateValuesFromUri(Landroid/net/Uri;)Ljava/util/Map;
    .locals 10
    .param p0, "uri"    # Landroid/net/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/Uri;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 88
    new-instance v7, Ljava/util/HashMap;

    invoke-direct {v7}, Ljava/util/HashMap;-><init>()V

    .line 89
    .local v7, "stateValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v8, "state"

    invoke-virtual {p0, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 90
    .local v5, "state":Ljava/lang/String;
    if-eqz v5, :cond_1

    .line 92
    const-string v8, "&"

    invoke-static {v5, v8}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    .line 93
    .local v6, "stateKeyValues":[Ljava/lang/String;
    if-eqz v6, :cond_1

    .line 95
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_0
    if-ge v3, v4, :cond_1

    aget-object v1, v0, v3

    .line 97
    .local v1, "attribute":Ljava/lang/String;
    const-string v8, "="

    invoke-static {v1, v8}, Landroid/text/TextUtils;->split(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 98
    .local v2, "attributeTuple":[Ljava/lang/String;
    if-eqz v2, :cond_0

    array-length v8, v2

    const/4 v9, 0x2

    if-ne v8, v9, :cond_0

    .line 100
    const/4 v8, 0x0

    aget-object v8, v2, v8

    const/4 v9, 0x1

    aget-object v9, v2, v9

    invoke-interface {v7, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 105
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "attribute":Ljava/lang/String;
    .end local v2    # "attributeTuple":[Ljava/lang/String;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v6    # "stateKeyValues":[Ljava/lang/String;
    :cond_1
    return-object v7
.end method


# virtual methods
.method extractResultsBundle(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)Landroid/os/Bundle;
    .locals 12
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "requestId"    # Ljava/lang/String;
    .param p3, "requestedScopes"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 46
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 47
    .local v1, "bundle":Landroid/os/Bundle;
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v7

    .line 48
    .local v7, "uri":Landroid/net/Uri;
    sget-object v8, Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Received response from WebBroswer for OAuth2 flow"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "response="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    const-string v8, "code"

    invoke-virtual {v7, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 51
    .local v0, "authzCode":Ljava/lang/String;
    const-string v8, "code"

    invoke-virtual {v1, v8, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    sget-object v8, Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;->LOG_TAG:Ljava/lang/String;

    const-string v9, "Code extracted from response"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "code="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    invoke-static {v7}, Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;->getStateValuesFromUri(Landroid/net/Uri;)Ljava/util/Map;

    move-result-object v6

    .line 55
    .local v6, "stateValues":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v8, "clientRequestId"

    invoke-interface {v6, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 56
    .local v2, "clientRequestId":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 58
    new-instance v8, Lcom/amazon/identity/auth/device/AuthError;

    const-string v9, "No clientRequestId in OAuth2 response"

    sget-object v10, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_SERVER_REPSONSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v8, v9, v10}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v8

    .line 62
    :cond_0
    invoke-virtual {v2, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 64
    new-instance v8, Lcom/amazon/identity/auth/device/AuthError;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "ClientRequestIds do not match. req="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " resp="

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_SERVER_REPSONSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v8, v9, v10}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v8

    .line 68
    :cond_1
    const-string v8, "error"

    invoke-virtual {v7, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 69
    .local v3, "error":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 71
    const-string v8, "error_description"

    invoke-virtual {v7, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 72
    .local v4, "errorDescription":Ljava/lang/String;
    invoke-direct {p0, v1, v3, v4}, Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;->constructErrorBundle(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v8

    .line 83
    .end local v4    # "errorDescription":Ljava/lang/String;
    :goto_0
    return-object v8

    .line 76
    :cond_2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_3

    .line 78
    new-instance v8, Lcom/amazon/identity/auth/device/AuthError;

    const-string v9, "No code in OAuth2 response"

    sget-object v10, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_SERVER_REPSONSE:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v8, v9, v10}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v8

    .line 82
    :cond_3
    const-string v8, "scope"

    invoke-virtual {v7, v8}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 83
    .local v5, "scopes":Ljava/lang/String;
    invoke-direct {p0, v1, v6, v5, p3}, Lcom/amazon/identity/auth/device/authorization/AuthorizationResponseParser;->constructSuccessBundle(Landroid/os/Bundle;Ljava/util/Map;Ljava/lang/String;[Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v8

    goto :goto_0
.end method
