.class public final enum Lcom/jayway/jsonpath/spi/Mode;
.super Ljava/lang/Enum;
.source "Mode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/jayway/jsonpath/spi/Mode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/jayway/jsonpath/spi/Mode;

.field public static final enum SLACK:Lcom/jayway/jsonpath/spi/Mode;

.field public static final enum STRICT:Lcom/jayway/jsonpath/spi/Mode;


# instance fields
.field private final mode:I


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 22
    new-instance v0, Lcom/jayway/jsonpath/spi/Mode;

    const-string v1, "SLACK"

    const/4 v2, -0x1

    invoke-direct {v0, v1, v4, v2}, Lcom/jayway/jsonpath/spi/Mode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/jayway/jsonpath/spi/Mode;->SLACK:Lcom/jayway/jsonpath/spi/Mode;

    .line 23
    new-instance v0, Lcom/jayway/jsonpath/spi/Mode;

    const-string v1, "STRICT"

    invoke-direct {v0, v1, v3, v3}, Lcom/jayway/jsonpath/spi/Mode;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/jayway/jsonpath/spi/Mode;->STRICT:Lcom/jayway/jsonpath/spi/Mode;

    .line 20
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/jayway/jsonpath/spi/Mode;

    sget-object v1, Lcom/jayway/jsonpath/spi/Mode;->SLACK:Lcom/jayway/jsonpath/spi/Mode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/jayway/jsonpath/spi/Mode;->STRICT:Lcom/jayway/jsonpath/spi/Mode;

    aput-object v1, v0, v3

    sput-object v0, Lcom/jayway/jsonpath/spi/Mode;->$VALUES:[Lcom/jayway/jsonpath/spi/Mode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .param p3, "mode"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .prologue
    .line 27
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 28
    iput p3, p0, Lcom/jayway/jsonpath/spi/Mode;->mode:I

    .line 29
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/jayway/jsonpath/spi/Mode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 20
    const-class v0, Lcom/jayway/jsonpath/spi/Mode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/jayway/jsonpath/spi/Mode;

    return-object v0
.end method

.method public static values()[Lcom/jayway/jsonpath/spi/Mode;
    .locals 1

    .prologue
    .line 20
    sget-object v0, Lcom/jayway/jsonpath/spi/Mode;->$VALUES:[Lcom/jayway/jsonpath/spi/Mode;

    invoke-virtual {v0}, [Lcom/jayway/jsonpath/spi/Mode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/jayway/jsonpath/spi/Mode;

    return-object v0
.end method


# virtual methods
.method public intValue()I
    .locals 1

    .prologue
    .line 32
    iget v0, p0, Lcom/jayway/jsonpath/spi/Mode;->mode:I

    return v0
.end method

.method public parse(I)Lcom/jayway/jsonpath/spi/Mode;
    .locals 3
    .param p1, "mode"    # I

    .prologue
    .line 36
    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    .line 37
    sget-object v0, Lcom/jayway/jsonpath/spi/Mode;->SLACK:Lcom/jayway/jsonpath/spi/Mode;

    .line 39
    :goto_0
    return-object v0

    .line 38
    :cond_0
    const/4 v0, 0x1

    if-ne p1, v0, :cond_1

    .line 39
    sget-object v0, Lcom/jayway/jsonpath/spi/Mode;->STRICT:Lcom/jayway/jsonpath/spi/Mode;

    goto :goto_0

    .line 41
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Mode "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " not supported"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
