.class public Lcom/amazon/ags/client/whispersync/model/Key;
.super Ljava/lang/Object;
.source "Key.java"


# static fields
.field public static final DELIMITER:Ljava/lang/String; = "~"

.field private static final TAG:Ljava/lang/String; = "GC_Whispersync"


# instance fields
.field private final name:Ljava/lang/String;

.field private final type:Lcom/amazon/ags/client/whispersync/model/SyncableType;


# direct methods
.method public constructor <init>(Lcom/amazon/ags/client/whispersync/model/SyncableType;Ljava/lang/String;)V
    .locals 3
    .param p1, "type"    # Lcom/amazon/ags/client/whispersync/model/SyncableType;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    if-nez p1, :cond_0

    .line 26
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to create key with null SyncableType and name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 27
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to create key with null SyncableType and name "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 29
    :cond_0
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 30
    :cond_1
    const-string v0, "GC_Whispersync"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to create key of type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->getJsonName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " with null/empty name"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Unable to create key of type "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->getJsonName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " with null/empty name"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 33
    :cond_2
    iput-object p1, p0, Lcom/amazon/ags/client/whispersync/model/Key;->type:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 34
    iput-object p2, p0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 5
    .param p1, "keyString"    # Ljava/lang/String;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    if-nez p1, :cond_0

    .line 39
    const-string v2, "GC_Whispersync"

    const-string v3, "Unable to create key from null keyString"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Unable to create key from null keyString"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 42
    :cond_0
    const-string v2, "~"

    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 43
    const-string v2, "GC_Whispersync"

    const-string v3, "Unable to create key from keyString missing delimiter ~"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Unable to create key from keyString missing delimiter ~"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 46
    :cond_1
    const-string v2, "~"

    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 47
    .local v0, "delimiterPos":I
    const/4 v2, 0x0

    invoke-virtual {p1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 48
    .local v1, "typeCandidate":Ljava/lang/String;
    invoke-static {v1}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->fromString(Ljava/lang/String;)Lcom/amazon/ags/client/whispersync/model/SyncableType;

    move-result-object v2

    iput-object v2, p0, Lcom/amazon/ags/client/whispersync/model/Key;->type:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    .line 49
    add-int/lit8 v2, v0, 0x1

    invoke-virtual {p1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    .line 50
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/Key;->type:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    if-nez v2, :cond_2

    .line 51
    const-string v2, "GC_Whispersync"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to create key with null SyncableType and name "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to create key with null SyncableType and name "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 54
    :cond_2
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    if-eqz v2, :cond_3

    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 55
    :cond_3
    const-string v2, "GC_Whispersync"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to create key of type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/model/Key;->type:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-virtual {v4}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->getJsonName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " with null/empty name"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unable to create key of type "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/model/Key;->type:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-virtual {v4}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->getJsonName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " with null/empty name"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 58
    :cond_4
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 79
    if-ne p0, p1, :cond_1

    .line 93
    :cond_0
    :goto_0
    return v1

    .line 81
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 82
    goto :goto_0

    .line 83
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 84
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 85
    check-cast v0, Lcom/amazon/ags/client/whispersync/model/Key;

    .line 86
    .local v0, "other":Lcom/amazon/ags/client/whispersync/model/Key;
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 87
    iget-object v3, v0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    if-eqz v3, :cond_5

    move v1, v2

    .line 88
    goto :goto_0

    .line 89
    :cond_4
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    iget-object v4, v0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    move v1, v2

    .line 90
    goto :goto_0

    .line 91
    :cond_5
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/Key;->type:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    iget-object v4, v0, Lcom/amazon/ags/client/whispersync/model/Key;->type:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    if-eq v3, v4, :cond_0

    move v1, v2

    .line 92
    goto :goto_0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Lcom/amazon/ags/client/whispersync/model/SyncableType;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/amazon/ags/client/whispersync/model/Key;->type:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    return-object v0
.end method

.method public hashCode()I
    .locals 5

    .prologue
    const/4 v3, 0x0

    .line 70
    const/16 v0, 0x1f

    .line 71
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 72
    .local v1, "result":I
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    if-nez v2, :cond_0

    move v2, v3

    :goto_0
    add-int/lit8 v1, v2, 0x1f

    .line 73
    mul-int/lit8 v2, v1, 0x1f

    iget-object v4, p0, Lcom/amazon/ags/client/whispersync/model/Key;->type:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    if-nez v4, :cond_1

    :goto_1
    add-int v1, v2, v3

    .line 74
    return v1

    .line 72
    :cond_0
    iget-object v2, p0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_0

    .line 73
    :cond_1
    iget-object v3, p0, Lcom/amazon/ags/client/whispersync/model/Key;->type:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-virtual {v3}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->hashCode()I

    move-result v3

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 98
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/Key;->type:Lcom/amazon/ags/client/whispersync/model/SyncableType;

    invoke-virtual {v1}, Lcom/amazon/ags/client/whispersync/model/SyncableType;->getJsonName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "~"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/amazon/ags/client/whispersync/model/Key;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
