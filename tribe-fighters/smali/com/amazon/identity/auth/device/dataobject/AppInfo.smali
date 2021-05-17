.class public Lcom/amazon/identity/auth/device/dataobject/AppInfo;
.super Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;
.source "AppInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;
    }
.end annotation


# static fields
.field public static final ALL_COLUMNS:[Ljava/lang/String;

.field public static final DELIM:Ljava/lang/String; = ","

.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field private allowedScopes:[Ljava/lang/String;

.field private appFamilyId:Ljava/lang/String;

.field private appVariantId:Ljava/lang/String;

.field private clientId:Ljava/lang/String;

.field private grantedPermissions:[Ljava/lang/String;

.field private packageName:Ljava/lang/String;

.field private payload:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 25
    const-class v0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->LOG_TAG:Ljava/lang/String;

    .line 28
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "rowid"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "AppFamilyId"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "PackageName"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "AllowedScopes"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "GrantedPermissions"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "ClientId"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "AppVariantId"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "Payload"

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->ALL_COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;-><init>()V

    return-void
.end method

.method private constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "rowid"    # J
    .param p3, "appFamilyId"    # Ljava/lang/String;
    .param p4, "appVariantId"    # Ljava/lang/String;
    .param p5, "packageName"    # Ljava/lang/String;
    .param p6, "allowedScopes"    # [Ljava/lang/String;
    .param p7, "grantedPermissions"    # [Ljava/lang/String;
    .param p8, "clientId"    # Ljava/lang/String;
    .param p9, "payload"    # Lorg/json/JSONObject;

    .prologue
    .line 65
    move-object v0, p0

    move-object v1, p3

    move-object v2, p4

    move-object v3, p5

    move-object v4, p6

    move-object v5, p7

    move-object/from16 v6, p8

    move-object/from16 v7, p9

    invoke-direct/range {v0 .. v7}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 66
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->setRowId(J)V

    .line 67
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "appFamilyId"    # Ljava/lang/String;
    .param p2, "appVariantId"    # Ljava/lang/String;
    .param p3, "packageName"    # Ljava/lang/String;
    .param p4, "allowedScopes"    # [Ljava/lang/String;
    .param p5, "grantedPermissions"    # [Ljava/lang/String;
    .param p6, "clientId"    # Ljava/lang/String;
    .param p7, "payload"    # Lorg/json/JSONObject;

    .prologue
    .line 54
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appFamilyId:Ljava/lang/String;

    .line 56
    iput-object p2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appVariantId:Ljava/lang/String;

    .line 57
    iput-object p3, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->packageName:Ljava/lang/String;

    .line 58
    iput-object p4, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->allowedScopes:[Ljava/lang/String;

    .line 59
    iput-object p5, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->grantedPermissions:[Ljava/lang/String;

    .line 60
    iput-object p6, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->clientId:Ljava/lang/String;

    .line 61
    iput-object p7, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->payload:Lorg/json/JSONObject;

    .line 62
    return-void
.end method

.method private getPayload()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->payload:Lorg/json/JSONObject;

    return-object v0
.end method

.method private payloadEquals(Lcom/amazon/identity/auth/device/dataobject/AppInfo;)Z
    .locals 9
    .param p1, "appInfo"    # Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 187
    invoke-direct {p1}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getPayload()Lorg/json/JSONObject;

    move-result-object v4

    .line 188
    .local v4, "otherPayload":Lorg/json/JSONObject;
    iget-object v7, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->payload:Lorg/json/JSONObject;

    if-nez v7, :cond_2

    .line 189
    if-nez v4, :cond_1

    :goto_0
    move v6, v5

    .line 212
    :cond_0
    :goto_1
    return v6

    :cond_1
    move v5, v6

    .line 189
    goto :goto_0

    .line 191
    :cond_2
    if-eqz v4, :cond_0

    .line 195
    iget-object v7, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->payload:Lorg/json/JSONObject;

    invoke-virtual {v7}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 197
    .local v1, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 198
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 200
    .local v3, "key":Ljava/lang/String;
    :try_start_0
    iget-object v7, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->payload:Lorg/json/JSONObject;

    invoke-virtual {v7, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 201
    sget-object v5, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "APIKeys not equal: key "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " not equal"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_1

    .line 204
    :catch_0
    move-exception v2

    .line 205
    .local v2, "jsone":Lorg/json/JSONException;
    sget-object v5, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->LOG_TAG:Ljava/lang/String;

    const-string v7, "APIKeys not equal: JSONException"

    invoke-static {v5, v7, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 207
    .end local v2    # "jsone":Lorg/json/JSONException;
    :catch_1
    move-exception v0

    .line 208
    .local v0, "cce":Ljava/lang/ClassCastException;
    sget-object v5, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->LOG_TAG:Ljava/lang/String;

    const-string v7, "APIKeys not equal: ClassCastExceptionException"

    invoke-static {v5, v7, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .end local v0    # "cce":Ljava/lang/ClassCastException;
    .end local v3    # "key":Ljava/lang/String;
    :cond_4
    move v6, v5

    .line 212
    goto :goto_1
.end method


# virtual methods
.method public clone()Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    .locals 10

    .prologue
    .line 217
    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getRowId()J

    move-result-wide v1

    iget-object v3, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appFamilyId:Ljava/lang/String;

    iget-object v4, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appVariantId:Ljava/lang/String;

    iget-object v5, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->packageName:Ljava/lang/String;

    iget-object v6, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->allowedScopes:[Ljava/lang/String;

    iget-object v7, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->grantedPermissions:[Ljava/lang/String;

    iget-object v8, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->clientId:Ljava/lang/String;

    iget-object v9, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->payload:Lorg/json/JSONObject;

    invoke-direct/range {v0 .. v9}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .prologue
    .line 23
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->clone()Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 171
    instance-of v2, p1, Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 172
    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;

    .line 173
    .local v0, "appInfo":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appFamilyId:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAppFamilyId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appVariantId:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAppVariantId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->allowedScopes:[Ljava/lang/String;

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAllowedScopes()[Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->grantedPermissions:[Ljava/lang/String;

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getGrantedPermissions()[Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->clientId:Ljava/lang/String;

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getClientId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-direct {p0, v0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->payloadEquals(Lcom/amazon/identity/auth/device/dataobject/AppInfo;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    .line 182
    .end local v0    # "appInfo":Lcom/amazon/identity/auth/device/dataobject/AppInfo;
    :cond_0
    return v1
.end method

.method public getAllowedRemoteScopes()[Ljava/lang/String;
    .locals 6

    .prologue
    .line 112
    iget-object v5, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->allowedScopes:[Ljava/lang/String;

    if-nez v5, :cond_0

    .line 113
    const/4 v5, 0x0

    .line 122
    :goto_0
    return-object v5

    .line 116
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 117
    .local v4, "to_return":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->allowedScopes:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_1
    if-ge v1, v2, :cond_2

    aget-object v3, v0, v1

    .line 118
    .local v3, "scope":Ljava/lang/String;
    invoke-static {v3}, Lcom/amazon/identity/auth/device/dataobject/Scope;->isLocal(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 119
    invoke-interface {v4, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 117
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 122
    .end local v3    # "scope":Ljava/lang/String;
    :cond_2
    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-interface {v4, v5}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/String;

    goto :goto_0
.end method

.method public getAllowedScopes()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->allowedScopes:[Ljava/lang/String;

    return-object v0
.end method

.method public getAppFamilyId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appFamilyId:Ljava/lang/String;

    return-object v0
.end method

.method public getAppVariantId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appVariantId:Ljava/lang/String;

    return-object v0
.end method

.method public getAttributeByKey(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 132
    :try_start_0
    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->payload:Lorg/json/JSONObject;

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 134
    :goto_0
    return-object v1

    .line 133
    :catch_0
    move-exception v0

    .line 134
    .local v0, "e":Lorg/json/JSONException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getClientId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->clientId:Ljava/lang/String;

    return-object v0
.end method

.method public bridge synthetic getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;
    .locals 1
    .param p1, "x0"    # Landroid/content/Context;

    .prologue
    .line 23
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;

    move-result-object v0

    return-object v0
.end method

.method public getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 166
    invoke-static {p1}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;

    move-result-object v0

    return-object v0
.end method

.method public getGrantedPermissions()[Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->grantedPermissions:[Ljava/lang/String;

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method public getValuesForInsert()Landroid/content/ContentValues;
    .locals 4

    .prologue
    .line 149
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 151
    .local v0, "to_return":Landroid/content/ContentValues;
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appFamilyId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->PACKAGE_NAME:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->ALLOWED_SCOPES:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->allowedScopes:[Ljava/lang/String;

    const-string v3, ","

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->toDelimitedString([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 154
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->GRANTED_PERMISSIONS:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->grantedPermissions:[Ljava/lang/String;

    const-string v3, ","

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/utils/MAPUtils;->toDelimitedString([Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->CLIENT_ID:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->clientId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->APP_VARIANT_ID:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appVariantId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->PAYLOAD:Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AppInfo$COL_INDEX;->colId:I

    aget-object v2, v1, v2

    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->payload:Lorg/json/JSONObject;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->payload:Lorg/json/JSONObject;

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 160
    return-object v0

    .line 158
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 2

    .prologue
    .line 143
    const-string v1, "ver"

    invoke-virtual {p0, v1}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getAttributeByKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 144
    .local v0, "version":Ljava/lang/String;
    if-eqz v0, :cond_0

    .end local v0    # "version":Ljava/lang/String;
    :goto_0
    return-object v0

    .restart local v0    # "version":Ljava/lang/String;
    :cond_0
    const-string v0, "1"

    goto :goto_0
.end method

.method public setAllowedScopes([Ljava/lang/String;)V
    .locals 0
    .param p1, "allowedScopes"    # [Ljava/lang/String;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->allowedScopes:[Ljava/lang/String;

    return-void
.end method

.method public setAppFamilyId(Ljava/lang/String;)V
    .locals 0
    .param p1, "appFamilyId"    # Ljava/lang/String;

    .prologue
    .line 86
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appFamilyId:Ljava/lang/String;

    return-void
.end method

.method public setAppVariantId(Ljava/lang/String;)V
    .locals 0
    .param p1, "appVariantId"    # Ljava/lang/String;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appVariantId:Ljava/lang/String;

    return-void
.end method

.method public setClientId(Ljava/lang/String;)V
    .locals 0
    .param p1, "clientId"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->clientId:Ljava/lang/String;

    return-void
.end method

.method public setGrantedPermissions([Ljava/lang/String;)V
    .locals 0
    .param p1, "grantedPermissions"    # [Ljava/lang/String;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->grantedPermissions:[Ljava/lang/String;

    return-void
.end method

.method public setPackageName(Ljava/lang/String;)V
    .locals 0
    .param p1, "packageName"    # Ljava/lang/String;

    .prologue
    .line 90
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->packageName:Ljava/lang/String;

    return-void
.end method

.method public setPayload(Ljava/lang/String;)V
    .locals 3
    .param p1, "payloadString"    # Ljava/lang/String;

    .prologue
    .line 102
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->payload:Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    :goto_0
    return-void

    .line 103
    :catch_0
    move-exception v0

    .line 104
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->LOG_TAG:Ljava/lang/String;

    const-string v2, "Payload String not correct JSON.  Setting payload to null"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0
.end method

.method public setPayload(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "payload"    # Lorg/json/JSONObject;

    .prologue
    .line 98
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->payload:Lorg/json/JSONObject;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 223
    :try_start_0
    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->payload:Lorg/json/JSONObject;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 226
    :goto_0
    return-object v1

    .line 225
    :catch_0
    move-exception v0

    .line 226
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "{ rowid="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->getRowId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", appFamilyId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appFamilyId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", appVariantId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->appVariantId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", packageName="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->packageName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", allowedScopes="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->allowedScopes:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", grantedPermissions="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->grantedPermissions:[Ljava/lang/String;

    invoke-static {v2}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", clientId="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AppInfo;->clientId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " }"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
