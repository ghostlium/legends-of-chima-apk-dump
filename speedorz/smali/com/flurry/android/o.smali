.class final Lcom/flurry/android/o;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private Q:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/flurry/android/bo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .prologue
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V
    .locals 2

    .prologue
    .line 12
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 14
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/bo;

    .line 15
    invoke-virtual {v0, p2, p3}, Lcom/flurry/android/bo;->addObserverForKey(Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V

    .line 23
    :goto_0
    return-void

    .line 18
    :cond_0
    new-instance v0, Lcom/flurry/android/bo;

    invoke-direct {v0, p1}, Lcom/flurry/android/bo;-><init>(Ljava/lang/String;)V

    .line 19
    invoke-virtual {v0, p2, p3}, Lcom/flurry/android/bo;->addObserverForKey(Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V

    .line 20
    iget-object v1, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 47
    :goto_0
    return-void

    .line 45
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/bo;

    .line 46
    invoke-virtual {v0, p2, p3}, Lcom/flurry/android/bo;->b(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V
    .locals 2

    .prologue
    .line 27
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 29
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/bo;

    .line 30
    invoke-virtual {v0, p3, p4}, Lcom/flurry/android/bo;->addObserverForKey(Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V

    .line 38
    :goto_0
    return-void

    .line 33
    :cond_0
    new-instance v0, Lcom/flurry/android/bo;

    invoke-direct {v0, p1, p2}, Lcom/flurry/android/bo;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    invoke-virtual {v0, p3, p4}, Lcom/flurry/android/bo;->addObserverForKey(Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)V

    .line 35
    iget-object v1, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 52
    const/4 v0, 0x0

    .line 55
    :goto_0
    return v0

    .line 54
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;Lcom/flurry/android/AppCloudValueUpdateHandler;)Z
    .locals 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 75
    const/4 v0, 0x0

    .line 83
    :goto_0
    return v0

    .line 77
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/bo;

    .line 78
    invoke-virtual {v0, p2}, Lcom/flurry/android/bo;->removeObserver(Lcom/flurry/android/AppCloudValueUpdateHandler;)Z

    move-result v1

    .line 79
    invoke-virtual {v0}, Lcom/flurry/android/bo;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 80
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    move v0, v1

    .line 83
    goto :goto_0
.end method

.method public final a(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2

    .prologue
    .line 60
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 61
    const/4 v0, 0x0

    .line 69
    :goto_0
    return v0

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/bo;

    .line 64
    invoke-virtual {v0, p2}, Lcom/flurry/android/bo;->removeObserverForKey(Ljava/lang/String;)Z

    move-result v1

    .line 65
    invoke-virtual {v0}, Lcom/flurry/android/bo;->size()I

    move-result v0

    if-nez v0, :cond_1

    .line 66
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    move v0, v1

    .line 69
    goto :goto_0
.end method

.method public final b(Ljava/lang/String;)Z
    .locals 2

    .prologue
    .line 96
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 97
    new-instance v0, Lcom/flurry/android/bo;

    invoke-direct {v0, p1}, Lcom/flurry/android/bo;-><init>(Ljava/lang/String;)V

    .line 98
    iget-object v1, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/bo;

    .line 102
    invoke-virtual {v0}, Lcom/flurry/android/bo;->S()V

    .line 103
    const/4 v0, 0x1

    return v0
.end method

.method public final c(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 108
    const/4 v0, 0x0

    .line 112
    :goto_0
    return v0

    .line 110
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/bo;

    .line 111
    invoke-virtual {v0}, Lcom/flurry/android/bo;->T()V

    .line 112
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public final d(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 117
    const/4 v0, 0x0

    .line 119
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public final e(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 124
    const/4 v0, 0x0

    .line 127
    :goto_0
    return v0

    .line 126
    :cond_0
    iget-object v0, p0, Lcom/flurry/android/o;->Q:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/bo;

    .line 127
    invoke-virtual {v0}, Lcom/flurry/android/bo;->isAutoSyncEnabled()Z

    move-result v0

    goto :goto_0
.end method
