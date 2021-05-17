.class public Lcom/flurry/sdk/gp$g;
.super Lcom/flurry/sdk/gp;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/gp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "g"
.end annotation


# instance fields
.field public final A:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 243
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gp$g;-><init>(Z)V

    .line 244
    return-void
.end method

.method synthetic constructor <init>(Lcom/flurry/sdk/gp$1;)V
    .locals 0

    .prologue
    .line 234
    invoke-direct {p0}, Lcom/flurry/sdk/gp$g;-><init>()V

    return-void
.end method

.method private constructor <init>(Z)V
    .locals 1

    .prologue
    .line 247
    sget-object v0, Lcom/flurry/sdk/gp$i;->f:Lcom/flurry/sdk/gp$i;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gp;-><init>(Lcom/flurry/sdk/gp$i;)V

    .line 248
    iput-boolean p1, p0, Lcom/flurry/sdk/gp$g;->A:Z

    .line 249
    return-void
.end method

.method synthetic constructor <init>(ZLcom/flurry/sdk/gp$1;)V
    .locals 0

    .prologue
    .line 234
    invoke-direct {p0, p1}, Lcom/flurry/sdk/gp$g;-><init>(Z)V

    return-void
.end method
