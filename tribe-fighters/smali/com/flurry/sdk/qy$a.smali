.class final Lcom/flurry/sdk/qy$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/qy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# instance fields
.field final a:[Ljava/lang/Object;

.field b:Lcom/flurry/sdk/qy$a;


# direct methods
.method public constructor <init>([Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 241
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 242
    iput-object p1, p0, Lcom/flurry/sdk/qy$a;->a:[Ljava/lang/Object;

    .line 243
    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/qy$a;)V
    .locals 1

    .prologue
    .line 251
    iget-object v0, p0, Lcom/flurry/sdk/qy$a;->b:Lcom/flurry/sdk/qy$a;

    if-eqz v0, :cond_0

    .line 252
    new-instance v0, Ljava/lang/IllegalStateException;

    invoke-direct {v0}, Ljava/lang/IllegalStateException;-><init>()V

    throw v0

    .line 254
    :cond_0
    iput-object p1, p0, Lcom/flurry/sdk/qy$a;->b:Lcom/flurry/sdk/qy$a;

    .line 255
    return-void
.end method

.method public a()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 245
    iget-object v0, p0, Lcom/flurry/sdk/qy$a;->a:[Ljava/lang/Object;

    return-object v0
.end method

.method public b()Lcom/flurry/sdk/qy$a;
    .locals 1

    .prologue
    .line 247
    iget-object v0, p0, Lcom/flurry/sdk/qy$a;->b:Lcom/flurry/sdk/qy$a;

    return-object v0
.end method
