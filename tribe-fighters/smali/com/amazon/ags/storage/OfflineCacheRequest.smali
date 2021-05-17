.class public Lcom/amazon/ags/storage/OfflineCacheRequest;
.super Ljava/lang/Object;
.source "OfflineCacheRequest.java"


# instance fields
.field private final m_JsonObject:Lorg/json/JSONObject;

.field private final m_PrimaryKey:Ljava/lang/String;

.field private final m_SecondaryKey:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "primaryKey"    # Ljava/lang/String;
    .param p2, "secondaryKey"    # Ljava/lang/String;
    .param p3, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 24
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "primaryKey is invalid"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 27
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "secondaryKey is invalid"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 29
    :cond_1
    if-nez p3, :cond_2

    .line 30
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "jsonObject is null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 32
    :cond_2
    iput-object p1, p0, Lcom/amazon/ags/storage/OfflineCacheRequest;->m_PrimaryKey:Ljava/lang/String;

    .line 33
    iput-object p2, p0, Lcom/amazon/ags/storage/OfflineCacheRequest;->m_SecondaryKey:Ljava/lang/String;

    .line 34
    iput-object p3, p0, Lcom/amazon/ags/storage/OfflineCacheRequest;->m_JsonObject:Lorg/json/JSONObject;

    .line 35
    return-void
.end method


# virtual methods
.method public getJsonObject()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/amazon/ags/storage/OfflineCacheRequest;->m_JsonObject:Lorg/json/JSONObject;

    return-object v0
.end method

.method public getPrimaryKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/amazon/ags/storage/OfflineCacheRequest;->m_PrimaryKey:Ljava/lang/String;

    return-object v0
.end method

.method public getSecondaryKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/amazon/ags/storage/OfflineCacheRequest;->m_SecondaryKey:Ljava/lang/String;

    return-object v0
.end method
