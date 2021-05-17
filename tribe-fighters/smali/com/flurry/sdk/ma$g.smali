.class final Lcom/flurry/sdk/ma$g;
.super Lcom/flurry/sdk/ma;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/ma;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "g"
.end annotation


# instance fields
.field protected final b:Lcom/flurry/sdk/qu;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/flurry/sdk/qu",
            "<*>;"
        }
    .end annotation
.end field

.field protected final c:Lcom/flurry/sdk/mr;


# direct methods
.method protected constructor <init>(Lcom/flurry/sdk/qu;Lcom/flurry/sdk/mr;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/flurry/sdk/qu",
            "<*>;",
            "Lcom/flurry/sdk/mr;",
            ")V"
        }
    .end annotation

    .prologue
    .line 231
    invoke-virtual {p1}, Lcom/flurry/sdk/qu;->a()Ljava/lang/Class;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/ma;-><init>(Ljava/lang/Class;)V

    .line 232
    iput-object p1, p0, Lcom/flurry/sdk/ma$g;->b:Lcom/flurry/sdk/qu;

    .line 233
    iput-object p2, p0, Lcom/flurry/sdk/ma$g;->c:Lcom/flurry/sdk/mr;

    .line 234
    return-void
.end method


# virtual methods
.method public b(Ljava/lang/String;Lcom/flurry/sdk/ja;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flurry/sdk/ji;
        }
    .end annotation

    .prologue
    .line 239
    iget-object v0, p0, Lcom/flurry/sdk/ma$g;->c:Lcom/flurry/sdk/mr;

    if-eqz v0, :cond_1

    .line 241
    :try_start_0
    iget-object v0, p0, Lcom/flurry/sdk/ma$g;->c:Lcom/flurry/sdk/mr;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/mr;->a(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 250
    :cond_0
    return-object v0

    .line 242
    :catch_0
    move-exception v0

    .line 243
    invoke-static {v0}, Lcom/flurry/sdk/qs;->c(Ljava/lang/Throwable;)V

    .line 246
    :cond_1
    iget-object v0, p0, Lcom/flurry/sdk/ma$g;->b:Lcom/flurry/sdk/qu;

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/qu;->a(Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    .line 247
    if-nez v0, :cond_0

    .line 248
    iget-object v0, p0, Lcom/flurry/sdk/ma$g;->a:Ljava/lang/Class;

    const-string v1, "not one of values for Enum class"

    invoke-virtual {p2, v0, p1, v1}, Lcom/flurry/sdk/ja;->a(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;)Lcom/flurry/sdk/ji;

    move-result-object v0

    throw v0
.end method
