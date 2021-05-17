.class Lcom/flurry/sdk/gp$f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flurry/sdk/gp;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "f"
.end annotation


# instance fields
.field public final a:[Lcom/flurry/sdk/gp;

.field public final b:I


# direct methods
.method public constructor <init>([Lcom/flurry/sdk/gp;I)V
    .locals 0

    .prologue
    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    iput-object p1, p0, Lcom/flurry/sdk/gp$f;->a:[Lcom/flurry/sdk/gp;

    .line 140
    iput p2, p0, Lcom/flurry/sdk/gp$f;->b:I

    .line 141
    return-void
.end method
