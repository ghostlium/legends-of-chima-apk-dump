.class public final Lcom/playhaven/android/R$styleable;
.super Ljava/lang/Object;
.source "R.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/playhaven/android/R;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "styleable"
.end annotation


# static fields
.field public static final com_playhaven_android_view_Badge:[I

.field public static final com_playhaven_android_view_Badge_placementTag:I = 0x0

.field public static final com_playhaven_android_view_Badge_textColor:I = 0x1

.field public static final com_playhaven_android_view_PlayHavenView:[I

.field public static final com_playhaven_android_view_PlayHavenView_displayOptions:I = 0x1

.field public static final com_playhaven_android_view_PlayHavenView_placementTag:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x2

    .line 53
    new-array v0, v1, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/playhaven/android/R$styleable;->com_playhaven_android_view_Badge:[I

    .line 56
    new-array v0, v1, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/playhaven/android/R$styleable;->com_playhaven_android_view_PlayHavenView:[I

    .line 58
    return-void

    .line 53
    :array_0
    .array-data 4
        0x7f010000
        0x7f010002
    .end array-data

    .line 56
    :array_1
    .array-data 4
        0x7f010000
        0x7f010001
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
