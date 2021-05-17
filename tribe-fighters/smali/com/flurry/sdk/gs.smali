.class public Lcom/flurry/sdk/gs;
.super Lcom/flurry/sdk/ft;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/flurry/sdk/ft",
        "<TT;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 26
    invoke-static {}, Lcom/flurry/sdk/gr;->b()Lcom/flurry/sdk/gr;

    move-result-object v0

    invoke-direct {p0, v1, v1, v0}, Lcom/flurry/sdk/gs;-><init>(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gr;)V

    .line 27
    return-void
.end method

.method public constructor <init>(Lcom/flurry/sdk/fm;)V
    .locals 1

    .prologue
    .line 35
    invoke-static {}, Lcom/flurry/sdk/gr;->b()Lcom/flurry/sdk/gr;

    move-result-object v0

    invoke-direct {p0, p1, p1, v0}, Lcom/flurry/sdk/gs;-><init>(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gr;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/gr;)V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0, p1, p2, p3}, Lcom/flurry/sdk/ft;-><init>(Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fm;Lcom/flurry/sdk/fs;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 30
    invoke-static {}, Lcom/flurry/sdk/gr;->b()Lcom/flurry/sdk/gr;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/flurry/sdk/gr;->a(Ljava/lang/reflect/Type;)Lcom/flurry/sdk/fm;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/flurry/sdk/gs;-><init>(Lcom/flurry/sdk/fm;)V

    .line 31
    return-void
.end method


# virtual methods
.method protected a(Ljava/lang/String;Lcom/flurry/sdk/fm;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 70
    invoke-virtual {p0}, Lcom/flurry/sdk/gs;->b()Lcom/flurry/sdk/gr;

    move-result-object v0

    invoke-virtual {v0, p2}, Lcom/flurry/sdk/gr;->b(Lcom/flurry/sdk/fm;)Ljava/lang/Class;

    move-result-object v0

    .line 71
    if-nez v0, :cond_0

    invoke-super {p0, p1, p2}, Lcom/flurry/sdk/ft;->a(Ljava/lang/String;Lcom/flurry/sdk/fm;)Ljava/lang/Object;

    move-result-object v0

    .line 72
    :goto_0
    return-object v0

    :cond_0
    invoke-static {v0, p1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    goto :goto_0
.end method

.method public b()Lcom/flurry/sdk/gr;
    .locals 1

    .prologue
    .line 51
    invoke-virtual {p0}, Lcom/flurry/sdk/gs;->a()Lcom/flurry/sdk/fs;

    move-result-object v0

    check-cast v0, Lcom/flurry/sdk/gr;

    return-object v0
.end method
