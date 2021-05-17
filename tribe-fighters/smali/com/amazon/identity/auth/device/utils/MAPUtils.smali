.class public final Lcom/amazon/identity/auth/device/utils/MAPUtils;
.super Ljava/lang/Object;
.source "MAPUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;
    }
.end annotation


# static fields
.field private static final AMAZON_HOST:Ljava/lang/String; = ".amazon."

.field private static final LOG_TAG:Ljava/lang/String;

.field private static MAPdatabase:Landroid/database/sqlite/SQLiteDatabase; = null

.field private static final PATH_AP:Ljava/lang/String; = "/ap/"

.field private static final PATH_AP_FORGOT_PASSWORD:Ljava/lang/String; = "/ap/forgotpassword"

.field private static final PATH_GP:Ljava/lang/String; = "/gp/yourstore/home"

.field private static final PROTOCOL:Ljava/lang/String; = "http"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/amazon/identity/auth/device/utils/MAPUtils;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/utils/MAPUtils;->LOG_TAG:Ljava/lang/String;

    .line 34
    const/4 v0, 0x0

    sput-object v0, Lcom/amazon/identity/auth/device/utils/MAPUtils;->MAPdatabase:Landroid/database/sqlite/SQLiteDatabase;

    return-void
.end method

.method private constructor <init>()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Ljava/lang/Exception;

    const-string v1, "This class is not instantiable!"

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static areScopesLocalAndValid(Lcom/amazon/identity/auth/device/dataobject/AppInfo;[Ljava/lang/String;)Z
    .locals 1
    .param p0, "appInfo"    # Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .param p1, "scopes"    # [Ljava/lang/String;

    .prologue
    .line 152
    sget-object v0, Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;->LOCAL:Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;

    invoke-static {p0, p1, v0}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->areScopesValid(Lcom/amazon/identity/auth/device/dataobject/AppInfo;[Ljava/lang/String;Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;)Z

    move-result v0

    return v0
.end method

.method public static areScopesRemoteAndValid(Lcom/amazon/identity/auth/device/dataobject/AppInfo;[Ljava/lang/String;)Z
    .locals 1
    .param p0, "appInfo"    # Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .param p1, "scopes"    # [Ljava/lang/String;

    .prologue
    .line 138
    sget-object v0, Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;->REMOTE:Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;

    invoke-static {p0, p1, v0}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->areScopesValid(Lcom/amazon/identity/auth/device/dataobject/AppInfo;[Ljava/lang/String;Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;)Z

    move-result v0

    return v0
.end method

.method public static areScopesValid(Lcom/amazon/identity/auth/device/dataobject/AppInfo;[Ljava/lang/String;)Z
    .locals 1
    .param p0, "appInfo"    # Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .param p1, "scopes"    # [Ljava/lang/String;

    .prologue
    .line 166
    sget-object v0, Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;->ALL:Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;

    invoke-static {p0, p1, v0}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->areScopesValid(Lcom/amazon/identity/auth/device/dataobject/AppInfo;[Ljava/lang/String;Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;)Z

    move-result v0

    return v0
.end method

.method private static areScopesValid(Lcom/amazon/identity/auth/device/dataobject/AppInfo;[Ljava/lang/String;Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;)Z
    .locals 9
    .param p0, "appInfo"    # Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .param p1, "scopes"    # [Ljava/lang/String;
    .param p2, "modifier"    # Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;

    .prologue
    const/4 v5, 0x0

    .line 170
    sget-object v6, Lcom/amazon/identity/auth/device/utils/MAPUtils;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "areScopesValid : modifier="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p2}, Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;->name()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " scopes="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {p1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    if-eqz p1, :cond_0

    array-length v6, p1

    if-nez v6, :cond_1

    .line 173
    :cond_0
    sget-object v6, Lcom/amazon/identity/auth/device/utils/MAPUtils;->LOG_TAG:Ljava/lang/String;

    const-string v7, "Scopes are invalid: array is either null or empty"

    invoke-static {v6, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 203
    :goto_0
    return v5

    .line 176
    :cond_1
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAllowedScopes()[Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_3

    .line 177
    :cond_2
    sget-object v6, Lcom/amazon/identity/auth/device/utils/MAPUtils;->LOG_TAG:Ljava/lang/String;

    const-string v7, "Scopes are invalid: either appInfo is null or allowedScopes is null"

    invoke-static {v6, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 181
    :cond_3
    new-instance v0, Ljava/util/HashSet;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAllowedScopes()[Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    invoke-direct {v0, v6}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 182
    .local v0, "allowedScopeSet":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    sget-object v6, Lcom/amazon/identity/auth/device/utils/MAPUtils;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "allowedScopeSet : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    move-object v1, p1

    .local v1, "arr$":[Ljava/lang/String;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v3, :cond_8

    aget-object v4, v1, v2

    .line 186
    .local v4, "scope":Ljava/lang/String;
    if-eqz v4, :cond_4

    invoke-interface {v0, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_5

    .line 187
    :cond_4
    sget-object v6, Lcom/amazon/identity/auth/device/utils/MAPUtils;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid scope: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " (it\'s either null or not part of the allowed set)"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 192
    :cond_5
    sget-object v6, Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;->REMOTE:Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;

    if-ne p2, v6, :cond_6

    invoke-static {v4}, Lcom/amazon/identity/auth/device/dataobject/Scope;->isLocal(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_6

    .line 193
    sget-object v6, Lcom/amazon/identity/auth/device/utils/MAPUtils;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid scope: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is local!"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 198
    :cond_6
    sget-object v6, Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;->LOCAL:Lcom/amazon/identity/auth/device/utils/MAPUtils$SCOPE_MODIFIER;

    if-ne p2, v6, :cond_7

    invoke-static {v4}, Lcom/amazon/identity/auth/device/dataobject/Scope;->isLocal(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_7

    .line 199
    sget-object v6, Lcom/amazon/identity/auth/device/utils/MAPUtils;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid scope: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " is remote!"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    :cond_7
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 203
    .end local v4    # "scope":Ljava/lang/String;
    :cond_8
    const/4 v5, 0x1

    goto/16 :goto_0
.end method

.method public static contains([Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6
    .param p0, "ary"    # [Ljava/lang/String;
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 114
    if-nez p0, :cond_1

    .line 124
    :cond_0
    :goto_0
    return v4

    .line 118
    :cond_1
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1
    if-ge v1, v2, :cond_0

    aget-object v3, v0, v1

    .line 119
    .local v3, "tmp":Ljava/lang/String;
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 120
    const/4 v4, 0x1

    goto :goto_0

    .line 118
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1
.end method

.method public static getDeviceId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 55
    const-string v0, "some-device-id"

    return-object v0
.end method

.method public static declared-synchronized getMAPdatabase(Landroid/content/Context;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 44
    const-class v1, Lcom/amazon/identity/auth/device/utils/MAPUtils;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/amazon/identity/auth/device/utils/MAPUtils;->MAPdatabase:Landroid/database/sqlite/SQLiteDatabase;

    if-nez v0, :cond_0

    .line 45
    new-instance v0, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;

    invoke-direct {v0, p0}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/utils/MAPUtils;->MAPdatabase:Landroid/database/sqlite/SQLiteDatabase;

    .line 47
    :cond_0
    sget-object v0, Lcom/amazon/identity/auth/device/utils/MAPUtils;->MAPdatabase:Landroid/database/sqlite/SQLiteDatabase;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 44
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getSetDifference([Ljava/lang/String;[Ljava/lang/String;)Ljava/util/Set;
    .locals 2
    .param p0, "setA"    # [Ljava/lang/String;
    .param p1, "setB"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 97
    if-nez p0, :cond_0

    .line 98
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 106
    :goto_0
    return-object v0

    .line 100
    :cond_0
    if-nez p1, :cond_1

    .line 101
    new-instance v0, Ljava/util/HashSet;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    goto :goto_0

    .line 104
    :cond_1
    new-instance v0, Ljava/util/HashSet;

    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 105
    .local v0, "to_return":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->removeAll(Ljava/util/Collection;)Z

    goto :goto_0
.end method

.method public static isMAPUrl(Ljava/lang/String;)Z
    .locals 14
    .param p0, "url"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    .line 231
    if-nez p0, :cond_1

    .line 233
    sget-object v10, Lcom/amazon/identity/auth/device/utils/MAPUtils;->LOG_TAG:Ljava/lang/String;

    const-string v11, "URL is null"

    invoke-static {v10, v11}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 268
    :cond_0
    :goto_0
    return v9

    .line 237
    :cond_1
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    .line 243
    .local v0, "aURL":Ljava/net/URL;
    invoke-virtual {v0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v8

    .line 244
    .local v8, "protocol":Ljava/lang/String;
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_0

    const-string v10, "http"

    invoke-virtual {v8, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 246
    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 247
    .local v2, "host":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v10

    if-nez v10, :cond_0

    const-string v10, ".amazon."

    invoke-virtual {v2, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 249
    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 250
    .local v4, "path":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    .line 251
    .local v3, "isPathEmpty":Z
    const-string v10, "/ap/"

    invoke-virtual {v4, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    .line 252
    .local v7, "pathStartsWithAP":Z
    const-string v10, "/gp/yourstore/home"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    .line 253
    .local v6, "pathEqualsGP":Z
    const-string v10, "/ap/forgotpassword"

    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    .line 254
    .local v5, "pathEqualsAPForgotPassword":Z
    sget-object v10, Lcom/amazon/identity/auth/device/utils/MAPUtils;->LOG_TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, " isEmpty="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "startsWithAP="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "equalsGP="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "equalsForgotPassword="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 259
    if-nez v3, :cond_0

    if-eqz v7, :cond_2

    if-eqz v5, :cond_3

    :cond_2
    if-eqz v6, :cond_0

    .line 263
    :cond_3
    const/4 v9, 0x1

    goto/16 :goto_0

    .line 238
    .end local v0    # "aURL":Ljava/net/URL;
    .end local v2    # "host":Ljava/lang/String;
    .end local v3    # "isPathEmpty":Z
    .end local v4    # "path":Ljava/lang/String;
    .end local v5    # "pathEqualsAPForgotPassword":Z
    .end local v6    # "pathEqualsGP":Z
    .end local v7    # "pathStartsWithAP":Z
    .end local v8    # "protocol":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 239
    .local v1, "e":Ljava/net/MalformedURLException;
    sget-object v10, Lcom/amazon/identity/auth/device/utils/MAPUtils;->LOG_TAG:Ljava/lang/String;

    const-string v11, "MalformedURLException"

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, " url="

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v10, v11, v12}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0
.end method

.method public static toDelimitedString([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "ary"    # [Ljava/lang/String;
    .param p1, "delimiter"    # Ljava/lang/String;

    .prologue
    .line 65
    if-eqz p0, :cond_1

    array-length v2, p0

    if-lez v2, :cond_1

    .line 66
    const-string v1, ""

    .line 68
    .local v1, "to_return":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p0

    if-ge v0, v2, :cond_2

    .line 69
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p0, v0

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    array-length v2, p0

    add-int/lit8 v2, v2, -0x1

    if-ne v0, v2, :cond_0

    const-string v2, ""

    :goto_1
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 68
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    move-object v2, p1

    .line 69
    goto :goto_1

    .line 73
    .end local v0    # "i":I
    .end local v1    # "to_return":Ljava/lang/String;
    :cond_1
    const/4 v1, 0x0

    .line 76
    .restart local v1    # "to_return":Ljava/lang/String;
    :cond_2
    return-object v1
.end method

.method public static toHexString([B)Ljava/lang/String;
    .locals 5
    .param p0, "data"    # [B

    .prologue
    .line 211
    if-nez p0, :cond_0

    .line 212
    const/4 v3, 0x0

    .line 225
    :goto_0
    return-object v3

    .line 215
    :cond_0
    new-instance v1, Ljava/lang/StringBuffer;

    invoke-direct {v1}, Ljava/lang/StringBuffer;-><init>()V

    .line 217
    .local v1, "hexString":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    array-length v3, p0

    if-ge v2, v3, :cond_2

    .line 218
    aget-byte v3, p0, v2

    and-int/lit16 v3, v3, 0xff

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 219
    .local v0, "appendString":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_1

    .line 220
    const-string v3, "0"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 222
    :cond_1
    invoke-virtual {v1, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 217
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 225
    .end local v0    # "appendString":Ljava/lang/String;
    :cond_2
    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public static toStringArray(Ljava/lang/String;Ljava/lang/String;)[Ljava/lang/String;
    .locals 3
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "delimiter"    # Ljava/lang/String;

    .prologue
    .line 84
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
