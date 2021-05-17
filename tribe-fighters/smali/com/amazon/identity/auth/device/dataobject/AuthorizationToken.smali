.class public abstract Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
.super Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;
.source "AuthorizationToken.java"

# interfaces
.implements Lcom/amazon/identity/auth/device/token/Token;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;,
        Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;
    }
.end annotation


# static fields
.field public static final ALL_COLUMNS:[Ljava/lang/String;

.field private static final LOG_TAG:Ljava/lang/String;

.field private static final PRE_EXPIRATION_PERIOD:I = 0x12c


# instance fields
.field protected mAppFamilyId:Ljava/lang/String;

.field protected mCreationTime:Ljava/util/Date;

.field private mDirectedId:Ljava/lang/String;

.field protected mExpirationTime:Ljava/util/Date;

.field protected mMiscData:[B

.field protected mTokenValue:Ljava/lang/String;

.field protected mType:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 28
    const-class v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->LOG_TAG:Ljava/lang/String;

    .line 31
    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "AppId"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "Token"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "CreationTime"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "ExpirationTime"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "MiscData"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "type"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "directedId"

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->ALL_COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 86
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;Ljava/util/Date;[BLcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;)V
    .locals 1
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "directedId"    # Ljava/lang/String;
    .param p3, "tokenValue"    # Ljava/lang/String;
    .param p4, "creationTime"    # Ljava/util/Date;
    .param p5, "expirationTime"    # Ljava/util/Date;
    .param p6, "miscData"    # [B
    .param p7, "type"    # Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;-><init>()V

    .line 76
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mAppFamilyId:Ljava/lang/String;

    .line 77
    iput-object p3, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mTokenValue:Ljava/lang/String;

    .line 79
    invoke-static {p4}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->truncateFractionalSeconds(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mCreationTime:Ljava/util/Date;

    .line 80
    invoke-static {p5}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->truncateFractionalSeconds(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mExpirationTime:Ljava/util/Date;

    .line 81
    iput-object p6, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mMiscData:[B

    .line 82
    iput-object p7, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mType:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    .line 83
    iput-object p2, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mDirectedId:Ljava/lang/String;

    .line 84
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 160
    if-eqz p1, :cond_0

    instance-of v4, p1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;

    if-eqz v4, :cond_0

    .line 162
    :try_start_0
    move-object v0, p1

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;

    move-object v2, v0

    .line 163
    .local v2, "token":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    iget-object v4, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mAppFamilyId:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->getAppFamilyId()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mTokenValue:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->getTokenValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mCreationTime:Ljava/util/Date;

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->getCreationTime()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->areObjectsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mExpirationTime:Ljava/util/Date;

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->getExpirationTime()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->areObjectsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->getType()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mDirectedId:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->getDirectedId()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_0

    const/4 v3, 0x1

    .line 174
    .end local v2    # "token":Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;
    :cond_0
    :goto_0
    return v3

    .line 169
    :catch_0
    move-exception v1

    .line 170
    .local v1, "e":Ljava/lang/NullPointerException;
    sget-object v4, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, ""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/NullPointerException;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public getAppFamilyId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mAppFamilyId:Ljava/lang/String;

    return-object v0
.end method

.method public getCreationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mCreationTime:Ljava/util/Date;

    return-object v0
.end method

.method public getData()Ljava/util/Map;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 203
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 204
    .local v4, "results":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v5, 0x0

    .line 206
    .local v5, "str":Ljava/lang/String;
    :try_start_0
    new-instance v6, Ljava/lang/String;

    iget-object v7, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mMiscData:[B

    const-string v8, "UTF8"

    invoke-direct {v6, v7, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .end local v5    # "str":Ljava/lang/String;
    .local v6, "str":Ljava/lang/String;
    move-object v5, v6

    .line 210
    .end local v6    # "str":Ljava/lang/String;
    .restart local v5    # "str":Ljava/lang/String;
    :goto_0
    if-eqz v5, :cond_1

    .line 212
    const-string v7, ","

    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 213
    .local v0, "data":[Ljava/lang/String;
    array-length v3, v0

    .line 214
    .local v3, "length":I
    rem-int/lit8 v7, v3, 0x2

    if-nez v7, :cond_0

    .line 216
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_1
    if-ge v2, v3, :cond_1

    .line 218
    aget-object v7, v0, v2

    add-int/lit8 v8, v2, 0x1

    aget-object v8, v0, v8

    invoke-interface {v4, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    add-int/lit8 v2, v2, 0x2

    goto :goto_1

    .line 207
    .end local v0    # "data":[Ljava/lang/String;
    .end local v2    # "i":I
    .end local v3    # "length":I
    :catch_0
    move-exception v1

    .line 208
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    sget-object v7, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->LOG_TAG:Ljava/lang/String;

    const-string v8, "unable to parse misc data"

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 223
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v0    # "data":[Ljava/lang/String;
    .restart local v3    # "length":I
    :cond_0
    sget-object v7, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->LOG_TAG:Ljava/lang/String;

    const-string v8, "unable to parse misc data, key/value pairs do not match"

    invoke-static {v7, v8}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    .end local v0    # "data":[Ljava/lang/String;
    .end local v3    # "length":I
    :cond_1
    return-object v4
.end method

.method public bridge synthetic getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;
    .locals 1
    .param p1, "x0"    # Landroid/content/Context;

    .prologue
    .line 24
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;

    move-result-object v0

    return-object v0
.end method

.method public getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 155
    invoke-static {p1}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;

    move-result-object v0

    return-object v0
.end method

.method public getDirectedId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mDirectedId:Ljava/lang/String;

    return-object v0
.end method

.method public getExpirationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mExpirationTime:Ljava/util/Date;

    return-object v0
.end method

.method public getId()J
    .locals 2

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->getRowId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getLocalTimestamp()Landroid/text/format/Time;
    .locals 3

    .prologue
    .line 196
    new-instance v0, Landroid/text/format/Time;

    invoke-direct {v0}, Landroid/text/format/Time;-><init>()V

    .line 197
    .local v0, "time":Landroid/text/format/Time;
    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mCreationTime:Ljava/util/Date;

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Landroid/text/format/Time;->set(J)V

    .line 198
    return-object v0
.end method

.method public getMiscData()[B
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mMiscData:[B

    return-object v0
.end method

.method public getTokenValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 93
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mTokenValue:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mType:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTypeAsEnum()Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mType:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    return-object v0
.end method

.method public getValuesForInsert()Landroid/content/ContentValues;
    .locals 4

    .prologue
    .line 139
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 141
    .local v0, "to_return":Landroid/content/ContentValues;
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->APP_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mAppFamilyId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->TOKEN:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mTokenValue:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->CREATION_TIME:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    sget-object v2, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->ISO8601:Ljava/text/SimpleDateFormat;

    iget-object v3, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mCreationTime:Ljava/util/Date;

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->EXPIRATION_TIME:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    sget-object v2, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->ISO8601:Ljava/text/SimpleDateFormat;

    iget-object v3, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mExpirationTime:Ljava/util/Date;

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->MISC_DATA:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mMiscData:[B

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 146
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->TYPE:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mType:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;->ordinal()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 147
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->DIRECTED_ID:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mDirectedId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    return-object v0
.end method

.method public isRemainingLifeAcceptable()Z
    .locals 6

    .prologue
    .line 133
    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mExpirationTime:Ljava/util/Date;

    invoke-virtual {v2}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    sub-long v0, v2, v4

    .line 134
    .local v0, "currentLifeRemaining":J
    const-wide/16 v2, 0x12c

    invoke-static {v2, v3}, Lcom/amazon/identity/auth/device/token/AbstractToken;->secsToMillis(J)J

    move-result-wide v2

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public setAppFamilyId(Ljava/lang/String;)V
    .locals 0
    .param p1, "appId"    # Ljava/lang/String;

    .prologue
    .line 103
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mAppFamilyId:Ljava/lang/String;

    return-void
.end method

.method public setCreationTime(Ljava/util/Date;)V
    .locals 1
    .param p1, "creationTime"    # Ljava/util/Date;

    .prologue
    .line 118
    invoke-static {p1}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->truncateFractionalSeconds(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mCreationTime:Ljava/util/Date;

    .line 119
    return-void
.end method

.method public setDirectedId(Ljava/lang/String;)V
    .locals 0
    .param p1, "mDirectedId"    # Ljava/lang/String;

    .prologue
    .line 114
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mDirectedId:Ljava/lang/String;

    return-void
.end method

.method public setExpirationTime(Ljava/util/Date;)V
    .locals 1
    .param p1, "expirationTime"    # Ljava/util/Date;

    .prologue
    .line 123
    invoke-static {p1}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->truncateFractionalSeconds(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mExpirationTime:Ljava/util/Date;

    .line 124
    return-void
.end method

.method public setId(J)V
    .locals 0
    .param p1, "id"    # J

    .prologue
    .line 101
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->setRowId(J)V

    return-void
.end method

.method public setMiscData([B)V
    .locals 0
    .param p1, "miscData"    # [B

    .prologue
    .line 126
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mMiscData:[B

    return-void
.end method

.method public setTokenValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "tokenValue"    # Ljava/lang/String;

    .prologue
    .line 105
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mTokenValue:Ljava/lang/String;

    return-void
.end method

.method public toLogString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 185
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{ rowid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", appId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mAppFamilyId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", token="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mTokenValue:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", creationTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->ISO8601:Ljava/text/SimpleDateFormat;

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mCreationTime:Ljava/util/Date;

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", expirationTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->ISO8601:Ljava/text/SimpleDateFormat;

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mExpirationTime:Ljava/util/Date;

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", type="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mType:Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;

    invoke-virtual {v1}, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken$AUTHZ_TOKEN_TYPE;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", directedId=<obscured> }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 180
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/AuthorizationToken;->mTokenValue:Ljava/lang/String;

    return-object v0
.end method
