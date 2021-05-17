.class public final Lcom/flurry/sdk/qq$e;
.super Lcom/flurry/sdk/qz;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/qq;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "e"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/qz",
        "<[F>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 127
    invoke-direct {p0}, Lcom/flurry/sdk/qz;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(I)[F
    .locals 1

    .prologue
    .line 129
    new-array v0, p1, [F

    return-object v0
.end method

.method public synthetic b(I)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 124
    invoke-virtual {p0, p1}, Lcom/flurry/sdk/qq$e;->a(I)[F

    move-result-object v0

    return-object v0
.end method
