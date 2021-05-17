.class public abstract Lcom/flurry/sdk/au;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/aj;
.implements Lcom/flurry/sdk/j;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method protected abstract a(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Landroid/os/Bundle;)Lcom/flurry/sdk/ai;
.end method

.method protected a()Lcom/flurry/sdk/at;
    .locals 1

    .prologue
    .line 108
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->c()Lcom/flurry/sdk/at;

    move-result-object v0

    return-object v0
.end method

.method protected abstract a(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/AdCreative;Landroid/os/Bundle;)Lcom/flurry/sdk/h;
.end method

.method public a(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Lcom/flurry/sdk/h;
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 57
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    if-nez p4, :cond_1

    .line 76
    :cond_0
    :goto_0
    return-object v0

    .line 61
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->e()Lcom/flurry/sdk/ax;

    move-result-object v1

    .line 62
    invoke-virtual {p0, p1, v1}, Lcom/flurry/sdk/au;->b(Landroid/content/Context;Lcom/flurry/sdk/ax;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 66
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/au;->c(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Landroid/os/Bundle;

    move-result-object v5

    .line 67
    if-eqz v5, :cond_0

    .line 71
    invoke-static {p4}, Lcom/flurry/sdk/bt;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Lcom/flurry/android/AdCreative;

    move-result-object v4

    .line 72
    if-eqz v4, :cond_0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    .line 76
    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/au;->a(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/AdCreative;Landroid/os/Bundle;)Lcom/flurry/sdk/h;

    move-result-object v0

    goto :goto_0
.end method

.method protected a(Landroid/content/Context;Lcom/flurry/sdk/ax;)Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 81
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 90
    :cond_0
    :goto_0
    return v0

    .line 85
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->a()Lcom/flurry/sdk/at;

    move-result-object v1

    .line 86
    if-eqz v1, :cond_0

    .line 90
    invoke-interface {v1, p1, p2}, Lcom/flurry/sdk/at;->a(Landroid/content/Context;Lcom/flurry/sdk/ax;)Z

    move-result v0

    goto :goto_0
.end method

.method public a_(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Lcom/flurry/sdk/ai;
    .locals 6

    .prologue
    const/4 v0, 0x0

    .line 37
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    if-nez p4, :cond_1

    .line 51
    :cond_0
    :goto_0
    return-object v0

    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->d()Lcom/flurry/sdk/ax;

    move-result-object v1

    .line 42
    invoke-virtual {p0, p1, v1}, Lcom/flurry/sdk/au;->a(Landroid/content/Context;Lcom/flurry/sdk/ax;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 46
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/au;->b(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Landroid/os/Bundle;

    move-result-object v5

    .line 47
    if-eqz v5, :cond_0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    .line 51
    invoke-virtual/range {v0 .. v5}, Lcom/flurry/sdk/au;->a(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;Landroid/os/Bundle;)Lcom/flurry/sdk/ai;

    move-result-object v0

    goto :goto_0
.end method

.method protected b(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 168
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/au;->d(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method protected b()Lcom/flurry/sdk/at;
    .locals 1

    .prologue
    .line 112
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->c()Lcom/flurry/sdk/at;

    move-result-object v0

    return-object v0
.end method

.method protected b(Landroid/content/Context;Lcom/flurry/sdk/ax;)Z
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 95
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 104
    :cond_0
    :goto_0
    return v0

    .line 99
    :cond_1
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->b()Lcom/flurry/sdk/at;

    move-result-object v1

    .line 100
    if-eqz v1, :cond_0

    .line 104
    invoke-interface {v1, p1, p2}, Lcom/flurry/sdk/at;->a(Landroid/content/Context;Lcom/flurry/sdk/ax;)Z

    move-result v0

    goto :goto_0
.end method

.method protected c(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 173
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/au;->d(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method protected c()Lcom/flurry/sdk/at;
    .locals 1

    .prologue
    .line 116
    new-instance v0, Lcom/flurry/sdk/as;

    invoke-direct {v0}, Lcom/flurry/sdk/as;-><init>()V

    return-object v0
.end method

.method protected d(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Landroid/os/Bundle;
    .locals 1

    .prologue
    .line 178
    invoke-static {p1}, Lcom/flurry/sdk/el;->e(Landroid/content/Context;)Landroid/os/Bundle;

    move-result-object v0

    return-object v0
.end method

.method protected d()Lcom/flurry/sdk/ax;
    .locals 6

    .prologue
    .line 120
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->f()Ljava/lang/String;

    move-result-object v1

    .line 121
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->g()Ljava/util/List;

    move-result-object v2

    .line 122
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->h()Ljava/util/List;

    move-result-object v3

    .line 123
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->i()Ljava/util/List;

    move-result-object v4

    .line 124
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->j()Ljava/util/List;

    move-result-object v5

    .line 125
    new-instance v0, Lcom/flurry/sdk/ax;

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/ax;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method protected e()Lcom/flurry/sdk/ax;
    .locals 6

    .prologue
    .line 130
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->f()Ljava/lang/String;

    move-result-object v1

    .line 131
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->k()Ljava/util/List;

    move-result-object v2

    .line 132
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->l()Ljava/util/List;

    move-result-object v3

    .line 133
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->m()Ljava/util/List;

    move-result-object v4

    .line 134
    new-instance v0, Lcom/flurry/sdk/ax;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v5

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/ax;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-object v0
.end method

.method protected abstract f()Ljava/lang/String;
.end method

.method protected abstract g()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/aq;",
            ">;"
        }
    .end annotation
.end method

.method protected h()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 143
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->n()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected i()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 147
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->o()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected abstract j()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Landroid/content/pm/ActivityInfo;",
            ">;"
        }
    .end annotation
.end method

.method protected abstract k()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/flurry/sdk/aq;",
            ">;"
        }
    .end annotation
.end method

.method protected l()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 155
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->n()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected m()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 159
    invoke-virtual {p0}, Lcom/flurry/sdk/au;->o()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method protected abstract n()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method protected abstract o()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method
