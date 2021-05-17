.class public Lcom/flurry/sdk/pk;
.super Lcom/flurry/sdk/pq;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/pq",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field public static final a:Lcom/flurry/sdk/pk;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 21
    new-instance v0, Lcom/flurry/sdk/pk;

    invoke-direct {v0}, Lcom/flurry/sdk/pk;-><init>()V

    sput-object v0, Lcom/flurry/sdk/pk;->a:Lcom/flurry/sdk/pk;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Ljava/lang/Object;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/pq;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 29
    invoke-virtual {p2}, Lcom/flurry/sdk/hp;->f()V

    .line 30
    return-void
.end method
