.class public final Lcom/flurry/sdk/bt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;)Lcom/flurry/android/AdCreative;
    .locals 6

    .prologue
    .line 32
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->c()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 33
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->b()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v2

    .line 34
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->e()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 35
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->d()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    .line 36
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;->f()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 37
    new-instance v0, Lcom/flurry/android/AdCreative;

    invoke-direct/range {v0 .. v5}, Lcom/flurry/android/AdCreative;-><init>(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v0
.end method

.method public static a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Lcom/flurry/android/AdCreative;
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 41
    if-nez p0, :cond_0

    move-object v0, v1

    .line 60
    :goto_0
    return-object v0

    .line 45
    :cond_0
    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->d()Ljava/util/List;

    move-result-object v0

    .line 46
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    :cond_1
    move-object v0, v1

    .line 47
    goto :goto_0

    .line 50
    :cond_2
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;

    .line 51
    if-nez v0, :cond_3

    move-object v0, v1

    .line 52
    goto :goto_0

    .line 55
    :cond_3
    invoke-virtual {v0}, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdFrame;->e()Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;

    move-result-object v0

    .line 56
    if-nez v0, :cond_4

    move-object v0, v1

    .line 57
    goto :goto_0

    .line 60
    :cond_4
    invoke-static {v0}, Lcom/flurry/sdk/bt;->a(Lcom/flurry/android/impl/ads/avro/protocol/v6/AdSpaceLayout;)Lcom/flurry/android/AdCreative;

    move-result-object v0

    goto :goto_0
.end method

.method public static a(Lcom/flurry/android/impl/ads/FlurryAdModule;Ljava/lang/String;)Lcom/flurry/sdk/e;
    .locals 6

    .prologue
    .line 24
    new-instance v0, Lcom/flurry/sdk/e;

    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->d()J

    move-result-wide v1

    invoke-virtual {p0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->j()J

    move-result-wide v4

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lcom/flurry/sdk/e;-><init>(JLjava/lang/String;J)V

    .line 25
    invoke-virtual {p0, v0}, Lcom/flurry/android/impl/ads/FlurryAdModule;->a(Lcom/flurry/sdk/e;)V

    .line 26
    return-object v0
.end method
