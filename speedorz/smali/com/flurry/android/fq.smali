.class final enum Lcom/flurry/android/fq;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/flurry/android/fq;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum hJ:Lcom/flurry/android/fq;

.field public static final enum hK:Lcom/flurry/android/fq;

.field public static final enum hL:Lcom/flurry/android/fq;


# instance fields
.field private dH:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 176
    new-instance v0, Lcom/flurry/android/fq;

    const-string v1, "NONE_OR_UNKNOWN"

    invoke-direct {v0, v1, v2, v2}, Lcom/flurry/android/fq;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/flurry/android/fq;->hJ:Lcom/flurry/android/fq;

    .line 177
    new-instance v0, Lcom/flurry/android/fq;

    const-string v1, "WIFI"

    invoke-direct {v0, v1, v3, v3}, Lcom/flurry/android/fq;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/flurry/android/fq;->hK:Lcom/flurry/android/fq;

    .line 178
    new-instance v0, Lcom/flurry/android/fq;

    const-string v1, "CELL"

    invoke-direct {v0, v1, v4, v4}, Lcom/flurry/android/fq;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/flurry/android/fq;->hL:Lcom/flurry/android/fq;

    .line 174
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/flurry/android/fq;

    sget-object v1, Lcom/flurry/android/fq;->hJ:Lcom/flurry/android/fq;

    aput-object v1, v0, v2

    sget-object v1, Lcom/flurry/android/fq;->hK:Lcom/flurry/android/fq;

    aput-object v1, v0, v3

    sget-object v1, Lcom/flurry/android/fq;->hL:Lcom/flurry/android/fq;

    aput-object v1, v0, v4

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 183
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 184
    iput p3, p0, Lcom/flurry/android/fq;->dH:I

    .line 185
    return-void
.end method


# virtual methods
.method final getValue()I
    .locals 1

    .prologue
    .line 189
    iget v0, p0, Lcom/flurry/android/fq;->dH:I

    return v0
.end method
