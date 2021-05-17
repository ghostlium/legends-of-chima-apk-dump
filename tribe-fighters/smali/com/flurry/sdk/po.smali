.class public Lcom/flurry/sdk/po;
.super Lcom/flurry/sdk/ok;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/ok",
        "<",
        "Lcom/flurry/sdk/jj;",
        ">;"
    }
.end annotation


# static fields
.field public static final a:Lcom/flurry/sdk/po;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 32
    new-instance v0, Lcom/flurry/sdk/po;

    invoke-direct {v0}, Lcom/flurry/sdk/po;-><init>()V

    sput-object v0, Lcom/flurry/sdk/po;->a:Lcom/flurry/sdk/po;

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 34
    const-class v0, Lcom/flurry/sdk/jj;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/ok;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public a(Lcom/flurry/sdk/jj;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 40
    invoke-interface {p1, p2, p3}, Lcom/flurry/sdk/jj;->a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    .line 41
    return-void
.end method

.method public final a(Lcom/flurry/sdk/jj;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 52
    instance-of v0, p1, Lcom/flurry/sdk/jk;

    if-eqz v0, :cond_0

    .line 53
    check-cast p1, Lcom/flurry/sdk/jk;

    invoke-interface {p1, p2, p3, p4}, Lcom/flurry/sdk/jk;->a(Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V

    .line 57
    :goto_0
    return-void

    .line 55
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/po;->a(Lcom/flurry/sdk/jj;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    goto :goto_0
.end method

.method public bridge synthetic a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 27
    check-cast p1, Lcom/flurry/sdk/jj;

    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/po;->a(Lcom/flurry/sdk/jj;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    return-void
.end method

.method public bridge synthetic a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/hu;
        }
    .end annotation

    .prologue
    .line 27
    check-cast p1, Lcom/flurry/sdk/jj;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/flurry/sdk/po;->a(Lcom/flurry/sdk/jj;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;Lcom/flurry/sdk/jz;)V

    return-void
.end method
