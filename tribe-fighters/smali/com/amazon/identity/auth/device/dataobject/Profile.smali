.class public Lcom/amazon/identity/auth/device/dataobject/Profile;
.super Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;
.source "Profile.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;
    }
.end annotation


# static fields
.field public static final ALL_COLUMNS:[Ljava/lang/String;

.field private static final EXPIRATION_TIME:I = 0x36ee80

.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field protected mAppFamilyId:Ljava/lang/String;

.field protected mData:Ljava/lang/String;

.field protected mExpirationTime:Ljava/util/Date;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 22
    const-class v0, Lcom/amazon/identity/auth/device/dataobject/Profile;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/Profile;->LOG_TAG:Ljava/lang/String;

    .line 35
    const/4 v0, 0x4

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "Id"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "ExpirationTime"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "AppId"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "Data"

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/Profile;->ALL_COLUMNS:[Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "appFamilyId"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;

    .prologue
    .line 52
    new-instance v0, Ljava/util/Date;

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    const-wide/32 v3, 0x36ee80

    add-long/2addr v1, v3

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-direct {p0, p1, p2, v0}, Lcom/amazon/identity/auth/device/dataobject/Profile;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V

    .line 53
    return-void
.end method

.method constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Date;)V
    .locals 0
    .param p1, "appId"    # Ljava/lang/String;
    .param p2, "data"    # Ljava/lang/String;
    .param p3, "expirationTime"    # Ljava/util/Date;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;-><init>()V

    .line 56
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mAppFamilyId:Ljava/lang/String;

    .line 57
    iput-object p2, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mData:Ljava/lang/String;

    .line 58
    iput-object p3, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mExpirationTime:Ljava/util/Date;

    .line 59
    return-void
.end method

.method private dataEquals(Lcom/amazon/identity/auth/device/dataobject/Profile;)Z
    .locals 8
    .param p1, "profile"    # Lcom/amazon/identity/auth/device/dataobject/Profile;

    .prologue
    .line 186
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    iget-object v6, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mData:Ljava/lang/String;

    invoke-direct {v2, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 187
    .local v2, "json":Lorg/json/JSONObject;
    new-instance v0, Lorg/json/JSONObject;

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/dataobject/Profile;->getData()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v0, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 189
    .local v0, "argJSON":Lorg/json/JSONObject;
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    .line 190
    .local v4, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 192
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 193
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 194
    .local v5, "value":Ljava/lang/String;
    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-nez v6, :cond_0

    .line 195
    const/4 v6, 0x0

    .line 201
    .end local v0    # "argJSON":Lorg/json/JSONObject;
    .end local v2    # "json":Lorg/json/JSONObject;
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v5    # "value":Ljava/lang/String;
    :goto_0
    return v6

    .line 198
    .restart local v0    # "argJSON":Lorg/json/JSONObject;
    .restart local v2    # "json":Lorg/json/JSONObject;
    .restart local v4    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    const/4 v6, 0x1

    goto :goto_0

    .line 200
    .end local v0    # "argJSON":Lorg/json/JSONObject;
    .end local v2    # "json":Lorg/json/JSONObject;
    .end local v4    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 201
    .local v1, "e":Ljava/lang/Exception;
    iget-object v6, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mData:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/amazon/identity/auth/device/dataobject/Profile;->getData()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v6

    goto :goto_0
.end method

.method private getDataFromJSON()Landroid/os/Bundle;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 156
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 157
    .local v0, "data":Landroid/os/Bundle;
    iget-object v6, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mData:Ljava/lang/String;

    if-eqz v6, :cond_0

    .line 159
    const/4 v2, 0x0

    .line 161
    .local v2, "json":Lorg/json/JSONObject;
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .end local v2    # "json":Lorg/json/JSONObject;
    iget-object v6, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mData:Ljava/lang/String;

    invoke-direct {v2, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 169
    .restart local v2    # "json":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    .line 170
    .local v4, "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 172
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 173
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 174
    .local v5, "value":Ljava/lang/String;
    invoke-virtual {v0, v3, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 176
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "keys":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v5    # "value":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 177
    .local v1, "e":Lorg/json/JSONException;
    sget-object v6, Lcom/amazon/identity/auth/device/dataobject/Profile;->LOG_TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unable to parse profile data in database "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v1}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "json":Lorg/json/JSONObject;
    :cond_0
    return-object v0

    .line 162
    :catch_1
    move-exception v1

    .line 163
    .restart local v1    # "e":Lorg/json/JSONException;
    sget-object v6, Lcom/amazon/identity/auth/device/dataobject/Profile;->LOG_TAG:Ljava/lang/String;

    const-string v7, "JSONException while parsing profile information in database"

    invoke-static {v6, v7, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 164
    new-instance v6, Lcom/amazon/identity/auth/device/AuthError;

    const-string v7, "JSONException while parsing profile information in database"

    sget-object v8, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_JSON:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v6, v7, v1, v8}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v6
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 7
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 97
    if-eqz p1, :cond_0

    instance-of v4, p1, Lcom/amazon/identity/auth/device/dataobject/Profile;

    if-eqz v4, :cond_0

    .line 99
    :try_start_0
    move-object v0, p1

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/Profile;

    move-object v2, v0

    .line 100
    .local v2, "profile":Lcom/amazon/identity/auth/device/dataobject/Profile;
    iget-object v4, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mAppFamilyId:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/Profile;->getAppFamilyId()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mExpirationTime:Ljava/util/Date;

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/Profile;->getExpirationTime()Ljava/util/Date;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/amazon/identity/auth/device/dataobject/Profile;->areObjectsEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-direct {p0, v2}, Lcom/amazon/identity/auth/device/dataobject/Profile;->dataEquals(Lcom/amazon/identity/auth/device/dataobject/Profile;)Z
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_0

    const/4 v3, 0x1

    .line 108
    .end local v2    # "profile":Lcom/amazon/identity/auth/device/dataobject/Profile;
    :cond_0
    :goto_0
    return v3

    .line 103
    :catch_0
    move-exception v1

    .line 104
    .local v1, "e":Ljava/lang/NullPointerException;
    sget-object v4, Lcom/amazon/identity/auth/device/dataobject/Profile;->LOG_TAG:Ljava/lang/String;

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
    .line 113
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mAppFamilyId:Ljava/lang/String;

    return-object v0
.end method

.method public getData()Ljava/lang/String;
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mData:Ljava/lang/String;

    return-object v0
.end method

.method public getDataAsBundle()Landroid/os/Bundle;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 119
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/dataobject/Profile;->getDataFromJSON()Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;
    .locals 1
    .param p1, "x0"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/dataobject/Profile;->getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;

    move-result-object v0

    return-object v0
.end method

.method public getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 89
    invoke-static {p1}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;

    move-result-object v0

    return-object v0
.end method

.method public getExpirationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 115
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mExpirationTime:Ljava/util/Date;

    return-object v0
.end method

.method public getId()J
    .locals 2

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/Profile;->getRowId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getValuesForInsert()Landroid/content/ContentValues;
    .locals 4

    .prologue
    .line 66
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 68
    .local v0, "to_return":Landroid/content/ContentValues;
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/Profile;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->APP_ID:Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mAppFamilyId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mExpirationTime:Ljava/util/Date;

    if-eqz v1, :cond_0

    .line 71
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/Profile;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->EXPIRATION_TIME:Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    sget-object v2, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->ISO8601:Ljava/text/SimpleDateFormat;

    iget-object v3, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mExpirationTime:Ljava/util/Date;

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    :goto_0
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/Profile;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->DATA:Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mData:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    return-object v0

    .line 75
    :cond_0
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/Profile;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->EXPIRATION_TIME:Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/Profile$COL_INDEX;->colId:I

    aget-object v2, v1, v2

    const/4 v1, 0x0

    check-cast v1, Ljava/lang/String;

    invoke-virtual {v0, v2, v1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public hasExpired()Z
    .locals 3

    .prologue
    .line 147
    const/4 v0, 0x1

    .line 148
    .local v0, "hasExpired":Z
    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mExpirationTime:Ljava/util/Date;

    if-eqz v1, :cond_0

    .line 150
    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mExpirationTime:Ljava/util/Date;

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/Date;->before(Ljava/util/Date;)Z

    move-result v0

    .line 152
    .end local v0    # "hasExpired":Z
    :cond_0
    return v0
.end method

.method public setAppId(Ljava/lang/String;)V
    .locals 0
    .param p1, "appId"    # Ljava/lang/String;

    .prologue
    .line 123
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mAppFamilyId:Ljava/lang/String;

    return-void
.end method

.method public setData(Ljava/lang/String;)V
    .locals 0
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mData:Ljava/lang/String;

    return-void
.end method

.method public setExpirationTime(Ljava/util/Date;)V
    .locals 1
    .param p1, "expirationTime"    # Ljava/util/Date;

    .prologue
    .line 127
    invoke-static {p1}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->truncateFractionalSeconds(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mExpirationTime:Ljava/util/Date;

    .line 128
    return-void
.end method

.method public setId(J)V
    .locals 0
    .param p1, "id"    # J

    .prologue
    .line 121
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/dataobject/Profile;->setRowId(J)V

    return-void
.end method

.method public toLogString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 139
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{ rowid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/Profile;->getId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", appId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mAppFamilyId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", expirationTime="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->ISO8601:Ljava/text/SimpleDateFormat;

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mExpirationTime:Ljava/util/Date;

    invoke-virtual {v1, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", data="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/Profile;->mData:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 134
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/Profile;->toLogString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
