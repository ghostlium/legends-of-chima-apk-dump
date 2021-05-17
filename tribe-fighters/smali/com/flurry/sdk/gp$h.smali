.class public Lcom/flurry/sdk/gp$h;
.super Lcom/flurry/sdk/gp;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/gp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "h"
.end annotation


# instance fields
.field public final A:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    .prologue
    .line 407
    sget-object v0, Lcom/flurry/sdk/gp$i;->g:Lcom/flurry/sdk/gp$i;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gp;-><init>(Lcom/flurry/sdk/gp$i;)V

    .line 408
    iput p1, p0, Lcom/flurry/sdk/gp$h;->A:I

    .line 409
    return-void
.end method
