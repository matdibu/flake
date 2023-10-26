{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    google-chrome
  ];

  programs.chromium = {
    enable = true;
    extensions = [
      "ajhmfdgkijocedmfjonnpjfojldioehi" # Privacy Pass
      "blipmdconlkpinefehnmjammfjpmpbjk" # Lighthouse
      "cankofcoohmbhfpcemhmaaeennfbnmgp" # Netflix 1080p
      "chklaanhfefbnpoihckbnefhakgolnmc" # JSONVue
      "cjpalhdlnbpafiamejdnhcphjbkeiagm" # uBlock Origin
      "dneaehbmnbhcippjikoajpoabadpodje" # Old Reddit Redirect
      "dnhpnfgdlenaccegplpojghhmaamnnfp" # Augmented Steam
      "donbcfbmhbcapadipfkeojnmajbakjdc" # ruffle.rs
      "edibdbjcniadpccecjdfdjjppcpchdlm" # I still don't care about cookies
      "emffkefkbkpkgpdeeooapgaicgmcbolj" # Wikiwand
      "enamippconapkdmgfgjchkhakpfinmaj" # DeArrow
      "gebbhagfogifgggkldgodflihgfeippi" # Return YouTube dislike
      "ghbmnnjooekpmoecnnnilnnbdlolhkhi" # Google Docs Offline
      "hlepfoohegkhhmjieoechaddaejaokhf" # Refined GitHub
      "icallnadddjmdinamnolclfjanhfoafe" # FastForward
      "ipdchdaimepggclpjanobgdahjflhedd" # AWS Dark
      "jinjaccalgkegednnccohejagnlnfdag" # Małpka
      "lckanjgmijmafbedllaakclkaicjfmnk" # ClearURLs
      "ldpochfccmkkmhdbclfhpagapcfdljkj" # Decentraleyes
      "mnjggcdmjocbbbhaepdhchncahnbgone" # SponsorBlock for YouTube
      "mpbjkejclgfgadiemmefgebjfooflfhl" # Buster
      "ndpmhjnlfkgfalaieeneneenijondgag" # YouTube Anti Translate
      "nngceckbapebfimnlniiiahkandclblb" # Bitwarden
      "ohnjgmpcibpbafdlkimncjhflgedgpam" # 4chan X
      "pampamgoihgcedonnphgehgondkhikel" # DotGit
      "pkehgijcmpdhfbdbbnkijodmdjhbjlgp" # Privacy Badger
    ];
    extraOpts = {
      "AutofillAddressEnabled" = false;
      "AutofillCreditCardEnabled" = false;
      "BlockThirdPartyCookies" = true;
      "CloudPrintProxyEnabled" = false;
      "ExtensionInstallBlocklist" = [ "*" ];
      "HistoryClustersVisible" = false;
      "HttpsOnlyMode" = "force_enabled";
      "MetricsReportingEnabled" = false;
      "NetworkPredictionOptions" = 2;
      "PasswordManagerEnabled" = false;
      "PaymentMethodQueryEnabled" = false;
      "PrivacySandboxAdMeasurementEnabled" = false;
      "PrivacySandboxAdTopicsEnabled" = false;
      "PrivacySandboxPromptEnabled" = false;
      "PrivacySandboxSiteEnabledAdsEnabled" = false;
      "SafeBrowsingProtectionLevel" = 0;
      "SearchSuggestEnabled" = false;
      "SpellCheckServiceEnabled" = false;
      "SSLErrorOverrideAllowed" = true;
      "UrlKeyedAnonymizedDataCollectionEnabled" = false;
    };
  };
}
