{...}: {
  programs.nixcord = {
    enable = true;
    discord.openASAR.enable = false;
    config = {
      frameless = true;
      disableMinSize = true;
      themeLinks = [
        "https://raw.githubusercontent.com/refact0r/midnight-discord/refs/heads/master/flavors/midnight-vencord.theme.css"
      ];
      plugins = {
        alwaysTrust = {
          enable = true;
          domain = true;
          file = true;
        };
        banger = {
          enable = true;
          source = "https://i.imgur.com/wp5q52C.mp4";
        };
        betterFolders = {
          enable = true;
          sidebar = true;
          sidebarAnim = false;
          closeAllFolders = true;
          closeAllHomeButton = true;
          closeOthers = false;
          forceOpen = false;
          keepIcons = true;
          showFolderIcon = "moreThanOne";
        };
        betterGifAltText.enable = true;
        betterGifPicker.enable = true;
        betterSettings = {
          disableFade = true;
          organizeMenu = true;
          eagerLoad = true;
        };
        betterUploadButton.enable = true;
        biggerStreamPreview.enable = true;
        blurNSFW = {
          enable = true;
          blurAmount = 10;
        };
        callTimer = {
          enable = true;
          format = "human";
        };
        clearURLs.enable = true;
        copyUserURLs.enable = true;
        crashHandler = {
          enable = true;
          attemptToPreventCrashes = true;
          attemptToNavigateToHome = true;
        };
        customIdle = {
          enable = true;
          idleTimeout = 20.0;
          remainInIdle = false;
        };
        dearrow = {
          enable = true;
          hideButton = false;
          replaceElements = "everything";
          dearrowByDefault = true;
        };
        dontRoundMyTimestamps.enable = true;
        experiments = {
          enable = true;
          toolbarDevMenu = true;
        };
        fakeNitro = {
          enable = true;
          enableEmojiBypass = true;
          emojiSize = 48;
          transformEmojis = true;
          enableStickerBypass = true;
          stickerSize = 160;
          transformStickers = true;
          transformCompoundSentence = true;
          enableStreamQualityBypass = true;
          useHyperLinks = true;
          hyperLinkText = "{{NAME}}";
          disableEmbedPermissionCheck = false;
        };
        favoriteEmojiFirst.enable = true;
        favoriteGifSearch = {
          enable = true;
          searchOption = "hostandpath";
        };
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds = {
          enable = true;
          volume = 10.0;
        };
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        fullSearchContext.enable = true;
        fullUserInChatbox.enable = true;
        gameActivityToggle = {
          enable = true;
          oldIcon = true;
        };
        greetStickerPicker = {
          enable = true;
          greetMode = "Greet";
        };
        imageZoom = {
          enable = true;
          saveZoomValues = true;
          invertScroll = true;
          nearestNeighbour = true;
          square = false;
          zoom = 3.50;
          size = 450.0;
          zoomSpeed = 4.50;
        };
        invisibleChat = {
          enable = true;
          savedPasswords = "heck";
        };
        loadingQuotes = {
          enable = true;
          replaceEvents = true;
          enablePluginPresetQuotes = true;
          enableDiscordPresetQuotes = false;
          additionalQuotes = "i can touch my toooooooooooooes|don't kill yourself, you idiot|i'm an old money bitch|i'm a slut for you, slut for you!|you don't have the guts anymore|look at the sky";
          additionalQuotesDelimiter = "|";
        };
        memberCount = {
          enable = true;
          toolTip = true;
          memberList = true;
        };
        mentionAvatars = {
          enable = true;
          showAtSymbol = true;
        };
        messageClickActions = {
          enable = true;
          enableDeleteOnClick = true;
          enableDoubleClickToEdit = true;
          enableDoubleClickToReply = true;
          requireModifier = true;
        };
        messageLinkEmbeds = {
          enable = true;
          messageBackgroundColor = false;
          automodEmbeds = "never";
          listMode = "blacklist";
        };
        messageTags = {
          enable = true;
          clyde = false;
        };
        newGuildSettings = {
          enable = true;
          messages = "only@Mentions";
          everyone = false;
          role = false;
          highlights = true;
          events = true;
          showAllChannels = false;
        };
        noF1.enable = true;
        noOnboardingDelay.enable = true;
        noPendingCount = {
          enable = true;
          hideFriendRequestsCount = false;
          hideMessageRequestCount = false;
          hidePremiumOffersCount = true;
        };
        noReplyMention = {
          enable = true;
          shouldPingListed = true;
          inverseShiftReply = false;
        };
        notificationVolume = {
          enable = true;
          notificationVolume = 50.0;
        };
        noTypingAnimation.enable = true;
        nsfwGateBypass.enable = true;
        onePingPerDM = {
          enable = true;
          channelToAffect = "both_dms";
          allowMentions = true;
          allowEveryone = true;
        };
        openInApp = {
          enable = true;
          spotify = true;
          steam = false;
          epic = false;
          tidal = false;
          itunes = false;
        };
        permissionsViewer = {
          enable = true;
          permissionsSortOrder = "highestRole";
        };
        petpet.enable = true;
        pictureInPicture = {
          enable = true;
          loop = false;
        };
        pinDMs = {
          enable = true;
          pinOrder = "mostRecent";
          dmSectioncollapsed = false;
        };
        quickMention.enable = true;
        quickReply.enable = true;
        reactErrorDecoder.enable = true;
        readAllNotificationsButton.enable = true;
        relationshipNotifier = {
          enable = true;
          notices = true;
          offlineRemovals = true;
          friends = true;
          friendRequestCancels = true;
          servers = true;
          groups = true;
        };
        reverseImageSearch.enable = true;
        roleColorEverywhere = {
          enable = true;
          chatMentions = true;
          memberList = true;
          voiceUsers = true;
          reactorsList = true;
          colorChatMessages = false;
          messageSaturation = 20;
        };
        secretRingToneEnabler.enable = true;
        sendTimestamps = {
          enable = true;
          replaceMessageContents = true;
        };
        serverInfo.enable = true;
        serverListIndicators.enable = true;
        shikiCodeblocks = {
          enable = true;
          theme = "https://raw.githubusercontent.com/sainnhe/gruvbox-material-vscode/refs/heads/master/themes/gruvbox-material-dark.json";
          tryHljs = "SECONDARY";
          useDevIcon = "GREYSCALE";
          bgOpacity = 100.0;
        };
        showAllMessageButtons.enable = true;
        showHiddenChannels = {
          enable = true;
          hideUnreads = true;
          showMode = "muted";
          showHiddenChannels = true;
        };
        showMeYourName = {
          enable = true;
          mode = "nick-user";
        };
        silentMessageToggle = {
          enable = true;
          persistState = false;
          autoDisable = true;
        };
        silentTyping = {
          enable = true;
          showIcon = true;
          contextMenu = true;
          isEnabled = false;
        };
        sortFriendRequests = {
          enable = true;
          showDates = true;
        };
        spotifyControls = {
          enable = true;
          hoverControls = true;
          useSpotifyUris = true;
        };
        spotifyCrack = {
          enable = true;
          noSpotifyAutoPause = true;
          keepSpotifyActivityOnIdle = true;
        };
        spotifyShareCommands.enable = true;
        startupTimings.enable = true;
        stickerPaste.enable = true;
        superReactionTweaks = {
          enable = true;
          superReactByDefault = false;
          unlimitedSuperReactionPlaying = false;
          superReactionPlayingLimit = 0;
        };
        textReplace.enable = true;
        translate = {
          enable = true;
          autoTranslate = false;
          showChatBarButton = true;
        };
        typingIndicator = {
          enable = true;
          includeCurrentChannel = false;
          includeMutedChannels = false;
          includeBlockedUsers = false;
          indicatorMode = "avatars";
        };
        typingTweaks = {
          enable = true;
          showAvatars = true;
          showRoleColors = true;
          alternativeFormatting = true;
        };
        unindent.enable = true;
        userVoiceShow = {
          enable = true;
          showInUserProfileModal = true;
          showInMemberList = true;
          showInMessages = true;
        };
        validReply.enable = true;
        validUser.enable = true;
        viewIcons = {
          enable = true;
          format = "png";
          imgSize = 2048;
        };
        viewRaw = {
          enable = true;
          clickMethod = "Left";
        };
        voiceChatDoubleClick.enable = true;
        voiceDownload.enable = true;
        voiceMessages = {
          enable = true;
          noiseSuppression = true;
          echoCancellation = true;
        };
        volumeBooster = {
          enable = true;
          multiplier = 3;
        };
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
      };
    };
  };
}
