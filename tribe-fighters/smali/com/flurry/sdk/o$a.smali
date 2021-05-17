.class final Lcom/flurry/sdk/o$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/flurry/sdk/aj;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 95
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/o$1;)V
    .locals 0

    .prologue
    .line 95
    invoke-direct {p0}, Lcom/flurry/sdk/o$a;-><init>()V

    return-void
.end method


# virtual methods
.method public a_(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)Lcom/flurry/sdk/ai;
    .locals 1

    .prologue
    .line 100
    new-instance v0, Lcom/flurry/sdk/ab;

    invoke-direct {v0, p1, p2, p3, p4}, Lcom/flurry/sdk/ab;-><init>(Landroid/content/Context;Lcom/flurry/android/impl/ads/FlurryAdModule;Lcom/flurry/sdk/e;Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;)V

    return-object v0
.end method
