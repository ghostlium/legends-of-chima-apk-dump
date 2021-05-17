.class public Lcom/flurry/sdk/km;
.super Lcom/flurry/sdk/jh;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/flurry/sdk/km$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/jh",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# instance fields
.field protected final a:Lcom/flurry/sdk/rx;

.field protected final b:Z

.field protected final c:Z

.field protected final d:Z

.field protected final e:Z


# direct methods
.method public constructor <init>(Lcom/flurry/sdk/rx;)V
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 33
    invoke-direct {p0}, Lcom/flurry/sdk/jh;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/flurry/sdk/km;->a:Lcom/flurry/sdk/rx;

    .line 35
    invoke-virtual {p1}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v3

    .line 36
    const-class v0, Ljava/lang/String;

    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/flurry/sdk/km;->b:Z

    .line 37
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq v3, v0, :cond_0

    const-class v0, Ljava/lang/Boolean;

    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_0
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Lcom/flurry/sdk/km;->c:Z

    .line 38
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq v3, v0, :cond_1

    const-class v0, Ljava/lang/Integer;

    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_5

    :cond_1
    move v0, v2

    :goto_1
    iput-boolean v0, p0, Lcom/flurry/sdk/km;->d:Z

    .line 39
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq v3, v0, :cond_2

    const-class v0, Ljava/lang/Double;

    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_2
    move v1, v2

    :cond_3
    iput-boolean v1, p0, Lcom/flurry/sdk/km;->e:Z

    .line 40
    return-void

    :cond_4
    move v0, v1

    .line 37
    goto :goto_0

    :cond_5
    move v0, v1

    .line 38
    goto :goto_1
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 60
    iget-object v0, p0, Lcom/flurry/sdk/km;->a:Lcom/flurry/sdk/rx;

    invoke-virtual {v0}, Lcom/flurry/sdk/rx;->p()Ljava/lang/Class;

    move-result-object v0

    const-string v1, "abstract types can only be instantiated with additional type information"

    invoke-virtual {p2, v0, v1}, Lcom/flurry/sdk/ja;->a(Ljava/lang/Class;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0
.end method

.method public a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;Lcom/flurry/sdk/jy;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 48
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/km;->b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    .line 49
    if-eqz v0, :cond_0

    .line 52
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p3, p1, p2}, Lcom/flurry/sdk/jy;->a(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_0
.end method

.method protected b(Lcom/flurry/sdk/ht;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 72
    sget-object v0, Lcom/flurry/sdk/km$1;->a:[I

    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->e()Lcom/flurry/sdk/hw;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flurry/sdk/hw;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 100
    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 74
    :pswitch_0
    iget-boolean v0, p0, Lcom/flurry/sdk/km;->b:Z

    if-eqz v0, :cond_0

    .line 75
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->k()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 79
    :pswitch_1
    iget-boolean v0, p0, Lcom/flurry/sdk/km;->d:Z

    if-eqz v0, :cond_0

    .line 80
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->t()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0

    .line 85
    :pswitch_2
    iget-boolean v0, p0, Lcom/flurry/sdk/km;->e:Z

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {p1}, Lcom/flurry/sdk/ht;->x()D

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v0

    goto :goto_0

    .line 90
    :pswitch_3
    iget-boolean v0, p0, Lcom/flurry/sdk/km;->c:Z

    if-eqz v0, :cond_0

    .line 91
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_0

    .line 95
    :pswitch_4
    iget-boolean v0, p0, Lcom/flurry/sdk/km;->c:Z

    if-eqz v0, :cond_0

    .line 96
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    goto :goto_0

    .line 72
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
