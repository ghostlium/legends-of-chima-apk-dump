.class public final Lcom/amazon/ags/constants/OverlaySize;
.super Ljava/lang/Object;
.source "OverlaySize.java"


# static fields
.field public static ALERT_HEIGHT_PIXELS:I = 0x0

.field public static ALERT_WIDTH_PIXELS:I = 0x0

.field public static final TOAST_HEIGHT_PIXELS:I = 0x49

.field public static final TOAST_WIDTH_PIXELS:I = 0x140


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const/16 v0, 0x111

    sput v0, Lcom/amazon/ags/constants/OverlaySize;->ALERT_WIDTH_PIXELS:I

    .line 17
    const/16 v0, 0xb4

    sput v0, Lcom/amazon/ags/constants/OverlaySize;->ALERT_HEIGHT_PIXELS:I

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
