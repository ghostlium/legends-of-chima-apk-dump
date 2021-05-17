.class public final enum Lcom/amazon/ags/constants/IconSize;
.super Ljava/lang/Enum;
.source "IconSize.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/constants/IconSize;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/constants/IconSize;

.field public static final enum LARGE:Lcom/amazon/ags/constants/IconSize;

.field public static final enum MEDIUM:Lcom/amazon/ags/constants/IconSize;

.field public static final enum SMALL:Lcom/amazon/ags/constants/IconSize;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 9
    new-instance v0, Lcom/amazon/ags/constants/IconSize;

    const-string v1, "SMALL"

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/constants/IconSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/IconSize;->SMALL:Lcom/amazon/ags/constants/IconSize;

    new-instance v0, Lcom/amazon/ags/constants/IconSize;

    const-string v1, "MEDIUM"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/constants/IconSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/IconSize;->MEDIUM:Lcom/amazon/ags/constants/IconSize;

    new-instance v0, Lcom/amazon/ags/constants/IconSize;

    const-string v1, "LARGE"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/constants/IconSize;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/constants/IconSize;->LARGE:Lcom/amazon/ags/constants/IconSize;

    .line 8
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/amazon/ags/constants/IconSize;

    sget-object v1, Lcom/amazon/ags/constants/IconSize;->SMALL:Lcom/amazon/ags/constants/IconSize;

    aput-object v1, v0, v2

    sget-object v1, Lcom/amazon/ags/constants/IconSize;->MEDIUM:Lcom/amazon/ags/constants/IconSize;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/constants/IconSize;->LARGE:Lcom/amazon/ags/constants/IconSize;

    aput-object v1, v0, v4

    sput-object v0, Lcom/amazon/ags/constants/IconSize;->$VALUES:[Lcom/amazon/ags/constants/IconSize;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 8
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/constants/IconSize;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 8
    const-class v0, Lcom/amazon/ags/constants/IconSize;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/constants/IconSize;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/constants/IconSize;
    .locals 1

    .prologue
    .line 8
    sget-object v0, Lcom/amazon/ags/constants/IconSize;->$VALUES:[Lcom/amazon/ags/constants/IconSize;

    invoke-virtual {v0}, [Lcom/amazon/ags/constants/IconSize;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/constants/IconSize;

    return-object v0
.end method
