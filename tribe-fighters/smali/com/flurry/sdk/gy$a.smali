.class Lcom/flurry/sdk/gy$a;
.super Ljava/lang/ref/WeakReference;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/gy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/WeakReference",
        "<TK;>;"
    }
.end annotation


# instance fields
.field a:I

.field final synthetic b:Lcom/flurry/sdk/gy;


# direct methods
.method constructor <init>(Lcom/flurry/sdk/gy;Ljava/lang/Object;)V
    .locals 1

    .prologue
    .line 149
    iput-object p1, p0, Lcom/flurry/sdk/gy$a;->b:Lcom/flurry/sdk/gy;

    .line 150
    invoke-static {p1}, Lcom/flurry/sdk/gy;->a(Lcom/flurry/sdk/gy;)Ljava/lang/ref/ReferenceQueue;

    move-result-object v0

    invoke-direct {p0, p2, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    .line 151
    invoke-static {p2}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result v0

    iput v0, p0, Lcom/flurry/sdk/gy$a;->a:I

    .line 152
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .prologue
    const/4 v0, 0x1

    .line 159
    if-ne p0, p1, :cond_1

    .line 166
    :cond_0
    :goto_0
    return v0

    .line 162
    :cond_1
    check-cast p1, Lcom/flurry/sdk/gy$a;

    .line 163
    invoke-virtual {p0}, Lcom/flurry/sdk/gy$a;->get()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1}, Lcom/flurry/sdk/gy$a;->get()Ljava/lang/Object;

    move-result-object v2

    if-eq v1, v2, :cond_0

    .line 166
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 155
    iget v0, p0, Lcom/flurry/sdk/gy$a;->a:I

    return v0
.end method
