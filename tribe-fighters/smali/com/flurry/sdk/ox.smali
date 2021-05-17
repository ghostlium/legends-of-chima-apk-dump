.class public Lcom/flurry/sdk/ox;
.super Lcom/flurry/sdk/pn;
.source "SourceFile"


# annotations
.annotation runtime Lcom/flurry/sdk/kb;
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/flurry/sdk/pn",
        "<",
        "Ljava/util/Calendar;",
        ">;"
    }
.end annotation


# static fields
.field public static a:Lcom/flurry/sdk/ox;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    new-instance v0, Lcom/flurry/sdk/ox;

    invoke-direct {v0}, Lcom/flurry/sdk/ox;-><init>()V

    sput-object v0, Lcom/flurry/sdk/ox;->a:Lcom/flurry/sdk/ox;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Ljava/util/Calendar;

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
    .line 21
    check-cast p1, Ljava/util/Calendar;

    invoke-virtual {p0, p1, p2, p3}, Lcom/flurry/sdk/ox;->a(Ljava/util/Calendar;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V

    return-void
.end method

.method public a(Ljava/util/Calendar;Lcom/flurry/sdk/hp;Lcom/flurry/sdk/jw;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lcom/flurry/sdk/ho;
        }
    .end annotation

    .prologue
    .line 33
    invoke-virtual {p1}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v0

    invoke-virtual {p3, v0, v1, p2}, Lcom/flurry/sdk/jw;->a(JLcom/flurry/sdk/hp;)V

    .line 34
    return-void
.end method
