.class public final enum Lcom/playhaven/android/compat/VendorCompat$LAYOUT;
.super Ljava/lang/Enum;
.source "VendorCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/compat/VendorCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LAYOUT"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/compat/VendorCompat$LAYOUT;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

.field public static final enum playhaven_activity:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

.field public static final enum playhaven_dialog:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

.field public static final enum playhaven_exit:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

.field public static final enum playhaven_loadinganim:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

.field public static final enum playhaven_overlay:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 28
    new-instance v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    const-string v1, "playhaven_activity"

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_activity:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    .line 29
    new-instance v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    const-string v1, "playhaven_overlay"

    invoke-direct {v0, v1, v3}, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_overlay:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    .line 30
    new-instance v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    const-string v1, "playhaven_loadinganim"

    invoke-direct {v0, v1, v4}, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_loadinganim:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    .line 31
    new-instance v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    const-string v1, "playhaven_exit"

    invoke-direct {v0, v1, v5}, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_exit:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    .line 32
    new-instance v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    const-string v1, "playhaven_dialog"

    invoke-direct {v0, v1, v6}, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_dialog:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    .line 26
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_activity:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    aput-object v1, v0, v2

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_overlay:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    aput-object v1, v0, v3

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_loadinganim:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    aput-object v1, v0, v4

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_exit:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    aput-object v1, v0, v5

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->playhaven_dialog:Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    aput-object v1, v0, v6

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->ENUM$VALUES:[Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/compat/VendorCompat$LAYOUT;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/compat/VendorCompat$LAYOUT;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/compat/VendorCompat$LAYOUT;->ENUM$VALUES:[Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/compat/VendorCompat$LAYOUT;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
