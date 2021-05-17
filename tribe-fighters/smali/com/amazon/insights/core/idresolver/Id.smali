.class public Lcom/amazon/insights/core/idresolver/Id;
.super Ljava/lang/Object;
.source "Id.java"


# static fields
.field private static final EMPTY_ID:Lcom/amazon/insights/core/idresolver/Id;


# instance fields
.field private final id:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 8
    new-instance v0, Lcom/amazon/insights/core/idresolver/Id;

    const-string v1, ""

    invoke-direct {v0, v1}, Lcom/amazon/insights/core/idresolver/Id;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/amazon/insights/core/idresolver/Id;->EMPTY_ID:Lcom/amazon/insights/core/idresolver/Id;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/amazon/insights/core/idresolver/Id;->id:Ljava/lang/String;

    .line 18
    return-void
.end method

.method public static declared-synchronized getEmptyId()Lcom/amazon/insights/core/idresolver/Id;
    .locals 2

    .prologue
    .line 11
    const-class v0, Lcom/amazon/insights/core/idresolver/Id;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/amazon/insights/core/idresolver/Id;->EMPTY_ID:Lcom/amazon/insights/core/idresolver/Id;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/insights/core/idresolver/Id;
    .locals 1
    .param p0, "id"    # Ljava/lang/String;

    .prologue
    .line 21
    if-eqz p0, :cond_0

    const-string v0, ""

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 22
    :cond_0
    invoke-static {}, Lcom/amazon/insights/core/idresolver/Id;->getEmptyId()Lcom/amazon/insights/core/idresolver/Id;

    move-result-object v0

    .line 24
    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Lcom/amazon/insights/core/idresolver/Id;

    invoke-direct {v0, p0}, Lcom/amazon/insights/core/idresolver/Id;-><init>(Ljava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 41
    if-ne p0, p1, :cond_1

    .line 53
    :cond_0
    :goto_0
    return v1

    .line 43
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 44
    goto :goto_0

    .line 45
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 46
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 47
    check-cast v0, Lcom/amazon/insights/core/idresolver/Id;

    .line 48
    .local v0, "other":Lcom/amazon/insights/core/idresolver/Id;
    iget-object v3, p0, Lcom/amazon/insights/core/idresolver/Id;->id:Ljava/lang/String;

    if-nez v3, :cond_4

    .line 49
    iget-object v3, v0, Lcom/amazon/insights/core/idresolver/Id;->id:Ljava/lang/String;

    if-eqz v3, :cond_0

    move v1, v2

    .line 50
    goto :goto_0

    .line 51
    :cond_4
    iget-object v3, p0, Lcom/amazon/insights/core/idresolver/Id;->id:Ljava/lang/String;

    iget-object v4, v0, Lcom/amazon/insights/core/idresolver/Id;->id:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 52
    goto :goto_0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/amazon/insights/core/idresolver/Id;->id:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .line 33
    const/16 v0, 0x1f

    .line 34
    .local v0, "prime":I
    const/4 v1, 0x1

    .line 35
    .local v1, "result":I
    iget-object v2, p0, Lcom/amazon/insights/core/idresolver/Id;->id:Ljava/lang/String;

    if-nez v2, :cond_0

    const/4 v2, 0x0

    :goto_0
    add-int/lit8 v1, v2, 0x1f

    .line 36
    return v1

    .line 35
    :cond_0
    iget-object v2, p0, Lcom/amazon/insights/core/idresolver/Id;->id:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    goto :goto_0
.end method
