.class public Lcom/amazon/ags/client/whispersync/GameDataSingleMap;
.super Ljava/lang/Object;
.source "GameDataSingleMap.java"

# interfaces
.implements Lcom/amazon/ags/client/whispersync/InternalGameDataMap;


# static fields
.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private final gameDataMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;>;"
        }
    .end annotation
.end field

.field private final name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    .line 53
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->name:Ljava/lang/String;

    .line 54
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    .line 58
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->name:Ljava/lang/String;

    .line 59
    return-void
.end method

.method private getKeysByType(Lcom/amazon/ags/client/whispersync/model/SyncableType;)Ljava/util/Set;
    .locals 5
    .param p1, "type"    # Lcom/amazon/ags/client/whispersync/model/SyncableType;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/SyncableType;",
            ")",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 364
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 365
    .local v0, "allKeysByType":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/amazon/ags/client/whispersync/model/Key;

    .line 366
    .local v2, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-virtual {v2}, Lcom/amazon/ags/client/whispersync/model/Key;->getType()Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v3

    if-ne v3, p1, :cond_0

    .line 368
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/amazon/ags/client/whispersync/model/Mergeable;

    invoke-interface {v3}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v3

    sget-object v4, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-eq v3, v4, :cond_0

    .line 369
    invoke-virtual {v2}, Lcom/amazon/ags/client/whispersync/model/Key;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 373
    .end local v2    # "key":Lcom/amazon/ags/client/whispersync/model/Key;
    :cond_1
    return-object v0
.end method

.method private mergeLocked(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;)V
    .locals 6
    .param p1, "fromMap"    # Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    .prologue
    .line 346
    if-eqz p1, :cond_0

    invoke-interface {p1}, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;->getAllElements()Ljava/util/Map;

    move-result-object v3

    if-eqz v3, :cond_0

    invoke-interface {p1}, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;->getAllElements()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 347
    :cond_0
    const-string v3, "GC_Whispersync"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "GameDataMap - Unable to merge from an invalid/unset GameDataMap "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 360
    :cond_1
    return-void

    .line 350
    :cond_2
    invoke-interface {p1}, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;->getAllElements()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 352
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/amazon/ags/client/whispersync/model/Key;Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;>;"
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/client/whispersync/model/Mergeable;

    .line 353
    .local v1, "existing":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    if-nez v1, :cond_3

    .line 354
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v3, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 356
    :cond_3
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/amazon/ags/client/whispersync/model/Mergeable;

    invoke-interface {v1, v3}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->merge(Lcom/amazon/ags/client/whispersync/model/Mergeable;)V

    goto :goto_0
.end method


# virtual methods
.method public completeSyncing()V
    .locals 3

    .prologue
    .line 411
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 413
    :try_start_0
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/client/whispersync/model/Mergeable;

    .line 414
    .local v0, "element":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    invoke-interface {v0}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->completeSyncing()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 417
    .end local v0    # "element":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v2

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    .line 419
    return-void
.end method

.method public deepCopy()Lcom/amazon/ags/client/whispersync/GameDataSingleMap;
    .locals 6

    .prologue
    .line 64
    const-string v3, "GC_Whispersync"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "GameDataMap - Deep copy of GameDataMap with name: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    new-instance v0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;

    invoke-direct {v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;-><init>()V

    .line 66
    .local v0, "copy":Lcom/amazon/ags/client/whispersync/GameDataSingleMap;
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 67
    .local v1, "element":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/amazon/ags/client/whispersync/model/Key;Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;>;"
    iget-object v4, v0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/amazon/ags/client/whispersync/model/Mergeable;

    invoke-interface {v3}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->deepCopy()Lcom/amazon/ags/client/whispersync/model/Mergeable;

    move-result-object v3

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 69
    .end local v1    # "element":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Lcom/amazon/ags/client/whispersync/model/Key;Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;>;"
    :cond_0
    return-object v0
.end method

.method public bridge synthetic deepCopy()Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .locals 1

    .prologue
    .line 40
    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->deepCopy()Lcom/amazon/ags/client/whispersync/GameDataSingleMap;

    move-result-object v0

    return-object v0
.end method

.method public getAccumulatingNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableAccumulatingNumber;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 133
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/Key;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->ACCUMULATING_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {v0, v1, p1}, Lcom/amazon/ags/client/whispersync/model/Key;-><init>(Lcom/amazon/ags/client/whispersync/model/SyncableType;Ljava/lang/String;)V

    .line 134
    .local v0, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 136
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 137
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    new-instance v2, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;

    invoke-direct {v2, p1}, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/client/whispersync/model/AccumulatingNumber;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 141
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v1
.end method

.method public getAccumulatingNumberKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 274
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->ACCUMULATING_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->getKeysByType(Lcom/amazon/ags/client/whispersync/model/SyncableType;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getAllElements()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;>;"
        }
    .end annotation

    .prologue
    .line 320
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getDeveloperString(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableDeveloperString;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 231
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/Key;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->DEVELOPER_STRING:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {v0, v1, p1}, Lcom/amazon/ags/client/whispersync/model/Key;-><init>(Lcom/amazon/ags/client/whispersync/model/SyncableType;Ljava/lang/String;)V

    .line 232
    .local v0, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 234
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 235
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    new-instance v2, Lcom/amazon/ags/client/whispersync/model/DeveloperString;

    invoke-direct {v2, p1}, Lcom/amazon/ags/client/whispersync/model/DeveloperString;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/api/whispersync/model/SyncableDeveloperString;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 239
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v1
.end method

.method public getDeveloperStringKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 309
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->DEVELOPER_STRING:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->getKeysByType(Lcom/amazon/ags/client/whispersync/model/SyncableType;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getHighNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 147
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/Key;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->HIGHEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {v0, v1, p1}, Lcom/amazon/ags/client/whispersync/model/Key;-><init>(Lcom/amazon/ags/client/whispersync/model/SyncableType;Ljava/lang/String;)V

    .line 148
    .local v0, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 150
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 151
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    new-instance v2, Lcom/amazon/ags/client/whispersync/model/HighNumberList;

    invoke-direct {v2, p1}, Lcom/amazon/ags/client/whispersync/model/HighNumberList;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 155
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v1
.end method

.method public getHighNumberListKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 279
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->HIGHEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->getKeysByType(Lcom/amazon/ags/client/whispersync/model/SyncableType;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getHighestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 91
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/Key;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->HIGHEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {v0, v1, p1}, Lcom/amazon/ags/client/whispersync/model/Key;-><init>(Lcom/amazon/ags/client/whispersync/model/SyncableType;Ljava/lang/String;)V

    .line 92
    .local v0, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 94
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 95
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    new-instance v2, Lcom/amazon/ags/client/whispersync/model/HighestNumber;

    invoke-direct {v2, p1}, Lcom/amazon/ags/client/whispersync/model/HighestNumber;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/client/whispersync/model/HighestNumber;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 99
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v1
.end method

.method public getHighestNumberKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 259
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->HIGHEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->getKeysByType(Lcom/amazon/ags/client/whispersync/model/SyncableType;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getLatestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 119
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/Key;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {v0, v1, p1}, Lcom/amazon/ags/client/whispersync/model/Key;-><init>(Lcom/amazon/ags/client/whispersync/model/SyncableType;Ljava/lang/String;)V

    .line 120
    .local v0, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 122
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 123
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    new-instance v2, Lcom/amazon/ags/client/whispersync/model/LatestNumber;

    invoke-direct {v2, p1}, Lcom/amazon/ags/client/whispersync/model/LatestNumber;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 125
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/client/whispersync/model/LatestNumber;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 127
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v1
.end method

.method public getLatestNumberKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 269
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->getKeysByType(Lcom/amazon/ags/client/whispersync/model/SyncableType;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getLatestNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 175
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/Key;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {v0, v1, p1}, Lcom/amazon/ags/client/whispersync/model/Key;-><init>(Lcom/amazon/ags/client/whispersync/model/SyncableType;Ljava/lang/String;)V

    .line 176
    .local v0, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 178
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 179
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    new-instance v2, Lcom/amazon/ags/client/whispersync/model/LatestNumberList;

    invoke-direct {v2, p1}, Lcom/amazon/ags/client/whispersync/model/LatestNumberList;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 181
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 183
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v1
.end method

.method public getLatestNumberListKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 289
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->getKeysByType(Lcom/amazon/ags/client/whispersync/model/SyncableType;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getLatestString(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableString;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 189
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/Key;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_STRING:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {v0, v1, p1}, Lcom/amazon/ags/client/whispersync/model/Key;-><init>(Lcom/amazon/ags/client/whispersync/model/SyncableType;Ljava/lang/String;)V

    .line 190
    .local v0, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 192
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 193
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    new-instance v2, Lcom/amazon/ags/client/whispersync/model/LatestString;

    invoke-direct {v2, p1}, Lcom/amazon/ags/client/whispersync/model/LatestString;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/api/whispersync/model/SyncableString;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 197
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v1
.end method

.method public getLatestStringKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 294
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_STRING:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->getKeysByType(Lcom/amazon/ags/client/whispersync/model/SyncableType;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getLatestStringList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableStringList;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 203
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/Key;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_STRING_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {v0, v1, p1}, Lcom/amazon/ags/client/whispersync/model/Key;-><init>(Lcom/amazon/ags/client/whispersync/model/SyncableType;Ljava/lang/String;)V

    .line 204
    .local v0, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 206
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 207
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    new-instance v2, Lcom/amazon/ags/client/whispersync/model/LatestStringList;

    invoke-direct {v2, p1}, Lcom/amazon/ags/client/whispersync/model/LatestStringList;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 209
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/api/whispersync/model/SyncableStringList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 211
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v1
.end method

.method public getLatestStringListKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 299
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LATEST_STRING_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->getKeysByType(Lcom/amazon/ags/client/whispersync/model/SyncableType;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getLowNumberList(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 161
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/Key;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LOWEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {v0, v1, p1}, Lcom/amazon/ags/client/whispersync/model/Key;-><init>(Lcom/amazon/ags/client/whispersync/model/SyncableType;Ljava/lang/String;)V

    .line 162
    .local v0, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 164
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 165
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    new-instance v2, Lcom/amazon/ags/client/whispersync/model/LowNumberList;

    invoke-direct {v2, p1}, Lcom/amazon/ags/client/whispersync/model/LowNumberList;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 167
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/api/whispersync/model/SyncableNumberList;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 169
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v1
.end method

.method public getLowNumberListKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 284
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LOWEST_NUMBER_LIST:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->getKeysByType(Lcom/amazon/ags/client/whispersync/model/SyncableType;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getLowestNumber(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableNumber;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 105
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/Key;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LOWEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {v0, v1, p1}, Lcom/amazon/ags/client/whispersync/model/Key;-><init>(Lcom/amazon/ags/client/whispersync/model/SyncableType;Ljava/lang/String;)V

    .line 106
    .local v0, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 108
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 109
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    new-instance v2, Lcom/amazon/ags/client/whispersync/model/LowestNumber;

    invoke-direct {v2, p1}, Lcom/amazon/ags/client/whispersync/model/LowestNumber;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/client/whispersync/model/LowestNumber;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 113
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v1
.end method

.method public getLowestNumberKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 264
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->LOWEST_NUMBER:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->getKeysByType(Lcom/amazon/ags/client/whispersync/model/SyncableType;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getMap(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/GameDataMap;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 245
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/Key;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->MAP:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {v0, v1, p1}, Lcom/amazon/ags/client/whispersync/model/Key;-><init>(Lcom/amazon/ags/client/whispersync/model/SyncableType;Ljava/lang/String;)V

    .line 246
    .local v0, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 248
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 249
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    new-instance v2, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;

    invoke-direct {v2, p1}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/api/whispersync/GameDataMap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 253
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v1
.end method

.method public getMapKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 314
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->MAP:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->getKeysByType(Lcom/amazon/ags/client/whispersync/model/SyncableType;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getState()Lcom/amazon/ags/client/whispersync/model/SyncState;
    .locals 5

    .prologue
    .line 382
    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 383
    .local v2, "state":Lcom/amazon/ags/client/whispersync/model/SyncState;
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/client/whispersync/model/Mergeable;

    .line 384
    .local v0, "element":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    invoke-interface {v0}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v3

    sget-object v4, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v3, v4, :cond_2

    .line 385
    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncState;->DIRTY:Lcom/amazon/ags/client/whispersync/model/SyncState;

    .line 392
    .end local v0    # "element":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .end local v2    # "state":Lcom/amazon/ags/client/whispersync/model/SyncState;
    :cond_1
    return-object v2

    .line 386
    .restart local v0    # "element":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .restart local v2    # "state":Lcom/amazon/ags/client/whispersync/model/SyncState;
    :cond_2
    invoke-interface {v0}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v3

    sget-object v4, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v3, v4, :cond_3

    .line 387
    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCING:Lcom/amazon/ags/client/whispersync/model/SyncState;

    goto :goto_0

    .line 388
    :cond_3
    invoke-interface {v0}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->getState()Lcom/amazon/ags/client/whispersync/model/SyncState;

    move-result-object v3

    sget-object v4, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v3, v4, :cond_0

    sget-object v3, Lcom/amazon/ags/client/whispersync/model/SyncState;->NOT_SET:Lcom/amazon/ags/client/whispersync/model/SyncState;

    if-ne v2, v3, :cond_0

    .line 389
    sget-object v2, Lcom/amazon/ags/client/whispersync/model/SyncState;->SYNCED:Lcom/amazon/ags/client/whispersync/model/SyncState;

    goto :goto_0
.end method

.method public getStringSet(Ljava/lang/String;)Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 217
    new-instance v0, Lcom/amazon/ags/client/whispersync/model/Key;

    sget-object v1, Lcom/amazon/ags/client/whispersync/model/SyncableType;->STRING_SET:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {v0, v1, p1}, Lcom/amazon/ags/client/whispersync/model/Key;-><init>(Lcom/amazon/ags/client/whispersync/model/SyncableType;Ljava/lang/String;)V

    .line 218
    .local v0, "key":Lcom/amazon/ags/client/whispersync/model/Key;
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 220
    :try_start_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 221
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    new-instance v2, Lcom/amazon/ags/client/whispersync/model/StringSet;

    invoke-direct {v2, p1}, Lcom/amazon/ags/client/whispersync/model/StringSet;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 223
    :cond_0
    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/amazon/ags/api/whispersync/model/SyncableStringSet;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 225
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    return-object v1

    :catchall_0
    move-exception v1

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v1
.end method

.method public getStringSetKeys()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 304
    sget-object v0, Lcom/amazon/ags/client/whispersync/model/SyncableType;->STRING_SET:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-direct {p0, v0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->getKeysByType(Lcom/amazon/ags/client/whispersync/model/SyncableType;)Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public lockAndCopy()Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    .locals 9

    .prologue
    .line 74
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    .line 75
    .local v2, "copyStart":J
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 78
    :try_start_0
    invoke-virtual {p0}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->deepCopy()Lcom/amazon/ags/client/whispersync/GameDataSingleMap;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 81
    .local v4, "gameDataMapCopy":Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    .line 83
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    .line 84
    .local v0, "copyEnd":J
    const-string v5, "GC_Whispersync"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "GameDataMap copy took "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    sub-long v7, v0, v2

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " msec."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    return-object v4

    .line 81
    .end local v0    # "copyEnd":J
    .end local v4    # "gameDataMapCopy":Lcom/amazon/ags/client/whispersync/InternalGameDataMap;
    :catchall_0
    move-exception v5

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v5
.end method

.method public merge(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;)V
    .locals 1
    .param p1, "fromMap"    # Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    .prologue
    .line 335
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 337
    :try_start_0
    invoke-direct {p0, p1}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->mergeLocked(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 339
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    .line 341
    return-void

    .line 339
    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v0
.end method

.method public bridge synthetic merge(Lcom/amazon/ags/client/whispersync/model/Mergeable;)V
    .locals 0
    .param p1, "x0"    # Lcom/amazon/ags/client/whispersync/model/Mergeable;

    .prologue
    .line 40
    check-cast p1, Lcom/amazon/ags/client/whispersync/InternalGameDataMap;

    .end local p1    # "x0":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    invoke-virtual {p0, p1}, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->merge(Lcom/amazon/ags/client/whispersync/InternalGameDataMap;)V

    return-void
.end method

.method public putElement(Lcom/amazon/ags/client/whispersync/model/Key;Lcom/amazon/ags/client/whispersync/model/Mergeable;)V
    .locals 1
    .param p1, "key"    # Lcom/amazon/ags/client/whispersync/model/Key;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/amazon/ags/client/whispersync/model/Key;",
            "Lcom/amazon/ags/client/whispersync/model/Mergeable",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 330
    .local p2, "element":Lcom/amazon/ags/client/whispersync/model/Mergeable;, "Lcom/amazon/ags/client/whispersync/model/Mergeable<*>;"
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    return-void
.end method

.method public size()I
    .locals 1

    .prologue
    .line 325
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public startSyncing()V
    .locals 3

    .prologue
    .line 398
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->lock()V

    .line 400
    :try_start_0
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/GameDataSingleMap;->gameDataMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/client/whispersync/model/Mergeable;

    .line 401
    .local v0, "element":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    invoke-interface {v0}, Lcom/amazon/ags/client/whispersync/model/Mergeable;->startSyncing()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    .line 404
    .end local v0    # "element":Lcom/amazon/ags/client/whispersync/model/Mergeable;
    .end local v1    # "i$":Ljava/util/Iterator;
    :catchall_0
    move-exception v2

    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    throw v2

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    invoke-static {}, Lcom/amazon/ags/client/whispersync/GameDataLock;->unlock()V

    .line 406
    return-void
.end method
