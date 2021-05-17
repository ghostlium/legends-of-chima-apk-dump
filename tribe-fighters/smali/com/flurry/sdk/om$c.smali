.class public final Lcom/flurry/sdk/om$c;
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
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/pn",
        "<",
        "Ljava/lang/Float;",
        ">;"
    }
.end annotation


# static fields
.field static final a:Lcom/flurry/sdk/om$c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 184
    new-instance v0, Lcom/flurry/sdk/om$c;

    invoke-direct {v0}, Lcom/flurry/sdk/om$c;-><init>()V

    sput-object v0, Lcom/flurry/sdk/om$c;->a:Lcom/flurry/sdk/om$c;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 186
    const-class v0, Ljava/lang/Float;

    invoke-direct {p0, v0}, Lcom/flurry/sdk/pn;-><init>(Ljava/lang/Class;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Float;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 192
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result v0

    invoke-virtual {p2, v0}, Lcom/flurry/sdk/hp;->a(F)V

    .line 193
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
    .line 180
    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/om$c;->a(Ljava/lang/Float;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    return-void
.end method
