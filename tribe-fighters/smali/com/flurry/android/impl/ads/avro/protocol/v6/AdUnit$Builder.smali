.class public Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit$Builder;
.super Lcom/flurry/sdk/gw;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/gw",
        "<",
        "Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 296
    sget-object v0, Lcom/flurry/android/impl/ads/avro/protocol/v6/AdUnit;->SCHEMA$:Lcom/flurry/sdk/fm;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gw;-><init>(Lcom/flurry/sdk/fm;)V

    .line 297
    return-void
.end method
