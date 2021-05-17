.class public final Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "DatabaseHelper.java"


# static fields
.field public static final ISO8601:Ljava/text/SimpleDateFormat;

.field private static final LOG_TAG:Ljava/lang/String;

.field public static final MAP_DB_NAME:Ljava/lang/String; = "MAPDataStore.db"

.field private static final MAP_DB_VERSION:I = 0x6

.field private static final SECOND_MILLIS:J

.field private static final THIRD_PARTY_VER_2_1_X:I = 0x5

.field private static final THIRD_PARTY_VER_2_2_X:I = 0x6

.field private static final THIRD_PARTY_VER_2_X:I = 0x4

.field public static final appInfoTable:Ljava/lang/String; = "AppInfo"

.field public static final appInfo_AllowedScopes:Ljava/lang/String; = "AllowedScopes"

.field public static final appInfo_AppFamilyId:Ljava/lang/String; = "AppFamilyId"

.field public static final appInfo_AppVariantId:Ljava/lang/String; = "AppVariantId"

.field public static final appInfo_ClientId:Ljava/lang/String; = "ClientId"

.field public static final appInfo_GrantedPermissions:Ljava/lang/String; = "GrantedPermissions"

.field public static final appInfo_PackageName:Ljava/lang/String; = "PackageName"

.field public static final appInfo_Payload:Ljava/lang/String; = "Payload"

.field public static final authorizationCode:Ljava/lang/String; = "Code"

.field public static final authorizationCodeTable:Ljava/lang/String; = "AuthorizationCode"

.field public static final authorizationCode_AppId:Ljava/lang/String; = "AppId"

.field public static final authorizationCode_AuthorizationTokenId:Ljava/lang/String; = "AuthorizationTokenId"

.field public static final authorizationCode_Id:Ljava/lang/String; = "Id"

.field public static final authorizationTokenTable:Ljava/lang/String; = "AuthorizationToken"

.field public static final authorizationToken_AppId:Ljava/lang/String; = "AppId"

.field public static final authorizationToken_CreationTime:Ljava/lang/String; = "CreationTime"

.field public static final authorizationToken_DirectedId:Ljava/lang/String; = "directedId"

.field public static final authorizationToken_ExpirationTime:Ljava/lang/String; = "ExpirationTime"

.field public static final authorizationToken_Id:Ljava/lang/String; = "Id"

.field public static final authorizationToken_MiscData:Ljava/lang/String; = "MiscData"

.field public static final authorizationToken_Token:Ljava/lang/String; = "Token"

.field public static final authorizationToken_Type:Ljava/lang/String; = "type"

.field public static final profileTable:Ljava/lang/String; = "Profile"

.field public static final profile_AppId:Ljava/lang/String; = "AppId"

.field public static final profile_Data:Ljava/lang/String; = "Data"

.field public static final profile_ExpirationTime:Ljava/lang/String; = "ExpirationTime"

.field public static final profile_Id:Ljava/lang/String; = "Id"

.field public static final requestedScopeTable:Ljava/lang/String; = "RequestedScope"

.field public static final requestedScope_AppId:Ljava/lang/String; = "AppId"

.field public static final requestedScope_AuthorizationAccessTokenId:Ljava/lang/String; = "AtzAccessTokenId"

.field public static final requestedScope_AuthorizationRefreshTokenId:Ljava/lang/String; = "AtzRefreshTokenId"

.field public static final requestedScope_DirectedId:Ljava/lang/String; = "DirectedId"

.field public static final requestedScope_Scope:Ljava/lang/String; = "Scope"


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 29
    const-class v0, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    .line 30
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v1, 0x1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v0

    sput-wide v0, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->SECOND_MILLIS:J

    .line 88
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd HH:mm:ss"

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    sput-object v0, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->ISO8601:Ljava/text/SimpleDateFormat;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 91
    const-string v0, "MAPDataStore.db"

    const/4 v1, 0x0

    const/4 v2, 0x6

    invoke-direct {p0, p1, v0, v1, v2}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 92
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    const-string v1, "DatabaseHelper created"

    const-string v2, "MAP_DB_NAME=MAPDataStore.db, MAP_DB_VERSION=6"

    invoke-static {v0, v1, v2}, Lcom/amazon/identity/auth/device/utils/MAPLog;->pii(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    return-void
.end method

.method public static clearAuthorizationState(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 312
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Clearing Authorization Locally"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 313
    invoke-static {p0}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/datastore/AppInfoDataSource;->deleteAllRows()I

    .line 314
    invoke-static {p0}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/datastore/AuthorizationTokenDataSource;->deleteAllRows()I

    .line 315
    invoke-static {p0}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->deleteAllRows()I

    .line 316
    invoke-static {p0}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;

    move-result-object v0

    invoke-virtual {v0}, Lcom/amazon/identity/auth/device/datastore/ProfileDataSource;->deleteAllRows()I

    .line 317
    return-void
.end method

.method public static clearServiceAuthorizationState(Landroid/content/Context;)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/identity/auth/device/AuthError;
        }
    .end annotation

    .prologue
    .line 329
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 331
    .local v1, "result":Landroid/os/Bundle;
    :try_start_0
    invoke-static {p0}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->getRemoteAndroidService(Landroid/content/Context;)Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;

    move-result-object v2

    .line 332
    .local v2, "service":Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;
    if-eqz v2, :cond_0

    .line 334
    sget-object v3, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Clearing Authorization via Service"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    const/4 v3, 0x0

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;->clearAuthorizationState(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    .line 336
    if-eqz v1, :cond_0

    const-string v3, "AUTH_ERROR_EXECEPTION"

    invoke-virtual {v1, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 338
    invoke-static {v1}, Lcom/amazon/identity/auth/device/AuthError;->extractError(Landroid/os/Bundle;)Lcom/amazon/identity/auth/device/AuthError;

    move-result-object v3

    throw v3
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 342
    .end local v2    # "service":Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;
    :catch_0
    move-exception v0

    .line 345
    .local v0, "e":Landroid/os/RemoteException;
    :try_start_1
    invoke-static {p0}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->clearCachedService(Landroid/content/Context;)V

    .line 346
    new-instance v3, Lcom/amazon/identity/auth/device/AuthError;

    const-string v4, "Clearing Authorization RemoteException"

    sget-object v5, Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;->ERROR_UNKNOWN:Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;

    invoke-direct {v3, v4, v0, v5}, Lcom/amazon/identity/auth/device/AuthError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;Lcom/amazon/identity/auth/device/AuthError$ERROR_TYPE;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 350
    .end local v0    # "e":Landroid/os/RemoteException;
    :catchall_0
    move-exception v3

    invoke-static {p0}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->unbind(Landroid/content/Context;)V

    throw v3

    .restart local v2    # "service":Lcom/amazon/identity/auth/device/authorization/AmazonAuthorizationServiceInterface;
    :cond_0
    invoke-static {p0}, Lcom/amazon/identity/auth/device/authorization/ThirdPartyServiceHelper;->unbind(Landroid/content/Context;)V

    .line 352
    return-void
.end method

.method public static truncateFractionalSeconds(Ljava/util/Date;)Ljava/util/Date;
    .locals 4
    .param p0, "date"    # Ljava/util/Date;

    .prologue
    .line 295
    if-eqz p0, :cond_0

    .line 297
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    sget-wide v2, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->SECOND_MILLIS:J

    div-long/2addr v0, v2

    sget-wide v2, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->SECOND_MILLIS:J

    mul-long/2addr v0, v2

    invoke-virtual {p0, v0, v1}, Ljava/util/Date;->setTime(J)V

    .line 300
    :goto_0
    return-object p0

    :cond_0
    const/4 p0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public doesColumnExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 7
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "tableName"    # Ljava/lang/String;
    .param p3, "columnName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 216
    sget-object v4, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Checking if COL="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " in table="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " exists"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 217
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v4

    if-nez v4, :cond_1

    .line 219
    :cond_0
    sget-object v4, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Column does NOT exist"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 246
    :goto_0
    return v3

    .line 222
    :cond_1
    const/4 v0, 0x0

    .line 224
    .local v0, "cursor":Landroid/database/Cursor;
    :try_start_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "select * from sqlite_master where name = \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\' and sql like \'%"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "%\' "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 225
    .local v2, "query":Ljava/lang/String;
    const/4 v4, 0x0

    invoke-virtual {p1, v2, v4}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 232
    if-nez v0, :cond_2

    .line 234
    sget-object v4, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Column does NOT exist"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 226
    .end local v2    # "query":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 227
    .local v1, "e":Landroid/database/sqlite/SQLiteException;
    sget-object v4, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SQLiteException: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Landroid/database/sqlite/SQLiteException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 228
    sget-object v4, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Column does NOT exist"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 238
    .end local v1    # "e":Landroid/database/sqlite/SQLiteException;
    .restart local v2    # "query":Ljava/lang/String;
    :cond_2
    invoke-interface {v0}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 240
    sget-object v3, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    const-string v4, "Column does exist"

    invoke-static {v3, v4}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    const/4 v3, 0x1

    goto :goto_0

    .line 243
    :cond_3
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 245
    sget-object v4, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    const-string v5, "Column does NOT exist"

    invoke-static {v4, v5}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;

    .prologue
    .line 97
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    const-string v1, "onCreate called"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 100
    const-string v0, "CREATE TABLE IF NOT EXISTS AppInfo (AppFamilyId TEXT NOT NULL, PackageName TEXT NOT NULL, AllowedScopes TEXT, GrantedPermissions TEXT, ClientId TEXT NOT NULL, AppVariantId TEXT,Payload TEXT,UNIQUE (PackageName), PRIMARY KEY (AppVariantId))"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 108
    const-string v0, "CREATE INDEX IF NOT EXISTS app_info_index_pkg_name ON AppInfo (PackageName)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 111
    const-string v0, "CREATE INDEX IF NOT EXISTS app_info_index_app_variant_id ON AppInfo (AppVariantId)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 116
    const-string v0, "CREATE TABLE IF NOT EXISTS RequestedScope (Scope TEXT NOT NULL, AppId TEXT NOT NULL, DirectedId TEXT, AtzAccessTokenId INTEGER NOT NULL, AtzRefreshTokenId INTEGER NOT NULL, PRIMARY KEY (Scope,AppId,AtzAccessTokenId,AtzRefreshTokenId))"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 125
    const-string v0, "CREATE INDEX IF NOT EXISTS requested_scope_index_scope ON RequestedScope (Scope)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 128
    const-string v0, "CREATE INDEX IF NOT EXISTS requested_scope_index_app_id ON RequestedScope (AppId)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 131
    const-string v0, "CREATE INDEX IF NOT EXISTS requested_scope_index_atz_access_token_id ON RequestedScope (AtzAccessTokenId)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 135
    const-string v0, "CREATE INDEX IF NOT EXISTS requested_scope_index_atz_refresh_token_id ON RequestedScope (AtzRefreshTokenId)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 144
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CREATE TRIGGER IF NOT EXISTS requested_scope_valid_atz_access_token_id BEFORE INSERT ON RequestedScope FOR EACH ROW BEGIN SELECT CASE WHEN (new.AtzAccessTokenId != "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->UNKNOWN:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND new."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "AtzAccessTokenId"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " != "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND new."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "AtzAccessTokenId"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " < "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->GRANTED_LOCALLY:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "THEN RAISE(ABORT, \'Invalid authorization token ID\') END; END;"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 156
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "CREATE TRIGGER IF NOT EXISTS requested_scope_valid_atz_refresh_token_id BEFORE INSERT ON RequestedScope FOR EACH ROW BEGIN SELECT CASE WHEN (new.AtzRefreshTokenId != "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->UNKNOWN:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND new."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "AtzRefreshTokenId"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " != "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " AND new."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "AtzRefreshTokenId"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " < "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->GRANTED_LOCALLY:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v1, v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ") "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "THEN RAISE(ABORT, \'Invalid authorization token ID\') END; END;"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 165
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Attempting to create authorizationTokenTable TABLE"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    const-string v0, "CREATE TABLE IF NOT EXISTS AuthorizationToken (Id INTEGER PRIMARY KEY AUTOINCREMENT, AppId TEXT NOT NULL, Token TEXT NOT NULL, CreationTime DATETIME NOT NULL, ExpirationTime DATETIME NOT NULL, MiscData BLOB, type INTEGER NOT NULL, directedId TEXT )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 176
    const-string v0, "CREATE INDEX IF NOT EXISTS authz_token_index_app_id ON AuthorizationToken (AppId)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 181
    const-string v0, "CREATE TABLE IF NOT EXISTS AuthorizationCode (Id INTEGER PRIMARY KEY AUTOINCREMENT, Code TEXT NOT NULL, AppId TEXT NOT NULL, AuthorizationTokenId INTEGER NOT NULL )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 188
    const-string v0, "CREATE INDEX IF NOT EXISTS authz_code_index_app_id ON AuthorizationCode (AppId)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 193
    const-string v0, "CREATE INDEX IF NOT EXISTS authz_code_index_token_id ON AuthorizationCode (AuthorizationTokenId)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 200
    const-string v0, "CREATE TABLE IF NOT EXISTS Profile (Id INTEGER PRIMARY KEY AUTOINCREMENT, ExpirationTime DATETIME NOT NULL, AppId TEXT NOT NULL, Data TEXT NOT NULL )"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 207
    const-string v0, "CREATE INDEX IF NOT EXISTS profile_index_app_id ON Profile (AppId)"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 212
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 6
    .param p1, "db"    # Landroid/database/sqlite/SQLiteDatabase;
    .param p2, "oldVersion"    # I
    .param p3, "newVersion"    # I

    .prologue
    const/4 v5, 0x5

    const/4 v4, 0x4

    const/4 v3, 0x6

    .line 251
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "onUpgrade called old="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " new="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 253
    if-ge p2, v4, :cond_0

    if-lt p3, v4, :cond_0

    .line 255
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Doing upgrades for 4"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    const-string v0, "DROP TABLE IF EXISTS AuthorizationToken"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 259
    const-string v0, "DROP TABLE IF EXISTS RequestedScope"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 261
    const-string v0, "DROP TABLE IF EXISTS AppInfo"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 264
    const-string v0, "DROP INDEX IF EXISTS RequestedScope.requested_scope_index_directed_id"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 266
    const-string v0, "DROP INDEX IF EXISTS RequestedScope.requested_scope_index_atz_token_id"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 268
    const-string v0, "DROP TRIGGER IF EXISTS requested_scope_valid_atz_token_id"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 270
    :cond_0
    if-ge p2, v5, :cond_1

    if-lt p3, v5, :cond_1

    .line 272
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Doing upgrades for 5"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    :cond_1
    if-ge p2, v3, :cond_2

    if-lt p3, v3, :cond_2

    .line 277
    sget-object v0, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->LOG_TAG:Ljava/lang/String;

    const-string v1, "Doing upgrades for 6"

    invoke-static {v0, v1}, Lcom/amazon/identity/auth/device/utils/MAPLog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 279
    const-string v0, "DROP TABLE IF EXISTS AppInfo"

    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 282
    :cond_2
    if-le p3, v3, :cond_3

    .line 284
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Database version was updated, but no upgrade was done"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 287
    :cond_3
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/datastore/DatabaseHelper;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 288
    return-void
.end method
