.class public final Lcom/amazon/ags/constants/ServiceActionCode;
.super Ljava/lang/Object;
.source "ServiceActionCode.java"


# static fields
.field public static final ACTION_CODE_KEY:Ljava/lang/String; = "ACTION_CODE"

.field public static final AUTHENTICATE:I = 0x4

.field public static final AUTHORIZE_SESSION:I = 0x19

.field public static final DOWNLOAD:I = 0x2

.field public static final GENERIC_RESPONSE:I = 0x0

.field public static final GET_GAME_PROGRESS:I = 0x21

.field public static final HANDLE_TOAST_CLICK:Ljava/lang/String; = "HANDLE_TOAST_CLICK"

.field public static final HANDLE_TOAST_DISPLAY_METRIC:Ljava/lang/String; = "HANDLE_TOAST_DISPLAY_METRIC"

.field public static final INITIALIZE:I = 0x17

.field public static final IS_WHISPERSYNC_ENABLED:Ljava/lang/String; = "IS_WHISPERSYNC_ENABLED"

.field public static final LOAD_ACHIEVEMENT_ICON:I = 0x10

.field public static final PROCESS_OFFLINE_EVENT:I = 0x22

.field public static final QUERY_AUTHENTICATION:I = 0x3

.field public static final REQUEST_ACHIEVEMENT:I = 0xc

.field public static final REQUEST_ACHIEVEMENTS:I = 0x11

.field public static final REQUEST_LEADERBOARDS:I = 0x9

.field public static final REQUEST_LOCAL_PLAYER_PROFILE:I = 0x12

.field public static final REQUEST_PERCENTILES:I = 0x1f

.field public static final REQUEST_PLAYER_SCORE:I = 0xa

.field public static final REQUEST_SCORES:I = 0x7

.field public static final REQUEST_SESSION:I = 0x18

.field public static final RESET_ACHIEVEMENT:I = 0xf

.field public static final RESET_ACHIEVEMENTS:I = 0xe

.field public static final RETRIEVE_GAME_HISTORY:I = 0xb

.field public static final RETRIEVE_LATEST_SAVED_GAME_SUMMARY:I = 0x6

.field public static final REVERT:I = 0x16

.field public static final SET_OPT_IN:Ljava/lang/String; = "SET_OPT_IN"

.field public static final SHOW_GAME_CIRCLE:Ljava/lang/String; = "SHOW_GAME_CIRCLE"

.field public static final SHOW_OVERLAY_ACHIEVEMENTS:I = 0x1a

.field public static final SHOW_OVERLAY_LEADERBOARDS:I = 0x1b

.field public static final SHOW_OVERLAY_PROFILE:I = 0x23

.field public static final SHOW_OVERLAY_RANKS:I = 0x1c

.field public static final SHOW_OVERLAY_SUMMARY:I = 0x24

.field public static final SHOW_SETTINGS:I = 0x1d

.field public static final SHOW_SIGN_IN_PAGE:Ljava/lang/String; = "SHOW_SIGN_IN_PAGE"

.field public static final SHOW_SOFTKEY_PRESS_OVERLAY:I = 0x1e

.field public static final SHOW_TOS_PAGE:Ljava/lang/String; = "SHOW_TOS_PAGE"

.field public static final SHOW_UNIVERSAL_OVERLAY:I = 0x30

.field public static final START_SESSION:Ljava/lang/String; = "START_SESSION"

.field public static final STOP_SESSION:Ljava/lang/String; = "STOP_SESSION"

.field public static final SUBMIT_SCORE:I = 0x8

.field public static final SYNCHRONIZE:I = 0x15

.field public static final UNIVERSAL_AUTHORIZE_SESSION:I = 0x2c

.field public static final UNIVERSAL_CHECK_OPTED_IN:I = 0x2a

.field public static final UNIVERSAL_CHECK_SUPPORTED:I = 0x28

.field public static final UNIVERSAL_CHECK_WHISPERSYNC_ENABLED:I = 0x2b

.field public static final UNIVERSAL_OVERLAYS_SUPPORTED:I = 0x2f

.field public static final UNIVERSAL_REQUEST_SESSION:I = 0x2e

.field public static final UNIVERSAL_SET_OPTED_IN:I = 0x29

.field public static final UNIVERSAL_SIGN_MESSAGE:I = 0x2d

.field public static final UPDATE_ACHIEVEMENT_PROGRESS:I = 0xd

.field public static final UPDATE_COUNTRY_OF_RESIDENCE:Ljava/lang/String; = "UPDATE_COR"

.field public static final UPDATE_GAME_PROGRESS:I = 0x20

.field public static final UPLOAD:I = 0x1


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
