.class public final enum Lcom/playhaven/android/compat/VendorCompat$ID;
.super Ljava/lang/Enum;
.source "VendorCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/compat/VendorCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ID"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/playhaven/android/compat/VendorCompat$ID;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic ENUM$VALUES:[Lcom/playhaven/android/compat/VendorCompat$ID;

.field public static final enum com_playhaven_android_view_Exit:Lcom/playhaven/android/compat/VendorCompat$ID;

.field public static final enum com_playhaven_android_view_Exit_button:Lcom/playhaven/android/compat/VendorCompat$ID;

.field public static final enum com_playhaven_android_view_LoadingAnimation:Lcom/playhaven/android/compat/VendorCompat$ID;

.field public static final enum com_playhaven_android_view_Overlay:Lcom/playhaven/android/compat/VendorCompat$ID;

.field public static final enum playhaven_activity_view:Lcom/playhaven/android/compat/VendorCompat$ID;

.field public static final enum playhaven_dialog_view:Lcom/playhaven/android/compat/VendorCompat$ID;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 56
    new-instance v0, Lcom/playhaven/android/compat/VendorCompat$ID;

    const-string v1, "playhaven_dialog_view"

    invoke-direct {v0, v1, v3}, Lcom/playhaven/android/compat/VendorCompat$ID;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$ID;->playhaven_dialog_view:Lcom/playhaven/android/compat/VendorCompat$ID;

    .line 57
    new-instance v0, Lcom/playhaven/android/compat/VendorCompat$ID;

    const-string v1, "com_playhaven_android_view_Overlay"

    invoke-direct {v0, v1, v4}, Lcom/playhaven/android/compat/VendorCompat$ID;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_Overlay:Lcom/playhaven/android/compat/VendorCompat$ID;

    .line 58
    new-instance v0, Lcom/playhaven/android/compat/VendorCompat$ID;

    const-string v1, "com_playhaven_android_view_LoadingAnimation"

    invoke-direct {v0, v1, v5}, Lcom/playhaven/android/compat/VendorCompat$ID;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_LoadingAnimation:Lcom/playhaven/android/compat/VendorCompat$ID;

    .line 59
    new-instance v0, Lcom/playhaven/android/compat/VendorCompat$ID;

    const-string v1, "com_playhaven_android_view_Exit"

    invoke-direct {v0, v1, v6}, Lcom/playhaven/android/compat/VendorCompat$ID;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_Exit:Lcom/playhaven/android/compat/VendorCompat$ID;

    .line 60
    new-instance v0, Lcom/playhaven/android/compat/VendorCompat$ID;

    const-string v1, "com_playhaven_android_view_Exit_button"

    invoke-direct {v0, v1, v7}, Lcom/playhaven/android/compat/VendorCompat$ID;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_Exit_button:Lcom/playhaven/android/compat/VendorCompat$ID;

    .line 61
    new-instance v0, Lcom/playhaven/android/compat/VendorCompat$ID;

    const-string v1, "playhaven_activity_view"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/playhaven/android/compat/VendorCompat$ID;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$ID;->playhaven_activity_view:Lcom/playhaven/android/compat/VendorCompat$ID;

    .line 54
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/playhaven/android/compat/VendorCompat$ID;

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ID;->playhaven_dialog_view:Lcom/playhaven/android/compat/VendorCompat$ID;

    aput-object v1, v0, v3

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_Overlay:Lcom/playhaven/android/compat/VendorCompat$ID;

    aput-object v1, v0, v4

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_LoadingAnimation:Lcom/playhaven/android/compat/VendorCompat$ID;

    aput-object v1, v0, v5

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_Exit:Lcom/playhaven/android/compat/VendorCompat$ID;

    aput-object v1, v0, v6

    sget-object v1, Lcom/playhaven/android/compat/VendorCompat$ID;->com_playhaven_android_view_Exit_button:Lcom/playhaven/android/compat/VendorCompat$ID;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/playhaven/android/compat/VendorCompat$ID;->playhaven_activity_view:Lcom/playhaven/android/compat/VendorCompat$ID;

    aput-object v2, v0, v1

    sput-object v0, Lcom/playhaven/android/compat/VendorCompat$ID;->ENUM$VALUES:[Lcom/playhaven/android/compat/VendorCompat$ID;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 54
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/playhaven/android/compat/VendorCompat$ID;
    .locals 1

    .prologue
    .line 1
    const-class v0, Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/playhaven/android/compat/VendorCompat$ID;

    return-object v0
.end method

.method public static values()[Lcom/playhaven/android/compat/VendorCompat$ID;
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 1
    sget-object v0, Lcom/playhaven/android/compat/VendorCompat$ID;->ENUM$VALUES:[Lcom/playhaven/android/compat/VendorCompat$ID;

    array-length v1, v0

    new-array v2, v1, [Lcom/playhaven/android/compat/VendorCompat$ID;

    invoke-static {v0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object v2
.end method
