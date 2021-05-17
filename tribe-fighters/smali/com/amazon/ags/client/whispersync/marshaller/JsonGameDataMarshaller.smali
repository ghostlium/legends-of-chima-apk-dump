.class public Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;
.super Ljava/lang/Object;
.source "JsonGameDataMarshaller.java"

# interfaces
.implements Lcom/amazon/ags/client/whispersync/marshaller/GameDataMarshaller;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller$1;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/client/metrics/EventCollectorClient;)V
    .locals 0
    .param p1, "eventCollectorClient"    # Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .line 68
    return-void
.end method

.method private base64EncodeSha256(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "plainString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ComposeException;
        }
    .end annotation

    .prologue
    .line 676
    if-nez p1, :cond_0

    .line 677
    const/4 v3, 0x0

    .line 684
    :goto_0
    return-object v3

    .line 681
    :cond_0
    :try_start_0
    const-string v3, "SHA-256"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v2

    .line 682
    .local v2, "messageDigest":Ljava/security/MessageDigest;
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 683
    invoke-virtual {v2}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v1

    .line 684
    .local v1, "hash":[B
    new-instance v3, Ljava/lang/String;

    const/4 v4, 0x0

    invoke-static {v1, v4}, Landroid/util/Base64;->encode([BI)[B

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 685
    .end local v1    # "hash":[B
    .end local v2    # "messageDigest":Ljava/security/MessageDigest;
    :catch_0
    move-exception v0

    .line 686
    .local v0, "exception":Ljava/security/NoSuchAlgorithmException;
    new-instance v3, Lcom/amazon/ags/client/whispersync/marshaller/ComposeException;

    const-string v4, "SHA-256 algorithm was not found"

    invoke-direct {v3, v4, v0}, Lcom/amazon/ags/client/whispersync/marshaller/ComposeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method private composeAccumulatingNumber(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;
    .locals 4
    .param p2, "composeForDisk"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;Z)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 213
    .local p1, "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    move-object v1, p1

    check-cast v1, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;

    .line 214
    .local v1, "number":Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 215
    .local v0, "node":Lorg/json/JSONObject;
    const-string v2, "local"

    invoke-virtual {v1}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->getLocal()Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 216
    const-string v2, "remote"

    invoke-virtual {v1}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;->getRemote()Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 217
    if-eqz p2, :cond_0

    .line 218
    const-string v2, "state"

    invoke-interface {p1}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/ags/client/whispersync/model/SyncState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 220
    :cond_0
    return-object v0
.end method

.method private composeDataMap(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;Z)Lorg/json/JSONObject;
    .locals 10
    .param p1, "map"    # Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .param p2, "forDisk"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 133
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 134
    .local v5, "mapNode":Lorg/json/JSONObject;
    invoke-interface {p1}, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;->getAllElements()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 135
    .local v1, "element":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/amazon/ags/client/whispersync/model/Key;Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/amazon/ags/client/whispersync/model/Key;

    .line 136
    .local v4, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/amazon/ags/client/whispersync/model/Mergeable;

    .line 137
    .local v6, "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    invoke-interface {v6}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v7

    sget-object v8, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v7, v8, :cond_0

    .line 141
    if-nez p2, :cond_1

    invoke-interface {v6}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v7

    sget-object v8, Lcom/amazon/ags/client/whispersync/model/SyncState;->IN_CONFLICT:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v7, v8, :cond_0

    .line 145
    :cond_1
    if-nez p2, :cond_2

    invoke-interface {v6}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v7

    sget-object v8, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v7, v8, :cond_0

    .line 149
    :cond_2
    const/4 v3, 0x0

    .line 151
    .local v3, "jsonElement":Lorg/json/JSONObject;
    :try_start_0
    invoke-direct {p0, v4, v6, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeElement(Lcom/amazon/ags/client/whispersync/model/Key;Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;
    :try_end_0
    .catch Lcom/amazon/ags/client/whispersync/marshaller/ComposeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 155
    :goto_1
    if-eqz v3, :cond_0

    .line 156
    const-string v7, "GC_Whispersync"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Adding JSON element ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    invoke-virtual {v4}, Lcom/amazon/ags/client/whispersync/model/Key;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 152
    :catch_0
    move-exception v0

    .line 153
    .local v0, "e":Lcom/amazon/ags/client/whispersync/marshaller/ComposeException;
    const-string v7, "GC_Whispersync"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Cannot compose element with key ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "]"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_1

    .line 160
    .end local v0    # "e":Lcom/amazon/ags/client/whispersync/marshaller/ComposeException;
    .end local v1    # "element":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/amazon/ags/client/whispersync/model/Key;Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;>;"
    .end local v3    # "jsonElement":Lorg/json/JSONObject;
    .end local v4    # "key":Lcom/amazon/ags/client/whispersync/model/Key;
    .end local v6    # "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    :cond_3
    return-object v5
.end method

.method private composeDeveloperString(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;
    .locals 1
    .param p2, "composeForDisk"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;Z)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lcom/amazon/ags/client/whispersync/marshaller/ComposeException;
        }
    .end annotation

    .prologue
    .line 236
    .local p1, "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    if-eqz p2, :cond_0

    .line 237
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeDeveloperStringForDisk(Lcom/amazon/ags/client/whispersync/model/Mergeable;)Lorg/json/JSONObject;

    move-result-object v0

    .line 239
    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeDeveloperStringForService(Lcom/amazon/ags/client/whispersync/model/Mergeable;)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_0
.end method

.method private composeDeveloperStringForDisk(Lcom/amazon/ags/client/whispersync/model/Mergeable;)Lorg/json/JSONObject;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 244
    .local p1, "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    move-object v0, p1

    check-cast v0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;

    .line 245
    .local v0, "developerString":Lcom/amazon/ags/client/whispersync/model/DeveloperString;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 246
    .local v1, "node":Lorg/json/JSONObject;
    const-string v2, "local"

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeNullableStringValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 247
    const-string v2, "state"

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/ags/client/whispersync/model/SyncState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 248
    const-string v2, "ts"

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->getTimestamp()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 249
    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->isCloudValueSet()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 250
    const-string v2, "remote"

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->getCloudValue()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeNullableStringValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 251
    const-string v2, "rts"

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->getCloudTimestamp()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 253
    :cond_0
    return-object v1
.end method

.method private composeDeveloperStringForService(Lcom/amazon/ags/client/whispersync/model/Mergeable;)Lorg/json/JSONObject;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lcom/amazon/ags/client/whispersync/marshaller/ComposeException;
        }
    .end annotation

    .prologue
    .line 257
    .local p1, "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    move-object v0, p1

    check-cast v0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;

    .line 258
    .local v0, "developerString":Lcom/amazon/ags/client/whispersync/model/DeveloperString;
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 259
    .local v2, "node":Lorg/json/JSONObject;
    const-string v3, "value"

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->getValue()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeNullableStringValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 260
    const-string v3, "ts"

    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->getTimestamp()J

    move-result-wide v4

    invoke-virtual {v2, v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 261
    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->isCloudValueSet()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 262
    invoke-virtual {v0}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;->getCloudValue()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->base64EncodeSha256(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 263
    .local v1, "encodedBase":Ljava/lang/String;
    const-string v3, "base"

    invoke-direct {p0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeNullableStringValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 265
    .end local v1    # "encodedBase":Ljava/lang/String;
    :cond_0
    return-object v2
.end method

.method private composeElement(Lcom/amazon/ags/client/whispersync/model/Key;Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;
    .locals 3
    .param p1, "key"    # Lcom/amazon/ags/client/whispersync/model/Key;
    .param p3, "composeForDisk"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;Z)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lcom/amazon/ags/client/whispersync/marshaller/ComposeException;
        }
    .end annotation

    .prologue
    .line 164
    .local p2, "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    sget-object v0, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller$1;->$SwitchMap$com$amazon$ags$client$whispersync$model$SyncableType:[I

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 194
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected SyncableType cannot be composed for key:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 195
    const/4 v0, 0x0

    .end local p2    # "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    :goto_0
    return-object v0

    .line 168
    .restart local p2    # "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    :pswitch_0
    invoke-direct {p0, p2, p3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeNumber(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_0

    .line 171
    :pswitch_1
    invoke-direct {p0, p2, p3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeAccumulatingNumber(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_0

    .line 174
    :pswitch_2
    invoke-direct {p0, p2, p3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeString(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_0

    .line 177
    :pswitch_3
    invoke-direct {p0, p2, p3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeDeveloperString(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_0

    .line 182
    :pswitch_4
    invoke-direct {p0, p2, p3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeNumberList(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_0

    .line 185
    :pswitch_5
    invoke-direct {p0, p2, p3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeStringList(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_0

    .line 188
    :pswitch_6
    invoke-direct {p0, p2, p3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeStringSet(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_0

    .line 191
    :pswitch_7
    check-cast p2, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    .end local p2    # "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    invoke-direct {p0, p2, p3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeDataMap(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;Z)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_0

    .line 164
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method private composeMetadata(Lcom/amazon/ags/api/whispersync/model/SyncableElement;Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "syncable"    # Lcom/amazon/ags/api/whispersync/model/SyncableElement;
    .param p2, "node"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 606
    invoke-interface {p1}, Lcom/amazon/ags/api/whispersync/model/SyncableElement;->getMetadata()Ljava/util/Map;

    move-result-object v2

    .line 607
    .local v2, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v2, :cond_1

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 608
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 609
    .local v3, "metadataNode":Lorg/json/JSONObject;
    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 610
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_0

    .line 612
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    const-string v4, "md"

    invoke-virtual {p2, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 614
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "metadataNode":Lorg/json/JSONObject;
    :cond_1
    return-void
.end method

.method private composeNullableStringValue(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 342
    if-nez p1, :cond_0

    sget-object p1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    .end local p1    # "value":Ljava/lang/String;
    :cond_0
    return-object p1
.end method

.method private composeNumber(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;
    .locals 5
    .param p2, "composeForDisk"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;Z)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 201
    .local p1, "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    move-object v1, p1

    check-cast v1, Lcom/amazon/ags/api/whispersync/model/SyncableNumber;

    .line 202
    .local v1, "number":Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 203
    .local v0, "node":Lorg/json/JSONObject;
    const-string v2, "value"

    invoke-interface {v1}, Lcom/amazon/ags/api/whispersync/model/SyncableNumber;->asDecimal()Ljava/math/BigDecimal;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 204
    const-string v2, "ts"

    invoke-interface {v1}, Lcom/amazon/ags/api/whispersync/model/SyncableNumber;->getTimestamp()J

    move-result-wide v3

    invoke-virtual {v0, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 205
    if-eqz p2, :cond_0

    .line 206
    const-string v2, "state"

    invoke-interface {p1}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/ags/client/whispersync/model/SyncState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 208
    :cond_0
    invoke-direct {p0, v1, v0}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeMetadata(Lcom/amazon/ags/api/whispersync/model/SyncableElement;Lorg/json/JSONObject;)V

    .line 209
    return-object v0
.end method

.method private composeNumberList(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;
    .locals 4
    .param p2, "composeForDisk"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;Z)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 269
    .local p1, "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    move-object v0, p1

    check-cast v0, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;

    .line 270
    .local v0, "list":Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 271
    .local v1, "node":Lorg/json/JSONObject;
    const-string v2, "maxSize"

    invoke-interface {v0}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;->getMaxSize()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 272
    const-string v2, "values"

    invoke-interface {v0}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;->getValues()[Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeNumberListItems([Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 273
    if-eqz p2, :cond_0

    .line 274
    const-string v2, "state"

    invoke-interface {p1}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/ags/client/whispersync/model/SyncState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 276
    :cond_0
    return-object v1
.end method

.method private composeNumberListItem(Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "item"    # Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 289
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 290
    .local v0, "node":Lorg/json/JSONObject;
    const-string v1, "value"

    invoke-interface {p1}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;->asDecimal()Ljava/math/BigDecimal;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 291
    const-string v1, "ts"

    invoke-interface {p1}, Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 292
    invoke-direct {p0, p1, v0}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeMetadata(Lcom/amazon/ags/api/whispersync/model/SyncableElement;Lorg/json/JSONObject;)V

    .line 293
    return-object v0
.end method

.method private composeNumberListItems([Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;)Lorg/json/JSONArray;
    .locals 6
    .param p1, "list"    # [Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 280
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 281
    .local v1, "array":Lorg/json/JSONArray;
    move-object v0, p1

    .local v0, "arr$":[Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v4, :cond_0

    aget-object v3, v0, v2

    .line 282
    .local v3, "item":Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;
    invoke-direct {p0, v3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeNumberListItem(Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;)Lorg/json/JSONObject;

    move-result-object v5

    .line 283
    .local v5, "node":Lorg/json/JSONObject;
    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 281
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 285
    .end local v3    # "item":Lcom/amazon/ags/api/whispersync/model/SyncableNumberElement;
    .end local v5    # "node":Lorg/json/JSONObject;
    :cond_0
    return-object v1
.end method

.method private composeString(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;
    .locals 5
    .param p2, "composeForDisk"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;Z)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 224
    .local p1, "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    move-object v1, p1

    check-cast v1, Lcom/amazon/ags/api/whispersync/model/SyncableString;

    .line 225
    .local v1, "string":Lcom/amazon/ags/api/whispersync/model/SyncableString;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 226
    .local v0, "node":Lorg/json/JSONObject;
    const-string v2, "value"

    invoke-interface {v1}, Lcom/amazon/ags/api/whispersync/model/SyncableString;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeNullableStringValue(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 227
    const-string v2, "ts"

    invoke-interface {v1}, Lcom/amazon/ags/api/whispersync/model/SyncableString;->getTimestamp()J

    move-result-wide v3

    invoke-virtual {v0, v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 228
    if-eqz p2, :cond_0

    .line 229
    const-string v2, "state"

    invoke-interface {p1}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/ags/client/whispersync/model/SyncState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 231
    :cond_0
    invoke-direct {p0, v1, v0}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeMetadata(Lcom/amazon/ags/api/whispersync/model/SyncableElement;Lorg/json/JSONObject;)V

    .line 232
    return-object v0
.end method

.method private composeStringItem(Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;)Lorg/json/JSONObject;
    .locals 4
    .param p1, "item"    # Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 316
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 317
    .local v0, "node":Lorg/json/JSONObject;
    const-string v1, "value"

    invoke-interface {p1}, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 318
    const-string v1, "ts"

    invoke-interface {p1}, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;->getTimestamp()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 319
    invoke-direct {p0, p1, v0}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeMetadata(Lcom/amazon/ags/api/whispersync/model/SyncableElement;Lorg/json/JSONObject;)V

    .line 320
    return-object v0
.end method

.method private composeStringList(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;
    .locals 4
    .param p2, "composeForDisk"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;Z)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 297
    .local p1, "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    move-object v0, p1

    check-cast v0, Lcom/amazon/ags/api/whispersync/model/SyncableStringList;

    .line 298
    .local v0, "list":Lcom/amazon/ags/api/whispersync/model/SyncableStringList;
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 299
    .local v1, "node":Lorg/json/JSONObject;
    const-string v2, "maxSize"

    invoke-interface {v0}, Lcom/amazon/ags/api/whispersync/model/SyncableStringList;->getMaxSize()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 300
    const-string v2, "values"

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeStringListItems(Lcom/amazon/ags/api/whispersync/model/SyncableStringList;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 301
    if-eqz p2, :cond_0

    .line 302
    const-string v2, "state"

    invoke-interface {p1}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/ags/client/whispersync/model/SyncState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 304
    :cond_0
    return-object v1
.end method

.method private composeStringListItems(Lcom/amazon/ags/api/whispersync/model/SyncableStringList;)Lorg/json/JSONArray;
    .locals 6
    .param p1, "list"    # Lcom/amazon/ags/api/whispersync/model/SyncableStringList;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 308
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 309
    .local v1, "array":Lorg/json/JSONArray;
    invoke-interface {p1}, Lcom/amazon/ags/api/whispersync/model/SyncableStringList;->getValues()[Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;

    move-result-object v0

    .local v0, "arr$":[Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v4, :cond_0

    aget-object v3, v0, v2

    .line 310
    .local v3, "item":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    invoke-direct {p0, v3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeStringItem(Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v1, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 309
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 312
    .end local v3    # "item":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    :cond_0
    return-object v1
.end method

.method private composeStringSet(Lcom/amazon/ags/client/whispersync/model/Mergeable;Z)Lorg/json/JSONObject;
    .locals 4
    .param p2, "composeForDisk"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;Z)",
            "Lorg/json/JSONObject;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 324
    .local p1, "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    move-object v1, p1

    check-cast v1, Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;

    .line 325
    .local v1, "set":Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 326
    .local v0, "node":Lorg/json/JSONObject;
    const-string v2, "values"

    invoke-direct {p0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeStringSetElements(Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 327
    if-eqz p2, :cond_0

    .line 328
    const-string v2, "state"

    invoke-interface {p1}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/amazon/ags/client/whispersync/model/SyncState;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 330
    :cond_0
    return-object v0
.end method

.method private composeStringSetElements(Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;)Lorg/json/JSONArray;
    .locals 4
    .param p1, "set"    # Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 334
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 335
    .local v0, "array":Lorg/json/JSONArray;
    invoke-interface {p1}, Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;

    .line 336
    .local v1, "element":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    invoke-direct {p0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeStringItem(Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_0

    .line 338
    .end local v1    # "element":Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;
    :cond_0
    return-object v0
.end method

.method private createNumberList(Lcom/amazon/ags/client/whispersync/model/Key;ILjava/util/List;Lcom/amazon/ags/client/whispersync/model/SyncState;)Lcom/amazon/ags/client/whispersync/model/NumberList;
    .locals 3
    .param p1, "key"    # Lcom/amazon/ags/client/whispersync/model/Key;
    .param p2, "maxSize"    # I
    .param p4, "state"    # Lcom/amazon/ags/client/whispersync/model/SyncState;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "I",
            "Ljava/util/List",
            "<",
            "Lcom/amazon/ags/client/whispersync/model/NumberElement;",
            ">;",
            "Lcom/amazon/ags/client/whispersync/model/SyncState;",
            ")",
            "Lcom/amazon/ags/client/whispersync/model/NumberList;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 512
    .local p3, "list":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/client/whispersync/model/NumberElement;>;"
    sget-object v0, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller$1;->$SwitchMap$com$amazon$ags$client$whispersync$model$SyncableType:[I

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 523
    new-instance v0, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unexpected type ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] associated with key name ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 514
    :pswitch_0
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/HighNumberList;

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p3, p2, p4}, Lcom/amazon/ags/client/whispersync/model/HighNumberList;-><init>(Ljava/lang/String;Ljava/util/List;ILcom/amazon/ags/client/whispersync/model/SyncState;)V

    .line 520
    :goto_0
    return-object v0

    .line 517
    :pswitch_1
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/LowNumberList;

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p3, p2, p4}, Lcom/amazon/ags/client/whispersync/model/LowNumberList;-><init>(Ljava/lang/String;Ljava/util/List;ILcom/amazon/ags/client/whispersync/model/SyncState;)V

    goto :goto_0

    .line 520
    :pswitch_2
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/LatestNumberList;

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p3, p2, p4}, Lcom/amazon/ags/client/whispersync/model/LatestNumberList;-><init>(Ljava/lang/String;Ljava/util/List;ILcom/amazon/ags/client/whispersync/model/SyncState;)V

    goto :goto_0

    .line 512
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private parseAccumulatingNumber(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;
    .locals 5
    .param p1, "key"    # Lcom/amazon/ags/client/whispersync/model/Key;
    .param p2, "jsonNode"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 427
    const-string v2, "local"

    invoke-direct {p0, p2, v2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseBigDecimalFromValue(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v0

    .line 428
    .local v0, "local":Ljava/math/BigDecimal;
    const-string v2, "remote"

    invoke-direct {p0, p2, v2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseBigDecimalFromValue(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v1

    .line 429
    .local v1, "remote":Ljava/math/BigDecimal;
    new-instance v2, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseSyncState(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v4

    invoke-direct {v2, v3, v0, v1, v4}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;-><init>(Ljava/lang/String;Ljava/math/BigDecimal;Ljava/math/BigDecimal;Lcom/amazon/ags/client/whispersync/model/SyncState;)V

    return-object v2
.end method

.method private parseBigDecimalFromValue(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/math/BigDecimal;
    .locals 4
    .param p1, "node"    # Lorg/json/JSONObject;
    .param p2, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;,
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;
        }
    .end annotation

    .prologue
    .line 656
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 657
    new-instance v1, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Missing \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' field"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 659
    :cond_0
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 660
    .local v0, "valueObject":Ljava/lang/Object;
    if-nez v0, :cond_1

    .line 661
    new-instance v1, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to parse \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' field"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 663
    :cond_1
    instance-of v1, v0, Ljava/lang/Integer;

    if-eqz v1, :cond_2

    .line 664
    new-instance v1, Ljava/math/BigDecimal;

    check-cast v0, Ljava/lang/Integer;

    .end local v0    # "valueObject":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-direct {v1, v2}, Ljava/math/BigDecimal;-><init>(I)V

    .line 670
    :goto_0
    return-object v1

    .line 666
    .restart local v0    # "valueObject":Ljava/lang/Object;
    :cond_2
    instance-of v1, v0, Ljava/lang/Long;

    if-eqz v1, :cond_3

    .line 667
    new-instance v1, Ljava/math/BigDecimal;

    check-cast v0, Ljava/lang/Long;

    .end local v0    # "valueObject":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/math/BigDecimal;-><init>(J)V

    goto :goto_0

    .line 669
    .restart local v0    # "valueObject":Ljava/lang/Object;
    :cond_3
    instance-of v1, v0, Ljava/lang/Double;

    if-eqz v1, :cond_4

    .line 670
    new-instance v1, Ljava/math/BigDecimal;

    check-cast v0, Ljava/lang/Double;

    .end local v0    # "valueObject":Ljava/lang/Object;
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v2

    invoke-direct {v1, v2, v3}, Ljava/math/BigDecimal;-><init>(D)V

    goto :goto_0

    .line 672
    .restart local v0    # "valueObject":Ljava/lang/Object;
    :cond_4
    new-instance v1, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unable to parse \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private parseDataMap(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .locals 7
    .param p1, "json"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 346
    new-instance v0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;

    invoke-direct {v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;-><init>()V

    .line 347
    .local v0, "dataMap":Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 348
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 349
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 350
    .local v2, "jsonKey":Ljava/lang/String;
    invoke-direct {p0, v2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseKey(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/model/Key;

    move-result-object v3

    .line 351
    .local v3, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    .line 352
    .local v5, "value":Lorg/json/JSONObject;
    invoke-direct {p0, v3, v5}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseDataMapEntry(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;

    move-result-object v4

    .line 353
    .local v4, "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    invoke-interface {v0, v3, v4}, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;->putElement(Lcom/amazon/ags/client/whispersync/model/Key;Lcom/amazon/ags/client/whispersync/model/Mergeable;)V

    goto :goto_0

    .line 355
    .end local v2    # "jsonKey":Ljava/lang/String;
    .end local v3    # "key":Lcom/amazon/ags/client/whispersync/model/Key;
    .end local v4    # "mergeable":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    .end local v5    # "value":Lorg/json/JSONObject;
    :cond_0
    return-object v0
.end method

.method private parseDataMapEntry(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 3
    .param p1, "key"    # Lcom/amazon/ags/client/whispersync/model/Key;
    .param p2, "element"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 369
    sget-object v0, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller$1;->$SwitchMap$com$amazon$ags$client$whispersync$model$SyncableType:[I

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 399
    new-instance v0, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Invalid type ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "] associated with key name ["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 373
    :pswitch_0
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseNumber(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;

    move-result-object v0

    .line 396
    :goto_0
    return-object v0

    .line 376
    :pswitch_1
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseAccumulatingNumber(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;

    move-result-object v0

    goto :goto_0

    .line 381
    :pswitch_2
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseNumberList(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;

    move-result-object v0

    goto :goto_0

    .line 384
    :pswitch_3
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseStringList(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/LatestStringList;

    move-result-object v0

    goto :goto_0

    .line 387
    :pswitch_4
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseString(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;

    move-result-object v0

    goto :goto_0

    .line 390
    :pswitch_5
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseDeveloperString(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;

    move-result-object v0

    goto :goto_0

    .line 393
    :pswitch_6
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseStringSet(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/StringSet;

    move-result-object v0

    goto :goto_0

    .line 396
    :pswitch_7
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseDataMap(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    move-result-object v0

    goto :goto_0

    .line 369
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_4
        :pswitch_5
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_3
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method private parseDeveloperString(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 1
    .param p1, "key"    # Lcom/amazon/ags/client/whispersync/model/Key;
    .param p2, "jsonNode"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 453
    const-string v0, "value"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 454
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseDeveloperStringFromDisk(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;

    move-result-object v0

    .line 457
    :goto_0
    return-object v0

    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseDeveloperStringFromService(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;

    move-result-object v0

    goto :goto_0
.end method

.method private parseDeveloperStringFromDisk(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 18
    .param p1, "key"    # Lcom/amazon/ags/client/whispersync/model/Key;
    .param p2, "jsonNode"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 461
    const-string v2, "local"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 462
    new-instance v2, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Missing \'local\' field for key:"

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/amazon/ags/client/whispersync/model/Key;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v3, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 464
    :cond_0
    const-string v2, "local"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseNullableStringValue(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 466
    .local v4, "local":Ljava/lang/String;
    const/4 v5, 0x0

    .line 467
    .local v5, "remote":Ljava/lang/String;
    const-wide/16 v8, 0x0

    .line 468
    .local v8, "remoteTimestamp":J
    const/16 v17, 0x1

    .line 471
    .local v17, "remoteValueExists":Z
    :try_start_0
    const-string v2, "remote"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseNullableStringValue(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 472
    const-string v2, "rts"

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v8

    .line 478
    :goto_0
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseTimestamp(Lorg/json/JSONObject;)J

    move-result-wide v6

    .line 480
    .local v6, "timestamp":J
    if-eqz v17, :cond_1

    .line 481
    new-instance v2, Lcom/amazon/ags/client/whispersync/model/DeveloperString;

    invoke-virtual/range {p1 .. p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseSyncState(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v10

    invoke-direct/range {v2 .. v10}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLcom/amazon/ags/client/whispersync/model/SyncState;)V

    .line 483
    :goto_1
    return-object v2

    .line 473
    .end local v6    # "timestamp":J
    :catch_0
    move-exception v16

    .line 475
    .local v16, "ignored":Lorg/json/JSONException;
    const/16 v17, 0x0

    goto :goto_0

    .line 483
    .end local v16    # "ignored":Lorg/json/JSONException;
    .restart local v6    # "timestamp":J
    :cond_1
    new-instance v10, Lcom/amazon/ags/client/whispersync/model/DeveloperString;

    invoke-virtual/range {p1 .. p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v11

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseSyncState(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v15

    move-object v12, v4

    move-wide v13, v6

    invoke-direct/range {v10 .. v15}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;-><init>(Ljava/lang/String;Ljava/lang/String;JLcom/amazon/ags/client/whispersync/model/SyncState;)V

    move-object v2, v10

    goto :goto_1
.end method

.method private parseDeveloperStringFromService(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 9
    .param p1, "key"    # Lcom/amazon/ags/client/whispersync/model/Key;
    .param p2, "jsonNode"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 488
    const-string v0, "value"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 489
    new-instance v0, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Missing \'value\' field for key:"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 492
    :cond_0
    const-string v0, "value"

    invoke-direct {p0, p2, v0}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseNullableStringValue(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 493
    .local v2, "value":Ljava/lang/String;
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseTimestamp(Lorg/json/JSONObject;)J

    move-result-wide v4

    .line 494
    .local v4, "timestamp":J
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/DeveloperString;

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseSyncState(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v8

    move-object v3, v2

    move-wide v6, v4

    invoke-direct/range {v0 .. v8}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLcom/amazon/ags/client/whispersync/model/SyncState;)V

    return-object v0
.end method

.method private parseKey(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/model/Key;
    .locals 5
    .param p1, "keyString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;
        }
    .end annotation

    .prologue
    .line 361
    :try_start_0
    new-instance v1, Lcom/amazon/ags/client/whispersync/model/Key;

    invoke-direct {v1, p1}, Lcom/amazon/ags/client/whispersync/model/Key;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 365
    .local v1, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    return-object v1

    .line 362
    .end local v1    # "key":Lcom/amazon/ags/client/whispersync/model/Key;
    :catch_0
    move-exception v0

    .line 363
    .local v0, "ex":Ljava/lang/IllegalArgumentException;
    new-instance v2, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid key: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private parseMaxSize(Lorg/json/JSONObject;)I
    .locals 2
    .param p1, "node"    # Lorg/json/JSONObject;

    .prologue
    .line 580
    :try_start_0
    const-string v1, "maxSize"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 582
    :goto_0
    return v1

    .line 581
    :catch_0
    move-exception v0

    .line 582
    .local v0, "e":Lorg/json/JSONException;
    const/4 v1, 0x5

    goto :goto_0
.end method

.method private parseMetadata(Lorg/json/JSONObject;)Ljava/util/Map;
    .locals 3
    .param p1, "node"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 618
    :try_start_0
    const-string v2, "md"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 619
    .local v1, "metadata":Lorg/json/JSONObject;
    invoke-direct {p0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseMetadataNode(Lorg/json/JSONObject;)Ljava/util/Map;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 621
    .end local v1    # "metadata":Lorg/json/JSONObject;
    :goto_0
    return-object v2

    .line 620
    :catch_0
    move-exception v0

    .line 621
    .local v0, "ignored":Lorg/json/JSONException;
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private parseMetadataNode(Lorg/json/JSONObject;)Ljava/util/Map;
    .locals 8
    .param p1, "metadataNode"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 626
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 627
    .local v3, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .line 628
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 629
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 631
    .local v2, "key":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 632
    .local v4, "value":Ljava/lang/String;
    invoke-interface {v3, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 633
    .end local v4    # "value":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 634
    .local v0, "e":Lorg/json/JSONException;
    const-string v5, "GC_Whispersync"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unexpected type ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " for key ["

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "]"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 637
    .end local v0    # "e":Lorg/json/JSONException;
    .end local v2    # "key":Ljava/lang/String;
    :cond_0
    return-object v3
.end method

.method private parseNullableStringValue(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "jsonNode"    # Lorg/json/JSONObject;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 587
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    .line 588
    .local v0, "value":Ljava/lang/Object;
    sget-object v1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-ne v0, v1, :cond_0

    .line 589
    const/4 v1, 0x0

    .line 591
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {p1, p2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method private parseNumber(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 8
    .param p1, "key"    # Lcom/amazon/ags/client/whispersync/model/Key;
    .param p2, "json"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 405
    const-string v0, "value"

    invoke-direct {p0, p2, v0}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseBigDecimalFromValue(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v2

    .line 406
    .local v2, "value":Ljava/math/BigDecimal;
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseTimestamp(Lorg/json/JSONObject;)J

    move-result-wide v4

    .line 407
    .local v4, "timestamp":J
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseMetadata(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v3

    .line 408
    .local v3, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseSyncState(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v6

    .line 410
    .local v6, "state":Lcom/amazon/ags/client/whispersync/model/SyncState;
    sget-object v0, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller$1;->$SwitchMap$com$amazon$ags$client$whispersync$model$SyncableType:[I

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 421
    new-instance v0, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unexpected type ["

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v7, "] associated with key name ["

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v7, "]"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 412
    :pswitch_0
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/HighestNumber;

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;-><init>(Ljava/lang/String;Ljava/math/BigDecimal;Ljava/util/Map;JLcom/amazon/ags/client/whispersync/model/SyncState;)V

    .line 418
    :goto_0
    return-object v0

    .line 415
    :pswitch_1
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/LowestNumber;

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/client/whispersync/model/LowestNumber;-><init>(Ljava/lang/String;Ljava/math/BigDecimal;Ljava/util/Map;JLcom/amazon/ags/client/whispersync/model/SyncState;)V

    goto :goto_0

    .line 418
    :pswitch_2
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/LatestNumber;

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/client/whispersync/model/LatestNumber;-><init>(Ljava/lang/String;Ljava/math/BigDecimal;Ljava/util/Map;JLcom/amazon/ags/client/whispersync/model/SyncState;)V

    goto :goto_0

    .line 410
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private parseNumberElement(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/NumberElement;
    .locals 5
    .param p1, "node"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 529
    const-string v4, "value"

    invoke-direct {p0, p1, v4}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseBigDecimalFromValue(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/math/BigDecimal;

    move-result-object v3

    .line 530
    .local v3, "value":Ljava/math/BigDecimal;
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseTimestamp(Lorg/json/JSONObject;)J

    move-result-wide v1

    .line 531
    .local v1, "timestamp":J
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseMetadata(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v0

    .line 532
    .local v0, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v4, Lcom/amazon/ags/client/whispersync/model/NumberElement;

    invoke-direct {v4, v3, v0, v1, v2}, Lcom/amazon/ags/client/whispersync/model/NumberElement;-><init>(Ljava/math/BigDecimal;Ljava/util/Map;J)V

    return-object v4
.end method

.method private parseNumberList(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 7
    .param p1, "key"    # Lcom/amazon/ags/client/whispersync/model/Key;
    .param p2, "jsonNode"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 498
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseMaxSize(Lorg/json/JSONObject;)I

    move-result v1

    .line 499
    .local v1, "maxSize":I
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 500
    .local v2, "numberList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/client/whispersync/model/NumberElement;>;"
    const-string v6, "values"

    invoke-virtual {p2, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 501
    .local v5, "valuesNode":Lorg/json/JSONArray;
    if-eqz v5, :cond_0

    .line 502
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_0
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v0, v6, :cond_0

    .line 503
    invoke-virtual {v5, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 504
    .local v4, "valueNode":Lorg/json/JSONObject;
    invoke-direct {p0, v4}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseNumberElement(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/NumberElement;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 502
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 507
    .end local v0    # "index":I
    .end local v4    # "valueNode":Lorg/json/JSONObject;
    :cond_0
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseSyncState(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v3

    .line 508
    .local v3, "state":Lcom/amazon/ags/client/whispersync/model/SyncState;
    invoke-direct {p0, p1, v1, v2, v3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->createNumberList(Lcom/amazon/ags/client/whispersync/model/Key;ILjava/util/List;Lcom/amazon/ags/client/whispersync/model/SyncState;)Lcom/amazon/ags/client/whispersync/model/NumberList;

    move-result-object v6

    return-object v6
.end method

.method private parseString(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 8
    .param p1, "key"    # Lcom/amazon/ags/client/whispersync/model/Key;
    .param p2, "jsonNode"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "Lorg/json/JSONObject;",
            ")",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 433
    const-string v0, "value"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 434
    new-instance v0, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Missing \'value\' field for key:"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 436
    :cond_0
    const-string v0, "value"

    invoke-direct {p0, p2, v0}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseNullableStringValue(Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 437
    .local v2, "value":Ljava/lang/String;
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseTimestamp(Lorg/json/JSONObject;)J

    move-result-wide v4

    .line 438
    .local v4, "timestamp":J
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseMetadata(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v3

    .line 439
    .local v3, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseSyncState(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v6

    .line 441
    .local v6, "state":Lcom/amazon/ags/client/whispersync/model/SyncState;
    sget-object v0, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller$1;->$SwitchMap$com$amazon$ags$client$whispersync$model$SyncableType:[I

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 446
    new-instance v0, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Unexpected type ["

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v7, "] associated with key name ["

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v7, "]"

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 443
    :pswitch_0
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/LatestString;

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct/range {v0 .. v6}, Lcom/amazon/ags/client/whispersync/model/LatestString;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;JLcom/amazon/ags/client/whispersync/model/SyncState;)V

    return-object v0

    .line 441
    nop

    :pswitch_data_0
    .packed-switch 0x5
        :pswitch_0
    .end packed-switch
.end method

.method private parseStringItem(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/StringElement;
    .locals 6
    .param p1, "node"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 553
    const-string v4, "value"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 554
    new-instance v4, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;

    const-string v5, "Missing \'value\' field for StringList item"

    invoke-direct {v4, v5}, Lcom/amazon/ags/client/whispersync/marshaller/ParseException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 556
    :cond_0
    const-string v4, "value"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 558
    .local v3, "value":Ljava/lang/String;
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseTimestamp(Lorg/json/JSONObject;)J

    move-result-wide v1

    .line 559
    .local v1, "timestamp":J
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseMetadata(Lorg/json/JSONObject;)Ljava/util/Map;

    move-result-object v0

    .line 560
    .local v0, "metadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v4, Lcom/amazon/ags/client/whispersync/model/StringElement;

    invoke-direct {v4, v3, v0, v1, v2}, Lcom/amazon/ags/client/whispersync/model/StringElement;-><init>(Ljava/lang/String;Ljava/util/Map;J)V

    return-object v4
.end method

.method private parseStringList(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/LatestStringList;
    .locals 8
    .param p1, "key"    # Lcom/amazon/ags/client/whispersync/model/Key;
    .param p2, "jsonNode"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 536
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseMaxSize(Lorg/json/JSONObject;)I

    move-result v1

    .line 538
    .local v1, "maxSize":I
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 540
    .local v3, "stringList":Ljava/util/List;, "Ljava/util/List<Lcom/amazon/ags/client/whispersync/model/StringElement;>;"
    const-string v6, "values"

    invoke-virtual {p2, v6}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 541
    .local v5, "valuesNode":Lorg/json/JSONArray;
    if-eqz v5, :cond_0

    .line 542
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_0
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v6

    if-ge v0, v6, :cond_0

    .line 543
    invoke-virtual {v5, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 544
    .local v4, "valueNode":Lorg/json/JSONObject;
    invoke-direct {p0, v4}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseStringItem(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/StringElement;

    move-result-object v6

    invoke-interface {v3, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 542
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 548
    .end local v0    # "index":I
    .end local v4    # "valueNode":Lorg/json/JSONObject;
    :cond_0
    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseSyncState(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v2

    .line 549
    .local v2, "state":Lcom/amazon/ags/client/whispersync/model/SyncState;
    new-instance v6, Lcom/amazon/ags/client/whispersync/model/LatestStringList;

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v3, v1, v2}, Lcom/amazon/ags/client/whispersync/model/LatestStringList;-><init>(Ljava/lang/String;Ljava/util/List;ILcom/amazon/ags/client/whispersync/model/SyncState;)V

    return-object v6
.end method

.method private parseStringSet(Lcom/amazon/ags/client/whispersync/model/Key;Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/StringSet;
    .locals 7
    .param p1, "key"    # Lcom/amazon/ags/client/whispersync/model/Key;
    .param p2, "node"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 564
    const-string v4, "values"

    invoke-virtual {p2, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 566
    .local v3, "valuesNode":Lorg/json/JSONArray;
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 568
    .local v1, "stringSet":Ljava/util/Set;, "Ljava/util/Set<Lcom/amazon/ags/api/whispersync/model/SyncableStringElement;>;"
    if-eqz v3, :cond_0

    .line 569
    const/4 v0, 0x0

    .local v0, "index":I
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v0, v4, :cond_0

    .line 570
    invoke-virtual {v3, v0}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    .line 571
    .local v2, "valueNode":Lorg/json/JSONObject;
    invoke-direct {p0, v2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseStringItem(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/StringElement;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 569
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 575
    .end local v0    # "index":I
    .end local v2    # "valueNode":Lorg/json/JSONObject;
    :cond_0
    new-instance v4, Lcom/amazon/ags/client/whispersync/model/StringSet;

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, p2}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseSyncState(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v6

    invoke-direct {v4, v5, v1, v6}, Lcom/amazon/ags/client/whispersync/model/StringSet;-><init>(Ljava/lang/String;Ljava/util/Set;Lcom/amazon/ags/client/whispersync/model/SyncState;)V

    return-object v4
.end method

.method private parseSyncState(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/model/SyncState;
    .locals 3
    .param p1, "node"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/client/whispersync/marshaller/ParseException;,
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 641
    const-string v2, "state"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 642
    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 651
    :goto_0
    return-object v2

    .line 644
    :cond_0
    const-string v2, "state"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 645
    .local v1, "state":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 646
    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    goto :goto_0

    .line 649
    :cond_1
    :try_start_0
    invoke-static {v1}, Lcom/amazon/ags/client/whispersync/model/SyncState;->valueOf(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/model/SyncState;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    goto :goto_0

    .line 650
    :catch_0
    move-exception v0

    .line 651
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    goto :goto_0
.end method

.method private parseTimestamp(Lorg/json/JSONObject;)J
    .locals 4
    .param p1, "node"    # Lorg/json/JSONObject;

    .prologue
    .line 598
    :try_start_0
    const-string v1, "ts"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v1

    .line 601
    :goto_0
    return-wide v1

    .line 599
    :catch_0
    move-exception v0

    .line 600
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "GC_Whispersync"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "No timestamp value found in node ["

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "]"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 601
    const-wide/16 v1, 0x0

    goto :goto_0
.end method

.method private reportEvent(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 691
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/amazon/ags/client/whispersync/metrics/WhispersyncMetricsFactory;->createCountEvent(Ljava/lang/String;I)Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;

    move-result-object v0

    .line 692
    .local v0, "event":Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;
    if-eqz v0, :cond_0

    .line 693
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    invoke-virtual {v1, v0}, Lcom/amazon/ags/client/metrics/EventCollectorClient;->reportGenericEvent(Lcom/amazon/ags/client/metrics/events/GameCircleGenericEvent;)V

    .line 695
    :cond_0
    return-void
.end method


# virtual methods
.method public composeForDisk(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;)Ljava/lang/String;
    .locals 5
    .param p1, "gameDataMap"    # Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation

    .prologue
    .line 89
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 92
    .local v2, "whispersyncData":Lorg/json/JSONObject;
    if-eqz p1, :cond_0

    const/4 v3, 0x1

    :try_start_0
    invoke-direct {p0, p1, v3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeDataMap(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;Z)Lorg/json/JSONObject;

    move-result-object v1

    .line 93
    .local v1, "gameData":Lorg/json/JSONObject;
    :goto_0
    const-string v3, "gameData"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 94
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    return-object v3

    .line 92
    .end local v1    # "gameData":Lorg/json/JSONObject;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0

    .line 95
    :catch_0
    move-exception v0

    .line 96
    .local v0, "e":Lorg/json/JSONException;
    new-instance v3, Lcom/amazon/ags/AGSClientException;

    const-string v4, "Unable to compose JSON"

    invoke-direct {v3, v4, v0}, Lcom/amazon/ags/AGSClientException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public composeForService(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;)Ljava/lang/String;
    .locals 5
    .param p1, "gameDataMap"    # Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/amazon/ags/AGSClientException;
        }
    .end annotation

    .prologue
    .line 76
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 77
    .local v2, "whispersyncData":Lorg/json/JSONObject;
    if-eqz p1, :cond_0

    const/4 v3, 0x0

    invoke-direct {p0, p1, v3}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->composeDataMap(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;Z)Lorg/json/JSONObject;

    move-result-object v1

    .line 78
    .local v1, "gameData":Ljava/lang/Object;
    :goto_0
    const-string v3, "gameData"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 79
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 77
    .end local v1    # "gameData":Ljava/lang/Object;
    :cond_0
    sget-object v1, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 80
    .end local v2    # "whispersyncData":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 81
    .local v0, "e":Lorg/json/JSONException;
    new-instance v3, Lcom/amazon/ags/AGSClientException;

    const-string v4, "Unable to compose JSON"

    invoke-direct {v3, v4, v0}, Lcom/amazon/ags/AGSClientException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v3
.end method

.method public parse(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .locals 7
    .param p1, "gameDataMapJson"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 103
    if-nez p1, :cond_1

    .line 122
    :cond_0
    :goto_0
    return-object v3

    .line 108
    :cond_1
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 109
    .local v2, "root":Lorg/json/JSONObject;
    const-string v4, "gameData"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 112
    const-string v4, "gameData"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 114
    .local v1, "gameDataRoot":Lorg/json/JSONObject;
    if-eqz v1, :cond_0

    .line 118
    invoke-direct {p0, v1}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->parseDataMap(Lorg/json/JSONObject;)Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_0

    .line 119
    .end local v1    # "gameDataRoot":Lorg/json/JSONObject;
    .end local v2    # "root":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 120
    .local v0, "e":Ljava/lang/Exception;
    const-string v4, "GC_Whispersync"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Exception thrown while parsing game data JSON map ["

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "]"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 121
    const-string v4, "WHISPERSYNC_PARSE_EXCEPTION"

    invoke-direct {p0, v4}, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->reportEvent(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setEventCollectorClient(Lcom/amazon/ags/client/metrics/EventCollectorClient;)V
    .locals 0
    .param p1, "eventCollectorClient"    # Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .prologue
    .line 127
    if-eqz p1, :cond_0

    .line 128
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/marshaller/JsonGameDataMarshaller;->eventCollectorClient:Lcom/amazon/ags/client/metrics/EventCollectorClient;

    .line 130
    :cond_0
    return-void
.end method
