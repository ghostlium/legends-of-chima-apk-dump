.class final Lcom/flurry/sdk/ma$c;
.super Lcom/flurry/sdk/ma;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ma;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "c"
.end annotation


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 313
    const-class v0, Ljava/util/Calendar;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/ma;-><init>(Ljava/lang/Class;)V

    .line 314
    return-void
.end method


# virtual methods
.method public synthetic b(Ljava/lang/String;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 310
    invoke-virtual {p0, p1, p2}, Lcom/flurry/sdk/ma$c;->c(Ljava/lang/String;Lcom/flurry/sdk/ja;)Ljava/util/Calendar;

    move-result-object v0

    return-object v0
.end method

.method public c(Ljava/lang/String;Lcom/flurry/sdk/ja;)Ljava/util/Calendar;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;,
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 320
    invoke-virtual {p2, p1}, Lcom/flurry/sdk/ja;->a(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    .line 321
    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p2, v0}, Lcom/flurry/sdk/ja;->a(Ljava/util/Date;)Ljava/util/Calendar;

    move-result-object v0

    goto :goto_0
.end method
