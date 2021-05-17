.class public final Lcom/flurry/sdk/om$d;
.super Lcom/flurry/sdk/pn;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/om;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/pn",
        "<",
        "Ljava/lang/Number;",
        ">;"
    }
.end annotation


# static fields
.field static final a:Lcom/flurry/sdk/om$d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 140
    new-instance v0, Lcom/flurry/sdk/om$d;

    invoke-direct {v0}, Lcom/flurry/sdk/om$d;-><init>()V

    sput-object v0, Lcom/flurry/sdk/om$d;->a:Lcom/flurry/sdk/om$d;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 142
    const-class v0, Ljava/lang/Number;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/pn;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Number;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 148
    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hp;->b(I)V

    .line 149
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
    .line 136
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/om$d;->a(Ljava/lang/Number;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    return-void
.end method
