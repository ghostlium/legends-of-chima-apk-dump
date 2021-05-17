.class final Lcom/flurry/sdk/rv$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/rv;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "a"
.end annotation


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Lcom/flurry/sdk/rv$a;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/flurry/sdk/rv$a;)V
    .locals 0

    .prologue
    .line 523
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 524
    iput-object p1, p0, Lcom/flurry/sdk/rv$a;->a:Ljava/lang/String;

    .line 525
    iput-object p2, p0, Lcom/flurry/sdk/rv$a;->b:Lcom/flurry/sdk/rv$a;

    .line 526
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 1

    .prologue
    .line 528
    iget-object v0, p0, Lcom/flurry/sdk/rv$a;->a:Ljava/lang/String;

    return-object v0
.end method

.method public a([CII)Ljava/lang/String;
    .locals 5

    .prologue
    .line 532
    iget-object v1, p0, Lcom/flurry/sdk/rv$a;->a:Ljava/lang/String;

    .line 533
    iget-object v0, p0, Lcom/flurry/sdk/rv$a;->b:Lcom/flurry/sdk/rv$a;

    .line 536
    :goto_0
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    if-ne v2, p3, :cond_2

    .line 537
    const/4 v2, 0x0

    .line 539
    :cond_0
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    add-int v4, p2, v2

    aget-char v4, p1, v4

    if-eq v3, v4, :cond_1

    .line 543
    :goto_1
    if-ne v2, p3, :cond_2

    .line 553
    :goto_2
    return-object v1

    .line 542
    :cond_1
    add-int/lit8 v2, v2, 0x1

    if-lt v2, p3, :cond_0

    goto :goto_1

    .line 547
    :cond_2
    if-nez v0, :cond_3

    .line 553
    const/4 v1, 0x0

    goto :goto_2

    .line 550
    :cond_3
    invoke-virtual {v0}, Lcom/flurry/sdk/rv$a;->a()Ljava/lang/String;

    move-result-object v1

    .line 551
    invoke-virtual {v0}, Lcom/flurry/sdk/rv$a;->b()Lcom/flurry/sdk/rv$a;

    move-result-object v0

    goto :goto_0
.end method

.method public b()Lcom/flurry/sdk/rv$a;
    .locals 1

    .prologue
    .line 529
    iget-object v0, p0, Lcom/flurry/sdk/rv$a;->b:Lcom/flurry/sdk/rv$a;

    return-object v0
.end method
