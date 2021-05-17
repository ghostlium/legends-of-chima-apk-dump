.class public final Lcom/flurry/sdk/om$b;
.super Lcom/flurry/sdk/pj;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/om;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/pj",
        "<",
        "Ljava/lang/Double;",
        ">;"
    }
.end annotation


# static fields
.field static final a:Lcom/flurry/sdk/om$b;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 213
    new-instance v0, Lcom/flurry/sdk/om$b;

    invoke-direct {v0}, Lcom/flurry/sdk/om$b;-><init>()V

    sput-object v0, Lcom/flurry/sdk/om$b;->a:Lcom/flurry/sdk/om$b;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 215
    const-class v0, Ljava/lang/Double;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/pj;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Double;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 221
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    move-result-wide v0

    invoke-virtual {p2, v0, v1}, Lcom/flurry/sdk/hp;->a(D)V

    .line 222
    return-void
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
    .line 209
    check-cast p1, Ljava/lang/Double;

    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/om$b;->a(Ljava/lang/Double;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    return-void
.end method
