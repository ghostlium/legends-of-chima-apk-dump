.class public Lcom/amazon/identity/auth/device/dataobject/RequestedScope;
.super Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;
.source "RequestedScope.java"

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;,
        Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;
    }
.end annotation


# static fields
.field public static final ALL_COLUMNS:[Ljava/lang/String;

.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/amazon/identity/auth/device/dataobject/RequestedScope;",
            ">;"
        }
    .end annotation
.end field

.field private static final LOG_TAG:Ljava/lang/String;


# instance fields
.field private appFamilyId:Ljava/lang/String;

.field private directedId:Ljava/lang/String;

.field private mAuthorizationAccessTokenId:J

.field private mAuthorizationRefreshTokenId:J

.field private scopeValue:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 19
    const-class v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->LOG_TAG:Ljava/lang/String;

    .line 32
    const/4 v0, 0x6

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "rowid"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "Scope"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "AppId"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "DirectedId"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "AtzAccessTokenId"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "AtzRefreshTokenId"

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->ALL_COLUMNS:[Ljava/lang/String;

    .line 208
    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$1;

    invoke-direct {v0}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$1;-><init>()V

    sput-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 70
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;-><init>()V

    .line 49
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v0, v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    iput-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    .line 50
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v0, v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    iput-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationRefreshTokenId:J

    .line 70
    return-void
.end method

.method private constructor <init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 8
    .param p1, "rowid"    # J
    .param p3, "scopeValue"    # Ljava/lang/String;
    .param p4, "appFamilyId"    # Ljava/lang/String;
    .param p5, "directedId"    # Ljava/lang/String;
    .param p6, "authorizationTokenId"    # J
    .param p8, "authorizationRefreshTokenId"    # J

    .prologue
    .line 66
    move-object v0, p0

    move-object v1, p3

    move-object v2, p4

    move-object v3, p5

    move-wide v4, p6

    move-wide/from16 v6, p8

    invoke-direct/range {v0 .. v7}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

    .line 67
    invoke-virtual {p0, p1, p2}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setRowId(J)V

    .line 68
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "source"    # Landroid/os/Parcel;

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;-><init>()V

    .line 49
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v0, v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    iput-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    .line 50
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v0, v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    iput-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationRefreshTokenId:J

    .line 73
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setRowId(J)V

    .line 74
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->scopeValue:Ljava/lang/String;

    .line 75
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->appFamilyId:Ljava/lang/String;

    .line 76
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->directedId:Ljava/lang/String;

    .line 77
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    .line 78
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationRefreshTokenId:J

    .line 79
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "scopeValue"    # Ljava/lang/String;
    .param p2, "appFamilyId"    # Ljava/lang/String;
    .param p3, "directedId"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-direct {p0}, Lcom/amazon/identity/auth/device/dataobject/AbstractDataObject;-><init>()V

    .line 49
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v0, v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    iput-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    .line 50
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v0, v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    iput-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationRefreshTokenId:J

    .line 54
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->scopeValue:Ljava/lang/String;

    .line 55
    iput-object p2, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->appFamilyId:Ljava/lang/String;

    .line 56
    iput-object p3, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->directedId:Ljava/lang/String;

    .line 57
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V
    .locals 0
    .param p1, "scopeValue"    # Ljava/lang/String;
    .param p2, "appFamilyId"    # Ljava/lang/String;
    .param p3, "directedId"    # Ljava/lang/String;
    .param p4, "authorizationAccessTokenId"    # J
    .param p6, "authorizationRefreshTokenId"    # J

    .prologue
    .line 60
    invoke-direct {p0, p1, p2, p3}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    iput-wide p4, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    .line 62
    iput-wide p6, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationRefreshTokenId:J

    .line 63
    return-void
.end method


# virtual methods
.method public clone()Lcom/amazon/identity/auth/device/dataobject/RequestedScope;
    .locals 10

    .prologue
    .line 190
    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->getRowId()J

    move-result-wide v1

    iget-object v3, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->scopeValue:Ljava/lang/String;

    iget-object v4, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->appFamilyId:Ljava/lang/String;

    iget-object v5, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->directedId:Ljava/lang/String;

    iget-wide v6, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    iget-wide v8, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationRefreshTokenId:J

    invoke-direct/range {v0 .. v9}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;JJ)V

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
    .line 17
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->clone()Lcom/amazon/identity/auth/device/dataobject/RequestedScope;

    move-result-object v0

    return-object v0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 195
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 8
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v3, 0x0

    .line 173
    instance-of v4, p1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;

    if-eqz v4, :cond_0

    .line 175
    :try_start_0
    move-object v0, p1

    check-cast v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;

    move-object v2, v0

    .line 176
    .local v2, "scope":Lcom/amazon/identity/auth/device/dataobject/RequestedScope;
    iget-object v4, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->scopeValue:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->getScopeValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->appFamilyId:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->getAppFamilyId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->directedId:Ljava/lang/String;

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->getDirectedId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    iget-wide v4, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->getAuthorizationAccessTokenId()J

    move-result-wide v6

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    iget-wide v4, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationRefreshTokenId:J

    invoke-virtual {v2}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->getAuthorizationRefreshTokenId()J
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v6

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    const/4 v3, 0x1

    .line 184
    .end local v2    # "scope":Lcom/amazon/identity/auth/device/dataobject/RequestedScope;
    :cond_0
    :goto_0
    return v3

    .line 179
    :catch_0
    move-exception v1

    .line 180
    .local v1, "e":Ljava/lang/NullPointerException;
    sget-object v4, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->LOG_TAG:Ljava/lang/String;

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
    .line 84
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->appFamilyId:Ljava/lang/String;

    return-object v0
.end method

.method public getAuthorizationAccessTokenId()J
    .locals 2

    .prologue
    .line 88
    iget-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    return-wide v0
.end method

.method public getAuthorizationRefreshTokenId()J
    .locals 2

    .prologue
    .line 90
    iget-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationRefreshTokenId:J

    return-wide v0
.end method

.method public bridge synthetic getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/AbstractDataSource;
    .locals 1
    .param p1, "x0"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-virtual {p0, p1}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;

    move-result-object v0

    return-object v0
.end method

.method public getDataSource(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 168
    invoke-static {p1}, Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;->getInstance(Landroid/content/Context;)Lcom/amazon/identity/auth/device/datastore/RequestedScopeDataSource;

    move-result-object v0

    return-object v0
.end method

.method public getDirectedId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->directedId:Ljava/lang/String;

    return-object v0
.end method

.method public getScope()Lcom/amazon/identity/auth/device/dataobject/Scope;
    .locals 2

    .prologue
    .line 149
    new-instance v0, Lcom/amazon/identity/auth/device/dataobject/Scope;

    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->scopeValue:Ljava/lang/String;

    invoke-direct {v0, v1}, Lcom/amazon/identity/auth/device/dataobject/Scope;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public getScopeValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->scopeValue:Ljava/lang/String;

    return-object v0
.end method

.method public getValuesForInsert()Landroid/content/ContentValues;
    .locals 4

    .prologue
    .line 154
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 156
    .local v0, "to_return":Landroid/content/ContentValues;
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->SCOPE:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->scopeValue:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->APP_FAMILY_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->appFamilyId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->DIRECTED_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-object v2, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->directedId:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->AUTHORIZATION_ACCESS_TOKEN_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-wide v2, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 160
    sget-object v1, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->ALL_COLUMNS:[Ljava/lang/String;

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->AUTHORIZATION_REFRESH_TOKEN_ID:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;

    iget v2, v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$COL_INDEX;->colId:I

    aget-object v1, v1, v2

    iget-wide v2, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationRefreshTokenId:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Long;)V

    .line 162
    return-object v0
.end method

.method public isGranted()Ljava/lang/Boolean;
    .locals 4

    .prologue
    .line 106
    iget-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->UNKNOWN:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v2, v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    .line 107
    const/4 v0, 0x0

    .line 113
    :goto_0
    return-object v0

    .line 109
    :cond_0
    iget-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    sget-object v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v2, v2, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 110
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 113
    :cond_1
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0
.end method

.method public setAppFamilyId(Ljava/lang/String;)V
    .locals 0
    .param p1, "appFamilyId"    # Ljava/lang/String;

    .prologue
    .line 94
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->appFamilyId:Ljava/lang/String;

    return-void
.end method

.method public setAuthorizationAccessTokenId(J)V
    .locals 0
    .param p1, "authorizationTokenId"    # J

    .prologue
    .line 98
    iput-wide p1, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    return-void
.end method

.method public setAuthorizationRefreshTokenId(J)V
    .locals 0
    .param p1, "authorizationTokenId"    # J

    .prologue
    .line 100
    iput-wide p1, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationRefreshTokenId:J

    return-void
.end method

.method public setDirectedId(Ljava/lang/String;)V
    .locals 0
    .param p1, "directedId"    # Ljava/lang/String;

    .prologue
    .line 96
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->directedId:Ljava/lang/String;

    return-void
.end method

.method public setIsGranted(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "isGranted"    # Ljava/lang/Boolean;

    .prologue
    .line 127
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->isGranted()Ljava/lang/Boolean;

    move-result-object v0

    if-eq p1, v0, :cond_0

    .line 128
    if-nez p1, :cond_1

    .line 129
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->UNKNOWN:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v0, v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setAuthorizationAccessTokenId(J)V

    .line 130
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->UNKNOWN:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v0, v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setAuthorizationRefreshTokenId(J)V

    .line 141
    :cond_0
    :goto_0
    return-void

    .line 132
    :cond_1
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    if-ne p1, v0, :cond_2

    .line 133
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v0, v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setAuthorizationAccessTokenId(J)V

    .line 134
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->REJECTED:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v0, v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setAuthorizationRefreshTokenId(J)V

    goto :goto_0

    .line 137
    :cond_2
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->GRANTED_LOCALLY:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v0, v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setAuthorizationAccessTokenId(J)V

    .line 138
    sget-object v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->GRANTED_LOCALLY:Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;

    iget-wide v0, v0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope$OUTCOME;->longVal:J

    invoke-virtual {p0, v0, v1}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->setAuthorizationRefreshTokenId(J)V

    goto :goto_0
.end method

.method public setScopeValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "scopeValue"    # Ljava/lang/String;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->scopeValue:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 222
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "{ rowid="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->getRowId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", scope="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->scopeValue:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", appFamilyId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->appFamilyId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", directedId=<obscured>, atzAccessTokenId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", atzRefreshTokenId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationRefreshTokenId:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " }"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 2
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    .line 200
    invoke-virtual {p0}, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->getRowId()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 201
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->scopeValue:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 202
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->appFamilyId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 203
    iget-object v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->directedId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 204
    iget-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationAccessTokenId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 205
    iget-wide v0, p0, Lcom/amazon/identity/auth/device/dataobject/RequestedScope;->mAuthorizationRefreshTokenId:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 206
    return-void
.end method
