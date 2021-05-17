.class public Lcom/amazon/identity/auth/device/authorization/ProfileHelper;
.super Ljava/lang/Object;
.source "ProfileHelper.java"


# static fields
.field private static final PROFILE_SCOPE:Ljava/lang/String; = "profile"

.field private static final TAG:Ljava/lang/String;

.field private static mServerCommunication:Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const-class v0, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->TAG:Ljava/lang/String;

    .line 32
    new-instance v0, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;

    invoke-direct {v0}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;-><init>()V

    sput-object v0, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->mServerCommunication:Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 1
    .param p0, "x0"    # Landroid/os/Bundle;

    .prologue
    .line 27
    invoke-static {p0}, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->createResponseBundle(Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 1
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 27
    invoke-static {p0, p1}, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->getProfileLocal(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 1
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 27
    invoke-static {p0, p1}, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->getProfileRemote(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lorg/json/JSONObject;)Landroid/os/Bundle;
    .locals 1
    .param p0, "x0"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 27
    invoke-static {p0}, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->createProfileBundle(Lorg/json/JSONObject;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0
    .param p0, "x0"    # Landroid/content/Context;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lorg/json/JSONObject;

    .prologue
    .line 27
    invoke-static {p0, p1, p2}, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->updateProfileLocal(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)V

    return-void
.end method

.method private static createProfileBundle(Lorg/json/JSONObject;)Landroid/os/Bundle;
    .locals 6
    .param p0, "profileData"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 131
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 133
    .local v0, "profileBundle":Landroid/os/Bundle;
    invoke-virtual {p0}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 135
    .local v1, "profileItr":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 136
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 137
    .local v2, "profileKey":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 139
    .end local v2    # "profileKey":Ljava/lang/String;
    :cond_0
    sget-object v3, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->TAG:Ljava/lang/String;

    const-string v4, "Profile Information"

    invoke-virtual {v0}, Landroid/os/Bundle;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 140
    return-object v0
.end method

.method private static createResponseBundle(Landroid/os/Bundle;)Landroid/os/Bundle;
    .locals 2
    .param p0, "profileBundle"    # Landroid/os/Bundle;

    .prologue
    .line 144
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 145
    .local v0, "responseBundle":Landroid/os/Bundle;
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->PROFILE:Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;

    iget-object v1, v1, Lcom/amazon/identity/auth/device/authorization/api/AuthzConstants$BUNDLE_KEY;->val:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 146
    return-object v0
.end method

.method public static getProfile(Landroid/content/Context;Ljava/lang/String;Lcom/amazon/identity/auth/device/shared/APIListener;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "listener"    # Lcom/amazon/identity/auth/device/shared/APIListener;

    .prologue
    .line 37
    const/4 v4, 0x1

    new-array v3, v4, [Ljava/lang/String;

    const/4 v4, 0x0

    const-string v5, "profile"

    aput-object v5, v3, v4

    .line 38
    .local v3, "profileScope":[Ljava/lang/String;
    new-instance v0, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;

    invoke-direct {v0}, Lcom/amazon/identity/auth/device/appid/ThirdPartyAppIdentifier;-><init>()V

    .line 39
    .local v0, "appIdentifier":Lcom/amazon/identity/auth/device/appid/AppIdentifier;
    invoke-interface {v0, p1, p0}, Lcom/amazon/identity/auth/device/appid/AppIdentifier;->getAppInfo(Ljava/lang/String;Landroid/content/Context;)Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v1

    .line 40
    .local v1, "appInfo":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    if-nez v1, :cond_0

    .line 42
    new-instance v4, Lcom/amazon/identity/auth/device/AuthError;

    const-string v5, "App info is null"

    sget-object v6, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_ACCESS_DENIED:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v4, v5, v6}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    invoke-interface {p2, v4}, Lcom/amazon/identity/auth/device/shared/APIListener;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    .line 99
    :goto_0
    return-void

    .line 47
    :cond_0
    :try_start_0
    invoke-virtual {v1}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getClientId()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lcom/amazon/identity/auth/device/authorization/ProfileHelper$1;

    invoke-direct {v5, p0, p2, v1}, Lcom/amazon/identity/auth/device/authorization/ProfileHelper$1;-><init>(Landroid/content/Context;Lcom/amazon/identity/auth/device/shared/APIListener;Lcom/amazon/identity/auth/device/dataobject/AppInfo;)V

    invoke-static {p0, p1, v4, v3, v5}, Lcom/amazon/identity/auth/device/authorization/TokenHelper;->getToken(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Lcom/amazon/identity/auth/device/shared/APIListener;)V
    :try_end_0
    .catch Lcom/amazon/identity/auth/device/AuthError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 95
    :catch_0
    move-exception v2

    .line 96
    .local v2, "e":Lcom/amazon/identity/auth/device/AuthError;
    invoke-interface {p2, v2}, Lcom/amazon/identity/auth/device/shared/APIListener;->onError(Lcom/amazon/identity/auth/device/AuthError;)V

    goto :goto_0
.end method

.method private static getProfileLocal(Landroid/content/Context;Ljava/lang/String;)Landroid/os/Bundle;
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "appId"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 102
    sget-object v4, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->TAG:Ljava/lang/String;

    const-string v5, "Accessing local profile information"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 103
    invoke-static {p0}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;

    move-result-object v2

    .line 104
    .local v2, "profileDataSource":Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;
    invoke-virtual {v2, p1}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->getProfile(Ljava/lang/String;)Lcom/amazon/identity/auth/device/dataobject/Profile;

    move-result-object v1

    .line 105
    .local v1, "profile":Lcom/amazon/identity/auth/device/dataobject/Profile;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/amazon/identity/auth/device/dataobject/Profile;->hasExpired()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 106
    :cond_0
    sget-object v4, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->TAG:Ljava/lang/String;

    const-string v5, "Local profile information does not exist, or has expired"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    :goto_0
    return-object v3

    .line 110
    :cond_1
    :try_start_0
    invoke-virtual {v1}, Lcom/amazon/identity/auth/device/dataobject/Profile;->getDataAsBundle()Landroid/os/Bundle;
    :try_end_0
    .catch Lcom/amazon/identity/auth/device/AuthError; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 111
    :catch_0
    move-exception v0

    .line 112
    .local v0, "e":Lcom/amazon/identity/auth/device/AuthError;
    sget-object v4, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->TAG:Ljava/lang/String;

    const-string v5, "Local profile information invalid"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private static getProfileRemote(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "authzToken"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 119
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->TAG:Ljava/lang/String;

    const-string v1, "Fetching remote profile information"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 120
    sget-object v0, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->mServerCommunication:Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;

    invoke-virtual {v0, p0, p1}, Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;->getProfile(Landroid/content/Context;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method

.method static setServerCommunication(Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;)V
    .locals 0
    .param p0, "serverCommunication"    # Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;

    .prologue
    .line 150
    sput-object p0, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->mServerCommunication:Lcom/amazon/identity/auth/device/endpoint/ServerCommunication;

    .line 151
    return-void
.end method

.method private static updateProfileLocal(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "profileData"    # Lorg/json/JSONObject;

    .prologue
    .line 124
    sget-object v1, Lcom/amazon/identity/auth/device/authorization/ProfileHelper;->TAG:Ljava/lang/String;

    const-string v2, "Updating local profile information"

    invoke-static {v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 125
    invoke-static {p0}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;

    move-result-object v0

    .line 126
    .local v0, "profileDataSource":Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;
    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->deleteAllRows()I

    .line 127
    new-instance v1, Lcom/amazon/identity/auth/device/dataobject/Profile;

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, p1, v2}, Lcom/amazon/identity/auth/device/dataobject/Profile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->insertRow(Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;)J

    .line 128
    return-void
.end method
