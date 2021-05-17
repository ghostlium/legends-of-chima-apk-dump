.class final Lcom/flurry/sdk/bl$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/millennialmedia/android/RequestListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/bl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/flurry/sdk/bl;


# direct methods
.method private constructor <init>(Lcom/flurry/sdk/bl;)V
    .locals 0

    .prologue
    .line 110
    iput-object p1, p0, Lcom/flurry/sdk/bl$a;->a:Lcom/flurry/sdk/bl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/bl;Lcom/flurry/sdk/bl$1;)V
    .locals 0

    .prologue
    .line 110
    invoke-direct {p0, p1}, Lcom/flurry/sdk/bl$a;-><init>(Lcom/flurry/sdk/bl;)V

    return-void
.end method


# virtual methods
.method public MMAdOverlayClosed(Lcom/millennialmedia/android/MMAd;)V
    .locals 3

    .prologue
    .line 137
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bl;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Millennial MMAdView banner overlay closed."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 138
    return-void
.end method

.method public MMAdOverlayLaunched(Lcom/millennialmedia/android/MMAd;)V
    .locals 3

    .prologue
    .line 127
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bl;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Millennial MMAdView banner overlay launched."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 128
    return-void
.end method

.method public MMAdRequestIsCaching(Lcom/millennialmedia/android/MMAd;)V
    .locals 3

    .prologue
    .line 132
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bl;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Millennial MMAdView banner request is caching."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 133
    return-void
.end method

.method public onSingleTap(Lcom/millennialmedia/android/MMAd;)V
    .locals 3

    .prologue
    .line 142
    iget-object v0, p0, Lcom/flurry/sdk/bl$a;->a:Lcom/flurry/sdk/bl;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bl;->onAdClicked(Ljava/util/Map;)V

    .line 143
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bl;->a()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Millennial MMAdView banner tapped."

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 144
    return-void
.end method

.method public requestCompleted(Lcom/millennialmedia/android/MMAd;)V
    .locals 5

    .prologue
    .line 120
    iget-object v0, p0, Lcom/flurry/sdk/bl$a;->a:Lcom/flurry/sdk/bl;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bl;->onAdShown(Ljava/util/Map;)V

    .line 121
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bl;->a()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Millennial MMAdView returned ad."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 123
    return-void
.end method

.method public requestFailed(Lcom/millennialmedia/android/MMAd;Lcom/millennialmedia/android/MMException;)V
    .locals 4

    .prologue
    .line 113
    iget-object v0, p0, Lcom/flurry/sdk/bl$a;->a:Lcom/flurry/sdk/bl;

    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/flurry/sdk/bl;->onRenderFailed(Ljava/util/Map;)V

    .line 114
    const/4 v0, 0x3

    invoke-static {}, Lcom/flurry/sdk/bl;->a()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Millennial MMAdView failed to load ad with error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/flurry/sdk/ex;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 116
    return-void
.end method
