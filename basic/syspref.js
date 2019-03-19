//Firefox settings  file

//Disable title bar
pref('browser.tabs.drawInTitlebar', true);
pref('general.autoScroll', true);
pref('lightweightThemes.selectedThemeID', 'firefox-compact-light@mozilla.org');
pref('browser.tabs.warnOnClose', false);

// scrolling (windows like smooth scrolling)
pref('general.smoothScroll.mouseWheel.durationMaxMS', 600);
pref('general.smoothScroll.mouseWheel.durationMinMS', 400);
pref('mousewheel.min_line_scroll_amount', 80);

// Telemetry used this as reference https://support.mozilla.org/en-US/questions/1197144
// main setting to disable it
pref('datareporting.healthreport.uploadEnabled', false);

pref('toolkit.telemetry.archive.enabled', false);
pref('toolkit.telemetry.bhrPing.enabled', false);
pref('toolkit.telemetry.firstShutdownPing.enabled', false);
pref('toolkit.telemetry.hybridContent.enabled', false);
pref('toolkit.telemetry.newProfilePing.enabled', false);
pref('toolkit.telemetry.reportingpolicy.firstRun', false);
pref('browser.newtabpage.activity-stream.telemetry', false);
pref('toolkit.telemetry.server', ' ');
pref('toolkit.telemetry.shutdownPingSender.enabled', false);
pref('toolkit.telemetry.shutdownPingSender.enabledFirstSession', true);
pref('toolkit.telemetry.unified', false);
pref('toolkit.telemetry.updatePing.enabled', false);
pref('privacy.donottrackheader.enabled', true);
pref('browser.contentblocking.category', strict);
pref('network.cookie.cookieBehavior', 4);
pref('privacy.trackingprotection.enabled', true);





pref('browser.startup.homepage', 'https://duckduckgo.com/');

