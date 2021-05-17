.class public Lcom/flurry/sdk/pa;
.super Lcom/flurry/sdk/pn;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/pn",
        "<",
        "Ljava/util/Date;",
        ">;"
    }
.end annotation


# static fields
.field public static a:Lcom/flurry/sdk/pa;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 24
    new-instance v0, Lcom/flurry/sdk/pa;

    invoke-direct {v0}, Lcom/flurry/sdk/pa;-><init>()V

    sput-object v0, Lcom/flurry/sdk/pa;->a:Lcom/flurry/sdk/pa;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 26
    const-class v0, Ljava/util/Date;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/pn;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 20
    check-cast p1, Ljava/util/Date;

    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/pa;->a(Ljava/util/Date;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    return-void
.end method

.method public a(Ljava/util/Date;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 32
    invoke-virtual {p3, p1, p2}, Lcom/flurry/sdk/jw;->a(Ljava/util/Date;Lcom/flurry/sdk/hp;)V

    .line 33
    return-void
.end method
