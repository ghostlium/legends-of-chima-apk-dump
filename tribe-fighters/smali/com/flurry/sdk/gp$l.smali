.class public Lcom/flurry/sdk/gp$l;
.super Lcom/flurry/sdk/gp;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/gp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "l"
.end annotation


# direct methods
.method private varargs constructor <init>([Lcom/flurry/sdk/gp;)V
    .locals 2

    .prologue
    .line 254
    sget-object v0, Lcom/flurry/sdk/gp$i;->b:Lcom/flurry/sdk/gp$i;

    invoke-static {p1}, Lcom/flurry/sdk/gp$l;->c([Lcom/flurry/sdk/gp;)[Lcom/flurry/sdk/gp;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/flurry/sdk/gp;-><init>(Lcom/flurry/sdk/gp$i;[Lcom/flurry/sdk/gp;)V

    .line 255
    iget-object v0, p0, Lcom/flurry/sdk/gp$l;->b:[Lcom/flurry/sdk/gp;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    .line 256
    return-void
.end method

.method synthetic constructor <init>([Lcom/flurry/sdk/gp;Lcom/flurry/sdk/gp$1;)V
    .locals 0

    .prologue
    .line 252
    invoke-direct {p0, p1}, Lcom/flurry/sdk/gp$l;-><init>([Lcom/flurry/sdk/gp;)V

    return-void
.end method

.method private static c([Lcom/flurry/sdk/gp;)[Lcom/flurry/sdk/gp;
    .locals 6

    .prologue
    const/4 v1, 0x0

    .line 259
    invoke-static {p0, v1}, Lcom/flurry/sdk/gp$l;->a([Lcom/flurry/sdk/gp;I)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    new-array v2, v0, [Lcom/flurry/sdk/gp;

    .line 260
    const/4 v3, 0x1

    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    move-object v0, p0

    invoke-static/range {v0 .. v5}, Lcom/flurry/sdk/gp$l;->a([Lcom/flurry/sdk/gp;I[Lcom/flurry/sdk/gp;ILjava/util/Map;Ljava/util/Map;)V

    .line 263
    return-object v2
.end method
