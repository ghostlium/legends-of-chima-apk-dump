.class Lcom/playhaven/android/util/JsonUtil$JSONIterator;
.super Ljava/lang/Object;
.source "JsonUtil.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/util/JsonUtil;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "JSONIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private source:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Lnet/minidev/json/JSONObject;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Iterator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator",
            "<",
            "Lnet/minidev/json/JSONObject;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 56
    .local p1, "source":Ljava/util/Iterator;, "Ljava/util/Iterator<Lnet/minidev/json/JSONObject;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    iput-object p1, p0, Lcom/playhaven/android/util/JsonUtil$JSONIterator;->source:Ljava/util/Iterator;

    .line 59
    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/playhaven/android/util/JsonUtil$JSONIterator;->source:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1
    invoke-virtual {p0}, Lcom/playhaven/android/util/JsonUtil$JSONIterator;->next()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/lang/String;
    .locals 2

    .prologue
    .line 80
    iget-object v1, p0, Lcom/playhaven/android/util/JsonUtil$JSONIterator;->source:Ljava/util/Iterator;

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnet/minidev/json/JSONObject;

    .line 81
    .local v0, "obj":Lnet/minidev/json/JSONObject;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    .line 82
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lnet/minidev/json/JSONObject;->toJSONString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/playhaven/android/util/JsonUtil$JSONIterator;->source:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 97
    return-void
.end method
