.class public final enum Lcom/amazon/ags/api/overlay/PopUpLocation;
.super Ljava/lang/Enum;
.source "PopUpLocation.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/amazon/ags/api/overlay/PopUpLocation;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/amazon/ags/api/overlay/PopUpLocation;

.field public static final enum BOTTOM_CENTER:Lcom/amazon/ags/api/overlay/PopUpLocation;

.field public static final enum BOTTOM_LEFT:Lcom/amazon/ags/api/overlay/PopUpLocation;

.field public static final enum BOTTOM_RIGHT:Lcom/amazon/ags/api/overlay/PopUpLocation;

.field public static final DEFAULT_POPUP_LOCATION:Lcom/amazon/ags/api/overlay/PopUpLocation;

.field public static final enum TOP_CENTER:Lcom/amazon/ags/api/overlay/PopUpLocation;

.field public static final enum TOP_LEFT:Lcom/amazon/ags/api/overlay/PopUpLocation;

.field public static final enum TOP_RIGHT:Lcom/amazon/ags/api/overlay/PopUpLocation;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 13
    new-instance v0, Lcom/amazon/ags/api/overlay/PopUpLocation;

    const-string v1, "TOP_LEFT"

    invoke-direct {v0, v1, v3}, Lcom/amazon/ags/api/overlay/PopUpLocation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/overlay/PopUpLocation;->TOP_LEFT:Lcom/amazon/ags/api/overlay/PopUpLocation;

    new-instance v0, Lcom/amazon/ags/api/overlay/PopUpLocation;

    const-string v1, "TOP_RIGHT"

    invoke-direct {v0, v1, v4}, Lcom/amazon/ags/api/overlay/PopUpLocation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/overlay/PopUpLocation;->TOP_RIGHT:Lcom/amazon/ags/api/overlay/PopUpLocation;

    new-instance v0, Lcom/amazon/ags/api/overlay/PopUpLocation;

    const-string v1, "BOTTOM_LEFT"

    invoke-direct {v0, v1, v5}, Lcom/amazon/ags/api/overlay/PopUpLocation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/overlay/PopUpLocation;->BOTTOM_LEFT:Lcom/amazon/ags/api/overlay/PopUpLocation;

    new-instance v0, Lcom/amazon/ags/api/overlay/PopUpLocation;

    const-string v1, "BOTTOM_RIGHT"

    invoke-direct {v0, v1, v6}, Lcom/amazon/ags/api/overlay/PopUpLocation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/overlay/PopUpLocation;->BOTTOM_RIGHT:Lcom/amazon/ags/api/overlay/PopUpLocation;

    new-instance v0, Lcom/amazon/ags/api/overlay/PopUpLocation;

    const-string v1, "TOP_CENTER"

    invoke-direct {v0, v1, v7}, Lcom/amazon/ags/api/overlay/PopUpLocation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/overlay/PopUpLocation;->TOP_CENTER:Lcom/amazon/ags/api/overlay/PopUpLocation;

    new-instance v0, Lcom/amazon/ags/api/overlay/PopUpLocation;

    const-string v1, "BOTTOM_CENTER"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/amazon/ags/api/overlay/PopUpLocation;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/amazon/ags/api/overlay/PopUpLocation;->BOTTOM_CENTER:Lcom/amazon/ags/api/overlay/PopUpLocation;

    .line 12
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/amazon/ags/api/overlay/PopUpLocation;

    sget-object v1, Lcom/amazon/ags/api/overlay/PopUpLocation;->TOP_LEFT:Lcom/amazon/ags/api/overlay/PopUpLocation;

    aput-object v1, v0, v3

    sget-object v1, Lcom/amazon/ags/api/overlay/PopUpLocation;->TOP_RIGHT:Lcom/amazon/ags/api/overlay/PopUpLocation;

    aput-object v1, v0, v4

    sget-object v1, Lcom/amazon/ags/api/overlay/PopUpLocation;->BOTTOM_LEFT:Lcom/amazon/ags/api/overlay/PopUpLocation;

    aput-object v1, v0, v5

    sget-object v1, Lcom/amazon/ags/api/overlay/PopUpLocation;->BOTTOM_RIGHT:Lcom/amazon/ags/api/overlay/PopUpLocation;

    aput-object v1, v0, v6

    sget-object v1, Lcom/amazon/ags/api/overlay/PopUpLocation;->TOP_CENTER:Lcom/amazon/ags/api/overlay/PopUpLocation;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/amazon/ags/api/overlay/PopUpLocation;->BOTTOM_CENTER:Lcom/amazon/ags/api/overlay/PopUpLocation;

    aput-object v2, v0, v1

    sput-object v0, Lcom/amazon/ags/api/overlay/PopUpLocation;->$VALUES:[Lcom/amazon/ags/api/overlay/PopUpLocation;

    .line 15
    sget-object v0, Lcom/amazon/ags/api/overlay/PopUpLocation;->TOP_RIGHT:Lcom/amazon/ags/api/overlay/PopUpLocation;

    sput-object v0, Lcom/amazon/ags/api/overlay/PopUpLocation;->DEFAULT_POPUP_LOCATION:Lcom/amazon/ags/api/overlay/PopUpLocation;

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
    .line 12
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getLocationFromString(Ljava/lang/String;Lcom/amazon/ags/api/overlay/PopUpLocation;)Lcom/amazon/ags/api/overlay/PopUpLocation;
    .locals 1
    .param p0, "str"    # Ljava/lang/String;
    .param p1, "defaultLocation"    # Lcom/amazon/ags/api/overlay/PopUpLocation;

    .prologue
    .line 28
    :try_start_0
    invoke-static {p0}, Lcom/amazon/ags/api/overlay/PopUpLocation;->valueOf(Ljava/lang/String;)Lcom/amazon/ags/api/overlay/PopUpLocation;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object p1

    .line 32
    .end local p1    # "defaultLocation":Lcom/amazon/ags/api/overlay/PopUpLocation;
    :goto_0
    return-object p1

    .line 29
    .restart local p1    # "defaultLocation":Lcom/amazon/ags/api/overlay/PopUpLocation;
    :catch_0
    move-exception v0

    .line 30
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    goto :goto_0

    .line 31
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v0

    .line 32
    .local v0, "e":Ljava/lang/NullPointerException;
    goto :goto_0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/amazon/ags/api/overlay/PopUpLocation;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 12
    const-class v0, Lcom/amazon/ags/api/overlay/PopUpLocation;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/amazon/ags/api/overlay/PopUpLocation;

    return-object v0
.end method

.method public static values()[Lcom/amazon/ags/api/overlay/PopUpLocation;
    .locals 1

    .prologue
    .line 12
    sget-object v0, Lcom/amazon/ags/api/overlay/PopUpLocation;->$VALUES:[Lcom/amazon/ags/api/overlay/PopUpLocation;

    invoke-virtual {v0}, [Lcom/amazon/ags/api/overlay/PopUpLocation;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/amazon/ags/api/overlay/PopUpLocation;

    return-object v0
.end method
