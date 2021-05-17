.class public Lcom/amazon/ags/constants/OverlayActionCode;
.super Ljava/lang/Object;
.source "OverlayActionCode.java"


# static fields
.field public static final SHOW_ACHIEVEMENTS:I = 0x1

.field public static final SHOW_ACHIEVEMENT_SIGN_IN_PROMPT:Ljava/lang/String; = "SHOW_ACHIEVEMENT_SIGN_IN_PROMPT"

.field public static final SHOW_AGE_VERIFICATION:Ljava/lang/String; = "SHOW_AGE_VERIFICATION"

.field public static final SHOW_AGE_VIOLATION:Ljava/lang/String; = "SHOW_AGE_VIOLATION"

.field public static final SHOW_COR_SELECTION:Ljava/lang/String; = "SHOW_COR_SELECTION"

.field public static final SHOW_COR_UNSUPPORTED:Ljava/lang/String; = "SHOW_COR_UNSUPPORTED"

.field public static final SHOW_LEADERBOARDS:I = 0x2

.field public static final SHOW_LEADERBOARD_RANKS:I = 0x6

.field public static final SHOW_LEADERBOARD_SIGN_IN_PROMPT:Ljava/lang/String; = "SHOW_LEADERBOARD_SIGN_IN_PROMPT"

.field public static final SHOW_LOGIN:Ljava/lang/String; = "SHOW_LOGIN"

.field public static final SHOW_PROFILE:I = 0x5

.field public static final SHOW_SETTINGS:I = 0x3

.field public static final SHOW_SUMMARY:I = 0x4

.field public static final SHOW_TERMS_OF_SERVICE:Ljava/lang/String; = "SHOW_TOS"

.field public static final SHOW_TOP_ALL_TIME_LEADERBOARD:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
