.class public final Lcom/flurry/sdk/mx$c;
.super Lcom/flurry/sdk/mx$d;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/mx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 342
    invoke-direct {p0}, Lcom/flurry/sdk/mx$d;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/reflect/Method;)Z
    .locals 4

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 349
    invoke-super {p0, p1}, Lcom/flurry/sdk/mx$d;->a(Ljava/lang/reflect/Method;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 361
    :cond_0
    :goto_0
    return v0

    .line 352
    :cond_1
    invoke-static {p1}, Lcom/flurry/sdk/qs;->a(Ljava/lang/reflect/Method;)Z

    move-result v2

    if-nez v2, :cond_2

    move v0, v1

    .line 353
    goto :goto_0

    .line 356
    :cond_2
    invoke-virtual {p1}, Ljava/lang/reflect/Method;->getReturnType()Ljava/lang/Class;

    move-result-object v2

    .line 357
    const-class v3, Ljava/util/Collection;

    invoke-virtual {v3, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-nez v3, :cond_0

    const-class v3, Ljava/util/Map;

    invoke-virtual {v3, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_0

    move v0, v1

    .line 361
    goto :goto_0
.end method
